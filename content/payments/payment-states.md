---
title: Payment States
---
## Payment States
|Status|Applicability|Comments|
|---|---|---|
|PENDING|All|Payment is pending.|
|SUCCESS|All|Payment is successful. Amount has been successfully deducted from the investor's account but yet to be transferred to the AMC's account.|
|FAILED|All|Payment failed for some reason.|
|SUBMITTED|Mandates only|Mandate has been submitted to the payment gateway.|
|TIMEDOUT|All|Received timed out error from payment gateway.|
|INITIATED|All|Transfer of money has been initiated from payment gateway to AMC.|
|APPROVED|All|Transfer of money from payment gateway to AMC is successful.|

### Error reasons
|Error reason|Received from|Meaning|
|---|---|---|
|Payment was not completed on time|Payment Gateway|This usually happens when payment couldn't get completed within a stipulated time set by the banks and the session expires and we don't receive a callback from the bank. This may happen due to various reasons, for instance, the user does not receive an OTP or there is network fluctuation at the user's end.|
|Payment failed|Payment Gateway|Payment is declined by the bank gateway where the exact reason is not disclosed by the bank. Banks usually decline the payments when the transaction is not verified, suspecting a certain risk factor (fraudulent transaction) or the customer’s transaction deviates from his current purchasing pattern.|
|Failed by system due to inactivity|FP|It means the investor has gone till the Razorpay popup screen, but he has not done any action further. In that case, FP marks the payment and order as failed with this reason.|
|Bank mandate not approved|Payment Gateway||
|Payment failed because cardholder couldn't be authenticated|Payment Gateway||

