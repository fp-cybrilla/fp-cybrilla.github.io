## SLAs and TAT when using FP APIs for order routing

#### 1. Order submission SLA
**1.1 For orders routed via FP in Channel Partner `gateway`s**

Customers routing orders via Channel Partner route can now automate the order submission to RTAs and also also avail order submission SLAs from FP by configuring RTA Order Submission API credentials with FP.

|Order submission automated?|Scenario|SLA|
|---|---|---|
|Yes|RTA systems are not down during order submission|Any confirmed order(Purchase/Redemption/Switch) will be submitted to RTAs within 5 minutes of confirmation.|
|Yes|RTA systems are down during order submission|The first attempt to submit the confirmed order(Purchase/Redemption/Switch) will be made within 5 minutes of confirmation. Upon failure(Since system is down), we will fallback to manual submission*|

**Note:** Manual submissions are not calculated for SLA calculation purposes.

**1.2 For orders routed via FP in ONDC `gateway`s**

Any confirmed order(Purchase/Redemption/Switch) will be submitted to Seller App via ONDC protocols within 2 minutes of order confirmation.

#### 2. About payment collection and settlement

**2.1 Payment collection and settlement against orders routed via Channel Partner `gateway`s**

Payment Collection and Settlement SLAs are provided by the PG that you use. Depending on the arrangement with PG, settlement happens and FP can’t provide any SLAs as it can only facilitate but can’t control payment collection and settlements.

**2.2 Payment collection and settlement against orders routed via ONDC `gateway`**

Payment Collection and Settlement SLAs are provided by the Seller App. Currently it is T+1 for settlement once the payment is collected successfully. FP can’t provide any SLAs as it can only facilitate but can’t control payment collection and settlements.

#### 3. About NAV 

Be it Channel Partner route or ONDC gateway, for complete order execution, 
 - Amount has to be settled(In case of purchases) to AMCs and MIS reports have to be sent by PGs to RTAs
 - Order has to be validated at RTA/SellerApps and then further processed, the process over which FP doesn’t have control again.

Because of these reasons, no NAV related SLAs can be given.

**3.1 NAV discrepancy management**

Detection: 
  - We will provide NAV discrepancy report(In roadmap) OR
  - Distributors can access order details using different mechanisms either via fetching orders for each investors, via console, or via Scheduled queries or via [these Data access mechanisms](/data/overview/) and compare the actual NAV Date against the order with expected NAV Date against the order and if not same flag orders if expected and actual NAV dates don’t match.

Remediation:
  - Coming Soon: In cases where the NAV discrepancy is due to RTA/SellerApp, our operations team will followup with AMCs and try to get the right NAV proactively
  - Beyond this, how investors are compensated for the NAV loss is left to the FP customers. 

#### 4. Redemptions

Be it Channel Partner `gateway` or ONDC `gateway`,  AMC is responsible for settling the redeption proceeds to the bank account of investors.  At present, the payment cycle by AMCs for redemptions submitted before cut-off time are
 - T+1 for debt
 - T+2 for equity/hybrid
 - T+5 days for FoF Overseas. In some cases it could be T+6

#### 5. Refunds

**5.1 Amount already settled to AMC’s account**

If the amount is already settled to AMC’s account and the purchase order is rejected due to some issues, AMCs are responsible for refunds and TAT for refunds depends on AMC.

**5.2 Amount collected from investor but not settled to AMC’s account**

Late Authorization Cases : Amount collected from investor but we do not receive confirmation from banks via PGs in time. 
 
 - **FP - Channel Partner `gateway`s**: Razorpay and Billdesk : 3 to 5 working days TAT for refunds. Automatically initiated by FP, however, settlement of amount to investor’s account is the responsibility of PG. Note: If you are collecting money your own, you will have to manage refunds also by yourself in such cases. 
 - **FP - ONDC**: 3 to 5 working days TAT for refunds.  Managed entirely by SellerApp.