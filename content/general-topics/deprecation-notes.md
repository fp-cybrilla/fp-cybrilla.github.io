---
title: Deprecated features 
---

## Deprecated features

#### This is a list of all the features which are deprecated and will be removed in the near future

Deprecated features are regularly updated in this list and API documents. Please refer to respective API documents as mentioned below. We recommend to not use any deprecated feature as these will `NOT` be supported & are scheduled to be removed as per the `Deadline` date mentioned below. 


| Feature to be deprecated | New Feature  |API Documentation | Deadline| Status |
| ---------- | ------------ |------------ |------------ |------------ |
| `distributor_id` attribute for all type of orders and plans | `partner` attribute for all type of orders and plans | [purchase](https://fintechprimitives.com/docs/api/#mf-purchase-object), [redemption](https://fintechprimitives.com/docs/api/#mf-redemption-object), [switch](https://fintechprimitives.com/docs/api/#mf-switch-object) and [plans](https://fintechprimitives.com/docs/api/#other-common-plan-attributes)| 25th Aug, 2023| Removed|
| V1 Authentication | [V2 tenant authentication](https://fintechprimitives.com/docs/api/#tenant-authentication)|[FP Authentication](https://fintechprimitives.com/docs/api/#authentication) | 31st Dec, 2023| Removed|
| Integer data type for amount\unit attributes in scheme master| [Scheme master changes](/general-topics/scheme-master-deprecation-details)|[Scheme master](https://fintechprimitives.com/docs/api/#fund-scheme)| 30th Mar, 2024| Deprecated|
| Remove deprecated attributes in scheme master| [Scheme master changes](/general-topics/scheme-master-deprecation-details)|[Scheme master](https://fintechprimitives.com/docs/api/#fund-scheme)| 30th Mar, 2024| Deprecated|
| [V1 lumpsum order](https://docs.fintechprimitives.com/general-topics/v1-orders-deprecated-endpoints/) | [V2 MF purchases](https://fintechprimitives.com/docs/api/#mf-purchases) | [purchase](https://fintechprimitives.com/docs/api/#mf-purchase-object)| 30th Mar, 2024| Deprecated|
| [V1 SIP](https://docs.fintechprimitives.com/general-topics/v1-orders-deprecated-endpoints/) | [V2 MF purchase plans](https://fintechprimitives.com/docs/api/#mf-purchase-plans) | [SIP Migration procedure](/mf-transactions/purchase-plans/sip-v1-purchase-plan-migration) | 30th Mar, 2024| Deprecated|
| POST /v2/mf_purchase_plans/:id/cancel |POST /v2/mf_purchase_plans/cancel | [New cancel V2 MF purchase plans](https://fintechprimitives.com/docs/api/#cancel-a-purchase-plan)| 30th Mar, 2024| Removed|


