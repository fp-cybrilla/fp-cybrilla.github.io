---
title: Auto Cancellation of SIPs
---

## Auto Cancellation of SIPs

Uniform timeline for auto cancellation of plans due to failed installments

##### References
1. [newwindow, SEBI Circular](https://)
As per SEBI circular SEBI/HO/OW/IMD/IMD-SEC1/P/2024/270/1 dated 3rd January 2024, AMCs are required to follow common practice to allow "number of failed instalments" for a purchase plan. This change is expected to be live by April 1st, 2024.

### Changes in FP

| FP Frequency | No. of consecutive failed installment limit as per SEBI |Remark|
| ---------- | ------------ |------------ |
| `daily` | 3 | Currently, limit applicable for systematic plan only |
| `day_in_a_week` | 3 | Currently, limit applicable for systematic plan only |
| `four_times_a_month` | 3 | Currently, limit applicable for systematic plan only |
| `day_in_a_fortnight` | 3 | Currently, limit applicable for systematic plan only |
| `twice_a_month` | 3 | Currently, limit applicable for systematic plan only |
| `monthly` | 3 | Currently, limit applicable for systematic plan only |
| `quarterly` | 3 | Currently, limit applicable for systematic plan only |
| `half-yearly` | 3 | Currently, limit applicable for systematic plan only |
| `yearly` | 3 | Currently, limit applicable for systematic plan only |

1. FP will mark a purchase plan as cancelled automatically if the plan is systematic and the number of consecutive failed\skipped instalments is more than the limit suggested by SEBI. Purchase plan will also have a `cancellation_code` to indicate the same i.e 

`cancellation_code - skipped_installment_limit_exceeded`
      
2. FP will take care of these changes, and you do not need to make any change at your end.

3. We recommend you to make a note of these limits if you are skipping installments from your front end application.
    
4. More importantly, we recommend you to keep the investors informed about auto cancellation of the plans via notifications every-time an installment is skipped\failed or when the plan is cancelled due to consecutive installment failures.
