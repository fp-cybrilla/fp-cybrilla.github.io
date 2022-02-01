## Quarterly Roadmap : Jan-March 2022
We prioritize the features in our roadmap based on the feedback customers like you give us. The idea to publish this list out in the public is to give you an indication of where we are heading.  
In the current quarter, these are some of the key things you can expect to be available in FP Platform, among many other improvements.

### Onboarding
|Feature|Remarks|
|---|---|
|Investor authentication and authorization|Leverage FP APIs to authenticate and authorize your investors instead of building your own investor authentication mechanism.|
|KYC Status - On hold|Check the status of investors whose KYC status is on hold.|


### Orders
|Feature|Remarks|
|---|---|
|Migrate folios from CAS|Parse CAS files and migrate folios against investment accounts and place orders against these folios|
|SIP V2|a) Create and submit systematic installments without mandates.<br>b) Create lumpsum purchases as installments<br> c) Pause/Resume SIP<br> d) Modify SIP Date<br> e) Modify SIP amount |
|Orders notifications|Get notified via callbacks upon state changes in orders|
|Systematic Plan notifications|Get notified via callbacks upon state changes in SIPs,SWPs and STPs|
|Others|a)Scheme Master V2<br>b)Improve performance while handling KFintech order rejections.<br>c)Detect consolidated folios and add validations to prevent orders from being placed against consolidated folios|

### Payments
|Feature|Remarks|
|---|---|
|Razorpay UPI e-mandates|Create payments for lump sum purchases and SIP installments via Razorpay e-mandates.Available for orders that are routed via RTA|
|Razorpay e-mandate authorization SDK options|Create custom Razorpay e-mandate authorization checkout experience for your users|
|Payments notifications|Get notified via callbacks upon state changes in payments|
|BSE NEFT transfer|Support BSE NEFT payments against lumpsum purchase orders|
|Consolidated Razorpay e-mandate payment collection|Create a single payment for all payment collections that are bound to happen on the same day via a given Razorpay e-mandates and save costs.|


### Data
|Feature|Remarks|
|---|---|
|KYC Requests list report	|Fetch the status of multiple KYC requests at once and check whether the SUBMITTED kyc requests are approved or rejected.|
|Capital Gains Report|Generate capital gains reports for investors and track usage.|
|Dashboard|**Listing**<br>1. Switch orders <br> 2. Payments <br> 3. Mandates <br>  4. Settlements  <br> 5. SIPs <br>  6. STPs <br>  7. SWPs<br> **Monitoring**<br>1.Payment collection tracking<br>2.SIP Cash flow<br>3.Aging orders |

### Others
|Feature|Remarks|
|---|---|
|File retention|Implementation of file retention policy for both prod and sandbox environments|  
