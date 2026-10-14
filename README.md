# Remember Me – Bible Memory

Memorize Bible verses with your AI assistant. Remember Me – Bible Memory connects Claude, ChatGPT and other assistants to [Remember Me](https://www.remem.me), the Bible memory app with spaced repetition: add a verse you have just read, get quizzed on the verses that are due, and follow a daily Bible reading plan. It is available in 48 languages.

You need a Remember Me account. You can create one for free from the sign-in page.

## Connect your assistant

Add `https://auth.remem.me/mcp` as a connector in Claude, ChatGPT or Grok and sign in with your Remember Me account. Step by step: [Connect an AI Assistant](https://www.remem.me/docs/mcp/).

## Install the skill

The `bible-memory` skill teaches your assistant how to use Remember Me: how to add a verse word for word, how to run a review one verse at a time, how to read the day's passages, and which words the app uses.

**Claude Code:** install the plugin, which brings the skill and the connection:

```
/plugin marketplace add remem-me/bible-memory
/plugin install bible-memory@remem-me
```

Then run `/mcp`, choose `remember-me` and sign in.

**Other agents** (Codex, Cursor, Grok Build, Hermes, OpenClaw and others): install the skill with [skills.sh](https://skills.sh):

```
npx skills add remem-me/bible-memory
```

Codex signs in to your account like ChatGPT. Most other agents, such as OpenClaw, Grok Build or Hermes, can't; they can use the public server, `https://mcp.remem.me/mcp`, to browse the published verse collections. [The skill's connection guide](skills/bible-memory/references/connect.md) shows how to connect each of them.

## What it connects to

The plugin connects your assistant to the Remember Me server at `https://auth.remem.me/mcp`. When you ask for something, your assistant sends the details to that server, such as a verse to add, a search term or today's date, and gets back your verses, a collection or the day's reading. The server changes only the verses and collections of the account you signed in with. For the day's reading, your assistant opens the passages on a Bible website in your translation.

How Remember Me handles this data is described in the [privacy policy](https://www.remem.me/docs/privacy/), under *If you connect an AI assistant*. The [terms of use](https://www.remem.me/docs/terms/) apply.

The plugin runs no code of its own. The other files in this repository, such as the listing texts and the build script for the ChatGPT package, are for maintaining the listings and are never run by the plugin.

## Help

Ask in the [user forum](https://forum.remem.me/) or write to support@remem.me.

Remember Me is run by Poimena, a nonprofit organisation in Switzerland. This repository is published under the [MIT License](LICENSE). Maintainers: see [MAINTAINING.md](MAINTAINING.md).
