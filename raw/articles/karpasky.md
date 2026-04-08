# llm-wiki

[![@karpathy](https://avatars.githubusercontent.com/u/241138?s=64&v=4)](/karpathy)

# [karpathy](/karpathy)/**[llm-wiki.md](/karpathy/442a6bf555914893e9891c11519de94f)**

Created April 4, 2026 11:25 • [Report abuse](/contact/report-content?content_url=https%3A%2F%2Fgist.github.com%2F442a6bf555914893e9891c11519de94f&report=karpathy+%28user%29)

-        Subscribe
    

Show Gist options

-   [Download ZIP](/karpathy/442a6bf555914893e9891c11519de94f/archive/ac46de1ad27f92b28ac95459c782c07f6b8c964a.zip)

-     Star
    
-     Fork
    

-     Unstar 5,000+ (5,000+) Unstar this gist
    
      Star 5,000+ (5,000+) Star this gist
    
-    Fork 2,239 (2,239) Fork this gist
    

-   Embed
    
    # Select an option
    
    -   Embed Embed this gist in your website.
    -   Share Copy sharable link for this gist.
    -   Clone via HTTPS Clone using the web URL.
    -   Clone via SSH Clone with an SSH key and passphrase from your GitHub settings.
    
    ## No results found
    
    [Learn more about clone URLs](https://docs.github.com/articles/which-remote-url-should-i-use)
    
    Clone this repository at &lt;script src=&quot;https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f.js&quot;&gt;&lt;/script&gt;
    
-   Save karpathy/442a6bf555914893e9891c11519de94f to your computer and use it in GitHub Desktop.

Embed

# Select an option

-   Embed Embed this gist in your website.
-   Share Copy sharable link for this gist.
-   Clone via HTTPS Clone using the web URL.
-   Clone via SSH Clone with an SSH key and passphrase from your GitHub settings.

## No results found

[Learn more about clone URLs](https://docs.github.com/articles/which-remote-url-should-i-use)

Clone this repository at &lt;script src=&quot;https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f.js&quot;&gt;&lt;/script&gt;

Save karpathy/442a6bf555914893e9891c11519de94f to your computer and use it in GitHub Desktop.

[Download ZIP](/karpathy/442a6bf555914893e9891c11519de94f/archive/ac46de1ad27f92b28ac95459c782c07f6b8c964a.zip)

llm-wiki

[Raw](/karpathy/442a6bf555914893e9891c11519de94f/raw/ac46de1ad27f92b28ac95459c782c07f6b8c964a/llm-wiki.md)

[**llm-wiki.md**](#file-llm-wiki-md)

# LLM Wiki

[](#llm-wiki)

A pattern for building personal knowledge bases using LLMs.

This is an idea file, it is designed to be copy pasted to your own LLM Agent (e.g. OpenAI Codex, Claude Code, OpenCode / Pi, or etc.). Its goal is to communicate the high level idea, but your agent will build out the specifics in collaboration with you.

## The core idea

[](#the-core-idea)

Most people's experience with LLMs and documents looks like RAG: you upload a collection of files, the LLM retrieves relevant chunks at query time, and generates an answer. This works, but the LLM is rediscovering knowledge from scratch on every question. There's no accumulation. Ask a subtle question that requires synthesizing five documents, and the LLM has to find and piece together the relevant fragments every time. Nothing is built up. NotebookLM, ChatGPT file uploads, and most RAG systems work this way.

The idea here is different. Instead of just retrieving from raw documents at query time, the LLM **incrementally builds and maintains a persistent wiki** — a structured, interlinked collection of markdown files that sits between you and the raw sources. When you add a new source, the LLM doesn't just index it for later retrieval. It reads it, extracts the key information, and integrates it into the existing wiki — updating entity pages, revising topic summaries, noting where new data contradicts old claims, strengthening or challenging the evolving synthesis. The knowledge is compiled once and then _kept current_, not re-derived on every query.

This is the key difference: **the wiki is a persistent, compounding artifact.** The cross-references are already there. The contradictions have already been flagged. The synthesis already reflects everything you've read. The wiki keeps getting richer with every source you add and every question you ask.

You never (or rarely) write the wiki yourself — the LLM writes and maintains all of it. You're in charge of sourcing, exploration, and asking the right questions. The LLM does all the grunt work — the summarizing, cross-referencing, filing, and bookkeeping that makes a knowledge base actually useful over time. In practice, I have the LLM agent open on one side and Obsidian open on the other. The LLM makes edits based on our conversation, and I browse the results in real time — following links, checking the graph view, reading the updated pages. Obsidian is the IDE; the LLM is the programmer; the wiki is the codebase.

This can apply to a lot of different contexts. A few examples:

-   **Personal**: tracking your own goals, health, psychology, self-improvement — filing journal entries, articles, podcast notes, and building up a structured picture of yourself over time.
-   **Research**: going deep on a topic over weeks or months — reading papers, articles, reports, and incrementally building a comprehensive wiki with an evolving thesis.
-   **Reading a book**: filing each chapter as you go, building out pages for characters, themes, plot threads, and how they connect. By the end you have a rich companion wiki. Think of fan wikis like [Tolkien Gateway](https://tolkiengateway.net/wiki/Main_Page) — thousands of interlinked pages covering characters, places, events, languages, built by a community of volunteers over years. You could build something like that personally as you read, with the LLM doing all the cross-referencing and maintenance.
-   **Business/team**: an internal wiki maintained by LLMs, fed by Slack threads, meeting transcripts, project documents, customer calls. Possibly with humans in the loop reviewing updates. The wiki stays current because the LLM does the maintenance that no one on the team wants to do.
-   **Competitive analysis, due diligence, trip planning, course notes, hobby deep-dives** — anything where you're accumulating knowledge over time and want it organized rather than scattered.

## Architecture

[](#architecture)

There are three layers:

**Raw sources** — your curated collection of source documents. Articles, papers, images, data files. These are immutable — the LLM reads from them but never modifies them. This is your source of truth.

**The wiki** — a directory of LLM-generated markdown files. Summaries, entity pages, concept pages, comparisons, an overview, a synthesis. The LLM owns this layer entirely. It creates pages, updates them when new sources arrive, maintains cross-references, and keeps everything consistent. You read it; the LLM writes it.

**The schema** — a document (e.g. CLAUDE.md for Claude Code or AGENTS.md for Codex) that tells the LLM how the wiki is structured, what the conventions are, and what workflows to follow when ingesting sources, answering questions, or maintaining the wiki. This is the key configuration file — it's what makes the LLM a disciplined wiki maintainer rather than a generic chatbot. You and the LLM co-evolve this over time as you figure out what works for your domain.

## Operations

[](#operations)

**Ingest.** You drop a new source into the raw collection and tell the LLM to process it. An example flow: the LLM reads the source, discusses key takeaways with you, writes a summary page in the wiki, updates the index, updates relevant entity and concept pages across the wiki, and appends an entry to the log. A single source might touch 10-15 wiki pages. Personally I prefer to ingest sources one at a time and stay involved — I read the summaries, check the updates, and guide the LLM on what to emphasize. But you could also batch-ingest many sources at once with less supervision. It's up to you to develop the workflow that fits your style and document it in the schema for future sessions.

**Query.** You ask questions against the wiki. The LLM searches for relevant pages, reads them, and synthesizes an answer with citations. Answers can take different forms depending on the question — a markdown page, a comparison table, a slide deck (Marp), a chart (matplotlib), a canvas. The important insight: **good answers can be filed back into the wiki as new pages.** A comparison you asked for, an analysis, a connection you discovered — these are valuable and shouldn't disappear into chat history. This way your explorations compound in the knowledge base just like ingested sources do.

**Lint.** Periodically, ask the LLM to health-check the wiki. Look for: contradictions between pages, stale claims that newer sources have superseded, orphan pages with no inbound links, important concepts mentioned but lacking their own page, missing cross-references, data gaps that could be filled with a web search. The LLM is good at suggesting new questions to investigate and new sources to look for. This keeps the wiki healthy as it grows.

## Indexing and logging

[](#indexing-and-logging)

Two special files help the LLM (and you) navigate the wiki as it grows. They serve different purposes:

**index.md** is content-oriented. It's a catalog of everything in the wiki — each page listed with a link, a one-line summary, and optionally metadata like date or source count. Organized by category (entities, concepts, sources, etc.). The LLM updates it on every ingest. When answering a query, the LLM reads the index first to find relevant pages, then drills into them. This works surprisingly well at moderate scale (~100 sources, ~hundreds of pages) and avoids the need for embedding-based RAG infrastructure.

**log.md** is chronological. It's an append-only record of what happened and when — ingests, queries, lint passes. A useful tip: if each entry starts with a consistent prefix (e.g. `## [2026-04-02] ingest | Article Title`), the log becomes parseable with simple unix tools — `grep "^## \[" log.md | tail -5` gives you the last 5 entries. The log gives you a timeline of the wiki's evolution and helps the LLM understand what's been done recently.

## Optional: CLI tools

[](#optional-cli-tools)

At some point you may want to build small tools that help the LLM operate on the wiki more efficiently. A search engine over the wiki pages is the most obvious one — at small scale the index file is enough, but as the wiki grows you want proper search. [qmd](https://github.com/tobi/qmd) is a good option: it's a local search engine for markdown files with hybrid BM25/vector search and LLM re-ranking, all on-device. It has both a CLI (so the LLM can shell out to it) and an MCP server (so the LLM can use it as a native tool). You could also build something simpler yourself — the LLM can help you vibe-code a naive search script as the need arises.

## Tips and tricks

[](#tips-and-tricks)

-   **Obsidian Web Clipper** is a browser extension that converts web articles to markdown. Very useful for quickly getting sources into your raw collection.
-   **Download images locally.** In Obsidian Settings → Files and links, set "Attachment folder path" to a fixed directory (e.g. `raw/assets/`). Then in Settings → Hotkeys, search for "Download" to find "Download attachments for current file" and bind it to a hotkey (e.g. Ctrl+Shift+D). After clipping an article, hit the hotkey and all images get downloaded to local disk. This is optional but useful — it lets the LLM view and reference images directly instead of relying on URLs that may break. Note that LLMs can't natively read markdown with inline images in one pass — the workaround is to have the LLM read the text first, then view some or all of the referenced images separately to gain additional context. It's a bit clunky but works well enough.
-   **Obsidian's graph view** is the best way to see the shape of your wiki — what's connected to what, which pages are hubs, which are orphans.
-   **Marp** is a markdown-based slide deck format. Obsidian has a plugin for it. Useful for generating presentations directly from wiki content.
-   **Dataview** is an Obsidian plugin that runs queries over page frontmatter. If your LLM adds YAML frontmatter to wiki pages (tags, dates, source counts), Dataview can generate dynamic tables and lists.
-   The wiki is just a git repo of markdown files. You get version history, branching, and collaboration for free.

## Why this works

[](#why-this-works)

The tedious part of maintaining a knowledge base is not the reading or the thinking — it's the bookkeeping. Updating cross-references, keeping summaries current, noting when new data contradicts old claims, maintaining consistency across dozens of pages. Humans abandon wikis because the maintenance burden grows faster than the value. LLMs don't get bored, don't forget to update a cross-reference, and can touch 15 files in one pass. The wiki stays maintained because the cost of maintenance is near zero.

The human's job is to curate sources, direct the analysis, ask good questions, and think about what it all means. The LLM's job is everything else.

The idea is related in spirit to Vannevar Bush's Memex (1945) — a personal, curated knowledge store with associative trails between documents. Bush's vision was closer to this than to what the web became: private, actively curated, with the connections between documents as valuable as the documents themselves. The part he couldn't solve was who does the maintenance. The LLM handles that.

## Note

[](#note)

This document is intentionally abstract. It describes the idea, not a specific implementation. The exact directory structure, the schema conventions, the page formats, the tooling — all of that will depend on your domain, your preferences, and your LLM of choice. Everything mentioned above is optional and modular — pick what's useful, ignore what isn't. For example: your sources might be text-only, so you don't need image handling at all. Your wiki might be small enough that the index file is all you need, no search engine required. You might not care about slide decks and just want markdown pages. You might want a completely different set of output formats. The right way to use this is to share it with your LLM agent and work together to instantiate a version that fits your needs. The document's only job is to communicate the pattern. Your LLM can figure out the rest.

   Load earlier comments...

[![@aakarim](https://avatars.githubusercontent.com/u/3791557?s=80&v=4)](/aakarim)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[aakarim](/aakarim)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6085832#gistcomment-6085832) •

edited

Loading

### Uh oh!

There was an error while loading. Please reload this page.

Great to standardise around some interfaces for knowledge sharing - having the agents have a dedicated 'outbox' folder, and being able to ingest straight from there on the filesystem makes things a lot less confusing _and_ makes things easier when sandboxing.

We're building an integration into our multi-agent knowledge server, [Oiya](https://oiya.ai) so that we can natively support this workflow. Can't wait to share it!

The only slight wrinkle is the `log.md` file - generally this can be done with pretty standard tools like git, and having a log locally for each agent seems to only confuse less intelligent models - we'll take that out and have it as a command, if the agent needs it.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@AgriciDaniel](https://avatars.githubusercontent.com/u/223140489?s=80&v=4)](/AgriciDaniel)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[AgriciDaniel](/AgriciDaniel)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6085862#gistcomment-6085862)

Built a full Claude Code plugin + Obsidian vault around this pattern: **claude-obsidian**

Drop any source → Claude extracts 8–15 cross-referenced wiki pages → knowledge compounds.  
Hot cache keeps session context under 500 tokens. One command to scaffold, one to ingest.

 [![claude-obsidian](https://raw.githubusercontent.com/AgriciDaniel/claude-obsidian/main/wiki/meta/claude-obsidian-gif-cover-16x9.gif)](https://raw.githubusercontent.com/AgriciDaniel/claude-obsidian/main/wiki/meta/claude-obsidian-gif-cover-16x9.gif) [![claude-obsidian](https://raw.githubusercontent.com/AgriciDaniel/claude-obsidian/main/wiki/meta/claude-obsidian-gif-cover-16x9.gif)

](https://raw.githubusercontent.com/AgriciDaniel/claude-obsidian/main/wiki/meta/claude-obsidian-gif-cover-16x9.gif)[](https://raw.githubusercontent.com/AgriciDaniel/claude-obsidian/main/wiki/meta/claude-obsidian-gif-cover-16x9.gif)

Install: `claude plugin install github:AgriciDaniel/claude-obsidian`  
Repo: [https://github.com/AgriciDaniel/claude-obsidian](https://github.com/AgriciDaniel/claude-obsidian)

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@anzal1](https://avatars.githubusercontent.com/u/77688078?s=80&v=4)](/anzal1)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[anzal1](/anzal1)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6085868#gistcomment-6085868)

Built a full implementation of this: [**Quicky Wiki**](https://github.com/anzal1/quicky-wiki)

Goes beyond raw → wiki with:

-   **Confidence-scored claims** — every extracted fact has a confidence score
-   **Temporal tracking** — beliefs evolve: created → reinforced → challenged → superseded
-   **Contradiction detection** — conflicts surfaced automatically with cascade propagation
-   **Interactive dashboard** — Obsidian-style knowledge graph, Ask Wiki chat with citations, timeline, health views
-   **Knowledge metabolism** — decay, red-teaming, gap discovery, resurfacing
-   **MCP server** — plug into Claude Desktop or any AI agent

One command to try: `npx quicky-wiki init`

Works with Gemini, OpenAI, Anthropic, Ollama, or any OpenAI-compatible API.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@cfulger](https://avatars.githubusercontent.com/u/188754106?s=80&v=4)](/cfulger)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[cfulger](/cfulger)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6085919#gistcomment-6085919) •

edited

Loading

### Uh oh!

There was an error while loading. Please reload this page.

Most AI agent systems treat almost every task as requiring intelligence, every time. This means the same cost, the same risk of hallucination, the same inability to guarantee consistency — whether the task is interpreting a contract or checking disk usage. I thought of a system where the AI designs its own deterministic replacement, and the machine tests whether it works.

The boundary between intelligence and mechanics isn't declared upfront. It's discovered empirically, step by step, within every task, and revised when evidence changes. Trust is earned through agreement, revoked instantly on failure, and nothing is permanently classified as beyond automation — only "not yet proven otherwise."

A human at the gate makes this Godel compliant. I am not an IT specialist. Why wouldn't thist work?

[https://zenodo.org/records/19401816](https://zenodo.org/records/19401816)  
or  
[https://gist.github.com/cfulger/19779c3cab04d2c8b47b496168386d1e](https://gist.github.com/cfulger/19779c3cab04d2c8b47b496168386d1e)

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@MetamusicX](https://avatars.githubusercontent.com/u/120335587?s=80&v=4)](/MetamusicX)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[MetamusicX](/MetamusicX)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6085976#gistcomment-6085976)

I implemented this for academic research in music and philosophy — an LLM-maintained wiki with domain-specific page types (concepts, authors, debates, syntheses), full ingest/query/lint workflows, and a CLAUDE.md schema for Claude Code. First ingest produced 38 interlinked pages from a single source note.

Public template repo: [https://github.com/MetamusicX/llm-research-wiki](https://github.com/MetamusicX/llm-research-wiki)

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@codezz](https://avatars.githubusercontent.com/u/5703385?s=80&v=4)](/codezz)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[codezz](/codezz)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086039#gistcomment-6086039)

I built something very similar for Claude Code and Openclaw: [https://github.com/remember-md/remember](https://github.com/remember-md/remember)  
Same idea as your wiki, but the "sources" are your past AI chat sessions instead of articles. It reads them, pulls out the people, decisions, projects, and tasks you talked about, and files everything into an Obsidian vault you actually own and sync over GIT.

The part you mention about catching contradictions and stale notes, haven't built that yet.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@rothnic](https://avatars.githubusercontent.com/u/452052?s=80&v=4)](/rothnic)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[rothnic](/rothnic)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086041#gistcomment-6086041)

I evaluated some options for this when openclaw first gained traction since there wasn't a great way to collaborate and visualize the content the agent processed and organized. To me, it seemed like obsidian wasn't well suited to the task and made things complicated if you wanted a distributed shared knowledge base, but not sure if I'm missing anything there. I ended up going with a more simple solution I found called silverbullet, but it too has some downsides. [https://github.com/silverbulletmd/silverbullet](https://github.com/silverbulletmd/silverbullet)

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@kytmanov](https://avatars.githubusercontent.com/u/19655528?s=80&v=4)](/kytmanov)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[kytmanov](/kytmanov)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086145#gistcomment-6086145)

I've implemented this LLM Wiki pattern to work fully offline with Ollama LLMs on a local machine.

[https://github.com/kytmanov/obsidian-llm-wiki-local](https://github.com/kytmanov/obsidian-llm-wiki-local)

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@emailhuynhhuy](https://avatars.githubusercontent.com/u/259412335?s=80&v=4)](/emailhuynhhuy)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[emailhuynhhuy](/emailhuynhhuy)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086146#gistcomment-6086146)

Thank you for sharing. Your post gave me the courage to share my own 'raw' progress — and helped me understand why what I built actually works.

**The problem that broke my trust in generation:**  
Using cloud LLMs or NotebookLM to build n8n automation workflows kept producing the same failure mode: plausible-looking JSON that missed critical execution details. The logic looked right. It failed silently in production. For complex automation, "mostly correct" isn't a degraded state — it's a broken state.

**What I built instead — a Deterministic Retrieval System:**

I organized thousands of validated n8n workflow JSONs on a local NAS. Each is mapped to an Obsidian MD file with rich metadata: tags, process steps, and a direct pointer to the source JSON.

It maps directly to your three-layer architecture:

-   **Raw sources**: validated JSONs — immutable, never touched by the LLM
-   **Wiki layer**: Obsidian MD files — not for reading, but for navigation
-   **Schema**: the local AI acts purely as a router. It traverses the graph, finds the right metadata pointer, and retrieves the pre-validated JSON for the team to paste and run.

Instead of asking an LLM to _generate_ a workflow, we ask it to _find_ one. 100% reliable. No hallucinated logic.

Your framing of the wiki as a "persistent, compounding artifact" is what made this click. The Obsidian graph is my fast navigation layer — seeing how workflows connect, identifying direction. The NAS is the deep execution layer — deterministic, no surprises.

**Where I'm taking this next:**

I'm now applying this same pointer-based pattern to other knowledge bases beyond workflows — testing whether the same reliability holds when the "source of truth" is less structured than JSON (documentation, SOPs, client briefs). The hypothesis is that the pattern generalizes: as long as the retrieval layer is deterministic and the wiki layer handles navigation, generation becomes optional rather than necessary.

**The tension I can't fully resolve yet:**

Pointer-based retrieval works perfectly when there's a match. But when a novel request arrives — something that doesn't exist in the library — the system is blind. Falling back to generation breaks the reliability I've built. Staying purely deterministic means the system can't grow into genuinely new territory.

Your wiki pattern handles novelty well because the LLM can still synthesize across existing pages. I'm wondering if there's a hybrid path: deterministic retrieval for known cases, but a wiki-style synthesis layer that absorbs novel cases over time — and promotes them into validated sources once tested in production.

Do you see a way to maintain that level of reliability at the retrieval layer while keeping the system fluid at the edges?

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@K-Edmonds-G42](https://avatars.githubusercontent.com/u/272871689?s=80&v=4)](/K-Edmonds-G42)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[K-Edmonds-G42](/K-Edmonds-G42)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086200#gistcomment-6086200)

I think the hope is that Grokipedia becomes a large scale version of this.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@bitsofchris](https://avatars.githubusercontent.com/u/170658393?s=80&v=4)](/bitsofchris)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[bitsofchris](/bitsofchris)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086278#gistcomment-6086278) •

edited

Loading

### Uh oh!

There was an error while loading. Please reload this page.

I've been running this pattern against my personal Obsidian vault with 4,000+ journal entries, research notes, and project logs over 2+ years. Not curated papers per topic but like my real, everything second brain.

A few things I hit that might save others time:

-   **Index files will break.** It is simple and a great step on the path of "giving the LLM a map" so agentic retrieval can work. At 100 curated articles, auto-maintained indexes work great. At thousands of messy personal notes, with heterogenous note types and over lapping topics, you need some basic ETL from data engineering. And even then, naive semantic search returns 10 versions of your loudest thought — not 10 facets of your thinking. What actually fixed retrieval quality for me: overfetch 3x, deduplicate near-identical content, then re-rank for diversity (MMR). The difference is night and day. I did try more advanced versions of this by clustering on embeddings and summarizing clusters, this is pretty cool but the simpler de-dupe on retrieval helped a lot.
-   **Links are the whole thing.** I treat tags and links as first-class graph nodes, not just metadata. Then the agent can traverse from a search hit into the thought neighborhood around it. That's where the compound value lives. You're building a graph in this pattern whether you call it one or not. It also makes my new capture flow much easier b/c the LLM helps me maintain my taxonomy of work streams and topics.
-   **Write-back is the key to compounding**. The gist mentions filing outputs back into the wiki almost in passing, but after two years I think it's the single most important part. The knowledge base should grow through use, not just ingestion. Every research session, every synthesis, every new connection the agent find is written back. This is great for snipping key ideas from AI chat conversations (it's aMCP server I use so I can export data out of Claude or GPT ui easily.) It also helps me track active work streams. I always make it clear though which data I wrote and limit the agent to write to a specific location. Makes it easy to filter out what's my thinking.

Been building the open source tooling for this as an MCP server — one SQLite file, works with Claude natively: [https://github.com/bitsofchris/openaugi](https://github.com/bitsofchris/openaugi).

If anyone's trying this with personal notes instead of research papers, happy to talk. I've also been using it to manage my human context better so I can orchestrate multiple agents.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@emailhuynhhuy](https://avatars.githubusercontent.com/u/259412335?s=80&v=4)](/emailhuynhhuy)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[emailhuynhhuy](/emailhuynhhuy)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086296#gistcomment-6086296) •

edited

Loading

### Uh oh!

There was an error while loading. Please reload this page.

> I've been running this pattern against my personal Obsidian vault with 4,000+ journal entries, research notes, and project logs over 2+ years. Not curated papers per topic but like my real, everything second brain.
> 
> A few things I hit that might save others time:
> 
> -   **Index files will break.** It is simple and a great step on the path of "giving the LLM a map" so agentic retrieval can work. At 100 curated articles, auto-maintained indexes work great. At thousands of messy personal notes, with heterogenous note types and over lapping topics, you need some basic ETL from data engineering. And even then, naive semantic search returns 10 versions of your loudest thought — not 10 facets of your thinking. What actually fixed retrieval quality for me: overfetch 3x, deduplicate near-identical content, then re-rank for diversity (MMR). The difference is night and day. I did try more advanced versions of this by clustering on embeddings and summarizing clusters, this is pretty cool but the simpler de-dupe on retrieval helped a lot.
> -   **Links are the whole thing.** I treat tags and links as first-class graph nodes, not just metadata. Then the agent can traverse from a search hit into the thought neighborhood around it. That's where the compound value lives. You're building a graph in this pattern whether you call it one or not. It also makes my new capture flow much easier b/c the LLM helps me maintain my taxonomy of work streams and topics.
> -   **Write-back is the key to compounding**. The gist mentions filing outputs back into the wiki almost in passing, but after two years I think it's the single most important part. The knowledge base should grow through use, not just ingestion. Every research session, every synthesis, every new connection the agent find is written back. This is great for snipping key ideas from AI chat conversations (it's aMCP server I use so I can export data out of Claude or GPT ui easily.) It also helps me track active work streams. I always make it clear though which data I wrote and limit the agent to write to a specific location. Makes it easy to filter out what's my thinking.
> 
> Been building the open source tooling for this as an MCP server — one SQLite file, works with Claude natively: [https://github.com/bitsofchris/openaugi](https://github.com/bitsofchris/openaugi).
> 
> If anyone's trying this with personal notes instead of research papers, happy to talk. I've also been using it to manage my human context better so I can orchestrate multiple agents.

This resonates a lot — especially your point that write-back is the core mechanic. I went through a similar phase, but eventually realized that write-back alone doesn’t complete the learning loop.

What made a real difference for me was reframing the system around decision-based learning, not just knowledge accumulation.

A working learning loop looks like this:

1.  Task → not just retrieval, but decision context  
    The system shouldn’t just surface relevant notes, but structure the problem into actionable options (A/B/C with reasoning and risk).
    
2.  Decision → human stays in the loop  
    The user selects an option. This step is critical — without an explicit decision, the system has nothing to learn from.
    
3.  Outcome → success or failure signal  
    After execution, the result is captured. Not just “what was done”, but whether it worked.
    
4.  Memory → structured experience, not raw notes  
    Instead of just writing back summaries, I store:
    

decisions made  
context  
outcomes (success / failure)

Especially failure cases — they become high-priority constraints for future reasoning.

5.  System update → affects future routing and reasoning  
    The key is that this memory is not passive. It actively changes:

what options are generated  
which paths are avoided  
how future tasks are interpreted

So the loop becomes:

task → options → decision → outcome → memory → better options next time

At that point, the system is no longer just retrieving knowledge or maintaining a graph — it’s accumulating operational experience.

That was the shift for me from “second brain” to something closer to a decision system.

Really appreciate you sharing your experience — especially the scaling challenges with real-world data. This is the learning loop i built for my small local LLM.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@waydelyle](https://avatars.githubusercontent.com/u/16001190?s=80&v=4)](/waydelyle)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[waydelyle](/waydelyle)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086341#gistcomment-6086341)

Built [SwarmVault](https://github.com/swarmclawai/swarmvault) as an open-source TypeScript CLI that implements this pattern end-to-end: `ingest` → `compile` → `query` → `lint`, with a persistent markdown wiki, knowledge graph (community detection, god nodes, confidence-scored edges), and local search index. Save-first queries, candidate staging before pages go live, per-project schemas, code-aware ingestion, and an MCP server for agent interop. Works with OpenAI, Anthropic, Gemini, Ollama, or any compatible backend. Directly inspired by this gist. Feedback from the discussion here shaped a lot of the design (candidate buffers, grounding in sources, scheduled agents). [https://github.com/swarmclawai/swarmvault](https://github.com/swarmclawai/swarmvault)

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@007bsd](https://avatars.githubusercontent.com/u/22483432?s=80&v=4)](/007bsd)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[007bsd](/007bsd)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086347#gistcomment-6086347)

Great stuffs! Any examples one could refer to?

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@sakhmedbayev](https://avatars.githubusercontent.com/u/8005396?s=80&v=4)](/sakhmedbayev)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[sakhmedbayev](/sakhmedbayev)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086405#gistcomment-6086405)

Question for people running this in production: one unified Obsidian vault across all life domains, or split by domain into separate vaults?

Splitting feels mentally cleaner, but it seems to defeat the entire point of the pattern — the LLM can only weave cross-domain connections if it sees everything in one place, and the most interesting insights tend to happen exactly at the seams between domains.

Did those of you who split feel you lost the cross-pollination? Did those who unified find a way to handle mental-mode separation within one vault?

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@hsuanguo](https://avatars.githubusercontent.com/u/41297879?s=80&v=4)](/hsuanguo)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[hsuanguo](/hsuanguo)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086406#gistcomment-6086406)

Thanks for the idea, had a try with this with skills + cli, should be easy enough to use  
[https://github.com/hsuanguo/llm-wiki](https://github.com/hsuanguo/llm-wiki)

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@javi2375](https://avatars.githubusercontent.com/u/163609149?s=80&v=4)](/javi2375)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[javi2375](/javi2375)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086431#gistcomment-6086431)

How is this different from almost all markdown based memory solutions in the past year. See: mem-agent-mcp, which uses a finetuned qwen3 4B for the actual file modification/manipulation of the obsidian-like vault.

What we need is this kind of system, not tied to a cloud LLM. It’s not rocket science or something that needs massive parameters, and the main (larger) language model can filter out what the meat is in the context and send to the small  
model with one task only, growing the wiki.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@mariocjun](https://avatars.githubusercontent.com/u/43505626?s=80&v=4)](/mariocjun)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[mariocjun](/mariocjun)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086461#gistcomment-6086461)

Seria ótimo se alguém da comunidade montasse um pequeno benchmark compartilhado para esses sistemas de memória. Mesmo um conjunto simples de documentos, um lote fixo de consultas e algumas métricas básicas já facilitariam comparações.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@OuttaSpaceTime](https://avatars.githubusercontent.com/u/79710091?s=80&v=4)](/OuttaSpaceTime)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[OuttaSpaceTime](/OuttaSpaceTime)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086508#gistcomment-6086508)

I think this may be a very potent additional layer: [https://www.productcompass.pm/p/self-improving-claude-system](https://www.productcompass.pm/p/self-improving-claude-system)

I am currently exploring this as a coaching and learning self referential about the human, his goals and how he interacts with the system.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@Houseofmvps](https://avatars.githubusercontent.com/u/223674346?s=80&v=4)](/Houseofmvps)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[Houseofmvps](/Houseofmvps)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086545#gistcomment-6086545) •

edited

Loading

### Uh oh!

There was an error while loading. Please reload this page.

For codebases I built this same pattern without an LLM. TypeScript projects get the compiler API, everything else (Python, Go, Ruby, Java, Rust) uses regex detection across 25+ frameworks. No API calls, deterministic, 200ms. Same core idea compile once into domain articles, query the wiki instead of re-reading files each session. The one advantage over LLM compiled wikis is the extractor can't hallucinate your route paths or database schema. What it finds is exactly what's in the code.

npx codesight --wiki on any project. [https://github.com/Houseofmvps/codesight](https://github.com/Houseofmvps/codesight)

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@mojzis](https://avatars.githubusercontent.com/u/1639610?s=80&v=4)](/mojzis)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[mojzis](/mojzis)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086553#gistcomment-6086553)

wdyt about this, sounds like a neat implementation of the principles ? [https://github.com/milla-jovovich/mempalace](https://github.com/milla-jovovich/mempalace)

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@gourav-sg](https://avatars.githubusercontent.com/u/1283523?s=80&v=4)](/gourav-sg)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[gourav-sg](/gourav-sg)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086564#gistcomment-6086564)

its massively interesting how less is this thread about designing and is turning more and more into devops based tooling feature discussion - but I may be wrong. [@karpathy](https://github.com/karpathy) this is still perhaps a design discussion right? In that case are we not trying to build essentially knowledge graphs the same way that WWW conventions have been used? I think that the most critical part will be common vocubulary building as a foundation. Once again I may be completely wrong, but thought of asking.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@TheLazyLizzard](https://avatars.githubusercontent.com/u/5247411?s=80&v=4)](/TheLazyLizzard)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[TheLazyLizzard](/TheLazyLizzard)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086611#gistcomment-6086611)

This is not an idea at all, it’s something I’ve been running at work for some time. In fact, the only way I can explain the similarities between what I do with my LLM agent (for a long time already) and what you are describing here is, erm, either we just totally think the same way or you saw the recording of me demonstrating this. This is most certainly the way, as far as I am concerned. The BM25 speeds up retrieval but results in a lack of accuracy (which you can overcome pretty easily). Once you realize you can do more than BM25, things get interesting too.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@carson-nr](https://avatars.githubusercontent.com/u/22012608?s=80&v=4)](/carson-nr)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[carson-nr](/carson-nr)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086615#gistcomment-6086615)

> For codebases I built this same pattern without an LLM. TypeScript projects get the compiler API, everything else (Python, Go, Ruby, Java, Rust) uses regex detection across 25+ frameworks. No API calls, deterministic, 200ms. Same core idea compile once into domain articles, query the wiki instead of re-reading files each session. The one advantage over LLM compiled wikis is the extractor can't hallucinate your route paths or database schema. What it finds is exactly what's in the code.
> 
> npx codesight --wiki on any project. [https://github.com/Houseofmvps/codesight](https://github.com/Houseofmvps/codesight)

This works for building out a wiki for a coding project, but I think the gist is saying this concept can be applied to creative writing as well as technical writing. Basically any situation with organized notes.

If I'm trying to do world building for a book I'm writing I don't see how typescript is going to help with that without an llm.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@Anboias](https://avatars.githubusercontent.com/u/16767364?s=80&v=4)](/Anboias)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[Anboias](/Anboias)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086619#gistcomment-6086619)

> I have my bot CONSTANTLY push gists... when in mid development - Ill often tell them "OK Great, now publish all this to a gist, give visuals, diagrams as SVGs - include mermaid and sankey logic as appropriate, give me the link" <-- Its a wonderful tool, then I just push Gists between frontiers, like having [@grok](https://github.com/grok) read them, then publish a response for claude and my agents etc... USE MORE GISTS!!

This one might prove handy too [https://saved.md](https://saved.md)

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@monksy](https://avatars.githubusercontent.com/u/615363?s=80&v=4)](/monksy)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[monksy](/monksy)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086642#gistcomment-6086642)

Any work being done on Joplin for this?

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@visakadev](https://avatars.githubusercontent.com/u/167757357?s=80&v=4)](/visakadev)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[visakadev](/visakadev)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086647#gistcomment-6086647)

> wdyt about this, sounds like a neat implementation of the principles ? [https://github.com/milla-jovovich/mempalace](https://github.com/milla-jovovich/mempalace)

MemPalace is solid, but it's solving a different problem than the wiki pattern.  
It's a semantic search engine — you ask "how does auth work?" and it finds relevant chunks across your repos. That's RAG, not a wiki.  
Karpathy's key insight is compilation over retrieval. Instead of re-finding and re-piecing together the answer every time, the AI writes it down once as interlinked markdown pages and keeps them current. The knowledge compounds — cross-references are already there, contradictions already flagged.  
Where MemPalace fits really well is as the discovery layer underneath the wiki. During ingest, the AI uses MemPalace to find the right source files across repos, then compiles that into wiki pages. During queries, it's the fallback when the wiki doesn't cover something yet. But the wiki is what turns scattered search results into connected understanding.  
tl;dr: MemPalace finds things. A wiki connects things. They're complementary layers

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@torchy55](https://avatars.githubusercontent.com/u/8405182?s=80&v=4)](/torchy55)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[torchy55](/torchy55)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086665#gistcomment-6086665)

> g of me demonstrating this. This is most certainly the way, as far as I am concerned. T

Can you post how?

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@asong56](https://avatars.githubusercontent.com/u/238927804?s=80&v=4)](/asong56)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[asong56](/asong56)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086671#gistcomment-6086671)

One disadvantage might be that AI hallucinations can become permanently embedded as facts, causing errors to propagate. It also has maintenance burden, you have to check and clean the notes.

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@jeovanimeza92-code](https://avatars.githubusercontent.com/u/250586314?s=80&v=4)](/jeovanimeza92-code)

Sorry, something went wrong.

Quote reply

### Uh oh!

There was an error while loading. Please reload this page.

### 

**[jeovanimeza92-code](/jeovanimeza92-code)** commented [Apr 7, 2026](/karpathy/442a6bf555914893e9891c11519de94f?permalink_comment_id=6086676#gistcomment-6086676)

?

Sorry, something went wrong.

### Uh oh!

There was an error while loading. Please reload this page.

[![@asudbring](https://avatars.githubusercontent.com/u/26909696?s=80&v=4)](/asudbring)

Comment 

Write Preview

Heading

Bold

Italic

Quote

Code

Link

---

Numbered list

Unordered list

Task list

---

Attach files

Mention

Reference

Menu

-   Heading
-   Bold
-   Italic
-   Quote
-   Code
-   Link

-   Numbered list
-   Unordered list
-   Task list

-   Attach files
-   Mention
-   Reference

# Select a reply

Loading

### Uh oh!

There was an error while loading. Please reload this page.

[Create a new saved reply](/settings/replies?return_to=1)

There was an error creating your Gist.

Leave a comment

We don’t support that file type.

Try again with GIF, JPEG, JPG, MOV, MP4, PNG, SVG, WEBM or WEBP.

Attaching documents requires write permission to this repository.

Try again with GIF, JPEG, JPG, MOV, MP4, PNG, SVG, WEBM or WEBP.

This file is empty.

Try again with a file that’s not empty.

This file is hidden.

Try again with another file.

Something went really wrong, and we can’t process that file.

Try again.

[Markdown is supported](https://docs.github.com/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

Paste, drop, or click to add files

        

Nothing to preview

Comment