## FP Product Roadmap

#### 📅 FY 2025-26 Q1 Product Roadmap
In this quarter, we are aiming to bring down the cost of running the business for mutual fund intermediaries ( MFDs/RIAs) by providing them an ability to route the orders to Cybrilla OPAT via ONDC protocols from FP. Intermediaries chosing the ONDC route will not have to pay PG Costs, Signup with multiple AMCs or bear KYC application routing costs. In addition to this goal, we are also updating our APIs to support changes in nomination regulations. 


| Feature/Initiative | Category | May Mid(~21st of May) | May End | Jun Mid | Jun End |
| --- | --- | --- | --- | --- | --- |
| Support for capturing nomination according to new SEBI guidelines | Account Opening |  | ✅ |  |  |
| FP-ONDC: Support for creation of Business Day Daily SIPs (Single SIP registration at a time, No Payment collection on Day of registration) | Orders | ✅ |  |  |  |
| FP-ONDC: Ability to register mandates independently without the context of Plans | Payments | ✅ |  |  |  |
| FP-ONDC: Accept payment on day of registration of plans - Single SIPs | Orders |  | ✅ |  |  |
| FP-ONDC: Support for UPI Autopay & URI Option for UPI/UPI Autopay for custom payment experience | Payments |  | ✅ |  |  |
| FP-ONDC: SIP Cancellation | Orders |  | ✅ |  |  |
| FP-ONDC: SIP Amount Modification | Orders |  | ✅ |  |  |
| FP-ONDC: Calendar day Daily SIP | Orders |  |  | ✅ |  |
| FP-ONDC: Weekly SIP | Orders |  |  | ✅ |  |
| FP-ONDC: Support for basket Lumpsum Purchase orders(UPI Collect request & Netbanking) | Orders |  | ✅ |  |  |
| FP-ONDC: Support for UPI Intent flow | Payments |  | ✅ |  |  |
| FP-ONDC: Support for monthly SIP(Single SIP registration at a time, No Payment collection on Day of registration) | Orders | ✅ |  |  |  |
| FP-ONDC: Support for payment collection of multiple first installments of SIPs created in batch on day of registration | Orders |  |  |  | ✅ |
| FP-ONDC: Support for switch orders(Switch all, Switch by units, Switch by amount) | Orders |  |  | ✅ |  |
| FP-ONDC: Support for NRI-NRE/NRI-NRO orders | Orders |  |  |  | ✅ |
| FP-ONDC: Support for Sub-broker orders/plans | Orders |  |  | ✅ |  |
| FP-ONDC: Support for orders against Direct schemes | Orders |  |  | ✅ |  |
| FP-ONDC: Support for additional purchases against external folios | Orders |  |  |  | ✅ |
| FP-ONDC: Support for redemption against regular schemes by ARNs against external folios | Orders |  |  |  | ✅ |
| FP-ONDC: Support for redemption against direct schemes by RIAs against external folios | Orders |  |  |  | ✅ |
| FP-ONDC: Support for regular to regular switch by ARNs against external folios | Orders |  |  |  | ✅ |
| FP-ONDC: Support for direct to direct switch by RIAs against external folios | Orders |  |  |  | ✅ |
| FP: Support for NRI-NRE/NRI-NRO folio migration | Data |  |  |  | ✅ |


#### Disclaimer
For all roadmap items marked as `FP-ONDC`, there is a dependency on ONDC as ONDC checks the Seller App integration by verifying certain API logs so that none of the FP customers have to go through the same process by ONDC again.