---
title: CAF Governance Disciplines
created: 2026-04-07
updated: 2026-04-07
sources:
  - cloud-adoption-framework/*.md
tags:
  - networking-concept
  - caf
  - governance
  - policy
---

# CAF Governance Disciplines

Cloud governance ensures consistent, compliant, and cost-controlled use of Azure. Five disciplines from the Cloud Adoption Framework. (source: cloud-adoption-framework/*.md)

## Five Disciplines

| Discipline | Purpose | Azure tools |
|-----------|---------|-------------|
| **Cost Management** | Control and optimize cloud spending | Azure Cost Management, budgets, alerts, advisor |
| **Security Baseline** | Enforce minimum security posture | Azure Policy, Defender for Cloud, Secure Score |
| **Resource Consistency** | Standardize resource configuration | Azure Policy, naming conventions, tagging |
| **Identity Baseline** | Manage identity and access | Entra ID, RBAC, PIM, conditional access |
| **Deployment Acceleration** | Automate compliant deployments | IaC (Bicep/Terraform), Azure DevOps, GitHub Actions |

## Azure Policy

The primary enforcement mechanism. Policies can:
- **Audit** — report non-compliance without blocking
- **Deny** — prevent non-compliant resource creation
- **Modify** — auto-remediate resources to compliance
- **DeployIfNotExists** — deploy supporting resources automatically

Policy initiatives (groups of policies) align with compliance frameworks (CIS, NIST, ISO).

## Governance MVP (Minimum Viable Product)

Start with:
1. Resource naming + tagging policy
2. Cost budgets + alerts
3. Basic RBAC (Owner, Contributor, Reader by scope)
4. Security baseline (Defender for Cloud enabled)
5. Allowed regions + VM SKUs

Then iterate as the cloud estate grows.

## Links

- [[entities/cloud-adoption-framework]]
- [[concepts/caf-landing-zones]] — landing zones implement governance
- [[concepts/azure-rbac]] — identity governance
- [[comparisons/security-services]] — security stack
