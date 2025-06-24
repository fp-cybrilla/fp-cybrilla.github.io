## Custom Checkout Page design

The **FP-Cybrilla POA Gateway** enables you(BuyerApp) to build custom checkout experience while the investor makes a UPI payment or authorise UPI mandate instead of relying on the `Token URL`. Following are the steps to build your own custom checkout experience:

### UPI Payment creation flow:

1. **Create Purchase Order:** When a purchase order is created using the [FPDocs, MF Purchase](https://fintechprimitives.com/docs/api/#create-a-mf-purchase) from FPDocs, the order enters the `under_review` state immediately after creation.

2. **Review Completion:** The `cybrillapoa` gateway will asynchronously review the order details in the background. If the review passes, the order is marked as `pending` and `mf_purchase.review_completed` event is delivered. Else, the order is marked as `failed`.

3. **Consent Collection:** Required before payment can be initiated. Once the order is in `pending` state, consent must be obtained from the investor and updated against `mf_purchase` using the [FPDocs, Update MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase).

4. **Payment Creation:** After consent updation, utilise your custom checkout screen to enable your investor to choose their UPI payment method choice of Intent(list of UPI apps installed on their mobile device), QR(for desktop or laptop) or Collect request(textbox for them to enter their UPI ID(VPA)) to complete the payment against the order.

    **Payment via UPI Intent/QR:**

    If the investor choose Intent or QR, utilise the following request body to create the UPI URI which can be either used for trigggering the intent or generate the QR code:

    ```json
    //Request
    curl --location 'https://s.finprim.com/api/pg/payments/netbanking' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer token' \
    --data '{
        "amc_order_ids": [
            1
        ],
        "payment_postback_url": "https://tenantpostbackurl.com/",
        "method": "UPI",
        "upi":{
            "type": "URI"
        },
        "bank_account_id": 417
    }'

    //Response:
    {
        "id": 1,
        "token_url": null,
        "upi": {
            "type": "uri",
            "vpa": null,
            "uri": null
        }
    }
    ```
    At this point, only payment ID is generated. Store the payment ID and move on to the "Order Submission" step.

    **Payment via UPI Collect:**
    If the investor choose UPI Collect method, collect UPI ID(VPA) from the investor and pass the UPI ID in the Payment creation API request body as follows:

    ```json
    //Request
    curl --location 'https://s.finprim.com/api/pg/payments/netbanking' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer token' \
    --data '{
        "amc_order_ids": [
            1
        ],
        "payment_postback_url": "https://tenantpostbackurl.com/",
        "method": "UPI",
        "upi":{
            "type": "collect",
            "vpa": "anand@ybl"
        },
        "bank_account_id": 417
    }'

    //Response:
    {
        "id": 2,
        "token_url": null,
        "upi": {
            "type": "collect",
            "vpa": "anand@ybl",
            "uri": null
        }
    }
    ```
    Store the payment ID and move on to the "Order Submission" step.

5. **Order Submission:** Next mark the order as `confirmed` using [FPDocs, Update MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase). Once confirmed, the order is submitted to the `cybrillapoa` gateway and upon successful submission, its status becomes `submitted`.

6. **Payment Collection:** When the order is `submitted`, based on the user selection in step 4, following steps must be followed:

    **Payment via UPI Intent/QR:**
    Fetch the payment using the ID generated in step 4 and you will receive the URI in the response as follows:

    ```json

    //Request:
    curl --location 'https://s.finprim.com/api/pg/payments/1021' \
    --header 'Authorization: Bearer token'

    //Response:
    {
        "payment_type": "NETBANKING",
        "status": "PENDING",
        "amount": 1001.0000,
        "debit_date": "2025-06-17",
        "amc_order_ids": [
            2411
        ],
        "failed_reason": null,
        "method": "UPI",
        "created_at": "2025-06-17T19:00:45+05:30",
        "submitted_at": null,
        "debit_confirmed_at": null,
        "failed_at": null,
        "transfer_initiated_at": null,
        "settled_at": null,
        "rejected_at": null,
        "from_bank_account_id": 417,
        "provider_name": "ONDC",
        "failure_code": null,
        "late_auth": false,
        "refund_reference": null,
        "refund_reason": null,
        "refund_status": null,
        "refund_created_at": null,
        "upi": {
            "type": "uri",
            "vpa": null,
            "uri": "upi://pay?pa=billdesk@hdfcbank&pn=(null)&mc=7399&tr=UHD5WXW0011G77&tn=Pay&am=1001.00&mam=1001.00&cu=INR"
        },
        "id": 1021
    }
    ```
    In mobile devices, you can utilise the UPI `URI` received in the response to launch the UPI apps installed on the Investor device or you can customise the UPI apps to be shown and their order based on your UI/UX requirements.

    You can also convert the URI received in the response to QR code using a QR generator and show it on the checkout page for the investor to scan and make the payment.

    Generally, Intent is shown if the user is using a mobile device and QR is displayed if they are using a desktop or a laptop.


    **Payment via UPI Collect:**
    If the Investor choice of payment is via UPI Collect, then once the order is submitted, collect request will be sent to the Investor's UPI app for them to complete the payment.

    You can store the UPI ID(VPA) collected from the Investor and prepoluate the UPI ID for them to directly select the Collect flow without entering the UPI ID(VPA) again.

7. **Order processing:** Based on the order processed at the RTAs, the order will move to its final state of either `successful` or `failed`.

### UPI Autopay authorisation flow:

1. **Mandate creation:** Create the UPI Autopay mandate using the following API request:

```json
\\Request:
curl --location 'https://s.finprim.com/api/pg/mandates' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer token' \
--data '{
    "mandate_type": "upi",
    "bank_account_id": 1,
    "provider_name": "CYBRILLAPOA",
    "mandate_limit": 100000
}
\\Response
{
    "id": 200,
    "mandate_ref": "man_209e6baee523444d9f1b7d36182c1210"
}'
```

2. **Mandate Authorisation:** Your investor must choose their UPI method of Intent, QR or Collect request to authorise the UPI Autopay.

    **Authorisation via UPI Intent/QR:**
    If the Investor chooses to authorise via Intent/QR, then use the following API:
    ```json
    \\Request:
    curl --location 'https://s.finprim.com/api/pg/payments/emandate/auth' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer bearer' \
    --data '
    {
        "mandate_id": 197,
        "upi": {
            "type": "uri"
        }
    }'

    \\Response:
    {
        "id": 1030,
        "token_url": "",
        "upi": {
            "type": "uri",
            "vpa": null,
            "uri": "upi://mandate?pa=billuat@icici&pn=BDUATV2K40&validitystart=18062025&validityend=17062055&am=100000.00&fam=1.00&amrule=MAX&recur=ASPRESENTED&recurvalue=1&recurtype=AFTER&tr=MA0BAD00466955&cu=INR&mc=5411&tn=Amount to be paid now is Rs 1.00&mode=04&purpose=14&rev=Y&orgid=000000&txntype=CREATE&tid=MA0BAD00466955"
        }
    }
    ```
    In Android and IOS devices, you can utilise the UPI `URI` received in the response to launch the UPI apps installed on the Investor device or you can customise the UPI apps to be shown and their order based on your UI/UX requirements.

    You can also convert the URI received in the response to QR code using a QR generator and show it on the checkout page for the investor to scan and make the payment.

    Generally, Intent is shown if the user is using a mobile device and QR is displayed if they are using a desktop or a laptop.

    **Authorisation via UPI Collect:**

    If the Investor chooses to authorise via Intent/QR, then use the following API and the a collect request will be sent to the Investor's UPI app to complete the Autopay authorisation:

    ```json
    \\Request:
    curl --location 'https://s.finprim.com/api/pg/payments/emandate/auth' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer bearer' \
    --data '
    {
        "mandate_id": 197,
        "upi": {
            "type": "collect",
            "vpa": "anand@ybl"
        }
    }'

    \\Response:
    {
        "id": 1031,
        "token_url": "",
        "upi": {
            "type": "collect",
            "vpa": "anand@ybl",
            "uri": ""
        }
    }

    ```