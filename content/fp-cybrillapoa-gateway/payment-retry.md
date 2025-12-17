## Payment Retry flow

The **FP-Cybrilla POA Gateway** enables you to retry the payment against an order when the initial payment is failed and thereby enable the Investor to retry without providing consent again.

A retry can be initiated when:
    - The previous payment attempt is marked as `failed`.  
    - The associated order(s) remains in the `submitted` state.  
    - No successful (or pending) payment attempt exists for the same order(s).

Payment must be created after the order(s) are `submitted`. The order will **not** be marked as failed due to payment failure. It stays `submitted`, allowing you to retry payment creation multiple times.

#### Single order Payment Creation Flow

1. **Create Purchase Order:**
When a purchase order is created using the [FPDocs, MF Purchase](https://fintechprimitives.com/docs/api/#create-a-mf-purchase), the order enters the `under_review` state immediately after creation.

2. **Review Completion:**
The `cybrillapoa` gateway asynchronously reviews the order details in the background.  
If the review passes, the order is marked as `pending` and `mf_purchase.review_completed` event is delivered.  
Else, the order is marked as `failed`.

3. **Consent Collection:**
Required before payment can be initiated.  
Once the order is in `pending` state, consent must be obtained from the investor and updated against `mf_purchase` using the [FPDocs, Update MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase).


4. **Order Submission:**
Once the consent is updated, mark the order as `confirmed` using [FPDocs, Update MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase).  
Once confirmed, the order is submitted to the `cybrillapoa` gateway and its status becomes `submitted`.

5. **Payment Creation:**
After order is submitted, create payment against the order either by using Cybrilla's token URL for Netbanking or by utilise your custom checkout screen to enable your investor to choose their UPI payment method choice of Intent(list of UPI apps installed on their mobile device), QR(for desktop or laptop) or Collect request(textbox for them to enter their UPI ID(VPA)) to complete the payment against the order.


6. **Payment Collection:**

Based on the Netbanking or UPI type chosen (**Intent / QR / Collect**), the investor completes the payment using their UPI app.
- For **Netbanking**, User must be redirected to the `token_url` received for them to complete the payment using their Netbanking credentials.
- For **Collect**, a request is sent to the investor’s UPI app.  
- For **Intent/QR**, the UPI URI is delivered via the `payment.updated` webhook or If the event is not received, as a fallback mechanism, fetch the payment using the ID generated in step 5 and you will receive the URI in the response. 


#### Batch order Payment Creation Flow

1. **Create Batch Purchase Order:**
When a batch purchase order is created using the [FPDocs, MF Batch Purchase](https://fintechprimitives.com/docs/api/#create-batch-purchase-orders-early-access), the batch orders enters the `under_review` state immediately after creation.

2. **Review Completion:**
The `cybrillapoa` gateway asynchronously reviews the order details in the background.  
If the review passes, the order is marked as `pending` and `mf_purchase.review_completed` event is delivered.  
Else, the order is marked as `failed`.

3. **Consent Collection:**
Required before payment can be initiated.  
Once the order is in `pending` state, consent must be obtained from the investor and updated against `mf_purchase` using the [FPDocs, Update MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase) for each order in the batch individually.


4. **Order Submission:**
Once the consent is updated, mark the batch orders as `confirmed` using [FPDocs, Update MF Purchase](https://fintechprimitives.com/docs/api/#update-batch-purchase-orders-early-access).  
Once confirmed, the order is submitted to the `cybrillapoa` gateway and its status becomes `submitted`.

5. **Payment Creation:**
After order is submitted, create payment against the order(s) either by using Cybrilla's token URL for Netbanking or by utilise your custom checkout screen to enable your investor to choose their UPI payment method choice of Intent(list of UPI apps installed on their mobile device), QR(for desktop or laptop) or Collect request(textbox for them to enter their UPI ID(VPA)) to complete the payment against the order.


6. **Payment Collection:**

Based on the Netbanking or UPI type chosen (**Intent / QR / Collect**), the investor completes the payment using their UPI app.
- For **Netbanking**, User must be redirected to the `token_url` received for them to complete the payment using their Netbanking credentials.
- For **Collect**, a request is sent to the investor’s UPI app.  
- For **Intent/QR**, the UPI URI is delivered via the `payment.updated` webhook or If the event is not received, as a fallback mechanism, fetch the payment using the ID generated in step 5 and you will receive the URI in the response. 

#### Payment Retry Flow

When the first payment attempt fails or expires, you can allow the investor to **retry the payment** without creating a new purchase order. 
> Same flow can be utilised to **retry payment for an SIP instalment** using Netbanking and UPI payment methods when the initial payment is failed. You can utilise the List all MF Purchases
(https://fintechprimitives.com/docs/api/#list-all-mf-purchases) to fetch the instalment AMC order ID to retry the payments.

1. **When to Retry:**
A retry can be initiated when:
    - The previous payment attempt is marked as `failed`.  
    - The associated order(s) remains in the `submitted` state.  
    - No successful (or pending) payment attempt exists for the same order(s).

The order will **not** be marked as failed due to payment failure. It stays `submitted`, allowing you to retry payment creation multiple times.

2. **Retry Payment Creation:**
Create a new payment for the same order(s) using the same endpoint as in Step 5.

    > **Note:**
    > - Each retry generates a **new Payment ID**.  
    > - The same `amc_order_ids` and `bank_account_id` can be reused.  
    > - Only one `pending` payment attempt should exist per order at a time.  
    > - The order **should not be re-confirmed**; it already remains in `submitted`.

3. **Payment Initiation:**
Once the new payment is created:
    - For **UPI Intent/QR**, fetch the UPI URI via webhook (`payment.updated`).  
    - For **UPI Collect**, a new collect request is automatically sent to the investor’s UPI app.
You can use the same UX pattern from your original checkout screen to show retry options.

4. **Handling Multiple Retries:**
If the payments fails multiple times, additional retries can be initiated by repeating the same process:
    - Each retry = new Payment ID.  
    - The order remains `submitted`.  
    - Once a payment succeeds, all failed payment attempts are automatically ignored.

5. **Webhook Events and Polling:**
    - Use the same payment webhook events as the original flow for monitoring payment retries: `payment.success`, `payment.failed`.
    - Alternatively, use the [FPDocs, Fetch Payment by ID](https://fintechprimitives.com/docs/api/#fetch-a-payment) endpoint to poll the status.
