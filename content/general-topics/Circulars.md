---
title: Circulars
---

## Circulars

Regulatory changes will be regularly updated in this list. 

### 1. Regulatory changes for purchase plan cancellation

#### 1.1. Uniform timeline for auto cancellation of plans due to failed installments

As per SEBI circular SEBI/HO/OW/IMD/IMD-SEC1/P/2024/270/1 dated 3rd January 2024, AMCs are required to follow common practice to allow “number of failed instalments” for a purchase plan. This change is expected to be live by April 1st, 2024.

### Changes in FP

| FP Frequency | No. of consecutive failed installment limit as per SEBI |Remark|
| ---------- | ------------ |------------ |
| daily | 3 | Currently, limit applicable for systematic plan only |
| day_in_a_week | 3 | Currently, limit applicable for systematic plan only |
| four_times_a_month | 3 | Currently, limit applicable for systematic plan only |
| day_in_a_fortnight | 3 | Currently, limit applicable for systematic plan only |
| twice_a_month | 3 | Currently, limit applicable for systematic plan only |
| monthly | 3 | Currently, limit applicable for systematic plan only |
| quarterly | 3 | Currently, limit applicable for systematic plan only |
| half-yearly | 3 | Currently, limit applicable for systematic plan only |
| yearly | 3 | Currently, limit applicable for systematic plan only |

1. FP will mark a purchase plan as cancelled automatically if the plan is systematic and the number of consecutive failed\skipped instalments is more than the limit suggested by SEBI. Purchase plan will also have a cancellation_code to indicate the same i.e cancellation_code - skipped_installment_limit_exceeded
      
2. FP will take care of these changes, and you do not need to make any change at your end.

3. We recommend you to make a note of these limits if you are skipping installments from your front end application.
    
4. More importantly, we recommend you to keep the investors informed about auto cancellation of the plans via notifications every-time an installment is skipped\failed or when the plan is cancelled due to consecutive installment failures.

### 2. Capture reasons for cancelling an SIP

As per SEBI circular SEBI/HO/OW/IMD/IMD-SEC1/P/2024/270/1 dated 3rd January 2024, AMCs are required to ensure capturing proper reasons for cancellation of a purchase plan. This change is expected to be live by April 1st, 2024.

### Changes in FP
    
FP has introduced a new attribute “cancellation_code” while cancelling a purchase plan.
This attribute will be optional input for the cancel API until March 31st 2024, and will be made mandatory on April 1st 2024.
Note the change in the cancel purchase plan API endpoint /v2/mf_purchase_plans/:id/cancel will be decommissioned on April first and new endpoint /v2/mf_purchase_plans/cancel will be active

### Affected API endpoints
`Purchase plan API endpoint` - POST /v2/mf_purchase_plans/:id/cancel

`SIP API endpoint` - PATCH /api/oms/investment_accounts/:id/orders/sips/:id

### Allowed cancellation codes
  
      amount_not_available        
      investment_returns_not_as_expected
      amc_support_not_satisfactory
      exit_load_not_as_expected
      switch_to_other_scheme
      fund_manager_changed
      investment_goal_complete
      mandate_not_ready
      invest_later
      customer_support_not_satisfactory
      Cancel Purchase API

`Current endpoint valid till Mar 31, 2024` - POST /v2/mf_purchase_plans/:id/cancel

`New endpoint`- POST /v2/mf_purchase_plans/cancel

### Request Parameters

|Name | Mandatory | Type | Comments |
| -- | -- | -- | -- |
| id | yes| string | V2 plan ID |
| canellation_code | yes | 

### CANCEL SIP API

`Endpoint` - PATCH /api/oms/investment_accounts/:id/orders/sips/:id

###  Request Parameters

|Name | Mandatory | Type | Comments |
| -- | -- | -- | -- |
| canellation_code | yes| string | if operation=`deactivate` |

## 3. Online PAN validation

As per the recent direction by CBDT, there will be a change in response feed that RTA receive for online PAN verification. This change is expected to be live by April 1st, 2024.

1. With respective to the above circular, Distributors to facilitate investor name as per the details available in investor PAN/ITD records for all the fresh folio creation request.
2. Additionally, If the Investor Name or DOB/DOI is different from the ITD records, first it should be rectified in ITD before submission of application / transaction.
3. In case of minor investor, Guardian Name and DOB will be mandatory.

If any of the above validations fails, transaction will get rejected at the time of processing.

In case of existing investors whose Name or DOB in the folio is not matching with the PAN/ITD, we request you to inform them to change their details either in the MF records or in the ITD before initiating an additional purchase or redemption.

Hence we recommend you to collect name from the investors exactly as per the PAN CARD. Highly recommended to communicate the same to the investors on your web/mobile apps to avoid any rejections from RTA.
