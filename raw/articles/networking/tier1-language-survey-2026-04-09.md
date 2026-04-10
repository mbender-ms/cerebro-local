# Question 4 — Tier 1 Languages in Azure Networking Documentation

**Question**: Which of the following tier 1 languages does your team currently include in documentation?

**Answer**: **None of the tier 1 languages are used in a meaningful way.** Azure networking documentation is infrastructure-focused, using Azure CLI, PowerShell, Bicep, and ARM JSON rather than programming languages.

**Generated**: 2026-04-09
**Scope**: 21 Azure networking service areas, 1,327 articles

---

## Quick Answer Table

| Language | In Networking Docs? | Code Samples | Details |
|----------|:-------------------:|:------------:|---------|
| **.NET/C#** | ⚠️ Minimal | 1 | Single article: `cdn/cdn-app-dev-net.md` (CDN SDK usage) |
| **Python** | ⚠️ Minimal | 1 | Single article: `load-balancer/create-custom-http-health-probe-howto.md` |
| **Java** | ⚠️ Minimal | 1 | Single article: `traffic-manager/traffic-manager-create-rum-visual-studio.md` |
| **JavaScript/TypeScript** | ⚠️ Minimal | 1 | Single article: `cdn/cdn-app-dev-node.md` (CDN SDK usage) |
| **Go** | ❌ None | 0 | No code samples |
| **Rust** | ❌ None | 0 | No code samples |
| **C/C++** | ⚠️ Minimal | 1 | Single article: `virtual-network/setup-dpdk-mana.md` (DPDK low-level networking) |
| **PHP** | ❌ None | 0 | No code samples |
| **Ruby** | ❌ None | 0 | No code samples |
| **Swift** | ❌ None | 0 | No code samples |
| **Kotlin** | ❌ None | 0 | No code samples |

---

## What Networking Docs Actually Use

Azure networking documentation is **infrastructure deployment and configuration** content, not application development content. The "code" in networking docs is:

| Language/Tool | Fenced Code Blocks | Role |
|---------------|-------------------|------|
| **Azure CLI** (`azurecli`) | 255 | Primary deployment tool |
| **Azure PowerShell** (`azurepowershell`) | 347 | Primary deployment tool |
| **PowerShell** (generic) | 274 | Scripts, module commands |
| **JSON** | 120 | ARM templates, REST request/response, config |
| **Bicep** | 52 | Infrastructure as Code (emerging) |
| **KQL/Kusto** | 56 | Azure Monitor / Log Analytics queries |
| **YAML** | 54 | Config files, K8s manifests |
| **Bash** | 68 | Shell scripts |
| **Terraform/HCL** | 14 | Infrastructure as Code (minimal) |
| **XML** | 8 | VPN device configurations |

### Total: 1,248 deployment/config code blocks vs 4 programming language code blocks

---

## The 4 Programming Language Articles (Detail)

### 1. C# — CDN SDK (`cdn/cdn-app-dev-net.md`)
- Azure CDN .NET SDK usage for managing CDN profiles and endpoints programmatically
- Not a core networking article — CDN is being retired in favor of Front Door

### 2. Python — Load Balancer Health Probe (`load-balancer/create-custom-http-health-probe-howto.md`)
- Python script for custom HTTP health probe testing
- Utility script, not SDK integration

### 3. Java — Traffic Manager RUM (`traffic-manager/traffic-manager-create-rum-visual-studio.md`)
- Real User Measurements (RUM) JavaScript tag integration (misleadingly tagged as Java)
- Actually a JavaScript/web snippet, not server-side Java

### 4. JavaScript — CDN Node.js SDK (`cdn/cdn-app-dev-node.md`)
- Azure CDN Node.js SDK for managing CDN resources
- Not a core networking article — CDN is being retired in favor of Front Door

### 5. C — DPDK Setup (`virtual-network/setup-dpdk-mana.md`)
- Data Plane Development Kit (DPDK) low-level networking with MANA driver
- Highly specialized — kernel/driver level, not application development

---

## SDK Reference Mentions (not code samples)

Many networking articles mention Azure SDK namespaces in text (links, descriptions) but do **not** include actual code samples:

| SDK | Text Mentions | Actual Code Samples |
|-----|:------------:|:-------------------:|
| .NET (`Azure.ResourceManager.Network`) | 0 | 0 |
| Python (`azure-mgmt-network`) | 0 | 0 |
| Java (`com.azure.resourcemanager.network`) | 0 | 0 |
| JavaScript (`@azure/arm-network`) | 0 | 0 |
| Go (`armnetwork`) | 0 | 0 |

**No networking service includes Azure SDK code samples for any tier 1 language.**

---

## Recommendations

1. **Answer "No" to this survey question** — Networking docs effectively contain zero tier 1 language code. The 4 articles with programming language blocks are edge cases (CDN being retired, DPDK driver-level, health probe utility).

2. **If expanding tier 1 language coverage is desired**, the highest-value additions would be:
   - **Python**: `azure-mgmt-network` SDK samples for VNet/NSG/LB management
   - **C#/.NET**: `Azure.ResourceManager.Network` samples for the same
   - **.NET Aspire / JavaScript**: For App Gateway and Front Door integration in web apps

3. **The real "code maintenance obligation" for networking is**:
   - Azure CLI commands (255 blocks) — updated with every API version change
   - Azure PowerShell cmdlets (621 blocks) — same
   - Bicep/ARM templates (256 blocks) — updated with schema changes
   - These are the actual code assets that require ongoing maintenance

---

## Summary for Survey Response

> **Q4: Which tier 1 languages does your team currently include?**
>
> **None in any meaningful capacity.** Our networking documentation contains 4 articles with programming language code blocks out of 1,327 total articles, and 3 of those 4 are edge cases (CDN being retired, DPDK driver-level). Our code content is Azure CLI (255 blocks), PowerShell (621 blocks), Bicep (52 blocks), and ARM JSON/KQL/YAML for infrastructure deployment — not application-level programming languages.
