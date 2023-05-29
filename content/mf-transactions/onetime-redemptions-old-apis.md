## Create a Redemption Order using V1 APIs

Mutual fund units are associated with folios. You can treat folios as sub-accounts under the investment account. You can fetch the list of folios for an investment a/c from the [FPDocs, holdings report](https://fintechprimitives.com/api/#get-holding-report). `redeemable_units` shows the number of units that are available for selling. You can use the FP APIs to sell the units partially or in total.

#### 1. Obtain investor's consent for the redemption order by sending an OTP to email or mobile or both
As per [SEBI regulations](https://www.sebi.gov.in/legal/circulars/mar-2022/discontinuation-of-usage-of-pool-accounts-for-transactions-in-the-units-of-mutual-funds-clarifications-with-respect-to-circulars-dated-october-4-2021_56887.html), investor consent must be obtained by sending a One-Time Password to the investor at his/her email/phone number registered against the folio before redemptions can be sent to rtas. Call the [FPDocs, List folios](https://fintechprimitives.com/docs/api/#list-folios) API and fetch email addresses and mobile numbers against the folio.
```json
# Displaying only a part of the folio object for brevity
{
  "email_addresses": [
    "mfp@cybrilla.com"
  ],
  "mobile_numbers": [
    "+919999999999"
  ]
}
```
Send OTP to any one of the email addresses/mobile numbers. Once the OTP has been sent and investor has entered the correct OTP, create the redemption order.

#### 2. Create a sell order

Call the [FPDocs, Create sell order](https://fintechprimitives.com/api/#post-create-sell-order) with the following json. Pass the `folio_number`,`isin`, and `consent` details according to the account from which you wish to sell the units from. `consent` details must include `email` address if you have sent OTP to an email address registered against the folio. `consent` details must include `isd` and `mobile` details if you have sent OTP to a mobile number registered against the folio. 

```json
{
  "orders": [
    {
      "folio_number": "45323/45",
      "isin": "INF109K01VQ1",
      "type": "units",
      "amount": 450,
      "consent" : {
        "email": "mfp@cybrilla.com",
        "isd_code": "91",
        "mobile": "9999999999"
      }
    }
  ]
}
```

An order gets created with `PENDING` status. Keep a note of the order id for tracking the status of the order.

#### 3. Check the order status

Call the [FPDocs, get order](https://fintechprimitives.com/api/#get-fetch-single-order) to check the `status` of the order.  
When the order is successfully submitted to the AMC, the order status becomes `SUBMITTED`.
### Testing

In sandbox environment, you can use the [FPDocs, simulation](https://fintechprimitives.com/api/#post-order-simulation) to simulate `successful` and `failed` orders to help you during the integration process. Use the following json to simulate the order to `successful` state.

```json
{
  "status": "SUCCESSFUL"
}
```
