#!/usr/bin/env -S yarn node

(async () => {
  const { spawnSync } = require("child_process");
  const { mkdirSync, readFileSync, readdirSync } = require("fs");
  const { resolve } = require("path");

  const fetch = require(require.resolve("node-fetch", { paths: [resolve()] }));

  // GitHub helpers

  const token = String(readFileSync("access_token")).trim();
  const authorization = `token ${token}`;
  const endpoint = "https://api.github.com/graphql";

  const request = async query => {
    const resp = await fetch(endpoint, {
      method: "POST",
      headers: { authorization, "content-type": "application/json" },
      body: JSON.stringify({ query })
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
        repositories: { nodes, pageInfo }
      }
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
    repos.push(...nodes);

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
      spawnSync("git", ["init"], { cwd: repoDir, stdio: "inherit" });
      spawnSync("git", ["remote", "add", "origin", url.href], {
        cwd: repoDir,
        stdio: "inherit"
      });
    }

    // fetch
    spawnSync("git", [`fetch`, `--prune`, "origin"], {
      cwd: repoDir,
      stdio: "inherit"
    });
  });
})();
