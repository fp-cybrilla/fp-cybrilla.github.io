## FP-Cybrilla POA Gateway Overview(Beta)

The **FP-Cybrilla POA Gateway** enables you(BuyerApp) to process mutual fund orders via Cybrilla POA gateway(SellerApp) through ONDC protocols , using **Cybrilla** as the ONDC-verified BuyerApp TSP. This document highlights how the Cybrilla POA route differs from the traditional RTA route and outlines the key steps involved in onboarding and transaction flows.

### Identity & Onboarding

During investor onboarding, you must collect the following details:

* Investor profile information
* Address details
   * The `nature` parameter is mandatory when creating an address.
* Bank account information
* Email address
* Mobile number

Cybrilla POA performs **KYC and BAV checks** when processing every order. You may choose to perform these checks during Investor onboarding by using [FPDocs, Bank account verification](https://fintechprimitives.com/docs/api/#bank-account-verification-early-access) and [FPDocs, KYC Check](https://fintechprimitives.com/docs/api/#kyc-checks). Adding these early checks helps ensure a seamless order placement experience.

* **KYC Check**: If you wish to perform [KYC Check](https://fintechprimitives.com/docs/api/#kyc-checks), you'll need to sign up with a KRA. Cybrilla currently supports CVL KYC (charges apply).
* **Bank Account Verification (BAV)**: Supported via Razorpay (charges apply).

### Order Creation Flow

#### MF Investment Account Creation(MFIA)

To create the purchase orders, MF Investment Account must be created using [FPDocs, MF Investment Account](https://fintechprimitives.com/docs/api/#create-an-mf-investment-account). Please note the following restrictions for `cybrillapoa` gateway:
  * `fourth_tax_residency` is **not supported** for `resident_individual`
  * Only `savings` bank account type is allowed

#### Order Creation Flow

1. **Create Purchase Order:** When a purchase order is created using the [FPDocs, MF Purchase](https://fintechprimitives.com/docs/api/#create-a-mf-purchase) from FPDocs, the order enters the `under_review` state immediately after creation.

2. **Review Completion:** The `cybrillapoa` gateway will asynchronously review the order details in the background. If the review passes, the order is marked as `pending` and `mf_purchase.review_completed` event is delivered. Else, the order is marked as `failed`.

3. **Consent Collection:** Required before payment can be initiated. Once the order is in `pending` state, consent must be obtained from the investor and updated against `mf_purchase` using the [FPDocs, Update MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase).

4. **Payment Creation:** After consent updation, create a payment against the order using the [FPDocs, Create Payment API](https://fintechprimitives.com/docs/api/#create-a-payment).

5. **Order Submission:** Next mark the order as `confirmed` using [FPDocs, Update MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase). Once confirmed, the order is submitted to the `cybrillapoa` gateway and upon successful submission, its status becomes `submitted`.

6. **Payment Collection:** When the order is `submitted`, redirect investor to the `token_url` to complete payment.

7. **Order processing:** Based on the order processed at the RTAs, the order will move to its final state of either `successful` or `failed`.

#### Basket Orders (Batch)

To create basket orders against which a single payment can be created, the steps remain the same as for single order except for the following:
* Use the [FPDocs, Batch Order API](https://fintechprimitives.com/docs/api/#create-batch-purchase-orders-early-access) to create multiple orders.
* Consent must be updated individually per order using the [FPDocs, Update Order](https://fintechprimitives.com/docs/api/#update-a-mf-purchase).
* Use [FPDocs, Update Batch Order API](https://fintechprimitives.com/docs/api/#update-batch-purchase-orders-early-access) to update the orders status to `confirmed`.
* Payment must be created for **all** orders created using  [FPDocs, Batch Order](https://fintechprimitives.com/docs/api/#create-batch-purchase-orders-early-access).

### Redemption flow

> Redemptions via `cybrillapoa` Gateway are supported **only** for folios created using the `cybrillapoa` gateway.

1. **Create Redemption Order:** When you create an order using [FPDocs, Create MF Redemption](https://fintechprimitives.com/docs/api/#create-a-mf-redemption), the order will be in `under_review` state.

2. **Review Completion:** The `cybrillapoa` gateway will asynchronously review the order details in the background. If this review passes, the order is marked as `pending`  and `mf_redemption.review_completed` event is delivered. Else, the order is marked as `failed` .

3. **Consent Collection:** Once the order is pending state, consent can be obtained from the investor and mark mf_redemption as `confirmed`  using [FPDocs, Update a MF Redemption](https://fintechprimitives.com/docs/api/#update-a-mf-redemption).

4. **Order Submission:** When the order is `confirmed` , it will be submitted to the `cybrillapoa`  gateway and upon successful submission, the order is marked as `submitted` . Upon the order processing at the RTA, the order moves to its final state of either `successful` or `failed` .
