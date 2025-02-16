---
title: Auto Cancellation of SIPs
---

## Auto Cancellation of SIPs

Uniform timeline for auto cancellation of plans due to failed installments

##### References
[newwindow, SEBI Circular](/compliance/changes/uniformity_in_cancellation_of_sips.pdf ':ignore')

As per SEBI circular SEBI/HO/OW/IMD/IMD-SEC1/P/2024/270/1 dated 3rd January 2024, AMCs are required to follow common practice to allow "number of failed instalments" for a purchase plan. This change is expected to be live by April 1st, 2024.

### Changes in FP

##### Frequency specific installments cancellation limit
| FP Frequency | No. of consecutive failed installment limit as per SEBI |Remark|
| ---------- | ------------ |------------ |
| `daily` | 3 | Currently, limit applicable for systematic plan only |
| `day_in_a_week` | 3 | Currently, limit applicable for systematic plan only |
| `four_times_a_month` | 3 | Currently, limit applicable for systematic plan only |
| `day_in_a_fortnight` | 3 | Currently, limit applicable for systematic plan only |
| `twice_a_month` | 3 | Currently, limit applicable for systematic plan only |
| `monthly` | 3 | Currently, limit applicable for systematic plan only |
| `quarterly` | 2 | Currently, limit applicable for systematic plan only |
| `half-yearly` | 2 | Currently, limit applicable for systematic plan only |
| `yearly` | 2 | Currently, limit applicable for systematic plan only |


1. FP will mark a purchase plan as cancelled automatically if the plan is systematic and the number of consecutive failed\skipped instalments is more than the limit suggested by SEBI. Purchase plan will also have a `cancellation_code` attribute with value as `consecutive_failed_installment_limit_exceeded`.

2. We recommend you to make a note of these limits if you are skipping installments from your front end application.
    
3. More importantly, we recommend you to keep the investors informed about auto cancellation of the plans via notifications every-time an installment is skipped\failed or when the plan is cancelled due to consecutive installment failures.

##### FP API changes for cancelling the installments

1. Purchase plan skip instruction
   1. End date (skip instruction object attribute `to`) is mandatory for systematic plans
   2. While creating a skip instruction, FP will validate that the total number of installment to be skipped within from & to date is at least 1 less than the no. of installments that can be skipped as per the SEBI regulation applicable for the frequency of the purchase plan
   3. API endpoint POST `/v2/mf_purchase_plans/:id/skip_instructions`

2. SIP modify API (<sup>Deprecated</sup>)
   1. FP will validate that the consecutive installments cancelled is within the no. of installments that can be skipped as per the SEBI regulation applicable for the frequency of the SIP
   2. Eg: Investor had cancelled last 2 installments of a monthly SIP consecutively. In this case, investor cannot cancel the 3rd installment.
   3. API endpoint PATCH `/api/oms/investment_accounts/:id/orders/sips/:id`
