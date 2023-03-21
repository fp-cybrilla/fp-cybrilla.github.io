---
title: Managing e-mandates
---
## Managing e-mandates
### Authorization

You need to take an authorization from your investor before you can debit money from investor's bank account automatically.

#### 1. Create a mandate

Call the [FPDocs, create mandate](https://fintechprimitives.com/docs/api/#create-a-mandate-enach) with the following json.

```json
{
	"mandate_type": "E_MANDATE",
	"bank_account_id": 123,
	"mandate_limit": 100000
}
```
Make a note of the mandate ID returned in the response. You'll need to use that in the next api call.

#### 2. Authorize the mandate

Call the [FPDocs, authorize mandate](https://fintechprimitives.com/docs/api/#authorize-a-mandate-enach) with the mandate ID from the previous step.

```json
{
	"mandate_id": 34
}
```

Look for `token_url` in the response and redirect your investor to it to complete his authorization. After your investor finishes the authorization, FP redirects him to the postback URL configured on your account or to the `payment_postback_url` provided in the request. You'll receive `success` or `failure` in the `status` param. As a good security practice, do not completely rely on the `status` received in the postback call. Instead check the status of the mandate from your server before giving a final confirmation to your investor.  

Note: There must be a gap of atleast 60 seconds between e-mandate creation and authorization in case of BSE e-mandates.
#### 3. Check the mandate status

Use the [FPDocs, get mandate](https://fintechprimitives.com/api/#fetch-a-mandate) to fetch the details about the mandate. `mandate_status` field represent the status of the mandate. Mandates in `APPROVED` status can be used to debit money.  


### Mandate cancellation
Call the [FPDocs, Cancel mandate](https://fintechprimitives.com/docs/api/#cancel-mandate).

`POST /api/pg/mandates/:id/cancel`

You will get the mandate details in the response
```json
#Displaying only a part of response for brevity
{
  "id": 1,
  "mandate_status": "CANCELLED",
  "cancelled_at": "2022-10-23T04:30:21+05:30"
}
```
Note: At present, e-mandate cancellation feature is allowed only for Razorpay e-mandates. If Razorpay e-mandates are deleted outside of FP, the mandates will be marked as `CANCELLED`.

### Testing

You can use the [FPDocs, simulation](https://fintechprimitives.com/docs/api/#mandate-simulation) to move the mandate into different states to help you during the integration process. For example, use the following json to simulate the mandate to `APPROVED` state.

```json
{
  "status": "APPROVED"
}
```
