---
title: Microsoft Copilot in Azure
created: 2026-04-07
updated: 2026-04-07
sources:
  - copilot/*.md
tags:
  - azure-service
  - ai
  - management
---

# Microsoft Copilot in Azure

AI-powered assistant for Azure. Uses LLMs + Azure control plane + your environment context to help design, operate, optimize, and troubleshoot Azure resources. (source: copilot/overview.md — 40 articles)

## Capabilities

- **Design and build** — generate ARM/Bicep/Terraform templates, suggest architectures
- **Operate and optimize** — analyze costs, recommend SKU changes, optimize performance
- **Troubleshoot** — diagnose issues using resource health, logs, and diagnostics
- **Learn** — explain Azure concepts, services, and configurations in context
- **Orchestrate** — execute actions across Azure portal, CLI, and APIs

## How It Works

1. User asks a question or describes a task in natural language
2. Copilot interprets intent using LLM + Azure context (your subscriptions, resources)
3. Generates response: explanation, CLI command, portal action, or code template
4. User reviews and executes (Copilot doesn't auto-execute destructive actions)

## Links

- [[concepts/azure-operations-management]] — operational tools landscape
- [[sources/copilot-docs]]
