## Phone number NCT
#### Use this guide to build your NCT workflows

### Pre-requisites to initiate phone number NCT
- Ensure the investor is onboarded and the `mf_investment_account` is present
- For whichever folio the investors wants to initiate an NCT, ensure that folio is tagged to the `mf_investment_account`. You can use [Fetch all Folios](https://fintechprimitives.com/docs/api/#fetch-all-folios) API to check this

### Phone number NCT workflow
1. Create a `non_commercial_transaction` object with `type = update_phone_number` and other mandatory attributes as mentioned in the [Create Phone Number NCT](https://fintechprimitives.com/docs/api/#create-phone-number-nct) API. The `status` would be `consent_required` at this stage
2. The investor will receive an OTP on the existing phone number on the folio from the gateway
3. Use [Update Phone Number NCT](https://fintechprimitives.com/docs/api/#update-phone-number-nct) API to provide the OTP that the investor received. Now the `status` would be changed to `second_consent_required` provided the OTP was successfully validated. If this OTP was not given in the valid time range, the `status` would be marked as `expired`
4. Use [Update Phone Number NCT](https://fintechprimitives.com/docs/api/#update-phone-number-nct) API again to provide the second OTP that the investor received on the new phone number that has to be updated on the folio. Now the `status` would be changed to `submitted` provided the second OTP was also successfully validated. If this OTP was not given in the valid time range, the `status` would be marked as `expired`
5. Now the Phone Number NCT request would have been submitted to the gateway. Use [Fetch Non-Commercial Transaction](https://fintechprimitives.com/docs/api/#fetch-non-commercial-transaction) API using the `non_commercial_transaction` ID to get the updated status of this NCT request. The final status can either be `successful` or `failed`

> **NOTE:**<br><br>OTP is generally observed to be valid until 10 minutes since it was generated. Ensure the OTP consent is collected within this time range failing which will result the NCT request to be marked as `expired`

### Why do I need to provide two consents?
The first consent that the investor provides, would be collected on the phone number that is currently existing on the folio. However, since this is an `update_phone_number` NCT, the system also has to ensure the new phone number is also valid and hence a second consent would be requested on that new phone number that would get updated on the folio.

### Testing

To test the various scenarios in your application during the development process, use the following simulation logic in the sandbox environment.

|Scenario|Phone number|First OTP|Second OTP|Description|
|-|-|-|-|-|
|Successful|nnnnnnnnXX|YYYYYY|ZZZZZZ|Phone number that matches the pattern `nnnnnnnnXX`, First OTP that matches the pattern `YYYYYY` and Second OTP that matches the pattern `ZZZZZZ` where -<br>- `n` is replaced with any number<br>- `X` is replaced with any number and `XX` has any pattern other than `00`, `01`<br>- `Y` is replaced with any number<br>- `Z` is replaced with any number<br><br>These requests would be submitted to the gateway and subsequently marked as successful after 1 minute since submission. These would be the cases where an NCT request would be submitted to the gateway and the updation is completed on the requested folio.|
|First OTP incorrect|nnnnnnnnXX|001234|ZZZZZZ|Phone number that matches the pattern `nnnnnnnnXX` and Second OTP that matches the pattern `ZZZZZZ` where -<br>- `n` is replaced with any number<br>- `X` is replaced with any number<br>- `Z` is replaced with any number<br><br>These requests would be failed with `failure_code` = `first_otp_incorrect`. These would be the cases where the investor has given an incorrect value for the First OTP|
|Second OTP incorrect|nnnnnnnnXX|YYYYYY|005678|Phone number that matches the pattern `nnnnnnnnXX` and First OTP that matches the pattern `YYYYYY` where -<br>- `n` is replaced with any number<br>- `X` is replaced with any number<br>- `Y` is replaced with any number<br><br>These requests would be failed with `failure_code` = `second_otp_incorrect`. These would be the cases where the investor has given an incorrect value for the Second OTP|
|Failure at gateway|nnnnnnnn00|YYYYYY|ZZZZZZ|Phone number that matches the pattern `nnnnnnnn00`, First OTP that matches the pattern `YYYYYY` and Second OTP that matches the pattern `ZZZZZZ` where -<br>- `n` is replaced with any number<br>- `Y` is replaced with any number<br>- `Z` is replaced with any number<br><br>These requests would be submitted to the gateway and subsequently failed with `failure_code` = `failure_at_gateway` after 1 minute since submission. These would be the cases where an NCT request would be submitted to the gateway but was rejected by the gateway due to some reason.|
|Phone number relationship mismatch|nnnnnnnn01|YYYYYY|ZZZZZZ|Phone number that matches the pattern `nnnnnnnn01`, First OTP that matches the pattern `YYYYYY` and Second OTP that matches the pattern `ZZZZZZ` where -<br>- `n` is replaced with any number<br>- `Y` is replaced with any number<br>- `Z` is replaced with any number<br><br>These requests would be submitted to the gateway and subsequently failed with `failure_code` = `phone_number_relationship_mismatch` after 1 minute since submission. These would be the cases where an NCT request would be submitted to the gateway with `belongs_to = self` but was rejected by the gateway due to the reason that the given phone number was mapped as `self` to another PAN in the RTA databases.|

> To simulate an expiry case, avoid passing any OTP within the valid OTP timerange.
