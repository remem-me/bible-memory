# Reviewer accounts

One user access per store (doc#30, decision 4), like the app stores' `apple@`, `googleplay@` and `amazon@remem.me`:

| Store | User access | Verse accounts |
|---|---|---|
| Claude | anthropic@remem.me | Anthropic Review English, Anthropic Review Deutsch |
| ChatGPT | openai@remem.me | OpenAI Review English, OpenAI Review Deutsch |

Verse account names are unique across all of Remember Me, so plain names such as "English" or "Deutsch" are taken; the names above aren't.

Both stores reject an account that needs a second factor, an email code or a new sign-up, so the reviewers sign in with email and password only. Keep the passwords in the password manager and enter them only in the stores' private fields, never in this repo.

## Set up (once per user access)

Below, `<Store>` is `Anthropic` or `OpenAI`.

1. **Register** at https://web.remem.me with the address and a strong password. The address must receive mail for the activation link.
2. **Verse accounts.** The activation creates a first verse account named after the address (`anthropic` or `openai`).
   - Rename that one to `<Store> Review English`, with English as the language of the verses and of the references. It has to be the first account: the daily reading uses the oldest account's language. Its translation is the one of the last verse added in the app, or NIV for English when none has been added there (the CSV import doesn't set it).
   - Add a second one, `<Store> Review Deutsch`, with German as the language of the verses and of the references.
3. **Import the verses** in the mobile app; the web app can't import files. Copy the files to the phone (on Android, into a folder other than Download). In each verse account, open the file menu in the visibility bar on the right and choose "Import from file":
   - [reviewer-en.csv](reviewer-en.csv) into the English account: 4 New, 4 Due, 4 Known; labels Peace, Trust, Hope, Gospel and God's Word.
   - [reviewer-de.csv](reviewer-de.csv) into the German account: 3 New, 3 Due, 3 Known; labels Frieden, Vertrauen, Evangelium and Gottes Wort.
4. **Check.** The English account shows 4 / 4 / 4 and the German one 3 / 3 / 3 in New / Due / Known. Asked in Claude for "my accounts", `list_accounts` returns exactly these two.
5. **Publish one collection, kept out of Discover.** Publish the English account's label "Peace" as a collection in the app, with the description "Four verses about peace to memorize." The released app has no switch for Discover yet (app#661), so the collection shows there until you hide it. Hide it right away:
   1. Add `https://auth.remem.me/mcp` to Claude as a connector and sign in as the reviewer.
   2. Ask: "Hide my collection Peace from Discover." The assistant calls `update_collection` with `listed: false`. (Or switch Listed off in the Django admin, rm_replication → Decks.)
   3. Check: `https://rpl.remem.me/v1/collections/<id>/` shows `"listed": false`. The id is in the assistant's answer or in `list_accounts`.

6. **Export a backup.** In the mobile app, in each verse account, first turn off "Boxes" in the visibility bar and choose "All verses"; the export takes only the verses on screen. Then file menu → "Export to file". Keep the files next to the password. To restore an account, delete its verses and import its file again.

The Amazon reviewer's collection "Meditate on (ESV)" (436663845892087) was unlisted on 2026-10-06.

## Keeping the accounts usable

- A review in a conversation writes nothing back, so the Due box stays full.
- The Known verses fall due between 2027-02-06 and 2027-02-10, 128 days after their last review. To keep the boxes as they are after that, delete the verses and import the CSV files again with newer review dates.
- Reviewers may add, edit or delete verses while testing. Deleted verses are in the waste bin at web.remem.me; restore the rest from the backup files.

## Instructions for the reviewers

Paste this into Claude's "Test & launch" step and into ChatGPT's "Review details", with the store's own account names. The email address and the password go into the credentials fields.

> **Sign-in.** The connector signs in with OAuth. When the Remember Me sign-in page (auth.remem.me) opens, enter the email address and the password from the credentials field. There is no second factor and no email code.
>
> **Test data.** The test user has two verse accounts, "`<Store>` Review English" and "`<Store>` Review Deutsch" (German). Each holds verses in all three review boxes (New, Due and Known) and several labels. The English account also has a collection of its own, "Peace", which is published but not shown in the public library. When the assistant asks which account to use, answer "`<Store>` Review English".
>
> **What to try.**
> 1. "Help me memorize Philippians 4:6-7." adds the verse to the New box.
> 2. "Quiz me on the Bible verses that are due today." starts a review, one verse at a time. Nothing is written back, so the review can be repeated.
> 3. "What is today's Bible reading?" returns today's passages from a one-year reading plan.
> 4. "Find a collection of Bible verses about peace that I can memorize." searches the public library.
> 5. "Add the note "Learned for Sunday school" to my verse John 3:16." edits one of the user's verses.
>
> **Limits.** An assistant can make at most 30 changes within five minutes and 300 per day; reading is not limited. Deleted verses go to the waste bin at https://web.remem.me, where they can be restored.
>
> **Help.** support@remem.me
