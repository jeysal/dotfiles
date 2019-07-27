#!/usr/bin/env yarn node

(async () => {
  const { spawnSync } = require("child_process");
  const { mkdirSync, readFileSync, readdirSync } = require("fs");
  const fetch = require("node-fetch");
  const { resolve } = require("path");

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
          repositories(isFork:false, first:100${after}) {
            nodes {
              name
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
    repos.push(...nodes.map(({ name }) => name));

    ({ endCursor, hasNextPage } = pageInfo);
  }

  // sync repos

  const reposDir = resolve("repos");
  mkdirSync(reposDir, { recursive: true });
  repos.forEach(repo => {
    const repoDir = resolve("repos", repo);
    if (!readdirSync(reposDir).includes(repo)) {
      mkdirSync(repoDir);
      spawnSync("git", ["init"], { cwd: repoDir });
    }
    spawnSync(
      "git",
      [
        `fetch`,
        `--prune`,
        `https://${user}:${token}@github.com/${user}/${repo}`
      ],
      { cwd: repoDir }
    );
  });
})();
