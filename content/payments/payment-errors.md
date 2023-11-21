---
title: Payment failure codes
---

### Payment failure codes and their meaning
The following are the failure codes and corresponding failure reasons that you may encounter in the callback response or within the payment object when a payment fails after creation, particularly at the payment provider level. The `failure code` can be used for programmatic actions upon payment failure or for creating custom failure messages displayed to investors. The `failure reason` can be directly shown to investors while the `explanation` is provided for your understanding.

Please be aware that this list is not exhaustive, and we will continue to update it as more codes are added in the future.

> As of now, failure codes are specifically populated for Billdesk as the payment provider.

| Failure Code   | Failure reason   | Explanation    |
| --- | --- | --- |
| `fp_payment_expired`     | Payment is failed by system due to inactivity   | Payment is expired by FP because either investor did not complete the payment in the stipulated time or the payment was not utilised.   |
| `pg_payment_expired`     | Payment failed due to investor's failure to complete within the allotted time.  | Payment was not completed by the investor in time stipulated by the investor's netbanking page or UPI app and the payment gateway has marked the payment as failed    |
| `tpv_failed`    | Payment is made from different bank account to the one provided. Please retry using bank account provided. | investor has tried making the payment using a different bank account from the one passed a 'bank_account_id' while creating the payment and the payment is failed by the bank as MF purchases require that investor must make the payment which belongs the them and verified by the system. |
| `pg_timeout`             | Payment is timed out. Please try again after sometime.       | This could be due to Timeout because of network traffic and Gateway or server busy and payment is not successful.    |
| `invalid_vpa`  | UPI ID provided is invalid. Please retry payment by entering correct UPI ID    | UPI ID entered by the investor is an invalid UPI ID or an unregistered UPI ID   |
| `bank_not_enabled`       | Given bank is not enabled. Please contact support | Bank through which the investor is trying to make the payment from, is not enabled by the payment gateway. Please verify that the payment gateway has enabled for the bank for your merchant account.  |
| `investor_bank_declined` | Payment is declined by your bank. Please contact your bank. | The customer bank has declined the debit request. The reasons can be because of the account being blocked, insufficient balance, daily limit exceeded. Please ask the investor to check with their banks|
| `investor_cancelled`  | Payment cancelled or not completed. Please retry the payment.   | investor has cancelled the payment or dropped off during the payment completion steps   |
| `bank_downtime`   | Bank is not responding. Please retry after sometime  | There is an issue/downtime with the UPI app or there's an issue with the Bank is not available due to a downtime or a technical issue  |
| `insufficient_funds`     | Insufficient funds for payment. Please ensure your account has enough funds and retry.  |     |
| `upi_app_unavailable`    | UPI app is not available. Please retry using different app  | There is an issue/downtime with the UPI app investor has tried making payment with.         |


<!-- ### Payment API error codes and their meaning

|Error reason|Received from|Meaning|
|---|---|---|
|Payment was not completed on time|Payment Gateway|This usually happens when payment couldn't get completed within a stipulated time set by the banks and the session expires and we don't receive a callback from the bank. This may happen due to various reasons, for instance, the user does not receive an OTP or there is network fluctuation at the user's end.|
|Payment failed|Payment Gateway|Payment is declined by the bank gateway where the exact reason is not disclosed by the bank. Banks usually decline the payments when the transaction is not verified, suspecting a certain risk factor (fraudulent transaction) or the customer’s transaction deviates from his current purchasing pattern.|
|Failed by system due to inactivity|FP|It means the investor has gone till the Razorpay popup screen, but he has not done any action further. In that case, FP marks the payment and order as failed with this reason.|
|Bank mandate not approved|Payment Gateway||
|Payment failed because cardholder couldn't be authenticated|Payment Gateway|| -->

