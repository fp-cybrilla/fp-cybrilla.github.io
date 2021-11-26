---
title: Check the kyc status
---
## KYC Check
#### Check your investor's kyc status

Use this API to check if your investor's identity detail exists in any of the KRAs (KYC Registration Agencies) database. If it exists, you'll get certain demographic information of the investor and the status of the KYC in the response object.
### Check kyc status
Call the [FPDocs, KYC Check](https://fintechprimitives.com/api/#create-a-kyc-check) with the investor's Income Tax Permanent Account Number (PAN)
```json
{

	"pan": "ARRPP1115N",
	"date_of_birth": "1955-10-25"

}
```

> `date_of_birth` is needed only to fetch the KYC data. This is an additional request body parameter along with the PAN number in-order to fetch the data from KRA databases. If you are using this API to check the KYC status alone, then the request body should only contain the PAN number.*

#### Status  
If the `status` in the response object is `true`, it means the investor details exists in one of the KRA's databases and his KYC is under process or completed successfully. You can go ahead and onboard the investor and place purchase and redemption orders.

  

If the `status` is `false`, it means the investor either does not exist in any of the KRA's databases or his KYC is unsuccessful. We recommend that you do not accept any orders from the investor at this stage, as they will get rejected during the processing at the RTA.
#### Investor Details
The `entity_details` in the response object will contain the investor's demographic information. If you are checking for the KYC status, you'll get the `name` of the investor. If you are fetching the KYC details of an investor, then the `entity_details` list in the response object will contain Identity, Address and Contact information of the investor as shown below:
```json
# Displaying only a part of the object for brevity

"entity_details": {
        "name": "Tony Soprano",
        "gender": "male",
        "date_of_birth": "1955-10-25",
        "father_name": "James Soprano",
        "marital_status": "married",
        "nationality": "indian",
        "residential_status": "resident_individual",
        "correspondence_address": {
		    "line_1": "19th main, 33rd cross",
		    "line_2": "Jayanagar 4th T block",
		    "line_3": null,
		    "city": "Bengaluru",
		    "pincode": "560041",
		    "state": "Karnataka",
		    "country": "India"
        },
		"permanent_address": null,
        "email": "tony.soprano@gmail.com",
        "mobile": "9123498765"
}
```

> **NOTE**: To fetch an investor's demographic information from the KRA databases, you need to be a SEBI registered entity with RIA, AMC or other licences. Currently, AMFI regulated ARN holders cannot avail this feature.

### Testing

To test the various scenarios in your application during the development process, use the following formats of PAN number and date of birth in the sandbox environment.

| Scenario                                                                   | PAN format | Date of birth | Description                                                                                                                                                                                                                                                                                                                                                                      |
| -------------------------------------------------------------------------- | ---------- | ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| *Status Check* - KYC compliant investor                                      | XXXPX3751X | -NOT APPLICABLE-            | PAN numbers that match XXXPX3751X (replace X with any alphabet) are considered full KYC compliant and the response object will contain `status` as true, with no constraints                                                                                                                                                                                                       |
| *Status Check* - KYC compliant investor with investment constraints          | XXXPX3752X | -NOT APPLICABLE-            | PAN numbers that match XXXPX3752X (replace X with any alphabet) are considered KYC compliant with restrictions on the investment limit. The response object will contain `status` as true and `constraints` will be populated                                                                                                                                                        |
| *Status Check* - KYC non-compliant investor (KYC not done / in process, etc) | Anything   | -NOT APPLICABLE-            | Any other format will mean that the investor has not done his/her KYC and so the response object will contain `status` as false                                                                                                                                                                                                                                                                           |
| *Fetch KYC data* - KYC compliant investor's full KYC data                    | XXXPX3751X | YYYY-MM-DD    | PAN numbers that match XXXPX3751X (replace X with any alphabet) and a valid date of birth combination are considered full KYC compliant and the response object will contain `status` as true, with no constraints. The `entity_details` list will contain all the data as received on the response from KRA                                                          |
| *Fetch KYC data* - KYC compliant investor but some data are null             | XXXPX3752X | YYYY-MM-DD    | PAN numbers that match XXXPX3752X (replace X with any alphabet) and a valid date of birth combination are considered KYC compliant with restrictions on the investment limit. The response object will contain `status` as true and `constraints` will be populated. The `entity_details` list will have some or all data as null depending on the response from KRA |
| *Fetch KYC data* - KYC non-compliant investor                                | Anything   | YYYY-MM-DD    | Any other format will mean that the investor has not done his/her KYC and so the response object will contain `status` as false 
