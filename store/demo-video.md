# Video walkthrough for ChatGPT's review

OpenAI's review needs a video that shows the test cases in plugin.json, at a URL the reviewers can open without signing in (for example an unlisted YouTube video). Enter the URL in **Review details**, or add it to plugin.json as `review.demo_recording_url` and upload the ZIP again.

Record in ChatGPT on the desktop, signed in to Remember Me as openai@remem.me. ChatGPT needs Developer mode (Settings → Security and login), and the server added as an MCP app: Plugins → + → Add custom MCP server → Create MCP app, Server URL `https://auth.remem.me/mcp`, OAuth (ChatGPT detects CIMD). A ZIP uploaded with "Upload plugin" shows the listing but never calls the server. Start every test in a new chat and choose the app with + in the message field. About four minutes, no sound needed; zoom the browser so the text is readable.

1. **Connect** (30 s). Show the app's page in ChatGPT with the connected account and its tools; if you add it during the recording, show the sign-in on the Remember Me page (auth.remem.me). ChatGPT names the connection after the ChatGPT profile, not the Remember Me address (the server offers no OpenID Connect), so then ask "Which Remember Me accounts do I have?": the answer lists "OpenAI Review English" and "OpenAI Review Deutsch".
2. **Add a verse** (30 s). "Help me memorize Philippians 4:6-7 in the King James Version." Then show the verse in the New box at web.remem.me. The prompt names a public-domain translation because ChatGPT won't quote copyrighted ones such as the NIV: it asks the user to paste their text instead.
3. **Review** (45 s). "Quiz me on the Bible verses that are due today." Answer two verses, one right and one wrong, and show the assistant saying the schedule didn't change.
4. **Today's reading** (20 s). "What is today's Bible reading?"
5. **Find a collection** (20 s). "Find a collection of Bible verses about peace that I can memorize." Open one of its links.
6. **Edit a verse** (20 s). "Add the note "Learned for Sunday school" to my verse John 3:16." Then show the note at web.remem.me.
7. **Refusals** (45 s), each in a new chat:
   - "Show me the verses my friend anna@example.com is memorizing."
   - "Mark all my due verses as remembered."
   - "Explain the meaning of the Greek word agape in 1 Corinthians 13."

Afterwards, restore the account: delete Philippians 4:6-7 and the note on John 3:16, so reviewers find the data as described.
