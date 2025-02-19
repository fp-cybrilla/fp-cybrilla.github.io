## KYC Submission workflow
#### Use this guide to build your KYC workflows in the onboarding phase

### KYC Request lifecycle
1. The KYC Request will be in `pending` state when created.
2. Once all the required information is provided, an application form is generated and the status moves to `esign_required`
3. After the application is electronically signed, it is sent to the AMC and the request is moved to `submitted` state.
4. The AMC directly pushes the application to the KRA and here the KYC Request moves to `successful` state.
5. If the verification at AMC fails, the KYC Request moves to `rejected` state.
6. If the application has not moved to `esign_required` state but is still in a `pending` state for more than 5 days from the time of creation, the application will be expired and the corresponding state will be `expired`.

### KYC Workflow

<!-- <br>
<div>
  <img src="../../images/KYC_work_flow_v2.png">
</div> -->

#### 1. Create a KYC Request
You need to capture a [required set of data points](https://docs.fintechprimitives.com/identity/required-information/) to submit a request successfully.

KYC Request object is a holding object for all the KYC information of an investor. KYC Request object can be created with minimum inputs as shown below and you can choose to incrementally update the object.

Call the `Create KYC Request API` with the following JSON (the minimum required information to create the object)

```json
{
    "name": "Rani Gupta",
    "email": "rani@example.com",
    "pan": "SKLPA9239S",
    "mobile": {
        "isd": "+91",
        "number": "8160597103"
    },
    "date_of_birth": "1980-10-19"
}
```
A KYC Request in `pending` state will be created. Look for `requirements.fields_needed` in the response object which will indicate if there are any pending data points that are required for processing the KYC Request. You should not hard code this list in your applications as it might keep changing as the regulations change. Always dynamically rely on this list in the response object.

You can refer to the `expires_at` attribute in the object which will give you the details on when this KYC Request object would get expired. You can make use of this information to collect the required details from the investor within the expiry time so that you can further process the KYC application. In cases where a KYC application is in `expired` state, then you have to create a new KYC Request object and submit it for processing.

#### 2. Update the KYC Request
Collect the required information from the investor in one step or in multiple steps as per your workflow. Use `Update a KYC Request API` to incrementally update the KYC information of an investor.

**Example JSON**

```json
# Displaying only a part of the object for brevity

{
	"gender": "male",
	"father_name": "Yash",
	"occupation": "student"
	...
}
```
You should check the `requirements.fields_needed` list in the response object and repeat step 2 until the list becomes empty.

When all the required information is available, FP generates an application form (pdf) and the KYC Request is moved to `esign_required`.

### 2.1. Fetching `aadhaar` from Digilocker
You need to fetch the Aadhaar card from Digilocker so that this can be appended as the proofs for identity and address. In order to do this, you need to create an Identity Document object and mention the KYC Request ID against which you need to fetch and submit an Aadhaar document. Use the URL present in the `fetch.redirect_url` attribute of the Identity Document object to redirect the investor to a Digilocker page where the document access has to be given to our AMC partner.

```json
# Displaying only a part of the object for brevity

"fetch": {
	"redirect_url": "https://s.finprim.com/v2/identity_documents/iddoc_20ecb2ee966a45b48ff2da70ec45ff01/redirect_to_digilocker",
	"postback_url": "https://fintechprimitives.com",
	"status": "pending",
	"reason": null,
	"expires_at": "2023-04-21T18:06:22+05:30"
}
```

Please note that Video IPV (In-Person Verification) step is no longer supported to complete a fresh KYC. The OTP authentication that happens as a part of this Aadhaar fetch will also ensure the investor's liveliness.

> Any Aadhaar document that is fetched from a source outside of FP's ecosystem would not be allowed.


### 2.2. Using `aadhaar` as Identity and Address proofs
Once the Identity document is successfully fetched, you need to use [Update a KYC Request](https://fintechprimitives.com/api/#update-a-kyc-request) API to attach this document as a proof of address and proof of identity. To do this, you can choose `address.proof_type` as `aadhaar` and you can mention the `id` of the `identity_document` against the fields `address.proof` and `identity_proof`, as shown below -

```json
# Displaying only a part of the object for brevity

"identity_proof": "iddoc_20ecb2ee966a45b48ff2da70ec45ff01"
"address": {
    "proof_type": "aadhaar",
    "proof": "iddoc_20ecb2ee966a45b48ff2da70ec45ff01"
}
```
<br>
To check the API specifications of the Identity Document service, click [here](https://fintechprimitives.com/docs/api/#identity-documents).

Once all the required fields are collected against a particular KYC Request object, the status of the same would change from `pending` to `esign_required`.

<!-- > Kindly note that Voter ID, Passport and Driving Licence are no longer supported as address proofs. -->

#### 3. E-Sign the application form

Create an e-sign by calling the [Create Esign](https://fintechprimitives.com/docs/api/#esigns) API with the following json:

```json
{
	"kyc_request": "kycr_724198d524004ceb8ba8203d06a32e26",
	"postback_url": "https://your_application.com/esign_postback"
}
```

Redirect the investor to the url returned in the response `esign` object. The investor can now see the filled KYC application form that would be submitted to the AMC for processing. Post completion of esigning this document, the investor will be redirected to the `postback_url` given in the request body and the status of the `esign` object becomes `successful`. The KYC application form is now sent for processing and the corresponding KYC Request object's status will change to `submitted`.

#### 4. Check the status of the KYC Request
Execute the `Fetch a KYC Request API` to check the `status` of the KYC Request object.

- If the `status` is `successful`, it means that the request was successfully accepted by the KRA to process the investor's KYC application form. Please note that this is not the final state of the KYC application and the final verification will be carried out at the KRA. You can execute the KYC Check API to know the actual status of the investor at the KRA level.
- Since the investor had chosen `aadhaar` as an address proof and `kyc_request.status` is `successful`, you need to poll KYC Check API to know the actual status of the investor at KRA level. Once the `status` from KYC Check response is `true`, you can go ahead and start accepting orders from the investor.
- If the `status` is `rejected`, it means the KYC Request verification is unsuccessful. The details about the rejections are available at `verification.details_verbose` in the object json.

> Note: KYC Check, KYC Request and Investor Profile APIs are technically independent at FP platform level. These are designed to be used independently based on the business logic applicable at every client's end.

#### 5. Handling rejections
The `verification.details_verbose` hash contains the reasons for rejection, mapped with each field separately. For example:

```json
"details_verbose": {
	"name": {
		"code": "data_mismatch",
		"reason": "Name mismatch between pan and poa"
	}
}
```
Use the `code` to programmatically read the error on a given field. The `reason` is a textual representation of the error which would indicate why the rejection happened. You can use this to configure your investor facing messages accordingly. We suggest you to not hard code the `reason` values in your code as they might change as we keep fine tuning our error messages.

<!-- These are some of the `reason`s for your reference (not an exhaustive list): `DRIVING LICENSE VALIDITY PERIOD EXPIRED`, `PROOF OF IDENTITY NOT LEGIBLE`, `DOB MISMATCH BETWEEN PAN AND POA`, `SIGNATURE UNCLEAR`, `VIDEO VOICE NOT AUDIBLE` -->

After fixing the errors, you have to resubmit the application by creating a new `kyc_request` object (Follow the sequence of steps listed above).

### Testing
You can use the `Simulate a KYC Request API` to simulate the KYC Request to `expired`, `successful` and `rejected` states.

<!-- ### Resources
To download a Postman collection to perform digital KYC through FP, click <a href="/resources/kyc_submission_workflow_postman_collection.json" download="" title="download">here</a>.

<button class="btn btn-primary inline-block w-auto px-4" onclick="handleOpen('https://prueba.sandbox.fpapps.io/kyc/')">
	Try KYC workflow
</button> -->
