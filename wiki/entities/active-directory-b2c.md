---
title: Azure Active Directory B2C
created: 2026-04-07
updated: 2026-04-07
sources:
  - active-directory-b2c/*.md
tags:
  - identity
  - authentication
  - ciam
  - b2c
---

# Azure Active Directory B2C

> **Note**: Azure AD B2C end-of-sale announced. New tenants should evaluate Microsoft Entra External ID as the successor CIAM platform.

Business-to-customer identity as a service (CIAM). Enables social, enterprise, and local account sign-in for customer-facing web and mobile applications.

## Core Capabilities

| Feature | Description |
|---------|-------------|
| **White-label auth** | Fully customizable sign-up/sign-in UI (HTML/CSS/JS) |
| **Social identity providers** | Facebook, Google, Apple, Amazon, Twitter, GitHub, etc. |
| **Enterprise federation** | SAML, OpenID Connect, WS-Federation |
| **Local accounts** | Email + password or phone + OTP |
| **SSO** | Central auth authority for all apps |
| **MFA** | Phone, email, TOTP authenticator |
| **Progressive profiling** | Collect minimal data at sign-up, expand over time |
| **External user stores** | Integrate with CRM/loyalty databases via API |

## Authentication Protocols

- OpenID Connect
- OAuth 2.0
- SAML 2.0

## User Flows vs Custom Policies

| Approach | Complexity | Use Case |
|----------|-----------|----------|
| **User flows** | Low (portal config) | Standard sign-up/sign-in, password reset, profile edit |
| **Custom policies** (Identity Experience Framework) | High (XML config) | Complex journeys: API calls, conditional logic, custom claims |

## Key Architecture Concepts

- **B2C tenant** — separate from corporate Entra ID tenant; holds consumer identities
- **Applications** — registered apps that use B2C for auth
- **User flows/custom policies** — define the auth journey
- **Identity providers** — social/enterprise IdPs federated to B2C
- **API connectors** — call REST APIs during sign-up/sign-in flows
- **Page layouts** — customizable HTML templates for auth UX

## Scale

- Supports millions of users and billions of daily authentications
- Built-in DDoS, password spray, and brute force protection
- Global availability via Azure public cloud
- 100 custom attributes per user in built-in directory

## Data Residency

B2C service runs worldwide in Azure public cloud. User data storage region is selected at tenant creation (Europe, US, Asia Pacific). For strict data residency, integrate with external user stores.

## Links

- [[comparisons/security-services]] — identity in the security stack
- [[entities/azure-aks]] — B2C tokens validated by API backends on AKS
- [[entities/azure-application-gateway]] — can route based on B2C auth headers
