# Question 5 — Tier 2 Languages in Azure Networking Documentation

**Question**: Which of the following tier 2 languages does your team currently include in documentation?

**Generated**: 2026-04-09
**Scope**: 21 Azure networking service areas, 1,327 articles

---

## Quick Answer Table

| Language | In Docs? | Code Blocks | Articles | Services | 
|----------|:--------:|:-----------:|:--------:|:--------:|
| **Azure CLI** | ✅ **Yes** | 1,371 | 216 | 21/21 |
| **Azure PowerShell** | ✅ **Yes** | 2,516 | 354 | 21/21 |
| **Bicep** | ✅ **Yes** | 53 | 8 | 4/21 |
| **KQL** | ✅ **Yes** | 70 | 16 | 11/21 |
| **Terraform** | ✅ **Yes** | 14 | 4 | 3/21 |
| **SQL** | ❌ No | 0 | 0 | 0/21 |
| **Kotlin** | ❌ No | 0 | 0 | 0/21 |
| **Gremlin** | ❌ No | 0 | 0 | 0/21 |
| **Azure Developer CLI** | ❌ No | 0 | 0 | 0/21 |
| **GitHub Actions** | ❌ No | 0 | 0 | 0/21 |
| **GitHub CLI** | ❌ No | 0 | 0 | 0/21 |

**Networking uses 5 of the 11 tier 2 languages: Azure CLI, Azure PowerShell, Bicep, KQL, and Terraform.**

---

## Detailed Breakdown

### ✅ Azure CLI (`azurecli`) — Primary deployment language

| Service | Articles | Blocks |
|---------|:--------:|:------:|
| application-gateway | 24 | 126 |
| bastion | 7 | 37 |
| cdn | 3 | 6 |
| dns | 20 | 118 |
| expressroute | 8 | 79 |
| firewall | 17 | 78 |
| firewall-manager | 4 | 12 |
| frontdoor | 10 | 55 |
| ip-services | 20 | 102 |
| load-balancer | 25 | 155 |
| nat-gateway | 6 | 53 |
| network-watcher | 14 | 91 |
| networking | 1 | 1 |
| private-link | 15 | 70 |
| route-server | 2 | 16 |
| traffic-manager | 4 | 18 |
| virtual-network | 23 | 250 |
| virtual-network-manager | 6 | 34 |
| virtual-wan | 1 | 4 |
| vpn-gateway | 5 | 65 |
| web-application-firewall | 1 | 1 |
| **TOTAL** | **216** | **1,371** |

Used in every service. Primary tool for quickstarts, how-to guides, and tutorials. Uses `azurecli` tag consistently.

### ✅ Azure PowerShell (`azurepowershell` + `powershell`) — Co-primary deployment language

| Tag | Articles | Blocks |
|-----|:--------:|:------:|
| `azurepowershell` | 299 | 2,028 |
| `powershell` (generic) | 100 | 488 |
| **Combined** | **354** | **2,516** |

Top services by PowerShell block count:
- vpn-gateway: 333 blocks (heaviest PS usage of any service)
- virtual-network: 216 blocks
- expressroute: 202 blocks
- application-gateway: 185 blocks
- load-balancer: 165 blocks

PowerShell is actually the **#1 code language by block count** in networking docs, exceeding Azure CLI. Especially dominant in vpn-gateway and expressroute.

### ✅ KQL / Kusto — Diagnostic and monitoring queries

| Service | Articles | Blocks |
|---------|:--------:|:------:|
| network-watcher | 2 | 31 |
| virtual-wan | 1 | 11 |
| expressroute | 1 | 6 |
| firewall | 3 | 5 |
| virtual-network-manager | 2 | 5 |
| application-gateway | 1 | 4 |
| load-balancer | 2 | 3 |
| firewall-manager | 1 | 2 |
| cdn | 1 | 1 |
| ip-services | 1 | 1 |
| nat-gateway | 1 | 1 |
| **TOTAL** | **16** | **70** |

Used in monitoring/diagnostics articles across 11 services. Heaviest in network-watcher (traffic analytics queries). Uses `kusto` tag.

### ✅ Bicep — Infrastructure as Code (emerging)

| Service | Articles | Blocks |
|---------|:--------:|:------:|
| frontdoor | 3 | 39 |
| virtual-network-manager | 2 | 9 |
| nat-gateway | 2 | 4 |
| virtual-network | 1 | 1 |
| **TOTAL** | **8** | **53** |

Emerging in newer articles. Only 4 of 21 services include Bicep samples. Uses `bicep` tag.

### ✅ Terraform / HCL — Infrastructure as Code (minimal)

| Service | Articles | Blocks | Tag |
|---------|:--------:|:------:|-----|
| nat-gateway | 1 | 4 | `terraform` |
| ip-services | 2 | 3 | `terraform` |
| nat-gateway | 1 | 5 | `hcl` |
| private-link | 1 | 2 | `hcl` |
| **TOTAL** | **4** | **14** | |

Very limited. Only 3 services have Terraform/HCL content. Uses both `terraform` and `hcl` tags (inconsistent).

---

## Not Used

| Language | Notes |
|----------|-------|
| **SQL** | No relational database operations in networking docs |
| **Kotlin** | No mobile/Android content |
| **Gremlin** | No graph database content (Cosmos DB–specific) |
| **Azure Developer CLI (azd)** | Networking services aren't deployed via azd templates |
| **GitHub Actions** | No CI/CD pipeline content in networking docs |
| **GitHub CLI** | No GitHub workflow content |

---

## Summary for Survey Response

> **Q5: Which tier 2 languages does your team currently include?**
>
> - ✅ **Azure CLI** — 1,371 code blocks across 216 articles (all 21 services)
> - ✅ **Azure PowerShell** — 2,516 code blocks across 354 articles (all 21 services) — actually our highest-volume code language
> - ✅ **KQL** — 70 code blocks across 16 articles (11 services, primarily network-watcher traffic analytics)
> - ✅ **Bicep** — 53 code blocks across 8 articles (4 services, emerging adoption)
> - ✅ **Terraform** — 14 code blocks across 4 articles (3 services, minimal)
>
> Not used: SQL, Kotlin, Gremlin, Azure Developer CLI, GitHub Actions, GitHub CLI

---

## Recommendations

1. **Bicep expansion**: Only 4/21 services have Bicep. Quickstarts and tutorials across all services should include Bicep alongside CLI/PS.

2. **Terraform expansion**: Only 3/21 services. Given Terraform's market share for IaC, more services should offer Terraform deployment articles.

3. **Tag standardization**: Terraform uses both `terraform` and `hcl` tags inconsistently. Standardize to `terraform`.

4. **KQL expansion**: Only network-watcher has significant KQL content. All services with Azure Monitor diagnostics should include sample KQL queries for common scenarios.

5. **PowerShell tag audit**: 299 articles use `azurepowershell` and 100 use `powershell`. Consider whether the generic `powershell` articles should be retagged to `azurepowershell` for consistency.
