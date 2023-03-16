# Release notes

## Upcoming Releases
#### Available in Sandbox

* We have introduce a new feature which allows tenants configured with the BSE gateway to route their purchase/ redemption/ switch orders via RTA as well. Please refer the [documentation](https://fintechprimitives.com/docs/api/#create-a-mf-purchase) for more information.

* We now support recurring transaction plans in additional frequencies supported by the schemes like daily, weekly or a fortnightly basis in RTA. For more info, please check the [documentation](https://fintechprimitives.com/docs/api/#managing-recurrence-of-a-plan)


* As per [SEBI regulations](https://www.sebi.gov.in/legal/circulars/sep-2022/two-factor-authentication-for-transactions-in-units-of-mutual-funds_63557.html), 2-Factor Authentication shall be applicable for purchases and SIPs with effect from April 1, 2023. Please refer the purchase [documentation](https://fintechprimitives.com/docs/api/#create-a-mf-purchase) and the purchase plan [API documentation](https://fintechprimitives.com/docs/api/#create-a-purchase-plan). <br> Please note the following - 
   1. Consent object is currently kept as an optional attribute for placing a purchase/ SIP request and will be made mandatory on 31st March 2023.
   2. Any order scheduled for submission on or after 1st April without consent will be marked as failed by RTA.


## Previous Releases (Live)

## March 2023
#### 12th March 2023
* You can now update the no. of installments and installment day for a non-systematic plan in RTA. Frequencies supported are `daily`, `twice_a_month`, `day_in_a_fortnight`, `four_times_a_month`, `day_in_a_week`, `monthly`, `quarterly`, `half_yearly` and `yearly` in RTA. Please refer the [documentation](https://fintechprimitives.com/docs/api/#update-a-purchase-plan) for more info.

* You can now create a transaction plan with daily, weekly and fortnightly frequencies in RTA. Please refer the [documentation](https://fintechprimitives.com/docs/api/#managing-recurrence-of-a-plan)

#### 7th March 2023
* We now support ability to authenticate a user via SMS / Email / SMS or Email. For more info, please check the [documentation](https://fintechprimitives.com/docs/api/#authenticating-a-user-via-oauth-2-0-pkce-flow-from-browser-based-clients)

#### 1st March 2023
* Investor Profile go-live
  * We have introduced a new and a better facility to store the demographic information belonging to an investor - Investor Profiles. Investor profiles can also support partial onboarding usecases for investors. Currently this is only supported on the RTA route. For more information, refer to this [documentation](https://fintechprimitives.com/docs/api/#investor-profiles-early-access)
  * Ability to create and update MF Investment accounts using Investor Profile ID. You will also be able to set default preferences for some of the attributes that are present in the Investor Profile, like, phone number, email address, etc. These would be used for new folio creation. For more information, refer to this [documentation](https://fintechprimitives.com/docs/api/#mf-investment-accounts)
  * We now support an ability to create orders created against MF Investment Accounts that are created by using Investor Profiles with `resident_individual` tax status
  * Ability to make payments for orders that are created against MF Investment Accounts that are linked to Investor Profiles with `resident_individual` tax status

## February 2023
#### 23rd February 2023
* FP supports SWP transactions that can be routed via BSE gateway. For more information please check the [documentation](https://fintechprimitives.com/docs/api/#create-a-redemption-plan)

#### 16th February 2023
* File service now has support for `webm` videos along with existing `mp4` format. For more information, refer to this [documentation](https://fintechprimitives.com/docs/api/#create-a-file)

#### 2nd February 2023
* You can now update the installment amount for a systematic/non-systematic plan in RTA. Frequencies supported are `monthly`, `quarterly`, `half_yearly` and `yearly`. For more info, please read the [documentation](https://fintechprimitives.com/docs/api/#update-a-purchase-plan)

## January 2023
#### 25th January 2023
* We now support digital verification of bank accounts. You can use this service to verify the [bank accounts](https://fintechprimitives.com/docs/api/#bank-accounts-early-access) present against your investor profile.  For more information, refer to this [documentation](https://fintechprimitives.com/docs/api/#bank-account-verification)

#### 24th January 2023
* You can now create a purchase order and schedule it for submission in the future. Please check [documentation](https://fintechprimitives.com/docs/api/#create-a-mf-purchase) for more information.

#### 20th January 2023
* FP now supports submission of nomination details to BSE as part of UCC creation. You can skip the manual updations on the BSE portal. 

## July 2022
#### 14th July 2022
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

#### 7th July 2022
* [Search investors by guardian PAN](https://fintechprimitives.com/docs/api/#search-investors)  
`investor`,`guardian`

#### 6th July 2022
* Investor consent information is now mandatory for redemption/switch orders processed via BSE order gateway.  
`redemption`, `switch`


## June 2022
#### 30th June 2022
* FP now automatically reports the primary bank account as the redemption bank account while placing redemption orders via BSE.  
`redemption`,`bse`
* You can now report investor consent information while confirming a BSE redemption order.  
`redemption`,`bse`

#### 15th June 2022
* Add checks to avoid duplicate Razorpay NACH payment creation in cases where Razorpay payment creation response is inconclusive.  
`payments`,`nach`


#### 4th June 2022
* [V2 Bank account APIs](https://fintechprimitives.com/docs/api/#bank-accounts-early-access)

#### 1st June 2022
* Investor consent information is now mandatory for redemption/switch orders processed via RTA order gateway.  
`redemption`, `switch`

## May 2022
#### 31st May 2022
* While authorizing Razorpay e-mandates, we now send bank account details to ensure that the mandate can be only authorized via investor's bank account.  
`e-mandates`, `razorpay`

#### 30th May 2022
* Report the email address and mobile number  used for 2FA before redemption/switches.  
Related API documentation:  
1.[Confirm V2 Redemption orders](https://fintechprimitives.com/docs/api/#update-a-mf-redemption)  
2.[Confirm V2 Switch orders](https://fintechprimitives.com/docs/api/#update-a-mf-switch)  
3.[Create Sell order - V1](https://fintechprimitives.com/api/#create-a-sell-order)  
`redemption`, `switch`

* Channel partners can now import investor master reports from RTAs and access demographic information stored against the folios via [List folios](https://fintechprimitives.com/docs/api/#fetch-all-folios)  
`folios`, `migration`

#### 9th May 2022
* `mf_switch` attribute name changed from `distributor_id` to `partner`  
`switch`

#### 4th May 2022
* Investor mobile number validation updated .For more details please refer to [API documentation](https://fintechprimitives.com/docs/api/#create-a-mf-investment-account)  
`investment account`, `validations`

#### 2nd May 2022
* Investor name,nominee name, guardian name validations update.For more details please refer to [API documentation](https://fintechprimitives.com/docs/api/#create-a-mf-investment-account)  
`investment account`, `validations`

* We are now reporting Mutual fund purchase details of orders whose payments are made via Razorpay to Razorpay so that Razorpay can send credit MIS reports to AMCs.  
`payments`, `razorpay`, `operations`

*  Purchase plans are now visible on dashboard.  
`dashboard`,`purchase plans`
