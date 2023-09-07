# Release notes

## Upcoming Releases
#### Available in Sandbox

## Previous Releases (Live)

### September 2023

#### Week of 8th September 2023

* We have built a internal API through which you can sync status between FP KYC request object and sinzy if it is not sync. 

* We have fixed the bug where nominee with allocation percentage as zero were passed in order feed file. 

* We have standardised format of date of birth fields in [mf_folio object](https://fintechprimitives.com/docs/api/#mf-folio-object) to `YYYY-MM-DD`

```
      primary_investor_dob        
      secondary_investor_dob
      third_investor_dob
      guardian_dob
      nominee1.dob
      nominee2.dob
      nominee3.dob
```

### August 2023

#### Week of 31st August 2023

* Updation of failure codes in all one time order APIs. Refer object structures for [purchase](https://fintechprimitives.com/docs/api/#mf-purchase-object), [redemption](https://fintechprimitives.com/docs/api/#mf-redemption-object), [switch](https://fintechprimitives.com/docs/api/#mf-switch-object)

* You can now add the consent for all transaction plans (purchase, redemption, switch) during the plan creation Or update the consent later using the update API. The plan will remain in `created` state if consent is not provided while creating the plan and will be activated only after the consent is updated for the plan. The installments will generated only if a plan moves to `active` state.

* Deprecated `distributor_id` attribute for all type of orders and plans is removed from APIs. A new attribute `partner` is added to these objects to support sub broker via whom a plan/ order is created. Refer document for [purchase](https://fintechprimitives.com/docs/api/#mf-purchase-object), [redemption](https://fintechprimitives.com/docs/api/#mf-redemption-object), [switch](https://fintechprimitives.com/docs/api/#mf-switch-object) and [plans](https://fintechprimitives.com/docs/api/#other-common-plan-attributes). 


#### Week of 25th August 2023

* You can now add sub broker partners using the [partner object](https://fintechprimitives.com/docs/api/#partner-object).

* We support ability to add sub broker partners for all type of orders. Refer partner attribute in order documents - [purchase](https://fintechprimitives.com/docs/api/#mf-purchase-object), [redemption](https://fintechprimitives.com/docs/api/#mf-redemption-object), [switch](https://fintechprimitives.com/docs/api/#mf-switch-object) and [plans](https://fintechprimitives.com/docs/api/#other-common-plan-attributes). 

*  We now show audit information for a [KYC Request object](https://fintechprimitives.com/docs/api/#kyc-request-object). We have newly added below 5 attributes to the object which would give more clarity on the state changes that could happen on the object. 
```
    updated_at
    esign_required_at
    submitted_at
    successful_at
    rejected_at
```


### July 2023

#### Week of 17th July 2023
*  We now support events  for payments and mandates. You can use our [Event APIs](https://fintechprimitives.com/docs/api/#event-object) to fetch information on any events triggered for payments and mandates state change. Additionally you can subscribe to these events via [Webhooks](https://fintechprimitives.com/docs/api/#webhook-notification-object).

### June 2023

#### Week of 23rd June 2023

* You can update a [V1 SIP](https://fintechprimitives.com/docs/api/#sips) using [Update a Purchase Plan](https://fintechprimitives.com/docs/api/#update-a-purchase-plan) API.

#### Week of 9th June 2023
* Technical upgrades to FP Authentication complete on 8th June, 2023 at 23:00 hours IST

* Simplified [Razorpay SDK integration](https://docs.fintechprimitives.com/payments/Razorpay-SDK-options/) by adding 'email ID' and 'contact' parameters to the eNACH mandate authorisation and payment creation API responses, eliminating the need to separately fetch Investor details.

* You can now cancel a [V1 SIP](https://fintechprimitives.com/docs/api/#sips) using [Cancel a Purchase Plan](https://fintechprimitives.com/docs/api/#cancel-a-purchase-plan) API.

#### Week of 2nd June 2023
* Introduced a user-friendly `provider_name` in the [fetch mandate](https://fintechprimitives.com/docs/api/#fetch-a-mandate) and [fetch payment](https://fintechprimitives.com/docs/api/#fetch-a-payment) API responses, enabling clients to easily identify the payment gateway associated with mandates and payments.

* You can now place an order or create a transaction plan via RTA by assigning a [Partner Object ID](https://fintechprimitives.com/docs/api/#partner-object), of the distributor/ advisor, as a part of the request attribute while creating an order or a transaction plan.

* You can now update the mandate associated with a purchase plan routed via RTA. Refer [API documentation](https://fintechprimitives.com/docs/api/#update-a-purchase-plan) for more details.

### May 2023

#### Week of 26th May 2023

* You can now use [Fetch a Purchase Plan](https://fintechprimitives.com/docs/api/#fetch-a-purchase-plan-by-its-id) to fetch a SIP created using V1 APIs

* We now have events generated for redemption and switch orders. You can use our [Event APIs](https://fintechprimitives.com/docs/api/#event-object) to fetch information on any events triggered for an order state change.

#### Week of 19th May 2023

* You can now fetch the Compound Annual Growth Rate (CAGR) for an investment account by using the [Investment Accounts Wise Returns Report](https://fintechprimitives.com/docs/api/#investment-account-wise-returns) 

* We now have events generated for purchase orders with states `submitted`, `cancelled`, `failed`, `successful` and `reversed`. You can use our [Event APIs](https://fintechprimitives.com/docs/api/#event-object) to fetch information on any events triggered for an order state change.

#### Week of 12th May 2023

* We have introduced a new feature which allows tenants configured with the BSE gateway to route their orders via RTA as well. Please refer the `order_gateway` attribute under [Purchase](https://fintechprimitives.com/docs/api/#create-a-mf-purchase), [Redemption](https://fintechprimitives.com/docs/api/#create-a-mf-redemption), [Switch](https://fintechprimitives.com/docs/api/#create-a-mf-switch), [Purchase Plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan), [Redemption Plan](https://fintechprimitives.com/docs/api/#create-a-redemption-plan) and [Switch Plan](https://fintechprimitives.com/docs/api/#create-a-switch-plan) sections.


* You can now choose your payment provider while creating payments i.e either via BSE gateway or other provider such as Razorpay. Please ensure that the MF purchase order also adheres to same gateway. Eg: If you are making payment via Razorpay, then your MF purchase order gateway should be RTA.

* You can now use Aadhaar as a POA while submitting new KYC Requests. This is a [Beta](https://docs.fintechprimitives.com/upcoming/overview/) release and only available on request. Please refer the [documentation](https://docs.fintechprimitives.com/upcoming/beta/aadhaar-as-poa/) for more information.

#### Week of 5th May 2023
* New error codes have been introduced for KYC Status Check service. Please refer the [documentation](https://fintechprimitives.com/docs/api/#error-codes) for more information.

### April 2023

#### Week of 28th April 2023
* Now you can receive UPI ID (VPA) validation errors  occured at BSE via HTTP POST `payment_postback_url` parameter passed during [payment creation](https://fintechprimitives.com/docs/api/#create-a-payment).

#### Week of 14th April 2023

* We now have events generated for purchase orders with states `pending` and `confirmed`. You can use our [Event APIs](https://fintechprimitives.com/docs/api/#event-object) to fetch information on any events triggered for an order state change.


### March 2023

#### Week of 31st March 2023

* As per [SEBI regulations](https://www.sebi.gov.in/legal/circulars/sep-2022/two-factor-authentication-for-transactions-in-units-of-mutual-funds_63557.html), 2-Factor Authentication is applicable for purchases and SIPs with effect from April 1, 2023. Please refer the [purchase](https://fintechprimitives.com/docs/api/#create-a-mf-purchase), [purchase plan](https://fintechprimitives.com/docs/api/#create-a-purchase-plan) &  [V1 SIP](https://fintechprimitives.com/docs/api/#sips) documentation for details.

 Consent(2FA) is mandatory for below order types from 31st March 2023, 3.00 PM in FP

 1. Lumpsum purchases 
 2. Systematic purchase plans - registration only 
 3. Non systematic purchase plans - registration & all its installments

#### Week of 24th March 2023
* You can now create a purchase/redemption/switch plan in RTA and schedule it for activation in the future. For more info, please refer the [documentation](https://fintechprimitives.com/docs/api/#create-a-purchase-plan).

#### Week of 17th March 2023
* You can now update the no. of installments and installment day for a non-systematic plan in RTA. Frequencies supported are `daily`, `twice_a_month`, `day_in_a_fortnight`, `four_times_a_month`, `day_in_a_week`, `monthly`, `quarterly`, `half_yearly` and `yearly` in RTA. Please refer the [documentation](https://fintechprimitives.com/docs/api/#update-a-purchase-plan) for more info.

* You can now create a transaction plan with daily, weekly and fortnightly frequencies in RTA. Please refer the [documentation](https://fintechprimitives.com/docs/api/#managing-recurrence-of-a-plan)

#### Week of 10th March 2023
* We now support ability to authenticate a user via SMS / Email / SMS or Email. For more info, please check the [documentation](https://fintechprimitives.com/docs/api/#authenticating-a-user-via-oauth-2-0-pkce-flow-from-browser-based-clients)

#### Week of 3rd March 2023
* Investor Profile go-live
  * We have introduced a new and a better facility to store the demographic information belonging to an investor - Investor Profiles. Investor profiles can also support partial onboarding usecases for investors. Currently this is only supported on the RTA route. For more information, refer to this [documentation](https://fintechprimitives.com/docs/api/#investor-profiles)
  * Ability to create and update MF Investment accounts using Investor Profile ID. You will also be able to set default preferences for some of the attributes that are present in the Investor Profile, like, phone number, email address, etc. These would be used for new folio creation. For more information, refer to this [documentation](https://fintechprimitives.com/docs/api/#mf-investment-accounts)
  * We now support an ability to create orders created against MF Investment Accounts that are created by using Investor Profiles with `resident_individual` tax status
  * Ability to make payments for orders that are created against MF Investment Accounts that are linked to Investor Profiles with `resident_individual` tax status

### February 2023
#### Week of 24th February 2023
* FP supports SWP orders that can be routed via BSE gateway. For more information please check the [documentation](https://fintechprimitives.com/docs/api/#create-a-redemption-plan)

#### Week of 17th February 2023
* File service now has support for `webm` videos along with existing `mp4` format. For more information, refer to this [documentation](https://fintechprimitives.com/docs/api/#create-a-file)

#### Week of 3rd February 2023
* You can now update the installment amount for a systematic/non-systematic plan in RTA. Frequencies supported are `monthly`, `quarterly`, `half_yearly` and `yearly`. For more info, please read the [documentation](https://fintechprimitives.com/docs/api/#update-a-purchase-plan)

### January 2023
#### Week of 27th January 2023
* We now support digital verification of bank accounts. You can use this service to verify the [bank accounts](https://fintechprimitives.com/docs/api/#bank-accounts) present against your investor profile.  For more information, refer to this [documentation](https://fintechprimitives.com/docs/api/#bank-account-verification)

* You can now create a purchase order and schedule it for submission in the future. Please check [documentation](https://fintechprimitives.com/docs/api/#create-a-mf-purchase) for more information.

#### Week of 20th January 2023
* FP now supports submission of nomination details to BSE as part of UCC creation. You can skip the manual updations on the BSE portal. 

* You can now skip installments of an existing purchase/ redemption/ switch plan in RTA by specifying the date range in which the installments are to be skipped. Please refer the [documentation](https://fintechprimitives.com/docs/api/#skip-installments-via-skip-instructions) for more information.

### July 2022
#### 15th July 2022
* You can now see the non-compliance reason and action required to ensure compliance when you check KYC status. For more info, please read the [documentation](/identity/kyc-check/)  
`kyc`
* Fixed a bug due to which the second installments of RTA SIPs were being incorrectly reported to RTAs in cases of SIPs that were created with flag `generate_first_installment_now`:`true`  
`sip`
* Updated order reconciliation logic to support order reconciliation for CAMS serviced AMC customers.  
`cams`,`amc`,`orders`
* You can now cancel Razorpay e-mandates. For more information please read this [documentation](https://fintechprimitives.com/docs/api/#cancel-a-mandate)


#### 8th July 2022
* Fixed an issue which was causing BSE redemption orders to fail due to bank account validation issues.  
`redemption`,`bse`

* [Search investors by guardian PAN](https://fintechprimitives.com/docs/api/#search-investors)  
`investor`,`guardian`

* Investor consent information is now mandatory for redemption/switch orders processed via BSE order gateway.  
`redemption`, `switch`

#### 1st July June 2022
* FP now automatically reports the primary bank account as the redemption bank account while placing redemption orders via BSE.  
`redemption`,`bse`
* You can now report investor consent information while confirming a BSE redemption order.  
`redemption`,`bse`

### June 2022

#### 17th June 2022
* Add checks to avoid duplicate Razorpay NACH payment creation in cases where Razorpay payment creation response is inconclusive.  
`payments`,`nach`


#### 3th June 2022
* [V2 Bank account APIs](https://fintechprimitives.com/docs/api/#bank-accounts)

* Investor consent information is now mandatory for redemption/switch orders processed via RTA order gateway.  
`redemption`, `switch`

* While authorizing Razorpay e-mandates, we now send bank account details to ensure that the mandate can be only authorized via investor's bank account.  
`e-mandates`, `razorpay`

* Report the email address and mobile number  used for 2FA before redemption/switches.  
Related API documentation:  
1.[Confirm V2 Redemption orders](https://fintechprimitives.com/docs/api/#update-a-mf-redemption)  
2.[Confirm V2 Switch orders](https://fintechprimitives.com/docs/api/#update-a-mf-switch)  
3.[Create Sell order - V1](https://fintechprimitives.com/api/#create-a-sell-order)  
`redemption`, `switch`

* Channel partners can now import investor master reports from RTAs and access demographic information stored against the folios via [List folios](https://fintechprimitives.com/docs/api/#fetch-all-folios)  
`folios`, `migration`

### May 2022

#### 13th May 2022
* `mf_switch` attribute name changed from `distributor_id` to `partner`  
`switch`

#### 6th May 2022
* Investor mobile number validation updated .For more details please refer to [API documentation](https://fintechprimitives.com/docs/api/#create-a-mf-investment-account)  
`investment account`, `validations`

* Investor name,nominee name, guardian name validations update.For more details please refer to [API documentation](https://fintechprimitives.com/docs/api/#create-a-mf-investment-account)  
`investment account`, `validations`

* We are now reporting Mutual fund purchase details of orders whose payments are made via Razorpay to Razorpay so that Razorpay can send credit MIS reports to AMCs.  
`payments`, `razorpay`, `operations`

*  Purchase plans are now visible on dashboard.  
`dashboard`,`purchase plans`
