# Perform digital kyc
*Use this guide to submit a digital kyc application for your investor.*

FP uses `KYC Request` object to represent the kyc application of an investor. You should create a `KYC Request` as the first step to initiate the kyc application process for the investor.  
> The digital kyc requests are processed by our partner AMC, ICICI Prudential. To use this service, you need to facilitate a minimum of ₹100 investment from your investor in any of the schemes offered by the AMC.


### KYC Request lifecycle
1. The KYC Request will be in `pending` state when created.
2. Once all the required information is provided, the application is sent to the AMC and the request is moved to `submitted` state.
3. The AMC verifies the data provided and accepts the request if the verification is successful. The KYC Request moves to `successful` state.
4. If the verification fails, the KYC Request moves to `rejected` state.

### 1. Create a KYC Request
You need to capture the investor's verification video and few data points to submit a request successfully.

KYC Request object is a holding object for all the investor data. You can collect all the information at one go from the investor or you can collect it in different steps. The KYC Request will not be processed until all the required information is provided. The `requirements.fields_needed` in the object will tell you if there are any pending data points that are required for processing the KYC Request.

Call the [create kyc request api](https://fintechprimitives.com/api/#create-a-kyc-request) with the following json (the minimum required information)

```json
{
	"name": "Raj",
	"pan": "ARRPP5554N",
	"email": "raj@gmail.com",
	"date_of_birth": "1986-01-01",
	"mobile": {
		"isd": "+91",
		"number": "9912399145"
	}
}
```
A KYC Request in `pending` state will be created. Look for `requirements.fields_needed` in the response object to get a list of all the required information about the investor. You should not hard code this list in your applications as it might keep changing as the regulations change. Always rely on the list from the response object.

### 2. Update the KYC Request
Collect the required information from the investor in one step or in multiple steps as per your workflow.  
Send the information collected by using the KYC Request update API. Example json

```json
{
	"gender": "male",
	"father_name": "Akbar",
	"mother_name": "Haseena"
}
```
You should check the `requirements.fields_needed` list in the response object and repeat step 2 until the list becomes empty.

When all the required information is available, FP automatically sends the KYC Request for processing and the object state becomes `submitted`.

### 3. Check the status of the KYC Request
Fetch the KYC Request object by calling the GET API and check `status` to see the status of the request.

If the `status` is `successful`, it means the KYC Request verification by the partner AMC is successful and KYC application has been submitted to KRA successfuly i.e. KYC application is at KRA and it is under process. At this point, you can go ahead and start accepting orders from the investor.

If the `status` is `rejected`, it means the KYC Request verification is unsuccessful. The details about the rejections are available at `verification.details_verbose` in the object json.


### 4. Handling rejections
The `verification.details_verbose` hash contains the reasons for rejection, mapped with each field separately. For example:

```json
"details_verbose": {
	"name": {
		"code": "data_mismatch",
		"reason": "Name mismatch between pan and poa"
	}
}
```
Use the `code` to programatically read the error on a given field. The `reason` is a textual representation of the error which you can safely use to display to your investor on their dashboard and in the email communication to them. Do not hard code the `reason` values in your code as they might change as we keep fine tuning our error messages.

These are some of the `reason`s for your reference (not an exhaustive list): `DRIVING LICENSE VALIDITY PERIOD EXPIRED`, `PROOF OF IDENTITY NOT LEGIBLE`, `DOB MISMATCH BETWEEN PAN AND POA`, `SIGNATURE UNCLEAR`, `VIDEO VOICE NOT AUDIBLE`

After fixing the errors, you have to resubmit the application by creating a new `/kyc_request` object (Follow the sequence of steps listed above).

### Testing
You can use the [simulation api](https://fintechprimitives.com/api/#simulate-a-kyc-request) to simulate a `successful` and `rejected` kyc request. A rejection in the simulation mode returns a fixed set of errors.
