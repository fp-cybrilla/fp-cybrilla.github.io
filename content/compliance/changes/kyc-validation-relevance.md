---
title: Relevance of KYC Validation
---

## KYC validation and its relevance
#### Learn about KYC Status being Validated and its relevance

As per the KYC master circular by SEBI, there are a couple of changes in interpreting investors' KYC statuses and their applicability while making investments. These changes went live on April 1st, 2024.

- All the investors whose KYC status is `KYC Validated` at the KRA are allowed to place all types of transactions and have no restrictions whatsoever
- All the investors whose KYC status is `KYC Registered` or `KYC Verified` at the KRA are allowed to transact only on existing folios 
  - However, if they want to place a fresh purchase request, they have to **first modify their KYC to include their Aadhaar details**
  - Once Aadhaar details are tagged to the KYC records and KRAs validate the same, the status at the KRA would change to `KYC Validated` and now the investor can place a fresh purchase request.

With the above background, FP made some minimal changes to [FPDocs, KYC Check APIs](https://fintechprimitives.com/docs/api/#kyc-checks) to accommodate the same -
- For all the `KYC Validated` cases, the KYC Check API response would return the `status` as `true` with `reason` and `action` as null
- For all the `KYC Registered` or `KYC Verified` cases, the KYC Check API response would return the `status` as `false` with `reason` as `incomplete` and `action` as `modify`. A sample response would like below -
```json
{
	// Displaying only a part of the object for brevity
	...

	"status": false,

	"reason": "incomplete",
	"action": "modify"

	...
}
```

### References
- Master KYC Circular by SEBI can be found [newwindow, here](https://www.sebi.gov.in/legal/master-circulars/oct-2023/master-circular-on-know-your-client-kyc-norms-for-the-securities-market_77945.html)
- Joint press release by KRAs can be found [newwindow, here](https://www.cvlindia.com/CVLINDIA_DOC/pdf/CVL_Media_release25042024.pdf)
- FAQs on revised KYC Process prepared by BSE can be found [newwindow, here](https://www.bseindia.com/markets/MarketInfo/DispNewNoticesCirculars.aspx?page=20240404-43)
