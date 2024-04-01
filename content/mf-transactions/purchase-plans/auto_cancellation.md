---
title: Auto cancellation of purchase plans
---
## Auto cancellation of purchase plans

>  This is applicable only for systematic purchase plans currently. Refer compliance [here](https://docs.fintechprimitives.com/compliance/changes/sip-auto-cancellation/) and plan frequency specific limits for [auto cancellation](https://fintechprimitives.com/docs/api/#cancel-a-purchase-plan)

#### Auto cancellation policy

1. FP will mark a purchase plan as cancelled automatically if the plan is systematic and the number of consecutive failed\skipped installments is more than the limit suggested by SEBI. Purchase plan will also have a `cancellation_code` attribute with value as `consecutive_failed_installment_limit_exceeded`.

2.  The payment completion or [retry payment](https://fintechprimitives.com/docs/api/#retry-mf-purchase) for an installment must happen within the expiry window and installment order should move to `confirmed` state. Refer to the [systematic purchase plan frequency specific installment order expiry windows](https://fintechprimitives.com/docs/api/#order-expiry) 
    1. For example say investor has a monthly purchase plan as below
       1. 1st installment scheduled on 1st April 2024 and payment failed due to low balance. Investor did not retry payment till 7th April, 2024. This is failure of 1st installment.
       2. 2nd  installment scheduled on 1st May 2024 and payment failed due to low balance. Investor did not retry payment till 7th May, 2024. This is failure of 2nd installment.
       3. 3rd  installment scheduled on 1st June 2024 and payment failed due to low balance. Investor did not retry payment till 7th June, 2024. This is failure of 3rd installment. On June 8th, 2024, since 3 consecutive installments failed, FP  will cancel the plan automatically

3. If there are purchase plans whose consecutive failed installment limit has exceeded prior to April 1st 2024, they will be cancelled automatically.

4. If there are purchase plans whose last consecutive failed installment occurs after April 1st 2024, they will be cancelled automatically. 
       1. For example consider an investor has a monthly plan from Feb 1st, 2024 and the first 2 installment on Feb 1st & Mar 1st failed due to mandate approval pending. On April 1st, when the 3rd installment is generated and failed due to mandate approval pending, the purchase plan will be auto cancelled by FP. However FP will wait until the payment retry window for the last installment, before cancelling the plan.

5. While creating a skip instruction for a  purchase plan, FP will validate that the total number of installment to be skipped within from & to date is at least 1 less than the no. of installments that can be skipped as per the SEBI regulation applicable for the frequency of the purchase plan

6. We recommend you to make a note of these limits if you are skipping installments from your front end application. Read detailed [auto cancellation related validations applicable](https://fintechprimitives.com/docs/api/#skip-installments-via-skip-instructions) while skipping a purchase plan

7. More importantly, we recommend you to keep the investors informed about auto cancellation of the plans via notifications every-time an installment is skipped\failed or when the plan is cancelled due to consecutive installment failures.

