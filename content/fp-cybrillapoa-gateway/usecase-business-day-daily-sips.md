## Business Day Daily SIPs

#### 1. Schedule
The following schedule is available for business day daily SIPs (assuming that Monday to Friday are working days, and Saturday and Sunday are market holidays):

| SIP Registration Day | 1st Instalment | 2nd Instalment | 3rd Instalment |
|----------------------|----------------|----------------|----------------|
| Monday               | Wednesday      | Wednesday      | Thursday       |
| Tuesday              | Thursday       | Thursday       | Friday         |
| Wednesday            | Friday         | Friday         | Monday         |
| Thursday             | Saturday       | Monday         | Tuesday        |
| Friday               | Monday         | Tuesday        | Wednesday      |
| Saturday             | Monday         | Tuesday        | Wednesday      |
| Sunday               | Tuesday        | Tuesday        | Wednesday      |

---
#### 2. Note on Redemptions

When you register a Business Day Daily SIP against a new folio, we do not wait for the folio creation to be completed before processing the second instalment, as it can take 2–3 business days for the folio number to be allotted. However, this approach has an implication: if the folio number is not available in time, the second (or in some cases, subsequent) instalments may be processed under separate folios, potentially leading to the creation of multiple folios for the same investor.

Therefore, at redemption, the distributor will have to create a screen to show the investor how much money is being redeemed from each scheme and folio, and a single consent from the investor can then be captured to authorize redemption across all folios.

---

#### 3. Special use case: Investor wants to start business day daily SIP instalments on a future date

Future activation is not currently supported. However, a distributor can take consent and initiate mandate authorisation today, and register the business day daily SIP on the day the investor wants.

---

#### 4. Special use case: Creating multiple business day daily SIPs for a goal

Some distributors might want to help investors set a financial goal, recommending and creating multiple business day daily SIPs to reach that goal. These SIPs can be from the same AMC or from different AMCs. FP-CybrillaPOA gateway enables this functionality in the following way:

- Mandates (UPI Autopay/E-NACH) can be registered and authorized first.
- Distributors can create multiple SIPs independently in the background and pass the same authorized mandate ID against all the SIPs.
- A single payment can be created against first instalments of all the business day daily SIPs.
- Distributors can collect a single consent and update on the SIPs and the SIPs will be active. However, if any of the SIPs are created against existing folios and these folios have a different contact number and email associated with them, then consent must be captured separately for these folios.
- If one has created multiple SIPs at the same time, every month multiple payment collections will happen.  
For instance, if there are 3 SIPs registered at the same time, 3 separate payment collection attempts (one each for SIP) are made every month using the same mandate. That means if 2 payment collections are successful** and 1 payment collection fails**, 2 SIP instalments get processed for the month and 1 instalment doesn’t get processed.
- If an investor is new and invests in multiple schemes by the same AMC, on successful processing of the first instalments, the AMC will create different folios even though the schemes belong to the same AMC.