---
title: FATCA & CRS
---
## FATCA & CRS Declaration
#### Learn everything about fatca and crs declarations to be collected from the investor


Mutual Funds collect certain information from the investors to identify the folios held by foreign tax residents and report them to Income Tax Department (ITD). The ITD then shares this information to the investor's country of tax residence, so they can ascertain that the investors are declaring their income and paying the right amount of tax.

#### `tax_residency`
Capture details about where an entity is resident for tax purposes. Check [this guide for details](/identity/profiles/tax-residencies/)

---

#### `specified_us_person_exemption`
Specified US Person means a US Person that is in scope for FATCA reporting.
In case the investor's country of incorporation or one of the tax residencies is US, but it is not a Specified US Person, this attribute captures the reason for the exemption from FATCA reporting.

---

#### `entity_classification`
The investor will broadly fall into these categories

- Financial Institution (FI)
- Direct Reporting Non Financial Entity (direct reporting NFE)
- Active Non Financial Entity (active NFE)
- Passive Non Financial Entity (passive NFE)

**Financial Institution**  
`fi`: If the investor is a financial institution and don't fall under any exemptions for fatca, crs compliance  
`fi_sponsored`: If the investor is a financial institution and is sponsored by another entity  
`non_reporting_fi`: If the investor is a financial institution and falls under certain categories who are exempted from reporting  

**Direct Reporting NFE**  
`direct_reporting_nfe`: If the investor is a NFE, but elects to report information to FATCA

**Active NFE**  
`active_nfe`: The investor is an active NFE and falls into any of the following categories  
`active_nfe_listed`: The investor is a publicly traded company, whose shares are regularly traded on an established securities market  
`active_nfe_related_to_listed`: The investor is a related entity of a publicly traded company, whose shares are regularly traded on an established securities market

**Passive NFE**  
`passive_nfe`: The investor is a passive NFE