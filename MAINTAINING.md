# Maintaining this repository

The connection itself is the MCP server at `https://auth.remem.me/mcp` in [rm_replication](https://gitlab.com/remem-me/server) (`mcp_server/`). This repository holds the skill and the packages and materials the assistants' stores and directories need around it ([doc#30](https://gitlab.com/remem-me/doc/-/work_items/30)).

## What's in it

| Path | Contents |
|---|---|
| [`skills/bible-memory/`](skills/bible-memory) | The `bible-memory` skill: how an assistant uses the tools, with [`references/connect.md`](skills/bible-memory/references/connect.md) for setting up the connection and [`references/vocabulary.md`](skills/bible-memory/references/vocabulary.md) for the app's words in each language. |
| [`.claude-plugin/plugin.json`](.claude-plugin/plugin.json) | Claude plugin `bible-memory`. Anthropic's directory reads its listing fields (icon, links) from here and its description from the README. |
| [`.mcp.json`](.mcp.json) | The plugin's MCP server, the personal one. claude.ai and Cowork list it on the plugin's Connectors tab. Claude Code also offers it as a project server when you open this repository; you can decline. |
| [`.claude-plugin/marketplace.json`](.claude-plugin/marketplace.json) | Marketplace `remem-me`, so Claude Code can install the plugin straight from this repository. |
| [`plugin.json`](plugin.json) | Agent Plugins manifest. The ChatGPT listing is under `extensions.com.openai`: texts, links, icons and the review test cases. |
| [`mcp.json`](mcp.json) | The same server for the ChatGPT package. |
| [`server.json`](server.json) | The entry `me.remem/bible-memory` in the Official MCP Registry. The public server has its own entry, `me.remem/collections`, in rm_replication's `mcp_server/server.json`. |
| [assets](assets) | Logo (512 px) and composer icon (192 px), both the app icon. |
| [`store/listing.md`](store/listing.md) | Listing texts, and the answers for each step of Claude's and ChatGPT's portals. |
| [`store/test-prompts.md`](store/test-prompts.md) | Test prompts in seven languages, with a column per assistant for the results. |
| [`store/reviewer-accounts.md`](store/reviewer-accounts.md) | How the reviewer accounts are set up, and the instructions for the reviewers. |
| [`store/reviewer-en.csv`](store/reviewer-en.csv), [`store/reviewer-de.csv`](store/reviewer-de.csv) | The reviewer accounts' verses, to import or restore. |
| [`store/demo-video.md`](store/demo-video.md) | Shot list for the video ChatGPT's review asks for. |
| [`scripts/build-zip.sh`](scripts/build-zip.sh) | Checks the portal's limits and builds `dist/remember-me-<version>.zip` for OpenAI. |

The repository root is also the Claude plugin's folder, so everything committed here is installed with the plugin and scanned by Anthropic's directory. Keep build output (`dist/`) and system files (`.DS_Store`) out of git, keep every file under 256 KiB, add no other binary files than images, and refer to images by Markdown links, not by paths in backticks; the directory holds a version for a reviewer otherwise.

## Updating

- **Tools** come from the server. Both stores rescan it, so a tool change needs a deploy of rm_replication, not a new ZIP. When a tool changes the way the skill describes, update [`SKILL.md`](skills/bible-memory/SKILL.md) too.
- **Skill and Claude plugin:** edit the files, raise `version` in `.claude-plugin/plugin.json` and run `claude plugin validate .`. Anthropic's directory follows `master` and scans each new commit; skills.sh and Hermes read the repository too. ClawHub keeps its own copy: after `clawhub login`, run `clawhub skill publish ./skills/bible-memory` again.
- **App words:** `references/vocabulary.md` copies the app's strings `Box.new`, `Box.due`, `Box.known`, `Flashcard.remembered`, `Flashcard.forgotten`, `Tags.title`, `Collections.title`, `Subscription.subscribe` and `Bin.title` from the app's language files in rm_app. Copy them again when the app changes them or gains a language.
- **Registry entry:** raise `version` in `server.json`, then `mcp-publisher login dns --domain remem.me --private-key <key>` and `mcp-publisher publish`. The key belongs to the `v=MCPv1` TXT record on remem.me; the login lasts five minutes.
- **Listing texts, icons and test cases** for ChatGPT live in `plugin.json`. Change them there, raise `version`, run `scripts/build-zip.sh` and upload the ZIP. Keep `store/listing.md` in step; Claude's connector texts are edited in its portal.

Keep passwords out of this repository. They go only into the stores' private fields.
