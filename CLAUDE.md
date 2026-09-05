# GCBASIC Help Documentation — Working Notes

## Repositories and folders in play

- **`D:\GreatCowBASICGits\Help.git\source`** — the real, git-tracked AsciiDoc source for the GCBASIC Help. This is "the original folder."
- **`D:\LocalRepos\help\source`** — a working/build copy of the same source, with `prog\` as a sibling directory (an NTFS junction to the real toolchain). This is where the CHM is actually built from (`chm.bat` → `gcbdoc.bat` → Asciidoctor → DocBook → Saxon/htmlhelp.xsl → `hhc.exe` → `output\chm\gcbasic.chm`). `source` and `prog` must stay siblings for the build scripts to find each other.
- **The review-tool Artifact** — a published Claude Artifact at `https://claude.ai/code/artifact/d9b3e7e4-ef1b-4361-89d3-9fae11929068`, backed by its `db` capability, collection `"pages"`. This is the review/approve staging layer for content changes before they land in the source files.

## The review-tool database

This is a **persistent database tied to that one Artifact's URL** — it is not a session resource. It does **not** need to be purged and reloaded to "start it back up"; it is simply there, indefinitely, the same way a real web app's database would be, across sessions.

Each document in the `pages` collection is one Help page:
`{category, deepened, edited, file, heading, order, original, proposed, status ("pending"|"approved"|"rejected"), tier ("tier0"|"tier1"), updatedAt}`.

**Normal workflow:**
1. Claude writes a content change via `write_db`, setting the page's `proposed` field and `status: "pending"`.
2. The user reviews and approves/rejects it in the Artifact's own UI.
3. Query `status == "pending"` at any time to see what's awaiting review.

**Important gotcha to avoid repeating:** if local `.adoc` files under `D:\LocalRepos\help\source` are edited directly (bypassing `write_db`) — which happened for a large stretch of work in this project (bulk reorganization of `gcbasic.adoc`, new pages, index-term insertion, LCD_IO example fixes) — the database silently falls **out of sync** with disk. If a future session then does a fresh "export everything from the database into `D:\LocalRepos\help\source`," it will **overwrite disk with the database's older content and destroy any changes made only on disk since the last sync.**

**Rule going forward:** after any batch of direct-to-disk edits, reconcile the database before considering the work "done" — write the current file content back into the corresponding `pages` document (`proposed`, `category`, `heading`), and create new documents for any newly-added pages that aren't tracked yet. Don't let the two drift for long stretches.

## Syncing to the real repo

`D:\GreatCowBASICGits\Help.git\source` is the authoritative, git-tracked original. Changes developed and verified in `D:\LocalRepos\help\source` get copied back here as working-tree changes (never auto-committed — the user commits when ready). Before overwriting, check `git status`/`git diff` in the real repo first: if the user has made direct edits there in parallel, merge them forward rather than clobbering them.
