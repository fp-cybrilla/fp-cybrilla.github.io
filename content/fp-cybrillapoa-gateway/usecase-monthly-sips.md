## Monthly SIPs
<br>

#### **Case 1:** Investor does not want to make payment on the day of SIP Registration

Some investors might not want to make a payment on the day of SIP registration, instead wanting the first instalment to be debited on a day of their choosing. The table below presents various schedules based on the date of SIP registration and installment day chosen by the investor.

**Note:**  There must be at least one day's gap between the start day and the SIP registration date. For example, if an investor is registering SIP on 3rd December and start day is 3, first instalment will be processed on 3rd January.

| SIP Registration Date | Instalment Day | First Instalment Day                                                                                   | Second Instalment Day |
|------------------------|----------------|----------------------------------------------------------------------------------------------------------|------------------------|
| Jan 1st 2025           | 1              | Feb 1st 2025                                                                                              | March 1st 2025         |
| Jan 1st 2025           | 2              | Instalment Created on Jan 2nd 2025  <br> Payment collection happens on Jan 3rd 2025   | Feb 2nd 2025           |
| Jan 1st 2025           | 3              | Jan 3rd 2025 (Both instalment and payment creation)                                                       | Feb 3rd 2025           |
| Jan 1st 2025           | 28             | Jan 28th 2025                                                                                             | Feb 28th 2025          |
| Jan 1st 2025           | 29,30,31       | 29, 30 and 31st as start days are not supported yet.                                                     | NA                     |
<br>

#### **Case 2:** Investor wants to make payment (first instalment) on the day of SIP Registration

Some investors might want to make the payment towards the first installment on the day of SIP creation itself. In this case, investors would expect the second instalment to happen as per the schedule.

This implies that the first instalment will get preponed to the day of SIP creation. The rest of the instalments will follow as per schedule, as explained in the table below:

| SIP Registration Date | Instalment Day | First Instalment Day                                                | Second Instalment Day |
|------------------------|----------------|----------------------------------------------------------------------|------------------------|
| Jan 1st 2025           | 1              | Jan 1st 2025  | Feb 1st 2025         |
| Jan 1st 2025           | 2              | Jan 1st 2025 (Collecting payment of Jan 2nd instalment in advance)   | Feb 2nd 2025           |
| Jan 1st 2025           | 3              | Jan 1st 2025 (Collecting payment of Jan 3rd instalment in advance)   | Feb 3rd 2025           |
| Jan 1st 2025           | 28             | Jan 1st 2025 (Collecting payment of Jan 28th instalment in advance)  | Feb 28th 2025          |
| Jan 1st 2025           | 29, 30, 31     | 29, 30 and 31st as start days are not supported yet.                 | NA                     |
<br>

##### Note
If the instalment day falls on a bank holiday, the payment collection will happen if it is UPI Autopay. In case of E-NACH, payment collection will happen on the next bank working day.
<br>

#### Special Use Case: Creating multiple SIPs for a goal

Some distributors might want to help investors set a financial goal, recommending and creating multiple SIPs to reach that goal. These SIPs can be from the same AMC or from different AMCs. FP-CybrillaPOA gateway enables this functionality in the following way:

* Mandates (UPI Autopay/E-NACH) can be registered and authorized first
* Distributors can create multiple SIPs independently in the background and pass the same authorized mandate ID against all the SIPs
* They can collect a single consent and update on the SIPs and SIPs will be active. However, if any of the SIPs are created against existing folios and these folios have a different contact number and email associated with them, then consent must be captured separately for these folios. 
* If one has created multiple SIPs at the same time, every month multiple payment collections will happen. For instance, if there are 3 SIPs registered at the same time, 3 separate payment collection attempts (one each for SIP) are made every month using the same mandate. That means if 2 payment collections are successful and one payment collection fails, 2 SIP instalments get processed for the month and 1 instalment doesn’t get processed.
* If an investor is new and invests in multiple schemes by the same AMC, on successful processing of the first instalments the AMC will create different folios even though the schemes belong to the same AMC.
<br>

##### Coming soon:
The ability to collect a single payment for the first instalments of multiple SIPs on the day of goal registration will soon be available.

