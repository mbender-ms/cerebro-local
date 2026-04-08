---
title: Cloud Adoption Framework (CAF)
created: 2026-04-07
updated: 2026-04-07
sources:
  - cloud-adoption-framework/*.md
tags:
  - azure-service
  - architecture
  - governance
  - migration
  - framework
---

# Cloud Adoption Framework (CAF)

Microsoft's comprehensive guidance for cloud adoption on Azure. Covers the full lifecycle from strategy through operations. Provides proven methodologies, landing zone architectures, and scenario-specific guidance. (source: cloud-adoption-framework/*.md — 473 articles)

## CAF Methodologies (Phases)

| Phase | Purpose | Key outputs |
|-------|---------|-------------|
| **Strategy** | Define motivations, business outcomes, and business case | Cloud strategy document, financial model |
| **Plan** | Assess digital estate, create adoption plan, define skills readiness | Adoption plan, skills plan, Azure DevOps backlog |
| **Ready** | Prepare Azure environment with landing zones | Azure landing zone, governance baseline |
| **Migrate** | Move workloads to Azure | Migrated workloads, operational procedures |
| **Modernize** | Optimize and modernize post-migration | Modernized architectures, PaaS adoption |
| **Govern** | Implement governance disciplines | Policy baselines, cost management, security baseline |
| **Manage** | Establish operations management baseline | Monitoring, business continuity, operations baseline |
| **Secure** | Integrate security across all phases | Zero Trust posture, incident response |
| **Organize** | Align teams and roles | RACI, cloud center of excellence |

## Azure Landing Zones

The cornerstone of the Ready phase. Pre-configured Azure environments with:

- **Management group hierarchy** — organized by workload type and environment
- **Subscription design** — separation of concerns (platform, workload, sandbox)
- **Identity** — Entra ID, RBAC, privileged access management
- **Networking** — hub-spoke or Virtual WAN topology
- **Security** — Microsoft Defender, Sentinel, policy baselines
- **Governance** — Azure Policy, cost management, resource naming
- **Operations** — Azure Monitor, update management, backup

202 of 473 articles mention landing zones — it's the most content-dense area of CAF.

## Scenario-Specific Guidance

| Scenario | Coverage |
|----------|----------|
| **Azure VMware Solution** | Network design, connectivity, migration patterns |
| **SAP on Azure** | Enterprise-scale architecture for SAP workloads |
| **AKS** | Enterprise-scale for Kubernetes clusters |
| **Data & Analytics** | Cloud-scale analytics, data mesh, data governance |
| **AI & ML** | AI agents, ML workloads, responsible AI |
| **Oracle on Azure** | Database@Azure, Exadata, connectivity design |
| **HPC** | High-performance computing adoption patterns |

## Anti-Patterns

CAF documents common cloud adoption mistakes to avoid (e.g., skipping governance, oversizing, ignoring security early).

## Links

- [[concepts/caf-landing-zones]] — landing zone architecture and design areas
- [[concepts/caf-governance]] — governance disciplines and policy
- [[entities/azure-well-architected-framework]] — WAF for workload-level design
- [[entities/azure-arc]] — hybrid/multicloud management in CAF
- [[sources/cloud-adoption-framework-docs]]
