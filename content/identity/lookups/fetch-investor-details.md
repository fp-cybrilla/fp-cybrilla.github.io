---
title: Lookup APIs
---

## Lookup APIs
#### Fetches your investors' bank account and demographic details

FP provides a mechanism through which you can fetch the bank account and certain demographic details of your investor from certain third party sources. This is completely a utility API which will only attempt to these details and respond back with whatever FP could scout. At present, bank account details and demographic information of the investor can be attempted to fetch using the below 2 APIs -

1. Bank Account Lookup API
2. Investor Data Lookup API

## Bank Account Lookup API

The Bank account lookup API lets a partner fetch the bank account details of the investor that is registered against the primary VPA / UPI ID. In order to fetch data, you need to provide your investor's verified phone number as an input. API details are present [here](https://fintechprimitives.com/docs/api/#bank-account-lookup-object)

## Customer Data Lookup API

The Customer data lookup API lets a partner fetch certain demographic information of the investor from certain third party sources. In order to fetch data, you need to provide your investor's verified phone number and name as an input. API details are present [here](https://fintechprimitives.com/docs/api/#customer-data-lookup-object)

> **NOTES:** 
> - Both these APIs **attempt** to fetch data from third-party sources provided they are available
> - Once data is fetched, accuracy isn’t validated. We strongly advise you to share these fetched details with the investor and proceed only after their approval
> - You can only fetch these details once per phone number

## Obligations and Limitations for Lookup APIs
- You should be using industry standard, strong encryption algorithms (e.g.,RSA, AES, etc.) to store PII fetched from Lookup APIs
- You should sponsor the ZTO Lookup transactions initiated at your end
- You should fetch the data only for investors who are initiating a mutual fund transaction or doing a mutual fund KYC. You should not use this data for any other purpose
- You should not resell this data fetched from Lookup APIs
- You should not store this data on foreign servers
- You should not lookup data without verifying investors' phone number
- You should not lookup data without obtaining explicit one time consent from investors
- You should ensure that the investor consent text used is the same as approved by Cybrilla and not alter it in any manner
	- Consent text for Bank account lookup - `I allow <tenant> to fetch my bank account details using my phone number via Cybrilla and its partners.`
	- Consent text for Customer data lookup - `I allow <tenant> to fetch my demographic details using my phone number and name from the credit bureau via Cybrilla and its partners.`
- You should only fetch bank account details once per phone number
- You should only fetch investor details once per phone number + name combination
- You should allow your investors to review the fetched data and edit it as needed
- You shall not use robot/crawler or any other automated mechanism to invoke lookup APIs
- Cybrilla doesn't guarantee any SLAs for lookup APIs
- Cybrilla doesn't guarantee the quality of the data returned via lookup APIs
- Cybrilla may audit your implementation at any time, and you will fully cooperate and provide necessary support for such audits

## Go-live checklist for ZTO APIs
- Sign a ZTO offering agreement/addendum with Cybrilla
- Cybrilla will review your implementations and sign-off on the below items -
	- Lookup APIs are not called before collecting explicit investor consents
	- Explicit investor consents are obtained separately for Bank Account Lookup and Customer Data Lookup
	- Cybrilla pre-approved text is used as consent text
	- Checkboxes are provided for investors for opting in (i.e. for providing consent) for data fetch and these checkboxes are not checked by default
	- Your app or any other digital asset is verifying the investor's phone number before invoking these APIs
	- The data fetched is used only for mutual fund transaction processing in the UI workflow
	- Investors have an option to review the data fetched and edit the same