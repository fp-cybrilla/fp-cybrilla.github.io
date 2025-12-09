---
title: Revised nomination opt-out workflows
---
##  Revised nomination opt-out workflows
#### Collection of Video based consent or OTP based consent with signed declaration forms for nomination opt-out cases

As per [**SEBI Circular NO. SEBI/HO/OIAE/OIAE_IAD-3/P/ON/2025/01650 dated 10th January, 2025**](https://www.sebi.gov.in/legal/circulars/jan-2025/circular-on-revise-and-revamp-nomination-facilities-in-the-indian-securities-market_90698.html),
- The 1st and 2nd phase of these changes went live on 1st June, 2025 and it majorly covered the implementation of cases where the investor opted in for nominations. 
- The **3rd phase of this circular is going live on 15th December, 2025** which will cover the implementation of cases where the investor opted out of nominations.

### Here are the highlights of the changes as mentioned in the circular -
- Going ahead, you need to extend the support upto 10 nominees
- If the investor is opting out of the nomination for a particular folio creation request, there has to be an explicit consent taken from them either in form of a video recording or in the form of OTP + signed opt-out declaration

### Changes that needs to be accommodated at your end to facilitate these changes -
- In case of nomination opt-in workflows, FP/Cybrilla is going to continue the support to only upto 3 nominees. In case any investor wants to add more nominees, an external NCT can be initiated at the respective AMC portals
- In case of nomination opt-out workflows, FP/Cybrilla is going to support Video based consent to start with
	- Since there is no enough clarity on the implementation of OTP based consent + signed declaration form option at an industry level, we are starting to accept Video based consent inorder to ensure business continuity
	- We will work in parallel regarding OTP based consent + signed declaration form option and share more details on this in the coming days
- WRT Video based opt-out consent flow, below are the changes that you need to take care of -
	1. Whenever an investor chooses to opt-out of the nominations for a particular folio creation request, record a video of the investor conveying the below points -
		- Investor's name and PAN number
		- Choice of opting out of nominations 
	2. Once the video is recorded, upload the same to FP/Cybrilla and proceed with the order workflow
- In case of nomination opt-out, only after investor completes the above mentioned workflow, can the order workflow be continued further to collect payment or activate a plan.
- The above points are applicable for every folio creation request. This also means that - if you are supporting batch orders (basket orders) and the investor is opting out of nominations, all the above mentioned points should be taken care of for each of those orders.
	- Even in cases of batch orders where multiple orders belong to the same AMC, the above points should be taken care for each of those folio creation requests as well

### Changes to support Video based opt-out consent
**Assumption:** The investor has opted out of nominations and the same has been updated on the respective `mf_investment_account.folio_defaults` object.

1. Once you have collected the video recording from the investor, pass it in [Create a File](https://fintechprimitives.com/docs/api/#files) API
2. Once you have the `File ID`, create a `mf_folio_creation_request` using the below API -
```json
POST {{base_url}}/v2/mf_folio_creation_requests
{
	"mf_investment_account":"mfia_3c1f0c0b0f15474e90baf9f32692c6eb",

	"nomination_opt_out": true,        
    "nomination_opt_out_declaration":"file_96a0ccde4bb74ce6b79bab6b720d479c"
}
```
3. `mf_folio_creation_request` object will look like below
```json
{
    "object": "mf_folio_creation_request",
    "id": "mfcr_3c1f0c0b0f15474e90baf9f32692c6eb",

    "mf_investment_account": "mfia_3c1f0c0b0f15474e90baf9f32692c6eb",

    "nomination_opt_out": true,
    "nomination_opt_out_declaration": "file_96a0ccde4bb74ce6b79bab6b720d479c",

    "created_at": "<timestamp>"
}
```
4. Only after ensuring the above points are completed, you can go ahead and create a MF Puchase or a MF Purchase Plan
5. While creating `mf_purchase` or `mf_purchase_plan`, ensure to provide the `mf_folio_creation_request.id` in the request body. Refer to the below examples -
```json
POST {{base_url}}/v2/mf_purchases
{
	"mf_investment_account": "mfia_367a75826694614a539c0f82b196027",

	"mf_folio_creation_request": "mfcr_3c1f0c0b0f15474e90baf9f32692c6eb",

	"scheme": "INF173K01FE6",
	"amount": 10000

	// Object trimmed for brevity
}
```
```json
POST {{base_url}}/v2/mf_purchase_plans
{
	"mf_investment_account": "mfia_d8c1b501c10d4835947a5c77fc031789",

	"mf_folio_creation_request": "mfcr_3c1f0c0b0f15474e90baf9f32692c6eb",

	"scheme": "INF109K01TP7",
	"frequency": "daily",
	"amount": 21,
	"number_of_installments": 6,
	"systematic": true

	// Object trimmed for brevity
}
```
6. Once `mf_folio_creation_request` is associated with MF Purchase or MF Purchase Plan, the subsequent order workflow would continue as currently implemented.