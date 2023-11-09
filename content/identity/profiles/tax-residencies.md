---
title: Tax Residencies
---
## Tax Residencies
#### Learn everything about tax residencies

`residential_status` attribute captures the India income tax residential status of the investor for that financial year as known at the time of capturing this information.

Call [FPDocs, update non individual investor api](https://fintechprimitives.com/docs/api/#modify-an-non-individual-investor-profile) with the following json
```json
{
    "residential_status": "resident",
}
```

`tax_residency` object captures information about countries / jurisdictions other than India, where the investor is liable to pay taxes.

To add a tax residency call [FPDocs, create tax residency api](https://fintechprimitives.com/docs/api/#create-a-tax-residency) with the following json
```json
{
    "profile": "invpni_9abd706565144b839324df4b498bc95e98",
    "country": "us",
    "taxid": "abc123",
    "taxid_type": "irs_number"
}
```
In the same way, you can add as many tax residencies where the investor is liable to pay taxes