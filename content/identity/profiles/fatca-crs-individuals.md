---
title: FATCA & CRS (Individuals)
---
## FATCA & CRS Declaration (Individuals)
#### Learn everything about fatca and crs declarations to be collected from the investor

>Works with
- Individual Investor Profiles

Mutual Funds collect certain information from the investors to identify the folios held by foreign tax residents and report them to Income Tax Department (ITD). The ITD then shares this information to the investor's country of tax residence, so they can ascertain that the investors are declaring their income and paying the right amount of tax.

#### Tax residencies

Capture information about countries / jurisdictions, where the investor is liable to pay taxes, including India.

Call [FPDocs, update individual investor](https://fintechprimitives.com/docs/api/#modify-an-investor-profile) with the following json

```json
{
  "first_tax_residency": {
    "country": "IN",
    "taxid_type": "pan",
    "taxid_number": "arrpp7775n",
    "applicable_from": null,
    "applicable_to": null
  },
  "second_tax_residency": {
    "country": "US",
    "taxid_type": "tin",
    "taxid_number": " 810-02-5239",
    "applicable_from": "2012-09-02",
    "applicable_to": "2099-12-31"
  }
}
```

You can capture upto 4 countries of tax residency by populating `third_tax_residency` and `fourth_tax_residency`. Suppose a non-indian tax residency details is provided by the investor, then ensure you also collect the `tin` details along with `applicable_from` and `applicable_to` dates of that tax residency period.