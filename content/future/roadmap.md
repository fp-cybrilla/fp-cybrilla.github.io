## Quarterly Roadmap : April-June 2022

We prioritize the features in our roadmap based on the feedback customers like you give us. The idea to publish this list out in the public is to give you an indication of where we are heading.  
In the current quarter, these are some of the key things you can expect to be available in FP Platform, among many other improvements.

### Onboarding
|Feature|Remarks|
|---|----|
|Investor authentication and authorization|Leverage FP APIs to authenticate and authorize your investors instead of building your own investor authentication mechanism.|
|KYC Status - On hold|Check the status of investors whose KYC status is on hold.|
|PAN verification|Verify investor's PAN via NSDL|
|Bank account verification|Use FP APIs to verify bank accounts|
|Mobile verification|Verify mobile numbers using FP APIs|
|Email verification|Verify email addresses using FP APIs|

### Orders
|Feature|Remarks|
|---|----|
|Investment account creation validations|Updated validations while creating investment accounts as  per AMFI Best Practice Guidelines Circular No.97 /2021-22|
|Two factor authentication for redemption/switch/stp/swp|Mechanisms to manage two factor authentication for redemptions/switches/stps/swps as per SEBI/HO/IMD/IMD-I DOF5/P/CIR/2021/634 |
|Instant redemption API upgrades|Upgrade instant redemption APIs to ensure two factor authentication compliance|
|SIP V2|a) Create and submit systematic installments without mandates.<br>b) Create lumpsum purchases as installments<br>c) Pause/Resume SIP<br>d)Modify SIP Date<br>e) Modify SIP amount|

### Payments
|Feature|Remarks|
|---|---|
|Razorpay UPI Autopay|Use Razorpay UPI Autopay feature for SIPs, and other purchase orders|
|Cancel Razorpay mandates|Ability to deactivate Razorpay mandates so that they can no longer be used|

### Data
|Feature|Remarks|
|---|---|
|Capital gains report|Transaction wise capital gains report|
|Returns report|Scheme and foliowise returns report containing XIRR and Absolute returns|
|Folio migration facility|Ability to migrate folios from WBR-9(CAMS) and MFSD-211(KFintech) and access demographic information from folio via FP APIs.|
|Dashboard|a) Dashboard home page<br>b) Purchase plan listing<br> c) Payments Listing<br>c) Dashboard access logs<br>e) Settlement details<br>f)STP<br>g)SWP|

### Others
|Feature|Remarks|
|---|---|
|Latency SLAs|Ensure that the response time for mission critical APIs are less than 200ms|
|Uptime SLAs|Ensure that FP services are up 99.9% of the time|
|Operations SLAs|SLAs to ensure timely order submission and reconcilliation|