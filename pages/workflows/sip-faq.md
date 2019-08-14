## Frequently Asked Questions
----------------------------------
#### What is the max limit on a mandate?
>  The limit for eNach (via NPCI) is 99,999 per SIP transaction.<br>
Reference - https://razorpay.com/docs/recurring-payments/faqs/#11-what-is-the-maximum-amount-per-debit<br>
The limit for physical mandate is 1 crore per SIP transaction.

#### How to set the mandate limit? 
> You can capture the same from the user and pass it through the [mandate creation API](https://fintechprimitives.com/api/#post-create-e-mandate)

#### Is the mandate limit per SIP transaction every month, or for all SIP transactions in a month? 
> The limit is per debit request, ie, per SIP transaction

#### If one has to create a new mandate with a higher limit, how do old SIPs get updated with the new mandate ID? Or does one need to stop the old SIPs, and create new SIPs with the new mandate ID?
> The old SIPs do not need to be stopped. A new mandate can be created and mapped to the existing SIPs through the [Update SIP API](https://fintechprimitives.com/api/#patch-update-sip-order)

#### Can the user have only one mandate "live" at any given point in time for a specific bank account?
> There can be multiple mandates for a user per bank account.

#### How to test the various SIP installments on the sandbox? 
> The [simulation API](https://fintechprimitives.com/api/#post-sip-simulation) can be used to test the SIP installments.

#### Is the SIP order marked as failed by the platform if the mandate gets rejected?
> No. The tenant has to check the status of the mandate and [cancel the SIP order](https://fintechprimitives.com/api/#patch-cancel-sip-order)

#### If the user is checking out multiple funds at a time, should mandate be created for each of those SIPs? 
> No. Mandate is a one time activity for every user, associated to the bank account. The same mandate id will be passed for every SIP order.

#### For e-mandate, there is an [Auth Transaction API](https://fintechprimitives.com/api/#post-auth-transaction), which helps the user to authorize the auto debit for SIP. So once the user clicks and authorizes this, is that all the user needs to do for the auto debit of money?
> Yes. The SIP order will be created in the system and the account will be auto debited

#### After creating the mandate, should the user make the first payment for SIP order, or is it handled through the mandate?
> The SIP order will be created in the system and the account will be auto debited. The user need not make a payment.

#### Is one mandate enough for more than one SIP transactions?
> Yes. Mandate is a one time activity.

#### What if SIP amount is greater than 10k and mandate max amount is 10k?
> The SIP shall be rejected.

