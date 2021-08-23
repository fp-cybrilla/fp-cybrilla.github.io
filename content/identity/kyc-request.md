---
title: Perform digital kyc
---
## Perform digital kyc
#### Use this guide to submit a digital kyc application for your investor.

FP uses `KYC Request` object to represent the kyc application of an investor. You should create a `KYC Request` as the first step to initiate the kyc application process for the investor.  
> The digital kyc requests are processed by our partner AMC, ICICI Prudential. To use this service, you need to facilitate a minimum of ₹100 investment from your investor in any of the schemes offered by the AMC.

### Key points

Our API complies with the [guidelines by SEBI on digital kyc](https://www.sebi.gov.in/legal/circulars/apr-2020/clarification-on-know-your-client-kyc-process-and-use-of-technology-for-kyc_46565.html). Make a note of the key highlights below that will impact the design of your investor onboarding process.

1. OTP  
When you generate the KYC Request object, a 6 digit number is generated and be part of the object structure. You should display that number to your investor and let him speak that number out loud in the video. This is used to verify that the video is not a pre-recorded one.

2. Bank a/c details  
You need to provide your investor's bank account details: account number, ifsc code and cancelled signed cheque scanned copy to submit a KYC Request. As part of the verification process:  
a) the details provided are matched against the cancelled cheque copy and  
b) a random amount is deposited in that bank account to verify the validity and the owner of the account  
You can collect a single bank account from your investor as part of your onboarding process and use it for both the KYC Request and investor apis.

3. Geo location  
You need to provide the latitude and longitude of the location of your investor from where he is performing his kyc

4. Esign the kyc form  
A kyc application form would be generated which needs to be signed electronically by your investor. FP APIs currently support the following electronic signature (esign) mechanisms:  
a) Aadhaar based eSign

5. Mobile & Email verification  
As part of the regulatory guidelines, the email id and mobile number provided in the KYC Request has to be verified for its validity. You can use any method of your choice to do the verification. Sending an OTP or a link is the most common method.  
Currently we don't offer apis for email and mobile verification. FP KYC Request apis assume that the verification is done at your end.

### KYC Request lifecycle
1. The KYC Request will be in `pending` state when created.
2. Once all the required information is provided, an application form is generated and the status moves to `esign_required`
3. After the application is electronically signed, it is sent to the AMC and the request is moved to `submitted` state.
3. The AMC verifies the data provided and accepts the request if the verification is successful. The KYC Request moves to `successful` state.
4. If the verification fails, the KYC Request moves to `rejected` state.

#### 1. Create a KYC Request
You need to capture the investor's verification video and [few data points](/identity/required-information) to submit a request successfully.

KYC Request object is a holding object for all the investor data. You can collect all the information at one go from the investor or you can collect it in different steps. The KYC Request will not be processed until all the required information is provided. The `requirements.fields_needed` in the object will tell you if there are any pending data points that are required for processing the KYC Request.

Call the create KYC Request api with the following json (the minimum required information)

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

#### 2. Update the KYC Request
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

When all the required information is available, FP generates an application form (pdf) and the KYC Request is moved to `esign_required`.

*Note on `ipv_video`*  
- The KYC Request object contains a 6 digit number in the `otp` field. As part of the verification video, the investor has to either  
  a) read out the 6 digits or  
  b) write it on a piece of paper and hold it so its visible in the video.  
The application will be rejected if the number is not read out clearly or not visible.

- The video has to be atleast 10 seconds long to be able to clearly detect the face of the person.

#### 3. E-Sign the application form

Create an esign by calling the `/esigns` api with the following json:

```json
{
	"kyc_request": "6wq82c2ce-e38d-4b8e-85f3-wqfb7dc382f21",
	"postback_url": "https://your_application.com/esign_postback"
}
```

Redirect the investor to the url returned in the response `esign` object. He will be guided through the signing process using his aadhaar number. Once the investor signs the document, he will be redirected to the `postback_url` given in the request body and the status of the `esign` object becomes `successful`. The KYC Request is sent for processing and the object state becomes `submitted`.

#### 4. Check the status of the KYC Request
Fetch the KYC Request object by calling the GET API and check `status` to see the status of the request.

If the `status` is `successful`, it means the KYC Request verification is successful. At this point, you can go ahead and start accepting orders from the investor.

If the `status` is `rejected`, it means the KYC Request verification is unsuccessful. The details about the rejections are available at `verification.details_verbose` in the object json.

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
Use the `code` to programatically read the error on a given field. The `reason` is a textual representation of the error which you can safely use to display to your investor on their dashboard and in the email communication to them. Do not hard code the `reason` values in your code as they might change as we keep fine tuning our error messages.

These are some of the `reason`s for your reference (not an exhaustive list): `DRIVING LICENSE VALIDITY PERIOD EXPIRED`, `PROOF OF IDENTITY NOT LEGIBLE`, `DOB MISMATCH BETWEEN PAN AND POA`, `SIGNATURE UNCLEAR`, `VIDEO VOICE NOT AUDIBLE`

After fixing the errors, you have to resubmit the application by creating a new `/kyc_request` object (Follow the sequence of steps listed above).

### Testing
You can use the simulation api to simulate a `successful` and `rejected` KYC Request. A rejection in the simulation mode returns a fixed set of errors.
