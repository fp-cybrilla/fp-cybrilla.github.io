---
title: Auto cancellation of purchase plans
---
## Auto cancellation of purchase plans

>  This is applicable only for systematic purchase plans currently. Refer compliance [here](https://docs.fintechprimitives.com/compliance/changes/sip-auto-cancellation/) and plan frequency specific limits for [auto cancellation](https://fintechprimitives.com/docs/api/#cancel-a-purchase-plan)

#### Auto cancellation policy

1. FP will mark a purchase plan as cancelled automatically if the plan is systematic and the number of consecutive failed\skipped installments is more than the limit suggested by SEBI. Purchase plan will also have a `cancellation_code` attribute with value as `consecutive_failed_installment_limit_exceeded`.

2.  If the payment of an installment fails, it must be retried before the installment order expires. Due to the auto cancellation policies, the retry of an installment must happen before the next installment debit is scheduled in FP. For example, in a weekly plan if the first installment is on 1st April 2024 and second installment falls on 8th April 2024, the payment for first installment should be completed before 8th April 2024. This helps in determining the true failure of installments and adhere to the SEBI guidelines. Refer to the [plan frequency specific order expiry windows]((https://fintechprimitives.com/docs/api/#order-expiry))

3. If there are purchase plans whose consecutive failed installment limit has exceed prior to April 1st 2024, they will be auto cancelled.

4. If there are purchase plans whose last consecutive failed installment occurs after April 1st 2024, they will be auto cancelled. For example consider an investor has a monthly plan from Feb 1st, 2024 and the first 2 installment on Feb 1st & Mar 1st failed due to mandate approval pending. On April 1st, when the 3rd installment is generated and failed due to mandate approval pending, the purchase plan will be auto cancelled by FP. However FP will wait until the payment retrywindow for the last installment on April 1st, before cancelling the plan.

5. While creating a skip instruction for a  purchase plan, FP will validate that the total number of installment to be skipped within from & to date is at least 1 less than the no. of installments that can be skipped as per the SEBI regulation applicable for the frequency of the purchase plan

6. Read detailed [auto cancellation related validations applicable](https://fintechprimitives.com/docs/api/#skip-installments-via-skip-instructions) while skipping a purchase plan

6. We recommend you to make a note of these limits if you are skipping installments from your front end application.
    
7. More importantly, we recommend you to keep the investors informed about auto cancellation of the plans via notifications every-time an installment is skipped\failed or when the plan is cancelled due to consecutive installment failures.

