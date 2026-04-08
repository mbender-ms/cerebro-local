---
title: Azure Caching Options
created: 2026-04-07
updated: 2026-04-07
sources:
  - azure-cache-for-redis/*.md
  - redis/*.md
tags:
  - comparison
  - caching
---

# Azure Caching Options

## Azure Cache for Redis vs Azure Managed Redis

| Dimension | Azure Cache for Redis | Azure Managed Redis |
|-----------|---------------------|-------------------|
| **Engine** | Redis Community Edition | Redis Enterprise |
| **Tiers** | Basic, Standard, Premium, Enterprise, Enterprise Flash | Memory Optimized, Balanced, Compute Optimized, Flash Optimized |
| **Active geo-replication** | Enterprise tier only | All tiers |
| **Redis modules** | Enterprise tier (RediSearch, RedisJSON, etc.) | All tiers |
| **Clustering** | OSS clustering (Premium+) | Enterprise clustering |
| **Availability** | Zones (Premium+, Enterprise) | Zones (all tiers) |
| **Status** | GA (existing) | GA (newer, recommended for new workloads) |

## Common Use Cases

- **Session store** — share session state across web app instances
- **Output caching** — cache rendered pages/fragments
- **Message broker** — pub/sub for lightweight messaging
- **Distributed lock** — coordinate across microservices
- **Leaderboards** — sorted sets for real-time rankings
- **Rate limiting** — token bucket per API key

## Links

- [[entities/azure-cache-for-redis]]
- [[entities/redis]]
