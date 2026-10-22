---
name: kb-ingest
description: Turn a paper, lecture deck (PDF/LaTeX slides) or reading into a structured note in the Markdown vault, linked to its Zotero item. Use for "add to my notes", "ingest this paper", "fiche de lecture", "notes de cours".
---

# Knowledge-base ingest

Vault: `~/vault` — folders `papers/`, `courses/<course-code>/`, `concepts/`, `inbox/`.

1. Find the item in Zotero (Zotero MCP) to get the citekey and metadata. If missing, ask me to add it to Zotero first (Zotero Connector), don't invent metadata.
2. Create `papers/<citekey>.md` (or `courses/<code>/<NN>-<topic>.md`) with front matter:
   ```yaml
   citekey: ...
   title: ...
   authors: [...]
   year: ...
   tags: [cvar, risk, ...]
   status: read | to-replicate | replicated
   ```
3. Body sections: **Question** · **Method** (equations in LaTeX) · **Data** · **Results** (numbers) · **Critique** · **Links** ([[concept]] notes) · **Replication notes**.
4. For each key concept (e.g. [[CVaR]], [[Itô's lemma]], [[LMP]]), create or update `concepts/<Concept>.md` with a definition and backlinks — don't duplicate.
5. Course notes: French if the course is in French; keep the professor's notation.
