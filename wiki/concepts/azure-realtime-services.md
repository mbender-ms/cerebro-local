---
title: Azure Real-Time Communication Services
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-web-pubsub/*.md
  - communication-services/*.md
  - azure-signalr/*.md
tags:
  - networking-concept
  - real-time
  - messaging
---

# Azure Real-Time Communication Services

| Service | Protocol | Best for |
|---------|----------|----------|
| **Azure Web PubSub** | WebSocket (native) | Serverless real-time messaging at scale; pub/sub |
| **Azure SignalR Service** | WebSocket/SSE/Long-polling | ASP.NET Core real-time apps (SignalR hub) |
| **Azure Communication Services** | WebRTC, PSTN, SMS, Email | Voice/video calling, chat, SMS, email for apps |

## Web PubSub vs SignalR Service

| Dimension | Web PubSub | SignalR Service |
|-----------|-----------|----------------|
| **Protocol** | Raw WebSocket | SignalR protocol (auto-negotiation) |
| **SDK** | Any language (WebSocket client) | .NET, JS, Java SignalR SDK |
| **Server required** | Optional (serverless mode) | Yes (SignalR hub) |
| **Best for** | Language-agnostic, IoT, gaming | ASP.NET Core apps |

## Links

- [[comparisons/messaging-options]] — broader messaging comparison
- [[entities/azure-web-pubsub]]
- [[entities/azure-signalr]]
