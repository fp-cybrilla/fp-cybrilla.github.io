---
title: Setup recurring payments
---
## NACH
#### Automatically debit money from your investor's bank account

You need to take an authorization from your investor before you can debit money from his bank account automatically.

#### 1. Create a mandate

Call the [FPDocs, create mandate api](https://fintechprimitives.com/api/#create-an-e-mandate) with the following json.

```json
{
	"mandate_type": "E_MANDATE",
	"bank_account_id": 123,
	"mandate_limit": 100000
}
```
Make a note of the mandate ID returned in the response. You'll need to use that in the next api call.

#### 2. Authorize the mandate

Call the [FPDocs, authorize mandate api]() with the mandate ID from the previous step.

```json
{
	"mandate_id": 34
}
```

Look for `token_url` in the response and redirect your investor to it to complete his authorization. After your investor finishes the authorization, FP redirects him to the postback URL configured on your account or to the `payment_postback_url` provided in the request. You'll receive `success` or `failure` in the `status` param. As a good security practice, do not completely rely on the `status` received in the postback call. Instead check the status of the mandate from your server before giving a final confirmation to your investor.  

#### 3. Check the mandate status

Use the [FPDocs, get mandate api](https://fintechprimitives.com/api/#fetch-a-mandate) to fetch the details about the mandate. `mandate_status` field represent the status of the mandate. Mandates in `APPROVED` status can be used to debit money.  

### Testing

You can use the [FPDocs, simulation api](https://fintechprimitives.com/api/#post-mandate-simulation) to move the mandate into different states to help you during the integration process. For example, use the following json to simulate the mandate to `APPROVED` state.

```json
{
  "status": "APPROVED"
}
```