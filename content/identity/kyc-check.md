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

> `date_of_birth` is needed only to fetch the KYC data. This is an additional request body parameter along with the PAN number in-order to fetch the data from KRA databases. If you are using this API to check the KYC status alone, then the request body should only contain the PAN number.

#### Status  
```json
# Displaying only a part of the object for brevity
{
  "id": "5620fd1f-eb14-442e-b0ee-da96a6c305c0",
  "pan": "BNBPP9384M",
  "status": false,
  "reason":"unavailable",
  "action":"create"
}
```

If the `status` in the response object is `true`, it means that the investor is fully KYC compliant. You can go ahead and onboard the investor and also accept all types of orders if `status` is `true`.

If the value of the `status` attribute in the response object is `false`, the investor is either not kyc compliant or the investor is partially kyc compliant. You cannot accept investments from the investor as it might result in order rejections. In such cases, the value of the attribute `reason` tells us the reason why the investor is non-compliant and the value of the attribute `action` tells us what action you can take to help investor become kyc compliant.

Note: If `status` is `true`, the values of `reason` and `action` will always be null.

##### Non compliance reasons
|Non compliance reason|Remarks|
|---|---|
|`unavailable`|The investor has never submitted his kyc application before.|
|`onhold`|The investor has submitted the KYC application before, but that application is on hold because of some data issues.|
|`rejected`|The previous KYC application submitted by investor has been rejected.|
|`deactivated`|This means that you cannot accept investments from this particular investor. You cannot submit new KYC application also. The reasons for deactivation could be fraud detection or death of an investor.|
|`legacy`|This means that the investors were KYC compliant according to earlier KYC regulations. However, the investors are not KYC compliant according to the current KYC regulations.|
|`underprocess`|The investor has submitted the KYC application with Aadhaar as the POA and it is under process at the KRA.|
|`incomplete`|The investor's KYC status is either `KYC Registered` or `KYC Verified` at the KRA. In such cases, the investor would be able to transact only on the existing folios if any and any new folio creation requests would not be allowed.|
|`unknown`|In certain scenarios, we will only be able to determine that the investor is KYC non-compliant without knowing the exact reason for non-compliance.In such cases the `reason` will be `unknown`. However, you can refer to `action` to understand what actions can be taken.|

##### Action required for compliance
|Action|Remarks|
|---|---|
|`modify`|Raise a modification request to fix the existing KYC application.|
|`create`|Submit a new KYC application to KRA. You can use FP APIs to [perform digital KYC]()|
|`disallowed`|This means that you cannot take any actions to ensure that the investor becomes KYC compliant. You will get this value when the `reason` is `deactivated`|
|`none`|This means that there is no action that can be taken from the investor's end to process the KYC application. You will have to wait for the KYC Status to be updated at KRAs' end. You will get this value when the reason is `underprocess`|
|`unknown`|In certain cases if we cannot unambiguously determine the non-compliance reason(i.e.if `reason`=`unknown`), we might also not be able to unambiguously detect the action required to ensure compliance. If that is the case, the value of `action` will be `unknown`.|

> In the cases where `reason` is `incomplete`, the investor has to reach out to an AMC and raise a KYC modification request. While modifying the KYC, Aadhaar should be used as the proof of address. Once Aadhaar details are tagged to the KYC record and KRAs validate the same, the status at the KRA would change to `KYC Validated` and now the investor can place a fresh purchase request.

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

> **NOTE**: If the investor is not KYC compliant yet(Ex: KYC On hold), the investor demographic information will be empty.

> **NOTE**: In cases where the KYC non-compliance reason for a PAN is `underprocess`, you can accept orders only after the concerned KRA processes the application and the investor becomes KYC compliant. You don't have to take any actions to move a KYC application from underprocess to a final state at the KRA.

### Testing

To test the various scenarios in your application during the development process, use the following formats of PAN number and date of birth in the sandbox environment.

| Scenario | PAN format | Date of birth |Description |
| - | - | - | - |
| *Status Check* - KYC compliant investor | XXXPX3751X | -NOT APPLICABLE- | PAN numbers that match XXXPX3751X (replace X with any alphabet) are considered full KYC compliant and the response object will contain `status` as true, with no constraints. You can also use this to simulate the scenarios where KYC applications are under process at KRA and have not used Aadhaar as thier POA |
| *Status Check* - KYC compliant investor with investment constraints | XXXPX3752X | -NOT APPLICABLE- | PAN numbers that match XXXPX3752X (replace X with any alphabet) are considered KYC compliant with restrictions on the investment limit. The response object will contain `status` as true and `constraints` will be populated |
| Status Check - KYC non-compliant investor (KYC not available)     | XXXPX3753X | \-            | KYC applications with PAN numbers that match XXXPX3753X (replace X with any alphabet) are not available in any of the KRAs. You can use FP's KYC APIs to [perform digital KYC](https://docs.fintechprimitives.com/identity/kyc-request/) |
| Status Check - KYC non-compliant investor (KYC on hold)           | XXXPX3754X | \-            | KYC applications with PAN numbers that match XXXPX3754X (replace X with any alphabet) are on hold in the KRA due to some data issues. Investments against such PANs should not be allowed. You need to raise a modification request with the concerned KRA to have the `onhold` application processed |
| Status Check - KYC non-compliant investor (KYC rejected)          | XXXPX3755X | \-            | KYC applications with PAN numbers that match XXXPX3755X (replace X with any alphabet) are rejected by the KRA. You can use FP's KYC APIs to [perform digital KYC](https://docs.fintechprimitives.com/identity/kyc-request/) again before accepting any investments from such PANs |
| Status Check - KYC non-compliant investor (KYC deactivated)       | XXXPX3756X | \-            | KYC applications with PAN numbers that match XXXPX3756X (replace X with any alphabet) are deactivated by the KRA. You can neither accept any investments against such PANs nor perform a digital KYC as well |
| Status Check - KYC non-compliant investor (Legacy KYC)            | XXXPX3757X | \-            | KYC applications with PAN numbers that match XXXPX3757X (replace X with any alphabet) are the ones which were compliant with earlier KYC regulations but no longer comply with the current one. You need to raise a modification request with the concerned KRA to have these kind of applications processed |
| Status Check - KYC non-compliant investor (KYC under process with Aadhaar as POA)            | XXXPX3758X | \-            | KYC applications with PAN numbers that match XXXPX3758X (replace X with any alphabet) are undergoing verifications at the KRA and Aadhaar is used as a POA in such applications. You can accept any investments against these PANs only after Aadhaar details present in such KYC applications are successfully validated and corresponding KYC applications are successfully verified at the KRA |
| Status Check - KYC non-compliant investor (KYC was incomplete as Aadhaar was not used)            | XXXPX3759X | \-            | KYC applications with PAN numbers that match XXXPX3759X (replace X with any alphabet) are having the status as either KYC Registered or KYC Verified at the KRA and Aadhaar was not used as a POA in such applications. You cannot accept any fresh purchase requests against these PANs. You can do so only after the KYC is modified with Aadhaar details successfully validated at the KRA |
| Status Check - KYC non-compliant investor (Reason unknown)        | Anything   | \-            | Any other format will mean that the investor's KYC status could not be clearly deciphered. For these scenarios, the `action` attribute in the response object would also be `unknown` |
| *Fetch KYC data* - KYC compliant investor's full KYC data                    | XXXPX3751X | YYYY-MM-DD    | PAN numbers that match XXXPX3751X (replace X with any alphabet) and a valid date of birth combination are considered full KYC compliant and the response object will contain `status` as true, with no constraints. The `entity_details` list will contain all the data as received on the response from KRA |
| *Fetch KYC data* - KYC compliant investor but some data are null             | XXXPX3752X | YYYY-MM-DD    | PAN numbers that match XXXPX3752X (replace X with any alphabet) and a valid date of birth combination are considered KYC compliant with restrictions on the investment limit. The response object will contain `status` as true and `constraints` will be populated. The `entity_details` list will have some or all data as null depending on the response from KRA |
| *Fetch KYC data* - KYC non-compliant investor                                | Anything   | YYYY-MM-DD    | Any other format will mean that the investor has not done his/her KYC and so the response object will contain `status` as false 
