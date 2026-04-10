# Question 6 — Tier 3 Languages in Azure Networking Documentation

**Question**: Which of the following tier 3 languages (configuration artifacts and data formats) does your team currently include in documentation?

**Generated**: 2026-04-09
**Scope**: 21 Azure networking service areas, 1,327 articles

---

## Quick Answer Table

| Format | In Docs? | Code Blocks | Articles | Services | Primary Use |
|--------|:--------:|:-----------:|:--------:|:--------:|-------------|
| **JSON** | ✅ **Yes** | 120 | 48 | 15/21 | ARM templates, REST responses, config |
| **YAML** | ✅ **Yes** | 54 | 13 | 3/21 | App Gateway ingress config, K8s manifests |
| **XML** | ✅ **Yes** | 8 | 4 | 4/21 | VPN device configs |
| **REST** | ✅ **Yes** | 7 | 3 | 2/21 | REST API call examples |
| **JSON-like** | ✅ **Yes** | 143 | — | — | `output` (71) + `console` (69) + `text` (3) |
| **HTML** | ❌ No | 0 | 0 | 0/21 | Not used |

**Networking uses 5 of 6 tier 3 formats: JSON, YAML, XML, REST, and JSON-like output. HTML is not used.**

---

## Detailed Breakdown

### ✅ JSON — Configuration and data format (primary tier 3 language)

120 fenced code blocks tagged `json` across 48 articles in 15 services.

| Service | Articles | Blocks | Primary Use |
|---------|:--------:|:------:|-------------|
| frontdoor | 4 | 50 | Bicep/ARM parameter files, WAF policy config |
| application-gateway | 7 | 12 | Health probe config, SSL policy |
| network-watcher | 7 | 11 | Flow log config, diagnostic settings |
| virtual-network | 5 | 8 | NSG rules, service endpoint policy |
| virtual-network-manager | 5 | 6 | Network group config, connectivity config |
| expressroute | 1 | 6 | Circuit properties, peering config |
| firewall | 3 | 6 | Firewall policy rules |
| virtual-wan | 2 | 5 | Hub route table config |
| cdn | 2 | 3 | CDN endpoint config |
| dns | 3 | 3 | DNS record sets |
| private-link | 2 | 3 | Private endpoint config |
| firewall-manager | 2 | 2 | Policy configuration |
| ip-services | 2 | 2 | Public IP properties |
| load-balancer | 2 | 2 | Load balancer rules |
| vpn-gateway | 1 | 1 | VPN connection config |
| **TOTAL** | **48** | **120** | |

JSON content types:
- **ARM template fragments**: Resource definitions with `Microsoft.Network/*` resource types (18 articles reference ARM schema)
- **REST API response bodies**: JSON with `"properties"` key (194 occurrences across all articles)
- **Configuration payloads**: NSG rules, route tables, firewall policies
- **Diagnostic settings**: Azure Monitor log/metric definitions

### ✅ JSON-like — Output and console display

Not technically JSON, but structured output displayed in code blocks:

| Tag | Blocks | Usage |
|-----|:------:|-------|
| `output` | 71 | Azure CLI / PowerShell command output |
| `console` | 69 | Terminal session output |
| `text` | 3 | Unformatted text |
| **TOTAL** | **143** | |

These are display-only — command results, not authored code. No maintenance obligation.

### ✅ YAML — Kubernetes and Application Gateway config

54 fenced code blocks tagged `yaml` across 13 articles in 3 services.

| Service | Articles | Blocks | Use |
|---------|:--------:|:------:|-----|
| application-gateway | 11 | 51 | Application Gateway Ingress Controller (AGIC) K8s manifests |
| frontdoor | 1 | 2 | Configuration |
| firewall | 1 | 1 | Configuration |
| **TOTAL** | **13** | **54** | |

Heavily concentrated in Application Gateway — 51 of 54 YAML blocks are AGIC/Kubernetes ingress configurations.

### ✅ XML — VPN device configurations

8 fenced code blocks tagged `xml` across 4 articles in 4 services.

| Service | Articles | Blocks | Use |
|---------|:--------:|:------:|-----|
| vpn-gateway | 1 | 3 | On-premises VPN device configuration samples |
| virtual-wan | 1 | 3 | VPN site configuration |
| application-gateway | 1 | 1 | Configuration export |
| frontdoor | 1 | 1 | Configuration |
| **TOTAL** | **4** | **8** | |

XML is legacy — primarily VPN device configs for on-premises hardware (Cisco, Juniper, etc.).

### ✅ REST — API call examples

7 fenced code blocks across 3 articles in 2 services.

| Service | Tag | Articles | Blocks |
|---------|-----|:--------:|:------:|
| expressroute | `rest` | 1 | 4 |
| application-gateway | `http` | 1 | 2 |
| load-balancer | `http` | 1 | 1 |
| **TOTAL** | | **3** | **7** |

Very minimal REST API documentation in networking. Most API interactions are abstracted through Azure CLI/PowerShell.

Additionally, 2 articles contain inline REST API call patterns (`PUT/GET https://management.azure.com/...`) in load-balancer docs.

### ❌ HTML — Not used

Zero HTML code blocks in any networking service. Web content rendering is not part of networking documentation scope.

---

## Summary for Survey Response

> **Q6: Which tier 3 formats does your team currently include?**
>
> - ✅ **JSON** — 120 code blocks across 48 articles (15 services). Used for ARM template fragments, REST API response bodies, and resource configuration payloads.
> - ✅ **JSON-like** — 143 code blocks (`output`/`console`/`text` tags). Command output display, not authored content.
> - ✅ **YAML** — 54 code blocks across 13 articles (3 services). Heavily concentrated in Application Gateway for Kubernetes ingress configs (51 of 54 blocks).
> - ✅ **XML** — 8 code blocks across 4 articles (4 services). Legacy VPN device configuration samples.
> - ✅ **REST** — 7 code blocks across 3 articles (2 services). Minimal direct REST API documentation.
> - ❌ **HTML** — Not used.
>
> The tier 3 formats carry minimal authoring obligation. JSON appears naturally in ARM templates and REST responses. YAML is limited to Application Gateway AGIC configs. XML and REST are near-zero.
