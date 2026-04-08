---
 title: Include file
 description: Include file
 services: search
 author: HeidiSteen
 ms.service: cognitive-search
 ms.topic: include
 ms.date: 08/15/2025
 ms.author: heidist
ms.custom: include file, build-2024, references_regions
---

The following table covers SLA, partition counts, and replica counts at the service level.

| Resource | Free | Basic | S1 | S2 | S3 | S3&nbsp;HD | L1 | L2 |
|----------|-------|------|----|----|----|----------- |----|----|
| Service level agreement (SLA)| No |Yes |Yes |Yes |Yes |Yes |Yes |Yes |
| Partitions | N/A |3 <sup>1</sup> |12 |12 |12 |3 |12 |12 |
| Replicas | N/A |3 |12 |12 |12 |12 |12 |12 |

<sup>1</sup> Basic tier supports three partitions and three replicas, for a total of nine search units (SU) on [new search services](/azure/search/search-create-service-portal) created after April 3, 2024. Older basic services are limited to one partition and three replicas.

A search service is subject to a maximum storage limit (partition size multiplied by the number of partitions) or by a hard limit on the [maximum number of indexes](/azure/search/search-limits-quotas-capacity#index-limits) or [indexers](/azure/search/search-limits-quotas-capacity#indexer-limits), whichever comes first.

Service-level agreements (SLAs) apply to billable services that have two or more replicas for query workloads, or three or more replicas for query and indexing workloads. The number of partitions isn't an SLA consideration. For more information, see [Reliability in Azure AI Search](/azure/search/search-reliability#high-availability).

Free services don't have fixed partitions or replicas and share resources with other subscribers.

### Partition storage (GB)

Per-service storage limits vary by two things: [service creation date](/azure/search/search-how-to-upgrade#check-your-service-creation-or-upgrade-date) and [region](/azure/search/search-region-support). There are higher limits for [newer services](/azure/search/search-create-service-portal) in most supported regions.

This table shows the progression of storage quota increases in GB over time. Starting in April 2024, higher capacity partitions were brought online in the regions listed in the footnotes. If you have an older service in a supported region, check if you can [upgrade your service](/azure/search/search-how-to-upgrade) to the higher storage limits.

| Service creation date |Basic | S1| S2 | S3/HD | L1 | L2 |
|-----------------------|------|---|----|----|----|----|
| Before April 3, 2024 | 2  | 25 | 100 | 200 | 1,024 | 2,048 |
| April 3, 2024 through May 17, 2024 <sup>1</sup> | **15**   | **160**  | **512**  | **1,024**  | 1,024 | 2,048 |
| After May 17, 2024 <sup>2</sup> | 15  | 160 | 512 | 1,024 | **2,048**  | **4,096**  |
| After February 10, 2025 <sup>3</sup> | 15  | 160 | 512 | 1,024 | 2,048  | 4,096  |

<sup>1</sup> Higher capacity storage for Basic, S1, S2, S3 in these regions. **Americas**: Brazil South​, Canada Central​, Canada East​​, East US​, East US 2, ​Central US​, North Central US​, South Central US​, West US​, West US 2​, West US 3​, West Central US. **Europe**: France Central​. Italy North​​, North Europe​​, Norway East, Poland Central​​, Switzerland North​, Sweden Central​, UK South​, UK West​. **Middle East**:  UAE North. **Africa**: South Africa North. **Asia Pacific**: Australia East​, Australia Southeast​​, Central India, Jio India West​, East Asia, Southeast Asia​, Japan East, Japan West​, Korea Central, Korea South​.

<sup>2</sup> Higher capacity storage for L1 and L2. More regions provide higher capacity at every billable tier. **Americas:** East US 2 EUAP. **Europe**: Germany North​, Germany West Central, Switzerland West​. **Azure Government**: Texas, Arizona, Virginia. **Africa**: South Africa North​. **Asia Pacific**: China North 3, China East 3.

<sup>3</sup> Higher capacity storage is available in West Europe.

> [!IMPORTANT]
> Currently, higher storage limits aren't available in the following regions, which are subject to the pre-April 3 limits.
>
> + Israel Central
> + Qatar Central
> + ⁠Spain Central
> + South India
