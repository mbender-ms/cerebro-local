---
title: "Source: Azure NAT Gateway Documentation (27 articles)"
created: 2026-04-07
updated: 2026-04-07
sources:
  - nat-gateway/nat-overview.md
  - nat-gateway/nat-gateway-resource.md
  - nat-gateway/nat-gateway-snat.md
  - nat-gateway/nat-gateway-design.md
  - nat-gateway/nat-sku.md
  - nat-gateway/nat-gateway-v2-migrate.md
  - nat-gateway/nat-gateway-flow-logs.md
  - nat-gateway/monitor-nat-gateway.md
  - nat-gateway/monitor-nat-gateway-flow-logs.md
  - nat-gateway/monitor-nat-gateway-reference.md
  - nat-gateway/nat-metrics.md
  - nat-gateway/resource-health.md
  - nat-gateway/manage-nat-gateway.md
  - nat-gateway/manage-nat-gateway-v2.md
  - nat-gateway/quickstart-create-nat-gateway.md
  - nat-gateway/quickstart-create-nat-gateway-v2.md
  - nat-gateway/quickstart-create-nat-gateway-v2-templates.md
  - nat-gateway/region-move-nat-gateway.md
  - nat-gateway/troubleshoot-nat.md
  - nat-gateway/troubleshoot-nat-connectivity.md
  - nat-gateway/troubleshoot-nat-and-azure-services.md
  - nat-gateway/tutorial-hub-spoke-nat-firewall.md
  - nat-gateway/tutorial-hub-spoke-route-nat.md
  - nat-gateway/tutorial-migrate-ilip-nat.md
  - nat-gateway/tutorial-migrate-outbound-nat.md
  - nat-gateway/tutorial-nat-gateway-load-balancer-internal-portal.md
  - nat-gateway/tutorial-nat-gateway-load-balancer-public-portal.md
tags:
  - source-summary
  - azure-nat-gateway
  - ms-learn
---

# Source: Azure NAT Gateway Documentation

27 articles from `MicrosoftDocs/azure-docs/articles/nat-gateway/`, covering the complete Azure NAT Gateway service documentation on Microsoft Learn.

**Total**: 27 articles, ~60,000 words, 308 chunks after splitting.

## Articles by Type

### Overviews (2)
| Article | Key content |
|---------|------------|
| nat-overview.md | Service definition, two SKUs, benefits, basics, how it works |
| nat-sku.md | SKU comparison table, StandardV2 features, known limitations |

### Concepts (5)
| Article | Key content |
|---------|------------|
| nat-gateway-resource.md | Architecture, subnets, IPs, SNAT ports, zones, protocols, timers, bandwidth, limitations |
| nat-gateway-snat.md | Dynamic port allocation, port selection/reuse, many-to-one SNAT, example flows |
| nat-gateway-design.md | Design patterns: internet connectivity, zone-redundancy, scaling, Private Link, hub-spoke, UDRs, default outbound replacement |
| nat-gateway-v2-migrate.md | Standard → StandardV2 migration guidance, unsupported scenarios, known issues |
| nat-gateway-flow-logs.md | StandardV2 flow log capability, log format, FAQs |

### How-To (7)
| Article | Key content |
|---------|------------|
| manage-nat-gateway.md | Create, delete, add/remove public IPs and prefixes (Standard SKU, tabbed: Portal/PS/CLI) |
| manage-nat-gateway-v2.md | Same operations for StandardV2 SKU |
| nat-metrics.md | Metrics overview, dashboard setup, alert configuration, Network Insights |
| monitor-nat-gateway.md | Azure Monitor integration |
| monitor-nat-gateway-flow-logs.md | Configure flow log queries |
| monitor-nat-gateway-reference.md | Metrics reference data |
| resource-health.md | Resource health status indicators and alerts |
| region-move-nat-gateway.md | Redeploy NAT Gateway after region move |

### Quickstarts (3)
| Article | Key content |
|---------|------------|
| quickstart-create-nat-gateway.md | Create Standard NAT Gateway (Portal/PS/CLI, 3-tab) |
| quickstart-create-nat-gateway-v2.md | Create StandardV2 NAT Gateway (Portal/PS/CLI, 3-tab) |
| quickstart-create-nat-gateway-v2-templates.md | Create StandardV2 via Bicep/ARM/Terraform templates |

### Tutorials (5)
| Article | Key content |
|---------|------------|
| tutorial-hub-spoke-nat-firewall.md | NAT Gateway + Azure Firewall in hub-spoke |
| tutorial-hub-spoke-route-nat.md | NAT Gateway + NVA route table in hub-spoke |
| tutorial-migrate-ilip-nat.md | Migrate VM instance-level PIP to NAT Gateway |
| tutorial-migrate-outbound-nat.md | Migrate default outbound and LB outbound to NAT Gateway |
| tutorial-nat-gateway-load-balancer-internal-portal.md | NAT Gateway + internal LB |
| tutorial-nat-gateway-load-balancer-public-portal.md | NAT Gateway + public LB |

### Troubleshooting (3)
| Article | Key content |
|---------|------------|
| troubleshoot-nat-connectivity.md | SNAT exhaustion, no connectivity, IP not used, FTP, port 25, best practices |
| troubleshoot-nat.md | Configuration basics, failed states, subnet/IP management issues |
| troubleshoot-nat-and-azure-services.md | Issues with App Services, AKS, Firewall, Databricks |

## Wiki Pages Created from These Sources

- [[entities/azure-nat-gateway]] — main service entity page
- [[concepts/snat]] — SNAT mechanics and port allocation
- [[concepts/default-outbound-access]] — what NAT Gateway replaces
- [[concepts/availability-zones-nat]] — zone behavior by SKU
- [[concepts/troubleshooting-nat-gateway]] — compiled troubleshooting guide
- [[comparisons/nat-gateway-standard-vs-standardv2]] — SKU comparison
- [[patterns/nat-gateway-hub-spoke]] — hub-and-spoke deployment patterns
- [[patterns/nat-gateway-with-load-balancer]] — load balancer integration patterns
