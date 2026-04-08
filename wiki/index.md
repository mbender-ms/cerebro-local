---
title: Index
created: 2026-04-07
updated: 2026-04-07
---

# Knowledge Base Index

> Master catalog of all wiki pages. The LLM reads this first when answering queries.

## Entities

_Service pages, tools, people, organizations._

- [[entities/azure-nat-gateway]] — Fully managed NAT service for outbound internet connectivity; Standard and StandardV2 SKUs (27 sources)
- [[entities/andrej-karpathy]] — AI researcher, author of the LLM Wiki pattern (1 source)
- [[entities/obsidian]] — Local-first markdown knowledge base app; viewing interface for the wiki (1 source)
- [[entities/qmd]] — Local hybrid search engine for markdown files (BM25 + vector + LLM reranking) (1 source)

## Concepts

_Protocols, patterns, principles, mental models._

- [[concepts/snat]] — Source Network Address Translation: how NAT Gateway rewrites private IPs to public IPs for outbound (3 sources)
- [[concepts/default-outbound-access]] — Azure's implicit outbound connectivity; being deprecated, replace with NAT Gateway (3 sources)
- [[concepts/availability-zones-nat]] — Zone behavior: Standard is zonal, StandardV2 is zone-redundant (4 sources)
- [[concepts/troubleshooting-nat-gateway]] — Common failure modes, causes, and fixes for NAT Gateway (3 sources)
- [[concepts/llm-wiki-pattern]] — Core methodology: LLM incrementally builds a persistent wiki from raw sources (1 source)
- [[concepts/three-layer-architecture]] — Raw sources → wiki → schema; the foundational structure (1 source)
- [[concepts/ingest]] — Operation: process a new source into the wiki, touching 10-15 pages (1 source)
- [[concepts/query]] — Operation: ask questions against the wiki, file good answers back (1 source)
- [[concepts/lint]] — Operation: periodic health check for orphans, broken links, contradictions (1 source)
- [[concepts/write-back]] — Filing valuable answers back into the wiki; the key to compounding (1 source)
- [[concepts/memex]] — Vannevar Bush's 1945 vision; intellectual ancestor of the LLM wiki (1 source)

## Comparisons

_Side-by-side analysis across topics._

- [[comparisons/nat-gateway-standard-vs-standardv2]] — Feature-by-feature SKU comparison, migration path, regional availability (3 sources)

## Patterns

_Recurring solutions, deployment patterns, workflows._

- [[patterns/nat-gateway-hub-spoke]] — Hub-and-spoke patterns: NAT Gateway + Firewall, NAT Gateway + NVA, per-spoke NAT (3 sources)
- [[patterns/nat-gateway-with-load-balancer]] — Integration with internal/public load balancers, outbound priority rules (3 sources)
- [[patterns/karpathy-wiki-setup]] — Practical setup pattern: directory structure, toolchain, steps, pros/cons (1 source)

## Sources

_Per-source summary pages._

- [[sources/nat-gateway-docs]] — Azure NAT Gateway documentation: 27 articles, ~60K words from MicrosoftDocs/azure-docs
- [[sources/karpathy-llm-wiki]] — "LLM Wiki" by Andrej Karpathy, GitHub Gist, April 2026 (5,000+ stars)
