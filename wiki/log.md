---
title: Operations Log
created: 2026-04-07
updated: 2026-04-07
---

# Operations Log

> Append-only chronological record of wiki operations.
> Each entry: `## [YYYY-MM-DD] operation | Title`
> Parse with: `grep "^## \[" wiki/log.md | tail -10`

## [2026-04-07] init | Knowledge base initialized

Created directory structure, schema, index, and log. Ready for first ingest.

## [2026-04-07] ingest | LLM Wiki by Andrej Karpathy

Source: `raw/articles/karpasky.md` (GitHub Gist, April 2026)

Pages created (11):
- `wiki/sources/karpathy-llm-wiki.md` — source summary
- `wiki/entities/andrej-karpathy.md` — person
- `wiki/entities/obsidian.md` — tool
- `wiki/entities/qmd.md` — tool
- `wiki/concepts/llm-wiki-pattern.md` — core methodology
- `wiki/concepts/three-layer-architecture.md` — architecture
- `wiki/concepts/ingest.md` — operation
- `wiki/concepts/query.md` — operation
- `wiki/concepts/lint.md` — operation
- `wiki/concepts/write-back.md` — compounding mechanism
- `wiki/concepts/memex.md` — historical concept
- `wiki/patterns/karpathy-wiki-setup.md` — setup pattern

Pages updated (1):
- `wiki/index.md` — added all 12 new pages

## [2026-04-07] ingest | Azure NAT Gateway Documentation (27 articles)

Source: `raw/articles/nat-gateway/*.md` (27 MS Learn articles, ~60K words)

Downloaded from: https://github.com/MicrosoftDocs/azure-docs/tree/main/articles/nat-gateway

Article types: 2 overviews, 5 concepts, 7 how-to, 3 quickstarts, 5 tutorials, 3 troubleshooting.
Chunked via `scripts/chunk-article.js` → 308 chunks analyzed.

Pages created (8):
- `wiki/entities/azure-nat-gateway.md` — main service entity (SKUs, limits, config, monitoring)
- `wiki/concepts/snat.md` — SNAT mechanics, dynamic port allocation, port reuse
- `wiki/concepts/default-outbound-access.md` — legacy outbound, deprecation, migration
- `wiki/concepts/availability-zones-nat.md` — Standard (zonal) vs StandardV2 (zone-redundant)
- `wiki/concepts/troubleshooting-nat-gateway.md` — compiled troubleshooting guide
- `wiki/comparisons/nat-gateway-standard-vs-standardv2.md` — full SKU comparison
- `wiki/patterns/nat-gateway-hub-spoke.md` — hub-spoke with Firewall, NVA, or per-spoke
- `wiki/patterns/nat-gateway-with-load-balancer.md` — internal LB, public LB, priority rules
- `wiki/sources/nat-gateway-docs.md` — source summary covering all 27 articles

Pages updated (1):
- `wiki/index.md` — added all 9 new pages
