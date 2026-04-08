# MS Learn Article Chunking Strategy

## Why Chunk Before Ingest

Azure documentation articles from Microsoft Learn are typically 100–600 lines
with multiple H2 sections, tabbed deployment methods (Portal/PowerShell/CLI),
and zone-pivot variants. Ingesting an entire article as one unit produces wiki
pages that are too broad for precise retrieval. Chunking at H2 boundaries with
tab/pivot separation produces focused pieces that map cleanly to wiki concepts.

## Article Anatomy

MS Learn articles follow a predictable structure:

```
---
title: Create an Azure NAT Gateway         ← YAML frontmatter
ms.service: azure-nat-gateway
ms.topic: quickstart
ms.date: 04/30/2025
---
# Quickstart: Create a NAT gateway         ← H1 (article title)

Intro paragraph...                          ← Overview chunk

## Prerequisites                            ← H2 = primary chunk boundary
### [Portal](#tab/portal)                   ← Tab group start
  ... portal-specific content ...
### [PowerShell](#tab/powershell)           ← Next tab
  ... powershell-specific content ...
### [CLI](#tab/cli)                         ← Next tab
  ... cli-specific content ...
---                                         ← Tab group terminator

## Create the NAT gateway                   ← Another H2 with tabs
### [Portal](#tab/portal)
...
---

::: zone pivot="azure-portal"              ← Zone pivot (alternative to tabs)
[!INCLUDE [file](path)]                     ← Include reference
::: zone-end

## Next steps                               ← Skipped (boilerplate)
```

## Chunking Rules

| Rule | Description |
|------|-------------|
| **Primary split: H2** | Every `## Section` becomes its own chunk |
| **Tab separation** | `### [Label](#tab/id)` groups → one chunk per tab |
| **Zone pivot separation** | `::: zone pivot="x"` blocks → one chunk per pivot |
| **Frontmatter propagation** | Every chunk inherits `ms.service`, `ms.topic`, `ms.date` |
| **Header path** | Each chunk records `H1 > H2` hierarchy |
| **Deployment method tag** | Tab chunks get `deployment-method: portal/powershell/cli` |
| **Intro chunk** | Content between H1 and first H2 → `*-overview` chunk |
| **Skip boilerplate** | "Next steps", "Clean up resources", "Related content" dropped |
| **Include references** | `[!INCLUDE]` lines preserved as-is |

## Chunk Output Format

Each chunk is a standalone markdown file with enriched frontmatter:

```yaml
---
title: "Create the NAT gateway (CLI)"
chunk-of: "Create an Azure NAT Gateway"
ms.service: "azure-nat-gateway"
ms.topic: "quickstart"
article-date: "04/30/2025"
header-path: "Quickstart: Create a NAT gateway > Create the NAT gateway"
tags:
  - azure-nat-gateway
  - quickstart
  - cli
deployment-method: "cli"
---
```

## Usage

```bash
# Preview what chunks an article produces
node scripts/chunk-article.js raw/articles/nat-gateway/nat-overview.md --summary

# Write chunks to a temp directory for review
node scripts/chunk-article.js raw/articles/nat-gateway/quickstart.md --output-dir /tmp/chunks

# Dry run — shows first 8 lines of each chunk
node scripts/chunk-article.js raw/articles/nat-gateway/article.md --dry-run
```

## Example Chunk Counts by Article Type

| Article type | Example | Chunks |
|-------------|---------|--------|
| Overview (no tabs) | nat-overview.md | 6 |
| Quickstart (3 tabs) | quickstart-create-nat-gateway.md | 20 |
| Troubleshooting | troubleshoot-nat-connectivity.md | 10 |
| Zone pivot tutorial | load-balancer-multiple-ip.md | 4 |

## When to Use the Chunker

The chunker is a **pre-processing step** for the LLM ingest workflow:

1. Run `--summary` to understand the article structure
2. LLM reads chunks to inform wiki page creation
3. Chunks are **working artifacts** — they feed the wiki but are NOT stored in `wiki/`
4. The wiki pages are the compiled output; raw articles stay intact in `raw/`
