---
title: Capturing SIP cancellation reasons
---

## Capturing SIP cancellation reasons

Uniformity in Cancellation of SIPs across Mutual Funds

##### References
[newwindow, SEBI Circular](/compliance/changes/uniformity_in_cancellation_of_sips.pdf ':ignore')

As per SEBI circular SEBI/HO/OW/IMD/IMD-SEC1/P/2024/270/1 dated 3rd January 2024, AMCs are required to ensure capturing proper reasons for cancellation of a purchase plan. This change is expected to be live by April 1st, 2024.

### Changes in FP


> Note the change in the cancel purchase plan API endpoint `/v2/mf_purchase_plans/:id/cancel` will be decommissioned on 1st April 2024 and new endpoint `/v2/mf_purchase_plans/cancel` will only be active

FP has introduced a new attribute `cancellation_code` while cancelling a purchase plan.

This attribute will be optional input for the cancel API (`/v2/mf_purchase_plans/cancel`) until March 31st 2024, and will be made mandatory on April 1st 2024.


#### Affected API endpoints
Purchase plan API endpoint - POST `/v2/mf_purchase_plans/:id/cancel`

SIP API endpoint - PATCH `/api/oms/investment_accounts/:id/orders/sips/:id`

#### Allowed cancellation codes
  
      `amount_not_available`

      `investment_returns_not_as_expected`

      `amc_support_not_satisfactory`

      `exit_load_not_as_expected`

      `switch_to_other_scheme`

      `fund_manager_changed`

      `investment_goal_complete`

      `mandate_not_ready`

      `invest_later`

      `customer_support_not_satisfactory`
      
#### Cancel Purchase API

Current endpoint valid till Mar 31, 2024 - POST `/v2/mf_purchase_plans/:id/cancel`

New endpoint- POST `/v2/mf_purchase_plans/cancel`

##### Request Parameters

|Name | Mandatory | Type | Comments |
| -- | -- | -- | -- |
| id | yes| string | V2 plan ID |
| cancellation_code | yes | 

#### Cancel SIP API (<sup>Deprecated</sup>)

Endpoint - PATCH `/api/oms/investment_accounts/:id/orders/sips/:id`

#####  Request Parameters

|Name | Mandatory | Type | Comments |
| -- | -- | -- | -- |
| cancellation_code | yes| string | if operation=`deactivate` |
