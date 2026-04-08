---
title: Azure Role-Based Access Control (RBAC)
created: 2026-04-07
updated: 2026-04-07
sources:
  - role-based-access-control/*.md
tags:
  - networking-concept
  - security
  - identity
---

# Azure Role-Based Access Control (RBAC)

Authorization system that manages who has access to Azure resources, what they can do, and what scope. Built on Azure Resource Manager. (source: role-based-access-control/overview.md)

## How It Works

1. **Security principal** — user, group, service principal, or managed identity
2. **Role definition** — collection of permissions (e.g., Reader, Contributor, Owner, custom)
3. **Scope** — management group > subscription > resource group > resource
4. **Role assignment** — attaches a role definition to a principal at a scope

## Key Built-in Roles

| Role | Access level |
|------|-------------|
| **Owner** | Full access + can assign roles |
| **Contributor** | Full access, cannot assign roles |
| **Reader** | View only |
| **User Access Administrator** | Manage role assignments only |
| **Network Contributor** | Manage networking resources |
| **Storage Blob Data Reader/Contributor/Owner** | Data plane access to blobs |

## ABAC (Attribute-Based Access Control)

Adds conditions to role assignments based on resource attributes (tags, blob index tags, container names). Enables fine-grained access like "can read blobs only in container X with tag Y." (source: role-based-access-control/*.md)

## Links

- [[concepts/security-admin-rules]] — VNet Manager centralized rules
- [[comparisons/security-services]] — full security stack
