---
title: Deprecated endpoints for v1 orders & SIPs
---
## Deprecated endpoints for v1 orders & SIPs
Below endpoints are deprecated and will be removed as per timelines in [deprecation notes](https://docs.fintechprimitives.com/general-topics/deprecation-notes/)

### V1 MF investment account APIs that are deprecated

**Improved capabilities in V2 MF investment accounts**

1. Support for folio defaults
2. Support for non individuals and other holding pattern 
3. Demat investment support
4. [Migrate offline folios](https://docs.fintechprimitives.com/mf-transactions/migrate_offline_folios)


|Action|V1 API|V2 API|
|----|----|----|
|Create investment account|POST /api/oms/investment_accounts|POST /v2/mf_investment_accounts|
|Fetch investment accounts|GET /api/oms/investment_accounts|GET /v2/mf_investment_accounts/|
|Fetch holding by investment account|GET /api/oms/investment_accounts/:id/holdings|GET /api/oms/reports/holdings|
|Fetch transactions|GET /api/oms/investment_accounts/transactions|GET /transactions|


### V1 lumpsum order APIs that are deprecated

**Improved capabilities in V2 MF purchases**

1. Consent can be updated for orders after  creation
2. Schedule an order processing at a later date
3. Ability to retry an order due to payment failures or expiry
4. Ability to cancel an order
5. Demat purchase support
6. Payment method need not be decided at the time of placing a purchase order unlike v1

|Action|V1 API|V2 API|
|----|----|----|
|Create order with netbanking payment| POST /api/oms/investment_accounts/:id/orders/purchase/netbanking|POST /v2/mf_purchases, POST /api/pg/payments/netbanking|
|Create order with nach payment | POST /api/oms/investment_accounts/:id/orders/purchase/nach|POST /v2/mf_purchases, POST /api/pg/payments/nach|
|Create redemption order |POST /api/oms/investment_accounts/:id/orders/sell|POST /v2/mf_redemptions|
|Create redemption order|GET /api/oms/investment_accounts/:id/orders/sell|POST /v2/mf_redemptions|
|Fetch redemption order|POST /api/oms/investment_accounts/:id/orders/switch|POST /v2/mf_switches|
|Fetch redemption order|GET /api/oms/investment_accounts/:id/orders/switch|GET /v2/mf_switches/:id|
|Fetch an order|GET /api/oms/investment_accounts/:id/orders/:id|GET /v2/mf_purchases/:id|
|Fetch all orders of an investment account|GET /api/oms/investment_accounts/:id/orders|GET /v2/mf_purchases|


### V1 SIP APIs that are deprecated

**Improved capabilities in V2 MF purchase plans**

1. Additional frequencies like daily, weekly, etc.. as supported in the fund scheme
2. Systematic and non systematic plans
3. Additional plan modifcation capabilities like amount , instalment numbers & installment day for non systematic plans
4. Delayed plan activation
5. Skip installments for a duration
6. Demat support
7. UPI Autopay setup for payments

Below are the deprecated end points of V1 SIPs.

* POST /api/oms/investment_accounts/:id/orders/sips
* PATCH /api/oms/investment_accounts/:id/orders/sips/:id
* GET /api/oms/investment_accounts/:id/orders/sips/:id
* GET /api/oms/investment_accounts/:id/orders/sips/:id/installments
* GET /api/oms/investment_accounts/:id/orders/sips

**Sandbox simulation for V1 SIPs**

|V1 API|V2 API|
|----|----|
|POST https://s.finprim.com/api/oms/simulate/sips/{sip_id}/generate_next_installment|https://fintechprimitives.com/docs/api/#create-a-mf-purchase-plan-installment|

Refer the [migration procedure](https://docs.fintechprimitives.com/mf-transactions/purchase-plans/sip-v1-purchase-plan-migration) for SIP use cases. 



