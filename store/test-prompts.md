# Test prompts

Assistants choose a connector by its name, description and tool descriptions (doc#30, B). These prompts check that Claude and ChatGPT pick the right Remember Me tool, and leave it alone when it doesn't fit.

## How to run them

- **Claude:** add `https://auth.remem.me/mcp` as a custom connector, sign in as a reviewer account, start a new chat per prompt.
- **ChatGPT:** at chatgpt.com/plugins, select + → **Add custom MCP server** with the same URL, sign in the same way, new chat per prompt.
- Mark ✓ when the expected tool runs (or, for negatives, no tool runs), ✗ otherwise, and note what happened. A ✗ on an indirect prompt means a tool description or the server instructions need work (rm_replication, `mcp_server/server.py`).

Types:

- **Direct** prompts name the app. They must always work.
- **Indirect** prompts describe the intent without naming the app. They decide whether the assistant suggests or uses Remember Me on its own.
- **Negative** prompts must not call a Remember Me tool: lookup and commentary are left to others, and a review in the conversation never changes the schedule.

Korean and Chinese users see the app as 리멤버 미 and 记念我, so their first direct prompt uses that name and the second the Latin one.

The prompts are what a user would type, so they speak to the assistant informally.

## Expected tools

| # | Intent | Expected |
|---|---|---|
| D1 | add a named verse | add_verse (after list_accounts if it has to pick an account) |
| D2 | review | get_review_queue with box "due" |
| D3 | find a collection | browse_collections |
| I1 | memorize a passage | offers or calls add_verse |
| I2 | be quizzed | get_review_queue |
| I3 | today's reading | get_daily_reading |
| I4 | verse of the day | the assistant picks a verse itself and offers add_verse |
| N1 | word study | no tool |
| N2 | record a review | no write tool; explains that reviews are recorded in the app |

## English

| # | Prompt | Claude | ChatGPT |
|---|---|---|---|
| D1 | Add Romans 12:2 to Remember Me. | | |
| D2 | Quiz me on my Remember Me verses that are due. | | |
| D3 | Find a collection about hope in Remember Me. | | |
| I1 | I want to learn Psalm 23 by heart. | | |
| I2 | Can you test me on the Bible verses I'm memorizing? | | |
| I3 | What should I read in the Bible today? | | |
| I4 | Give me a verse for today that I can keep. | | |
| N1 | What does the Greek word "agape" mean in 1 Corinthians 13? | | |
| N2 | Mark all my due verses as remembered. | | |

## Deutsch

| # | Prompt | Claude | ChatGPT |
|---|---|---|---|
| D1 | Füge Römer 12,2 zu Remember Me hinzu. | | |
| D2 | Frag mich meine fälligen Verse in Remember Me ab. | | |
| D3 | Such in Remember Me eine Sammlung zum Thema Hoffnung. | | |
| I1 | Ich möchte Psalm 23 auswendig lernen. | | |
| I2 | Kannst du mich die Bibelverse abfragen, die ich gerade lerne? | | |
| I3 | Was soll ich heute in der Bibel lesen? | | |
| I4 | Gib mir einen Vers für heute, den ich mir merken kann. | | |
| N1 | Was bedeutet das griechische Wort „agape“ in 1. Korinther 13? | | |
| N2 | Markiere alle meine fälligen Verse als erinnert. | | |

## Español

| # | Prompt | Claude | ChatGPT |
|---|---|---|---|
| D1 | Agrega Romanos 12:2 a Remember Me. | | |
| D2 | Hazme un repaso de mis versículos pendientes en Remember Me. | | |
| D3 | Busca en Remember Me una colección sobre la esperanza. | | |
| I1 | Quiero aprenderme de memoria el Salmo 23. | | |
| I2 | ¿Me puedes preguntar los versículos que estoy memorizando? | | |
| I3 | ¿Qué debería leer hoy en la Biblia? | | |
| I4 | Dame un versículo para hoy que pueda guardar. | | |
| N1 | ¿Qué significa la palabra griega "ágape" en 1 Corintios 13? | | |
| N2 | Marca todos mis versículos pendientes como recordados. | | |

## Português (Brasil)

| # | Prompt | Claude | ChatGPT |
|---|---|---|---|
| D1 | Adicione Romanos 12:2 ao Remember Me. | | |
| D2 | Me faça um teste com os versículos pendentes no Remember Me. | | |
| D3 | Procure no Remember Me uma coleção sobre esperança. | | |
| I1 | Quero decorar o Salmo 23. | | |
| I2 | Você pode me testar nos versículos que estou memorizando? | | |
| I3 | O que devo ler na Bíblia hoje? | | |
| I4 | Me dê um versículo para hoje que eu possa guardar. | | |
| N1 | O que significa a palavra grega "ágape" em 1 Coríntios 13? | | |
| N2 | Marque todos os meus versículos pendentes como lembrados. | | |

## Français

| # | Prompt | Claude | ChatGPT |
|---|---|---|---|
| D1 | Ajoute Romains 12.2 à Remember Me. | | |
| D2 | Interroge-moi sur mes versets échus dans Remember Me. | | |
| D3 | Cherche dans Remember Me une collection sur l'espérance. | | |
| I1 | Je veux apprendre le Psaume 23 par cœur. | | |
| I2 | Peux-tu m'interroger sur les versets bibliques que j'apprends ? | | |
| I3 | Que devrais-je lire dans la Bible aujourd'hui ? | | |
| I4 | Donne-moi un verset pour aujourd'hui que je puisse garder. | | |
| N1 | Que signifie le mot grec « agapè » en 1 Corinthiens 13 ? | | |
| N2 | Marque tous mes versets échus comme rappelés. | | |

## 한국어

| # | Prompt | Claude | ChatGPT |
|---|---|---|---|
| D1 | 로마서 12:2를 리멤버 미에 추가해 줘. | | |
| D2 | Remember Me에서 예정된 구절로 퀴즈를 내 줘. | | |
| D3 | 리멤버 미에서 소망에 관한 컬렉션을 찾아 줘. | | |
| I1 | 시편 23편을 암송하고 싶어. | | |
| I2 | 내가 외우고 있는 성경 구절을 테스트해 줄래? | | |
| I3 | 오늘 성경에서 무엇을 읽으면 좋을까? | | |
| I4 | 오늘 마음에 새길 구절 하나 알려 줘. | | |
| N1 | 고린도전서 13장에서 헬라어 '아가페'는 무슨 뜻이야? | | |
| N2 | 예정된 구절을 모두 기억됨으로 표시해 줘. | | |

## 简体中文

| # | Prompt | Claude | ChatGPT |
|---|---|---|---|
| D1 | 把罗马书12:2加到记念我里。 | | |
| D2 | 用 Remember Me 里到期的经文考考我。 | | |
| D3 | 在记念我里找一个关于盼望的收藏。 | | |
| I1 | 我想背诵诗篇23篇。 | | |
| I2 | 你能考考我正在背的经文吗？ | | |
| I3 | 我今天应该读圣经的哪一部分？ | | |
| I4 | 给我一节今天可以记住的经文。 | | |
| N1 | 哥林多前书13章里的希腊文"agape"是什么意思？ | | |
| N2 | 把我所有到期的经文都标记为记住了。 | | |

## Every tool once

Claude's portal asks you to confirm that every tool has been run, and the prompts above reach only some of them. Run these in English with a reviewer account, in one chat, in this order. The last steps undo the first ones.

| # | Prompt | Tool |
|---|---|---|
| 1 | Which Remember Me accounts do I have? | list_accounts |
| 2 | Show me the verses under my label Trust. | list_verses |
| 3 | Where is the verse about the lamp to my feet? | search_verses |
| 4 | Open that verse by its id. *(or paste a web.remem.me/share/… link of one of the verses)* | get_verse |
| 5 | Quiz me on my due verses. | get_review_queue |
| 6 | What is today's Bible reading? | get_daily_reading |
| 7 | Find a collection about peace. | browse_collections |
| 8 | Show me the verses of the first one. | get_collection_detail |
| 9 | How many people are learning it? | get_collection_metrics |
| 10 | Add Psalm 121:1-2 to my verses. | add_verse |
| 11 | Change its passage to the WEB text. | update_verse |
| 12 | Delete Psalm 121:1-2 from my verses. | delete_verse |
| 13 | Publish a test collection "Tool check" with Psalm 121:1-2 under my account `<Store> Review English`, not shown in Discover. | create_collection |
| 14 | Rename it to "Tool check 2". | update_collection |
| 15 | Delete the collection "Tool check 2". | delete_collection |
