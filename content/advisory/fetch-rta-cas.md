## Fetch RTA CAS
#### Use this guide to fetch an investor's investments summary across all mutual funds

FP offers a capability of fetch an investor's RTA CAS summary by providing the PAN and contact details of the investor. The summary details of all such folios having the combination of PAN and the given contact details can be fetched.

### Pre-requisites to fetch an RTA CAS
- Ensure the investor is onboarded and the `investor_profile` is present with either one `phone_number` or `email_address` tagged to it

### Workflow to fetch an RTA CAS
1. Create an `mf_investments_snapshot` object by providing the `profile` as mentioned in the [Create MF Investments Snapshot]() API. The `status` would be `consent_required` at this stage
2. The investor will receive an OTP on the phone number / email address mapped to the `profile` that was given in the previous step
3. Use [Update MF Investments Snapshot]() API to provide the  OTP that the investor received. Now the `status` would be changed to `submitted` provided the OTP was successfully validated. If this OTP was not given in the valid time range, the `status` would be marked as `expired`
5. Now the MF Investments Snapshot request would be submitted to the gateway. Use [Fetch MF Investments Snapshot]() API using the `mf_investments_snapshot` ID to get the updated status of this MF Investments Snapshot request. The final status can either be `successful` or `failed`

### Notes on OTP consent for RTA CAS
1. If both phone number and email address are tagged to an investor profile, FP will use the `phone_number` to send out the OTP
2. If only email address is tagged to an investor profile, the same would be used by FP to send out the OTP
3. If both phone number and email address are not tagged to an investor profile, FP will throw an error indicating either one should be present
4. If multiple objects for phone number / email address are tagged to an investor profile, FP will use the below logic to send out the OTP -
    - The latest created phone number / email address with `belongs_to = self` will be used to send the OTP
    - If `belongs_to = null` in all of them, FP use the latest created phone number / email address to send the OTP
5. OTP is generally observed to be valid until 10 minutes since it was generated. Ensure the OTP consent is collected within this time range failing which will result the MF Investments Snapshot request to be marked as `expired` with `failure_code` = `otp_expired`

### Testing

To test the various scenarios in your application during the development process, use the following simulation logic in the sandbox environment.

|MF Investments Snapshot status|PAN number|OTP|Description|
|-|-|-|-|
|successful|xxxpxnnnnx|nnnnnn|PAN number in the format `xxxpxnnnnx` and OTP in the format `nnnnnn` where -<br>- `x` is replaced by any alphabet<br>- `n` is replaced by any number<br><br>Such scenarios will be marked as successful and the investor's investments snapshot will be available|
|Failure at gateway|xxxpxnnnnf|nnnnnn|PAN number in the format `xxxpxnnnnf` and OTP in the format `nnnnnn` where -<br>- `x` is replaced by any alphabet<br>- `n` is replaced by any number<br><br>Such scenarios will be marked as failed with `failure_code` = `failure_at_gateway`. These would be the cases where a MF Investments Snapshot request was submitted to the gateway but was rejected by the gateway due to some reason.|
|OTP incorrect|xxxpxnnnnx|001234|PAN number in the format `xxxpxnnnnx` where -<br>- `x` is replaced by any alphabet<br>- `n` is replaced by any number<br><br>Such scenarios will be marked as failed with `failure_code` = `otp_incorrect`. These would be the cases where a MF Investments Snapshot request was submitted to the gateway but was rejected by the gateway due to OTP being incorrect.|
