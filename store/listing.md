# Listing texts and portal answers

One listing for both stores, for the personal server `https://auth.remem.me/mcp` (doc#30, decision 1). The ChatGPT texts live in [`../plugin.json`](../plugin.json); this file has the same texts for Claude's portal and the answers for each of its steps.

## Before submitting to either store

- **Docs live** (rm_documentation, branch `feature/terms-of-use` merged into master and deployed): the terms page at https://www.remem.me/docs/terms/, the privacy policy's section on AI assistants, and the support line at the end of https://www.remem.me/docs/mcp/. Both stores check these pages, and the terms URL answers 404 until then.
- **Server deployed** (rm_replication, branch `feature/m2-store-submission`): the listing name, the OpenAI domain token route, and server instructions without a price.
- **Reviewer accounts** set up as in [reviewer-accounts.md](reviewer-accounts.md), and every tool run once as in [test-prompts.md](test-prompts.md#every-tool-once).

## Shared texts

| Field | Text | Limit |
|---|---|---|
| Name | Remember Me – Bible Memory | ChatGPT 30, Claude 100 |
| Subtitle (ChatGPT) | Memorize Bible verses | 30 |
| One-liner (Claude) | Memorize Bible verses with spaced repetition: add a verse you just read, get quizzed on the ones that are due, and follow a daily Bible reading plan. | 200 |
| Description | `longDescription` in plugin.json (1,768 characters) | ChatGPT 4,000, Claude 2,000 |
| Publisher | Poimena | |
| Website | https://www.remem.me/ | |
| Documentation | https://www.remem.me/docs/mcp/ | |
| Privacy policy | https://www.remem.me/docs/privacy/ | |
| Terms of service | https://www.remem.me/docs/terms/ | |
| Support | https://www.remem.me/docs/mcp/ (its last section points to the forum and support@remem.me) · support@remem.me | |
| Icon | [`../assets/logo.png`](../assets/logo.png), 512 × 512, the app icon | |
| Brand colour | #A30131 (dark theme #F05A78) | |

The name keeps "Bible Memory" from the app's own name (Remember Me. Bible Memory Joy) and matches the registry name planned for M3, `me.remem/bible-memory`. Other connectors called "Remember Me" are general AI-memory tools, so the name never goes out without "Bible Memory".

OpenAI checks that the public URLs name the same publisher as the verified identity. The forum doesn't mention Poimena, so the support URL is the AI assistants page, which does.

The descriptions and the server instructions name no other app and no price (OpenAI forbids both). "Free" appears only where Claude asks what users need before they connect.

### Example prompts

ChatGPT takes up to three (`defaultPrompt`), Claude wants at least three:

1. Help me memorize Philippians 4:6-7.
2. Quiz me on the Bible verses that are due today.
3. What is today's Bible reading?
4. Find a collection of Bible verses about peace that I can memorize. *(Claude only)*

## Claude: claude.ai/directory/manage → Submit new → MCP connector

Requirements: any paid Claude plan; every tool with a `title` and `readOnlyHint` or `destructiveHint` (done in server#169).

1. **Connection.** Universal URL: `https://auth.remem.me/mcp`.
2. **Tools.** 15 tools sync from the server.
   - Read-only (9): browse_collections, get_collection_detail, get_collection_metrics, get_daily_reading, list_accounts, list_verses, get_verse, search_verses, get_review_queue.
   - Write (6): add_verse, create_collection, update_collection, update_verse, delete_verse, delete_collection.
   - If the portal flags a tool, fix it on the server and deploy before submitting.
3. **Listing.** Name, one-liner and description from above. Categories: choose from the portal's list; Education first, then Lifestyle or Productivity if offered. Documentation, privacy policy, support contact and icon from above. URL slug: `remember-me-bible-memory`. **The slug can't be changed once published.**
4. **Use cases.**
   - Primary use cases: memorize a Bible verse you have just read or heard; review the verses that are due, by voice or in writing; read today's passages from a one-year Bible reading plan; find published verse collections; manage your own verses and collections.
   - What users need: a free Remember Me account. The sign-in page links to the sign-up.
   - Reads and writes data: both.
5. **Company.** Poimena, https://www.remem.me/, primary contact: the maintainer's address.
6. **Authentication.** OAuth with client ID metadata documents (CIMD). Don't flag "starts without authentication": every tool on this server needs sign-in (lazy sign-in is a later decision in doc#30).
7. **Data handling.** The API is our own. No personal health data, no sponsored content.
8. **Test & launch.** Paste the reviewer instructions from [reviewer-accounts.md](reviewer-accounts.md#instructions-for-the-reviewers) with the Anthropic account, and enter its password in the private field. Confirm that every tool has been run as a custom connector in Claude (see [test-prompts.md](test-prompts.md#every-tool-once)).
9. **Compliance.** Seven acknowledgments. What applies to us: no financial transactions, no AI media generation, no collection of conversation data (we never receive the conversation), public documentation at https://www.remem.me/docs/mcp/.
10. **Review and submit.** Fix any quality warnings first; they go to the review team with the submission.

After submitting: status and feedback at claude.ai/directory/manage. Escalations: mcp-review@anthropic.com.

## ChatGPT: platform.openai.com/plugins

Requirements: a verified developer identity (Poimena, business verification), and the organization owner or a member with **Apps Management Write**.

1. **Upload** `dist/remember-me-1.0.0.zip` (`scripts/build-zip.sh`) and choose Poimena as the developer identity. Fix any metadata findings in plugin.json and upload again. Check that `category` (Education) is one of the dashboard's categories.
2. **MCPs → Connect.**
   - URL `https://auth.remem.me/mcp`, authentication OAuth. ChatGPT picks CIMD from our metadata, so there is no client to register.
   - Domain verification: copy the token the portal shows, set it as `OPENAI_APPS_CHALLENGE` on the auth.remem.me site, restart the site, and check `https://auth.remem.me/.well-known/openai-apps-challenge`. This needs the rm_replication change from the M2 branch to be deployed.
   - Sign in with the OpenAI reviewer account, then check the tool scan for findings.
3. **Review details.** The test cases come from plugin.json. Enter the credentials and instructions from [reviewer-accounts.md](reviewer-accounts.md#instructions-for-the-reviewers) with the OpenAI account. Add the video URL ([demo-video.md](demo-video.md)), either here or as `review.demo_recording_url` in plugin.json.
4. **Submit for review** and confirm the attestations. Feedback comes by email.
5. **Publish** once approved. `publication.countries` is `[]`, which means no country restriction; check the country setting in the dashboard after the upload.

Deadline: submit before **2026-12-11**, when custom GPTs move into the plugin directory.
