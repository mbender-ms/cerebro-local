# Wiki Conventions and Page Standards

## Every Wiki Page Must Have

### YAML Frontmatter

```yaml
---
title: Page Title
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources:
  - service-area/filename.md
tags:
  - relevant-tag
---
```

### Cross-References

Use Obsidian-style wiki links for all cross-references:

```markdown
[[entities/azure-nat-gateway]]
[[concepts/snat]]
[[comparisons/private-endpoints-vs-service-endpoints]]
```

### Source Citations

Every factual claim should cite its source inline:

```markdown
NAT Gateway provides 64,512 SNAT ports per public IP. (source: nat-gateway-resource.md)
```

### Conflict Callouts

When new information contradicts existing wiki content:

```markdown
> [!CONFLICT]
> **Old claim**: Standard SKU supports zone redundancy (source: old-article.md)
> **New claim**: Standard SKU is zonal only; StandardV2 is zone-redundant (source: nat-sku.md)
> **Status**: Unresolved
```

## Page Types

### Entity Pages (`wiki/entities/`)

One per Azure service. Structure:

```markdown
# Service Name

One-paragraph description. (source: overview.md)

## Key Features
- Feature 1 (source: file.md)
- Feature 2

## SKUs (if applicable)
| Feature | SKU A | SKU B |
|---------|-------|-------|

## Key Limitations
- Limitation 1 (source: file.md)

## Links
- [[related-entity]]
- [[related-concept]]
- [[sources/service-docs]]
```

### Concept Pages (`wiki/concepts/`)

Technical concepts that span services. Structure:

```markdown
# Concept Name

Clear definition and explanation. (source: file.md)

## How It Works
Technical details...

## Key Behaviors
- Behavior 1

## Links
- [[entities/service-that-uses-this]]
```

### Comparison Pages (`wiki/comparisons/`)

Side-by-side analysis. Structure:

```markdown
# X vs Y (or "Options for Z")

## Comparison Table
| Dimension | Option A | Option B |
|-----------|----------|----------|

## When to Use Each
### Choose A when: ...
### Choose B when: ...

## Links
```

### Pattern Pages (`wiki/patterns/`)

Deployment architectures. Structure:

```markdown
# Pattern Name

## Problem Statement
What you're trying to solve.

## Architecture
How it works. Numbered steps.

## Design Considerations
Gotchas, constraints, best practices.

## Links
```

### Source Summary Pages (`wiki/sources/`)

One per service area. Structure:

```markdown
# Source: Service Name (N articles)

N articles from `MicrosoftDocs/azure-docs/articles/service/`.

## Articles by Type
Tables of articles organized by type.

## Wiki Pages Created from These Sources
- [[entities/service]]
- [[concepts/related-concept]]
```

## Writing Style

- Write for a technically proficient professional familiar with Azure
- Be precise and concise
- Prefer tables and bullet points over prose for reference content
- Use code blocks for commands, configurations, and API examples
- Every page should have a Links section at the bottom
