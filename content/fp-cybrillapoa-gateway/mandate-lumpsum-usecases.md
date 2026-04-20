# Mandate Lumpsum Use cases

The **FP–Cybrilla POA Gateway** allows you to use mandates to collect payments for both SIPs and one-time (lumpsum) investments. This document covers how to use mandates effectively across onboarding, SIPs, lumpsum payments, and payment retries.

> **Note:** Mandate-based payments can only be created for single orders, not batch orders.

---

### Use Case 1: New Investor Onboarding

When an investor completes onboarding and sets up an SIP, the first installment would normally be triggered on a future date. You can instead collect the payment against first installment immediately using `generate_first_installment_now = true`, completing the full investment journey in a single session.

#### Flow

1. **Complete investor onboarding**
    Create the investor profile and MF investment account using [FPDocs, Create Investor Profile](https://fintechprimitives.com/docs/api/#create-an-investor-profile) and [FPDocs, Create MF Investment Account](https://fintechprimitives.com/docs/api/#create-an-mf-investment-account).

2. **Create and authorize a mandate**
    Create a mandate for the investor using [FPDocs, Create a mandate](https://fintechprimitives.com/docs/api/#create-a-mandate-enach-upi-autopay).
   
    Initiate the authorization using [FPDocs, Authorize a mandate](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach-and-upi-autopay) and redirect the investor to the `token_url` returned in the response to complete mandate authorization or use your own [Custom checkout page](/fp-cybrillapoa-gateway/custom-checkout/). This follows the same redirect-and-return pattern as a typical payment checkout.
   
    Once the investor completes authorization, they are redirected back to your configured `payment_postback_url`. **Wait for `mandate_status = APPROVED` before proceeding**.

3. **Create the purchase plan**
    Create the plan with `generate_first_installment_now = true` using [FPDocs, Create MF Purchase Plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan). The plan enters `created` state and FP-ONDC begins its asynchronous review.

4. **Wait for review completion**
    Listen for the `mf_purchase.review_completed` webhook event. Once received, the plan moves to `review_completed` state.

5. **Collect consent and confirm the plan**
    Obtain OTP consent from the investor and confirm the plan using [FPDocs, Update MF Purchase Plan](https://fintechprimitives.com/docs/api/#update-a-purchase-plan).
   
    Consent must be [FPDocs, updated](https://fintechprimitives.com/docs/api/#update-a-purchase-plan) against `mf_purchase_plan` and the plan state should be marked as `confirmed`. When the Purchase Plan is `confirmed`, it will be submitted to the gateway; the order is marked as `submitted` and then moved to `active` state automatically.
   
    > **Note:** Please ensure that an `APPROVED` mandate is added as `payment_source` to the Plan before it is `confirmed`.

6. **Fetch the generated first installment**
    Fetch the installment using [FPDocs, List all MF Purchases](https://fintechprimitives.com/docs/api/#list-all-mf-purchases) and retrieve the `old_id`. This is required for payment creation.

7. **Create payment**
    Create payment against the installment using [FPDocs, Create an eNACH or UPI Autopay Payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment).

Based on your workflow, you can either create the mandate before or after taking the consent.

---

### Use Case 2: Lumpsum Purchase for Large Amounts

You can now use mandates directly for lumpsum payments, which is especially useful for high-value investments where standard UPI limits might be exceeded. Instead of relying on immediate checkout methods, you can simply create a Purchase Order directly, take consent and collect the payment via the investor's authorized mandate.

#### Flow

1. **Check for an Active Mandate**
    If the investor has an active mandate, proceed. If not, create one using [FPDocs, Create a mandate](https://fintechprimitives.com/docs/api/#create-a-mandate-enach-upi-autopay) and initiate authorization using [FPDocs, Authorize a mandate](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach-and-upi-autopay) as part of the checkout flow.

2. **Create Purchase Order**
    Confirm the order using [FPDocs, Create a MF Purchase](https://fintechprimitives.com/docs/api/#create-a-mf-purchase).
   
    The order flows through: `under_review` → `pending` → `confirmed` → `submitted`.

3. **Create payment via eNACH mandate**
    Create payment against the installment using [FPDocs, Create an eNACH or UPI Autopay Payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment).
    The lumpsum is debited via the investor's mandate as per the [Settlement TATs](https://poa.cybrilla.com/docs/capabilities/Payments/settlement-TATs).

---

### Use Case 3: Payment Retry for a Failed Installment

The gateway allows you to retry mandate-based payments without recreating the order. This is useful when a debit fails due to reasons like insufficient balance.

**A retry can be initiated when:**
* The previous payment attempt is `FAILED`.
* The order remains in `submitted`.
* No pending or successful payment exists for the same order.
* The order is not marked as failed due to expiry and remains submitted.

As per [Settlement TATs](https://poa.cybrilla.com/docs/capabilities/Payments/settlement-TATs), mandate debits happen on day T. If a debit fails on day T, the earliest a retry can be attempted is once the failure is confirmed, which may mean the retry effectively falls on T+1.

As per SEBI guidelines, systematic purchase plans are subject to auto-cancellation if consecutive installments fail beyond a threshold: 3 consecutive instalment failures for SIPS.

#### Flow

1. **Detect the failed payment**
    Listen for the `payment.failed` webhook event, or poll the payment using [FPDocs, Fetch a payment](https://fintechprimitives.com/docs/api/#fetch-a-payment). Confirm `status = FAILED`.

2. **Verify the order is still actionable**
    Fetch the order using [FPDocs, Fetch a MF Purchase](https://fintechprimitives.com/docs/api/#fetch-a-mf-purchase) and confirm it is not in `failed` or `cancelled` state. If the order is in `pending` state, also confirm it has not exceeded the expiry window by checking `scheduled_on`.

3. **Create a new payment**
    Use the same `amc_order_ids` as before. The order does not need to be re-confirmed.
   
    For **eNACH or UPI Autopay**, use [FPDocs, Create an eNACH or UPI Autopay Payment](https://fintechprimitives.com/docs/api/#create-an-enach-or-upi-autopay-payment).
    For **Netbanking or UPI**, use [FPDocs, Create a payment](https://fintechprimitives.com/docs/api/#create-a-payment).