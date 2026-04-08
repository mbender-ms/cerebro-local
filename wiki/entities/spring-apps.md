---
title: "Azure Spring Apps"
created: 2026-04-07
updated: 2026-04-07
sources:
  - spring-apps/*.md
tags:
  - compute
  - java
  - spring
  - microservices
---

# Azure Spring Apps

> **Note**: Azure Spring Apps is scheduled for retirement. Migrate to Azure Container Apps or AKS.

Managed platform for running Spring Boot and Spring Cloud microservices on Azure. Handles infrastructure (JVM, Tomcat, config server, service registry) so developers focus on code.

## Key Features

| Feature | Description |
|---------|-------------|
| **Spring Cloud integration** | Config Server, Service Registry (Eureka), Gateway |
| **Auto-scaling** | CPU/memory-based or custom metrics |
| **Blue-green deployments** | Zero-downtime deployments with traffic management |
| **Built-in monitoring** | Application Insights, Log Analytics, distributed tracing |
| **VNet injection** | Deploy into customer VNet for network isolation |
| **Managed TLS** | Automatic certificate management |

## SKUs (before retirement)

| Plan | Use Case |
|------|----------|
| Basic | Dev/test |
| Standard | Production |
| Enterprise | VMware Tanzu components, SLA |

## Migration Paths

| From | To | Effort |
|------|----|----|
| Azure Spring Apps | **Azure Container Apps** | Medium (containerize, Dapr for microservices) |
| Azure Spring Apps | **AKS** | Higher (full K8s management) |
| Azure Spring Apps | **App Service** | Lower (for simple Spring Boot apps) |

## Links

- [[comparisons/compute-options]] — compute platform comparison
- [[comparisons/container-compute-options]] — container alternatives
- [[entities/azure-aks]] — K8s-based alternative
