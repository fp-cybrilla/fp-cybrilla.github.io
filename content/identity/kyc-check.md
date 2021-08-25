---
title: Check the kyc status
---
## KYC Check
#### Check your investor's kyc status

Use this api to check if your investor's identity detail exists in any of the KRAs (KYC Registration Agencies) database. If it exists, you'll get certain demographic information of the investor and the status of the KYC in the response object.
### Check kyc status
Call the [KYC Check api](https://fintechprimitives.com/api/#create-a-kyc-check) with the investor's Income Tax Permanent Account Number (PAN)
```json
{
	"pan": "arrpp1115n"
}
```
#### Status  
If the `status` in the response object is `true`, it means the investor details exists in one of the KRA's databases and his KYC is under process or completed successfully. You can go ahead and onboard the investor and place purchase and redemption orders.

If the `status` is `false`, it means the investor either does not exist in any of the KRA's databases or his KYC is unsuccessful. We recommend that you do not accept any orders from the investor at this stage, as they will get rejected during the processing at the RTA.
#### Investor Details
The `entity_details` in the response object will contain the investor's demographic information. In most cases, you'll get the `name` of the investor.
### Testing
To test various scenarios in your application during the development process, use the following pan numbers in the staging environment.


Pan numbers that match `XXXPX3751X` (replace X with any alphabet) are considered full kyc compliant and the response object will contain `status` as true, with no constraints.  
```json
# Displaying only a part of the object for brevity
{
	"pan": "ARRPP3751N",
	"entity_details": {
		"name": "Tony Soprano"
	},
	"status": true,
	"constraints": []
}
```

Pans that match `XXXPX3752X` (replace X with any alphabet) are considered kyc compliant with restrictions on the investment limit. The response object will contain `status` as true and constraints will be populated.  
```json
# Displaying only a part of the object for brevity
{
	"pan": "ARRPP3752N",
	"entity_details": {
		"name": "Junior Soprano"
	},
	"status": true,
	"constraints": [
        {
            "type": "investment_limit",
            "amount": {
                "value": 50000,
                "currency": "inr"
            }
        }
    ]
}
```

Any other pan number will be treated as kyc non compliant and so the response object will contain `status` as false.

```json
# Displaying only a part of the object for brevity
{
	"pan": "ARRPP1234N",
	"entity_details": {
		"name": null
	},
	"status": false,
	"constraints": []
}
```
