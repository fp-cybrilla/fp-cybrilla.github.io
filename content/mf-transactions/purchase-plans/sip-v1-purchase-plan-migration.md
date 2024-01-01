---
title: Migrate to MF purchase plans
---
## Migrate from V1 SIPs to V2 Purchase plans

#### Migration procedure

1. Map a V1 SIP with respective V2 MF purchase plan ID
   1. If you are maintain SIP ID against investor or investment accounts in your application then
      1. Use [Fetch a SIP](https://fintechprimitives.com/docs/api/#fetch-a-sip) and [List all SIPs](https://fintechprimitives.com/docs/api/#list-all-sips) of V1 SIP APIs to find V2 ID
      2. Update V2 ID for all SIPs in your application
   2. If you do not maintain SIP ID in your application
      1. Use `List all mf puchase plans` by investment account of the investor
2. Start using the V2 MF purchase plan APIs


#### Learn V2 MF purchase API alternatives for all V1 SIP Actions

|Action|V1 SIP API|V2 MF purchase plan API|
|-----|-----|-----|
|SIP Creation|[create-a-sip](https://fintechprimitives.com/docs/api/#create-a-sip)|[create-a-purchase-plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan)|
|Change mandate of an SIP|[modify-a-sip](https://fintechprimitives.com/docs/api/#modify-a-sip)|Use payment_source in [update-a-purchase-plan](https://fintechprimitives.com/docs/api/#update-a-purchase-plan)|
|Cancel SIP|[modify-a-sip](https://fintechprimitives.com/docs/api/#modify-a-sip)|[cancel-a-purchase-plan](https://fintechprimitives.com/docs/api/#cancel-a-purchase-plan)|
|Fetch SIP |[fetch-a-sip](https://fintechprimitives.com/docs/api/#fetch-a-sip)|[fetch-a-purchase-plan-by-its-id](https://fintechprimitives.com/docs/api/#fetch-a-purchase-plan-by-its-id)|
|Fetch installments of a SIP |[fetch-installments-of-a-sip](https://fintechprimitives.com/docs/api/#fetch-installments-of-a-sip)|Use plan id in [list-all-mf-purchases](https://fintechprimitives.com/docs/api/#list-all-mf-purchases)|
|List all SIPs|[list-all-sips](https://fintechprimitives.com/docs/api/#list-all-sips)|[list-all-purchase-plans](https://fintechprimitives.com/docs/api/#list-all-purchase-plans)|
|Cancel next installment |[modify-a-sip](https://fintechprimitives.com/docs/api/#modify-a-sip)|[skip-installments-via-skip-instructions](https://fintechprimitives.com/docs/api/#skip-installments-via-skip-instructions)|
|Cancel installments between a date range |Not available|[skip-installments-via-skip-instructions](https://fintechprimitives.com/docs/api/#skip-installments-via-skip-instructions)|
|Update SIP amount|Not available|Use amount in [update-a-purchase-plan](https://fintechprimitives.com/docs/api/#update-a-purchase-plan)|




