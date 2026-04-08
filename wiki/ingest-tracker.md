---
title: Ingest Tracker
created: 2026-04-07
updated: 2026-04-07
---

# Ingest Tracker

> Status of raw source ingestion into wiki pages.
> All service areas are ingested. 100% of entity pages have deep cross-links.

## Summary

| Metric | Count |
|--------|-------|
| **Total service areas** | 193 |
| **All ingested** | ✅ Yes |
| **Deep coverage (entity→concept/comparison links)** | 100% |
| **Total raw articles** | 15,229 |
| **Total wiki pages** | 394 |
| — Entities | 140 |
| — Concepts | 47 |
| — Comparisons | 23 |
| — Patterns | 5 |
| — Sources | 177 |
| — System | 3 (index, log, tracker) |
| **qmd vectors** | 88,488 chunks |

## Sync Sources (7 public repos)

| Repo | Script | Flag | Service areas |
|------|--------|------|---------------|
| `MicrosoftDocs/azure-docs` | `sync-raw.sh <service>` | `--learn` | 21 networking + 125 other |
| `MicrosoftDocs/azure-compute-docs` | `sync-raw.sh <service>` | `--compute` | virtual-machines, vmss, aci, service-fabric, impact-reporting |
| `MicrosoftDocs/azure-aks-docs` | `sync-raw.sh <service>` | `--aks` | aks, application-network, kubernetes-fleet |
| `MicrosoftDocs/azure-management-docs` | `sync-raw.sh <service>` | `--mgmt` | azure-arc, acr, copilot, lighthouse, portal, linux, quotas |
| `MicrosoftDocs/well-architected` | `sync-raw.sh well-architected` | `--frameworks` | well-architected |
| `MicrosoftDocs/cloud-adoption-framework` | `sync-raw.sh cloud-adoption-framework` | `--frameworks` | cloud-adoption-framework |
| `MicrosoftDocs/SupportArticles-docs` | `sync-raw.sh support-<service>` | `--support` | 29 support areas |

All repos are **public**. No local git pull required. Sync uses GitHub API + raw downloads.

## MS Learn — Azure Networking (21 service areas, Deep Ingest)

All 21 have entity + concept/comparison/pattern pages. See log.md for details.

## Azure Compute Docs (5 service areas, Deep Ingest)

virtual-machines (1,166), service-fabric (422), vmss (97), container-instances (89), impact-reporting (14).
Deep: managed-disks, vm-availability, container-compute-options.

## Azure AKS Docs (3 service areas, Deep Ingest)

aks (551), kubernetes-fleet (58), application-network (11).
Deep: aks-networking concept.

## Azure Management Docs (7 service areas, Deep Ingest)

azure-arc (459), container-registry (133), copilot (40), lighthouse (32), azure-portal (30), azure-linux (28), quotas (15).
Deep: hybrid-management comparison.

## Cloud Adoption Framework (Deep Ingest)

473 articles. 9 methodology phases, 202 landing zone articles, scenario guidance.
Deep: caf-landing-zones, caf-governance, caf-vs-waf comparison.

## Azure Well-Architected Framework (Deep Ingest)

224 articles. 5 pillars, 30+ service guides, specialized workloads.
Deep: waf-reliability, waf-security, waf-cost-optimization, waf-operational-excellence, waf-performance-efficiency.

## MS Learn — Other Azure Services (125 service areas)

All have entity + source + cross-links to comparison/concept pages.

## Microsoft Support Articles (29 service areas)

902 articles. Deep troubleshooting pages for: VMs (292), AKS (189), Monitor (73), storage (29), networking (53).

## Other Sources

| Source | Wiki Pages |
|--------|------------|
| Karpathy LLM Wiki gist | 12 methodology pages |
