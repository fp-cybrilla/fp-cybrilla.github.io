---
title: Payment failure codes
---

### Payment failure codes and their meaning
The following are the failure codes and corresponding failure reasons that you may encounter in the callback response or within the payment object when a payment fails after creation, particularly at the payment provider level. The `failure code` can be used for programmatic actions upon payment failure or for creating custom failure messages displayed to investors. The `failure reason` can be directly shown to investors while the `explanation` is provided for your understanding.

Please be aware that this list is not exhaustive, and we will continue to update it as more codes are added in the future.


| Failure Code   | Failure reason   | Explanation    |
| --- | --- | --- |
|`fp_payment_expired`| Payment is failed by  system due to inactivity| Payment is expired by FP because either user did not complete the payment in the stipulated time  or the payment was not utilised.|
|`pg_payment_expired`| Payment was not completed within the allotted time. Please retry the payment| Payment was not completed by the user in  time stipulated by the user's netbanking page or UPI app and the payment gateway has marked the payment as failed.|
|`tpv_failed`| Payment is made from different bank account to the one provided. Please retry using bank account provided. |User has tried making the payment using a different bank account from the one passed a 'bank_account_id' while creating the payment and the payment is failed by the bank as MF purchases require that user must make the payment which belongs the them and verified by the system. *Possible reasons*: <ul><li>Preceding zeros not added to the bank account number as per bank passbook or cheque copy.</li><li>Investor has changed their branch and if the IFSC is not updated at bank/NPCI end etc.</li></ul> |
|`pg_timeout`| Your payment has been cancelled. Try again or complete the payment later.| This could be due to Timeout because of network traffic and Gateway or server busy and payment is not successful.|
|`invalid_upi_id`| UPI ID provided is incorrect. Please retry payment by entering correct UPI ID| UPI ID entered by the user is an invalid or an unregistered UPI ID.|
|`bank_not_enabled`| Your payment could not be completed as this bank is not enabled by the business. To complete the payment, use another bank account.| Bank through which the investor is trying to make the payment from, is not enabled by the payment gateway. Please verify that the payment gateway has enabled the bank for your merchant account.|
|`investor_bank_declined`| Payment is declined by your bank. Please contact your bank or try again with another account.| The customer bank has declined the debit request. The reasons can be because of insufficient balance, daily limit exceeded. Please ask the investor to check with their banks.|
|`user_cancelled`| Payment cancelled or not completed. Please retry the payment.| User has cancelled the payment or dropped off during the payment completion steps. |
|`bank_downtime`| Payment processing failed due to error at bank or wallet gateway. Please retry after sometime. |There is an issue/downtime with the UPI app or there's an issue with the Bank is  not available due to a downtime or a technical issue.|
|`insufficient_funds`| Insufficient funds for payment. Please ensure your account has enough funds and retry. | |
|`upi_app_unavailable`| UPI app is  not available. Please retry using different app| There is an issue/downtime with the UPI app user has tried making payment with. |
|`pg_server_error`| Payment failed due to error at payment gateway. Please retry after sometime.| There is an issue/downtime with the payment gateway due to a downtime or a technical issue. Please reach out  to FP or the payment gateway for resolution.|
|`auth_in_progress`| Your mandate registration with same details is already in progress. Please retry after sometime.| Previous mandate authorisation is already in progress and the bank or the payment gateway has restricted duplicate authorisation request. Please wait for atleast 15 mins before retrying the mandate authorisation.|
|`invalid_credentials`| Payment failed due to invalid credentials. Please retry using correct credentials.| User has entered wrong credentials. User can retry using the correct credentials. This can be wrong wrong netbanking username, password  or pin.|
|`payment_failed`| Payment was unsuccessful due to a temporary issue. Please retry after sometime.| Payment processing or mandate registration failed due to error at bank or payment gateway. No specific error code received from gateway in this case.|
|`invalid_bank_account`| Payment failed as your bank account is inoperative, blocked or closed. Try another account or contact your bank for details.| The customer bank has declined the debit request. The reasons can be because of the account being blocked, Please ask the investor to  check  with their banks|


<!-- ### Payment API error codes and their meaning

|Error reason|Received from|Meaning|
|---|---|---|
|Payment was not completed on time|Payment Gateway|This usually happens when payment couldn't get completed within a stipulated time set by the banks and the session expires and we don't receive a callback from the bank. This may happen due to various reasons, for instance, the user does not receive an OTP or there is network fluctuation at the user's end.|
|Payment failed|Payment Gateway|Payment is declined by the bank gateway where the exact reason is not disclosed by the bank. Banks usually decline the payments when the transaction is not verified, suspecting a certain risk factor (fraudulent transaction) or the customer’s transaction deviates from his current purchasing pattern.|
|Failed by system due to inactivity|FP|It means the investor has gone till the Razorpay popup screen, but he has not done any action further. In that case, FP marks the payment and order as failed with this reason.|
|Bank mandate not approved|Payment Gateway||
|Payment failed because cardholder couldn't be authenticated|Payment Gateway|| -->

