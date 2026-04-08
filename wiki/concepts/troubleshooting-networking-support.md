---
title: Troubleshooting Azure Networking (Support Articles)
created: 2026-04-07
updated: 2026-04-07
sources:
  - support-virtual-network/*.md
  - support-vpn-gateway/*.md
  - support-expressroute/*.md
  - support-application-gateway/*.md
  - support-front-door/*.md
tags:
  - troubleshooting
  - networking
  - support
---

# Troubleshooting Azure Networking (Support Articles)

Compiled from 53 Microsoft Support articles across VNet, VPN Gateway, ExpressRoute, Application Gateway, and Front Door.

## Virtual Network (17 articles)

| Problem | Key diagnostic |
|---------|---------------|
| VM-to-VM connectivity failure | Check NSGs (IP flow verify), effective routes (next hop), peering status |
| Cannot delete subnet/VNet | Identify blocking resources (NICs, endpoints, delegations, gateways) |
| Peering route sync issues | Verify peering status = Connected; run address space sync |
| NSG blocking expected traffic | Use NSG diagnostics in Network Watcher; check rule priorities |
| SMTP outbound blocked (port 25) | Azure blocks port 25 by default; use authenticated relay (587) |
| NVA connectivity issues | Check IP forwarding enabled, UDR next hop correct, NVA health |
| Network latency measurement | Use `latte.exe` (Windows) or `sockperf` (Linux) for TCP/UDP latency |
| Network throughput testing | Use `ntttcp` to benchmark between VMs |

## VPN Gateway (12 articles)

| Problem | Key diagnostic |
|---------|---------------|
| S2S tunnel won't connect | Check shared key, IKE parameters, peer IP; review diagnostic logs |
| S2S intermittent disconnects | Check idle timeout, DPD settings, on-premises device health |
| P2S connection failures | Verify certificate chain, auth method, VPN client version |
| P2S on macOS IKEv2 | Verify IKEv2 configuration; check system keychain for certificates |
| BGP peering issues | Check ASN configuration, BGP peer IP, route propagation |
| VPN throughput validation | Use `iperf3` between on-premises and Azure VM; compare to SKU limits |

## ExpressRoute (6 articles)

| Problem | Key diagnostic |
|---------|---------------|
| Verify connectivity | Check ARP tables, route tables, circuit status (provider + Microsoft) |
| Network performance issues | Test with `iperf3`, check for asymmetric routing, verify MTU |
| Gateway migration errors | Follow migration sequence; check for resource locks |
| Get correlation ID | Activity Log → filter by resource → copy correlation ID for support ticket |
| Reset failed circuit | Use Azure portal or CLI to reset; provider may need to re-provision |

## Application Gateway (14 articles)

| Problem | Key diagnostic |
|---------|---------------|
| 502 Bad Gateway | Backend unhealthy; check health probe, backend NSG, connection timeout |
| Backend health shows unhealthy | Verify backend can respond on probe port/path; check NSG/UDR |
| Key Vault certificate errors | Check managed identity access, Key Vault firewall, certificate validity |
| Disabled listeners | Key Vault access revoked; re-grant and re-enable |
| Session affinity not working | Cookie configuration, backend TTL, intermediate proxies |
| Mutual auth failures | Client cert chain incomplete, root CA not uploaded |
| WAF log analysis | Use Log Analytics with `AzureDiagnostics | where Category == "ApplicationGatewayFirewallLog"` |
| AGIC installation issues | Helm chart version, RBAC permissions, pod identity configuration |

## Front Door (4 articles)

| Problem | Key diagnostic |
|---------|---------------|
| 4xx/5xx errors | Check reference string in response header for root cause identification |
| Compression not working | Verify content-type, file size, encoding headers |
| General performance | Check POP selection, backend latency, caching rules |

(source: support-*.md — 53 networking support articles)

## Links

- [[concepts/troubleshooting-nat-gateway]] — NAT Gateway-specific troubleshooting
- [[entities/azure-network-watcher]] — diagnostic tools (IP flow verify, NSG diagnostics, next hop)
- [[concepts/network-security-groups]] — NSG rule evaluation
- [[concepts/user-defined-routes]] — routing troubleshooting
