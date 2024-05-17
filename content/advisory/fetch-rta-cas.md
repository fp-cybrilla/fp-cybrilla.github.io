## Fetch RTA CAS
#### Use this guide to fetch an investor's investments summary across all mutual funds

FP offers a capability of fetch an investor's RTA CAS summary by providing the PAN and contact details of the investor. The summary details of all such folios having the combination of PAN and the given contact details can be fetched.

### Pre-requisites to fetch an RTA CAS
- Ensure the investor is onboarded and the `investor_profile` is present with either one `phone_number` or `email_address` tagged to it

### Workflow to fetch an RTA CAS
1. Create an `mf_investments_snapshot` object by providing the `profile` along with either `phone_number` or `email_address` as mentioned in the [Create MF Investments Snapshot](https://fintechprimitives.com/docs/api/#create-mf-investments-snapshot) API. The `status` would be `consent_required` at this stage
2. The investor will receive an OTP on the phone number / email address that was given in the previous step
3. Use [Update MF Investments Snapshot](https://fintechprimitives.com/docs/api/#update-mf-investments-snapshot) API to provide the  OTP that the investor received. Now the `status` would be changed to `submitted` provided the OTP was successfully validated. If this OTP was not given in the valid time range, the `status` would be marked as `expired`
5. Now the MF Investments Snapshot request would be submitted to the gateway. Use [Fetch MF Investments Snapshot](https://fintechprimitives.com/docs/api/#fetch-mf-investments-snapshot) API using the `mf_investments_snapshot` ID to get the updated status of this MF Investments Snapshot request. The final status can either be `successful` or `failed`

### How to work with `phone_number` and `email_address`?

1. Ensure either `phone_number` or `email_address` is provided along with the `profile`. You cannot provide both `phone_number` and `email_address`
2. Ensure that this `phone_number` or `email_address` is tagged to the `profile` and `belongs_to` is set to `self`
3. The investor would get an OTP on either the phone number or email address that is mentioned. The same can be provided in the [Update MF Investments Snapshot](https://fintechprimitives.com/docs/api/#update-mf-investments-snapshot) API to complete the workflow
4. OTP is generally observed to be valid until 10 minutes since it was generated. Ensure the OTP consent is collected within this time range failing which will result the MF Investments Snapshot request to be marked as `expired` with `failure_code` = `otp_expired`

> **NOTE:** You can use the below APIs to ensure `phone_number` and `email_addess` belong to the `profile` <br><br> - [List all Phone Numbers](https://fintechprimitives.com/docs/api/#list-all-phone-numbers) API<br>- [List all Email Addresses](https://fintechprimitives.com/docs/api/#list-all-email-addresses) API

### Testing

To test the various scenarios in your application during the development process, use the following simulation logic in the sandbox environment.

|MF Investments Snapshot status|PAN number|OTP|Description|
|-|-|-|-|
|successful|xxxpxnnnnx|nnnnnn|PAN number in the format `xxxpxnnnnx` and OTP in the format `nnnnnn` where -<br>- `x` is replaced by any alphabet<br>- `n` is replaced by any number<br><br>Such scenarios will be marked as successful and the investor's investments snapshot will be available|
|Failure at gateway|xxxpxnnnnf|nnnnnn|PAN number in the format `xxxpxnnnnf` and OTP in the format `nnnnnn` where -<br>- `x` is replaced by any alphabet<br>- `n` is replaced by any number<br><br>Such scenarios will be marked as failed with `failure_code` = `failure_at_gateway`. These would be the cases where a MF Investments Snapshot request was submitted to the gateway but was rejected by the gateway due to some reason.|
|OTP incorrect|xxxpxnnnnx|001234|PAN number in the format `xxxpxnnnnx` where -<br>- `x` is replaced by any alphabet<br>- `n` is replaced by any number<br><br>Such scenarios will be marked as failed with `failure_code` = `otp_incorrect`. These would be the cases where a MF Investments Snapshot request was submitted to the gateway but was rejected by the gateway due to OTP being incorrect.|
