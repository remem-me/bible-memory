# Remember Me – Bible Memory

The listing package and store materials for Remember Me's connection to AI assistants ([doc#30](https://gitlab.com/remem-me/doc/-/work_items/30)). The connection itself is the MCP server at `https://auth.remem.me/mcp` in [rm_replication](https://gitlab.com/remem-me/server) (`mcp_server/`). This repo holds what the stores need around it.

| Path | Contents |
|---|---|
| [`plugin.json`](plugin.json) | Agent Plugins manifest. The ChatGPT listing is under `extensions.com.openai`: texts, links, icons and the review test cases. |
| [`mcp.json`](mcp.json) | The remote MCP server. |
| [`assets/`](assets) | Logo (512 px) and composer icon (192 px), both the app icon. |
| [`store/listing.md`](store/listing.md) | Listing texts, and the answers for each step of Claude's and ChatGPT's portals. |
| [`store/test-prompts.md`](store/test-prompts.md) | Test prompts in seven languages, with a column per assistant for the results. |
| [`store/reviewer-accounts.md`](store/reviewer-accounts.md) | How the reviewer accounts are set up, and the instructions for the reviewers. |
| [`store/reviewer-en.csv`](store/reviewer-en.csv), [`store/reviewer-de.csv`](store/reviewer-de.csv) | The reviewer accounts' verses, to import or restore. |
| [`store/demo-video.md`](store/demo-video.md) | Shot list for the video ChatGPT's review asks for. |
| [`scripts/build-zip.sh`](scripts/build-zip.sh) | Checks the portal's limits and builds `dist/remember-me-<version>.zip` for OpenAI. |

## Updating the listing

- **Tools** come from the server. Both stores rescan it, so a tool change needs a deploy of rm_replication, not a new ZIP.
- **Listing texts, icons and test cases** for ChatGPT live in `plugin.json`. Change them there, raise `version`, run `scripts/build-zip.sh` and upload the ZIP. Keep `store/listing.md` in step; Claude's texts are edited in its portal.

Keep passwords out of this repo. They go only into the stores' private fields.

## Later

M4 in doc#30 adds a `bible-verse-memory` skill under `skills/`, a Claude plugin manifest and a GitHub mirror.
