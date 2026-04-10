# Question 3 — Code Snippets and Code Includes Survey

**Question**: Do you or your team have any code snippets or code includes in your content? This includes programming languages such as C#, service languages such as SQL, or non-compiled text such as JSON, ARM, HTML, or YAML.

**Answer**: **Yes** — every networking service has code snippets/includes in its content.

**Generated**: 2026-04-09
**Scope**: 21 Azure networking service areas, 1,327 articles

---

## Summary

| Metric | Count |
|--------|-------|
| Total networking articles | 1,327 |
| Articles containing code | 595 (44%) |
| Total code blocks | 3,503 |
| Labeled blocks | 3,331 (95%) |
| Unlabeled blocks | 172 (5%) |

---

## Languages Used

| Language | Blocks | Tag | Notes |
|----------|--------|-----|-------|
| **Azure PowerShell** | 347 | `azurepowershell` | Primary deployment language |
| **PowerShell** (generic) | 274 | `powershell` | Scripts, module commands |
| **Azure CLI** | 255 | `azurecli` | Primary deployment language |
| **JSON** | 120 | `json` | Config, ARM template fragments, REST responses |
| **Output** | 71 | `output` | Command output display |
| **Console** | 69 | `console` | Command output display |
| **Bash** | 68 | `bash` | Shell scripts |
| **Kusto (KQL)** | 56 | `kusto` | Log Analytics / Azure Monitor queries |
| **YAML** | 54 | `yaml` | ARM parameters, K8s manifests, pipeline config |
| **Bicep** | 52 | `bicep` | Infrastructure as code (newer articles) |
| **Terraform / HCL** | 14 | `terraform`, `hcl` | Infrastructure as code (7 each) |
| **XML** | 8 | `xml` | VPN device configs, ExpressRoute |
| **C#** | 7 | `csharp` | SDK samples |
| **REST / HTTP** | 7 | `rest`, `http` | API call examples (4 + 3) |
| **Text** | 3 | `text` | Unformatted content |

### Language Category Breakdown

| Category | Blocks | % of Labeled |
|----------|--------|-------------|
| **Deployment (CLI + PS)** | 876 | 26.3% |
| **Data formats (JSON + YAML + XML + Bicep)** | 234 | 7.0% |
| **Output display (output + console)** | 140 | 4.2% |
| **Shell scripts (bash)** | 68 | 2.0% |
| **Query languages (KQL)** | 56 | 1.7% |
| **IaC (Terraform/HCL)** | 14 | 0.4% |
| **Programming (C#)** | 7 | 0.2% |
| **API (REST/HTTP)** | 7 | 0.2% |
| **Unlabeled** | 172 | 4.9% |

---

## By Service

| Service | Articles | W/ Code | % | Code Blocks | Primary Languages |
|---------|----------|---------|---|-------------|-------------------|
| application-gateway | 126 | 80 | 63% | 604 | Azure CLI |
| bastion | 40 | 12 | 30% | 59 | Azure CLI |
| cdn | 49 | 10 | 20% | 77 | Azure CLI |
| dns | 73 | 43 | 59% | 350 | Azure CLI |
| expressroute | 92 | 38 | 41% | 413 | Azure CLI, PS |
| firewall | 85 | 47 | 55% | 277 | Azure CLI |
| firewall-manager | 27 | 13 | 48% | 80 | Azure CLI |
| frontdoor | 78 | 21 | 27% | 222 | Azure CLI, JSON, Bicep |
| ip-services | 52 | 28 | 54% | 243 | Azure CLI |
| load-balancer | 94 | 52 | 55% | 487 | Azure CLI, JSON |
| nat-gateway | 25 | 11 | 44% | 236 | Azure CLI, Bicep |
| network-watcher | 64 | 34 | 53% | 319 | Azure CLI, JSON, KQL |
| networking | 17 | 4 | 24% | 60 | Azure CLI |
| private-link | 47 | 30 | 64% | 172 | Azure CLI |
| route-server | 21 | 7 | 33% | 44 | Azure CLI |
| traffic-manager | 44 | 18 | 41% | 89 | Azure CLI |
| virtual-network | 76 | 45 | 59% | 737 | Azure CLI, PS |
| virtual-network-manager | 52 | 18 | 35% | 123 | Azure CLI, JSON, Bicep |
| virtual-wan | 133 | 31 | 23% | 187 | Azure CLI |
| vpn-gateway | 123 | 50 | 41% | 478 | Azure CLI, XML |
| web-application-firewall | 9 | 3 | 33% | 23 | Azure CLI |
| **TOTAL** | **1,327** | **595** | **44%** | **3,503** | |

---

## Top Code-Heavy Services (by block count)

| Rank | Service | Code Blocks | Dominant Pattern |
|------|---------|-------------|-----------------|
| 1 | virtual-network | 737 | CLI deployment tutorials, subnet/NSG/peering configuration |
| 2 | application-gateway | 604 | CLI setup, SSL/TLS configuration, health probe config |
| 3 | load-balancer | 487 | CLI deployment, JSON rules, health probe configuration |
| 4 | vpn-gateway | 478 | CLI setup, XML VPN device configs, BGP configuration |
| 5 | expressroute | 413 | CLI circuit provisioning, peering setup, PS management |
| 6 | dns | 350 | CLI zone/record management, private resolver setup |
| 7 | network-watcher | 319 | CLI diagnostics, JSON flow log config, KQL log queries |
| 8 | firewall | 277 | CLI firewall rules, policy configuration |
| 9 | ip-services | 243 | CLI public IP create/manage, prefix allocation |
| 10 | nat-gateway | 236 | CLI gateway setup, Bicep templates, integration tutorials |

---

## Key Observations

1. **Azure CLI and Azure PowerShell dominate** — 876 of 3,331 labeled blocks (26%) are deployment commands. These are the primary "code" in networking docs.

2. **JSON is used for configuration** — ARM template fragments, REST API request/response bodies, NSG rule definitions, and diagnostic settings.

3. **Bicep is emerging** — Found in frontdoor (39), virtual-network-manager (9), nat-gateway (4), virtual-network (1). Newer articles are adopting Bicep over ARM JSON.

4. **KQL appears in monitoring docs** — 56 blocks across network-watcher, firewall, and load-balancer for Azure Monitor / Log Analytics queries.

5. **XML is limited to VPN** — 7 blocks in vpn-gateway for on-premises VPN device configuration samples, plus 5 in virtual-wan and 3 each in expressroute and application-gateway.

6. **Terraform/HCL is minimal** — Only 14 blocks total. Most IaC content uses Azure CLI or Bicep.

7. **C# SDK samples are rare** — Only 7 blocks (load-balancer). Networking docs focus on infrastructure deployment rather than SDK programming.

8. **172 unlabeled code blocks (5%)** — These lack language tags, which affects syntax highlighting and accessibility tooling. Candidates for cleanup.

9. **No Python, Java, JavaScript, Go, HTML, or SQL** — Networking services don't include application-level programming samples. Code content is exclusively infrastructure deployment and configuration.

---

## Recommendations

1. **Label the 172 unlabeled code blocks** — Add appropriate language tags for syntax highlighting and accessibility.

2. **Standardize Bicep adoption** — Services with new articles should include Bicep alongside CLI/PS. Currently only 4 of 21 services have Bicep samples.

3. **Consider Terraform samples** — Only 2 services (firewall, frontdoor) include Terraform. Given Terraform's market share, more services should offer Terraform deployment options.

4. **KQL samples for all services** — Currently only network-watcher has significant KQL content. Other services with Azure Monitor integration should include diagnostic query examples.
