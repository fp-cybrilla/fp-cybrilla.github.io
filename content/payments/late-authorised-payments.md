---
title: Late payment authorisations
---
## Late payment authorisations

Late authorization occurs when a payment is disrupted due to network issues or technical errors at either the customer's or bank's end. This can result in uncertainty about whether money was debited from the customer's bank account, as the payment provider doesn't receive confirmation from the bank.

#### Razorpay handling of Late authorised payments:
To manage late authorizations, Razorpay waits for 10 minutes to receive status updates from the bank. If no response is received within this time, Razorpay marks the payment as failed due to timeout. However, if the bank authorizes the payment after Razorpay has marked it as `failed`, Razorpay moves the payment from `failed` to `success` and notifies Fintech Primitives about the payment status change. For such cases, FP initiates the refund for these late authorised payments and does not change the payment status. This refund is essential to maintain the integrity of the payment status and ensure accurate communication with users regarding payment statuses.

#### Tracking Late Authorized Payments
Late authorised payments can be tracked either via FP dashboard or via Fetch Payment API:
- **Via APIs(Sandbox only):** In the [FPDocs, Fetch Payment](https://fintechprimitives.com/docs/api/#fetch-a-payment), you will be able to see the following new parameters which will help you in providing the details to your investors.


Below is an example of a truncated Fetch payment JSON response showing only the  late auth and refund parameters:
```
{
    
    "late_auth": true,
    "refund_reference": "rfnd_NPC5uKsdkfF",
    "refund_reason": "late_authorization",
    "refund_status": "SUCCESSFUL",
    "refund_created_at": "2024-01-16T12:31:28+05:30",

}
```
- **Via Dashboard:** For late authorsied payments, in the dashboard, you will see "late authorised" flag as true and you will be able to see refund details as well. You can use these details to inform your investors about the refund status.
