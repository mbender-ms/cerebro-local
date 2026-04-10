---
title: Code Content in Azure Networking Documentation
created: 2026-04-09
updated: 2026-04-09
sources:
  - networking/code-survey-2026-04-09.md
tags:
  - networking
  - code
  - azure-cli
  - powershell
  - bicep
  - documentation
---

# Code Content in Azure Networking Documentation

Survey of code blocks across all 21 Azure networking service doc sets (1,327 articles, April 2026).

## Key Stats

| Metric | Value |
|--------|-------|
| Articles with code | 595 / 1,327 (44%) |
| Total code blocks | 3,503 |
| Labeled blocks | 3,331 (95%) |
| Unlabeled blocks | 172 (5%) |

## Language Distribution

| Language | Blocks | Usage |
|----------|--------|-------|
| Azure PowerShell | 347 | Primary deployment language |
| PowerShell (generic) | 274 | Scripts, module commands |
| Azure CLI | 255 | Primary deployment language |
| JSON | 120 | Config, ARM fragments, REST responses |
| Output/Console | 140 | Command output display |
| Bash | 68 | Shell scripts |
| KQL (Kusto) | 56 | Log Analytics queries |
| YAML | 54 | ARM parameters, K8s manifests |
| Bicep | 52 | IaC (emerging — 4 of 21 services) |
| Terraform/HCL | 14 | IaC (minimal — 2 services) |
| XML | 8 | VPN device configs |
| C# | 7 | SDK samples (load-balancer only) |
| REST/HTTP | 7 | API call examples |

## Code-Heaviest Services

| Service | Code Blocks | Primary Languages |
|---------|-------------|-------------------|
| virtual-network | 737 | CLI, PS — subnet/NSG/peering config |
| application-gateway | 604 | CLI — SSL/TLS, health probes |
| load-balancer | 487 | CLI, JSON — rules, health probes |
| vpn-gateway | 478 | CLI, XML — VPN device configs |
| expressroute | 413 | CLI, PS — circuit provisioning |
| dns | 350 | CLI — zone/record management |
| network-watcher | 319 | CLI, JSON, KQL — diagnostics |
| firewall | 277 | CLI — rules, policies |

## Key Findings

1. **CLI + PowerShell dominate** (876 blocks, 26%) — networking docs are infrastructure deployment, not application code
2. **Bicep is emerging** but only in 4 services (frontdoor, nat-gateway, virtual-network-manager, virtual-network)
3. **Terraform is minimal** (14 blocks, 2 services) despite market share
4. **No Python/Java/JS/Go** — networking docs contain zero application-language samples
5. **172 unlabeled blocks** need language tags for syntax highlighting
6. **KQL only in network-watcher** — other services lack diagnostic query examples

## Gaps

- Most services lack Bicep samples (17 of 21)
- Terraform nearly absent (19 of 21 services have zero)
- KQL diagnostic queries missing from most services
- 172 code blocks without language labels

## Links

- [[entities/azure-networking-foundations]] — networking overview
- [[concepts/infrastructure-as-code]] — IaC comparison (Bicep vs ARM vs Terraform)
- [[entities/azure-network-watcher]] — primary KQL/diagnostics service
