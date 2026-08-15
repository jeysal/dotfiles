#!/usr/bin/env -S yarn node

(async () => {
  const { spawnSync } = require("child_process");
  const { mkdirSync, readFileSync, readdirSync } = require("fs");
  const { resolve } = require("path");

  const run = (cmd, args, options) => {
    const result = spawnSync(cmd, args, {
      ...options,
      stdio: "inherit",
    });

    if (result.error) throw result.error;
    if (result.status !== 0) {
      throw new Error(
        `${cmd} ${args.join(" ")} failed with exit code ${result.status}`,
      );
    }
  };

  const fetch = require(require.resolve("node-fetch", { paths: [resolve()] }));

  // GitHub helpers

  const token = String(readFileSync("access_token")).trim();
  const authorization = `token ${token}`;
  const endpoint = "https://api.github.com/graphql";

  const request = async (query) => {
    const resp = await fetch(endpoint, {
      method: "POST",
      headers: { authorization, "content-type": "application/json" },
      body: JSON.stringify({ query }),
    });
    return (await resp.json()).data;
  };

  // collect relevant repos

  let user;
  let repos = [];

  let endCursor = undefined;
  let hasNextPage = true;
  while (hasNextPage) {
    const after = endCursor ? `, after: "${endCursor}"` : "";
    const {
      viewer: {
        login,
        repositories: { nodes, pageInfo },
      },
    } = await request(`
      query {
        viewer {
          login
          repositories(first:100${after}) {
            nodes {
              nameWithOwner
              url
            }
            pageInfo {
              endCursor
              hasNextPage
            }
          }
        }
      }
    `);

    user = login;
    repos.push(...nodes.filter(Boolean));

    ({ endCursor, hasNextPage } = pageInfo);
  }

  // sync repos

  repos.forEach(({ nameWithOwner, url: urlString }) => {
    const repoDir = resolve("repos", nameWithOwner);
    const url = new URL(urlString);
    url.username = user;
    url.password = token;

    // prepare repo dir
    mkdirSync(repoDir, { recursive: true });
    if (!readdirSync(repoDir).includes(".git")) {
      run("git", ["init"], { cwd: repoDir });
      run("git", ["remote", "add", "origin", url.href], {
        cwd: repoDir,
      });
    }

    // update credentials
    run("git", ["remote", "set-url", "origin", url.href], {
      cwd: repoDir,
    });
    // fetch
    run("git", [`fetch`, `--prune`, "origin", "'+refs/*:refs/*'"], {
      cwd: repoDir,
    });
  });
})();
