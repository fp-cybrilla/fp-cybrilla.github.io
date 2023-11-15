---
title: Beneficial Owners
---
## Beneficial Owners
#### Learn everything about beneficial owners

>Works with
- Non Individual Investor Profiles

`beneficial_owner` object captures the information of ultimate beneficial owners of an entity.

#### Means
A person can be a beneficial owner through following means:

#### `ownership`
If the person owns more than 25% of shares in the company, directly or indirectly - through a chain of companies or through nominee shareholders.

#### `other_than_ownership`
If the person has control on the company either, through voting rights or debt instruments or through positions held within the company or through any other informal means

#### `senior_managing_official`
When no person is identified as a beneficial owner as per the above means, then a person holding the position of a senior managing official in the company will be captured as beneficial owner

You can check for detailed explanation in this [newwindow, sebi circular](https://www.sebi.gov.in/legal/circulars/jan-2013/guidelines-on-identification-of-beneficial-ownership_24206.html)

---

To capture, call [FPDocs, create beneficial owner api](https://fintechprimitives.com/docs/api/#create-a-beneficial-owner) with the following json
```json
{
    "profile": "invpni_9abd706565144b839324df4b498bc95e98",
    "beneficial_owner_profile": "invp_1abc706565144b839324df4b498bc95f23",
    "beneficial_interest_means": "ownership",
    "beneficial_interest_percentage": 25.52
}
```

#### Notes
If the investor is a publicly traded company or a related entity of publicly traded company, beneficial owners need not be captured