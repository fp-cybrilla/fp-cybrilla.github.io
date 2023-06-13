---
title: Overview
---
## Go live checklist
Use this guide to prepare yourself for going live with your FP integration

### Prerequisites

You need to do the following activities before you can start distributing mutual funds on FP:  
1. Get your distribution license (*You'll need a minimum of 2 weeks for this*)
2. Signup with AMCs as Channel Partner (*You'll need a minimum of 4 weeks for this*)
3. Register with CAMS & KFintech RTAs
4. [Signup with Razorpay for Payments](/going-live/signing-up-with-razorpay)
5. Signup with CVL KRA for checking KYC (*You'll need 2-3 weeks for this*)

### Activate your FP Account

After you got your license and completed your signups as mentioned in the Prerequisites section above, provide us the following information to activate your FP account.

#### 1. Business details
- [ ] ARN (Registration Number issued by AMFI)  
OR
- [ ] RIA code (Registered Investment Advisor code issued by SEBI)
- [ ] EUIN (Employee unique identification number)
- [ ] Registered location of your business

#### 2. AMC details
- [ ] List of AMCs whose schemes you want enabled for distribution

*Collection bank account details for each AMC that needs to be enabled*
- [ ] Bank name
- [ ] Account holder name
- [ ] Account number
- [ ] IFSC code

#### 3. CAMS
**Required details**
- [ ] User code
- [ ] Online broker code
- [ ] STP credentials
  - STP username
  - STP password
- [ ] Answers to CAMS Fundsnet security questions

#### 4. Karvy
**Required details**
- [ ] User code
- [ ] Broker code
- [ ] STP credentials
  - STP username
  - STP password
  - STP app identifier
  - STP arn number
  - STP branch code

#### 5. CVL KRA A/c details
- [ ] CVL Username
- [ ] CVL POS Code
- [ ] CVL Password

#### 6. Payment gateway account details
6a. Razorpay
*Razorpay account 1 (with third party validation enabled)*
- [ ] Merchant ID
- [ ] Live account api key id
- [ ] Live account api key secret

*Razorpay account 2 (with third party validation disabled)*
- [ ] Merchant ID
- [ ] Live account api key id
- [ ] Live account api key secret
- [ ] ENach/E-mandate processing terminal bank (Contact your Razorpay Relationship Manager)
- [ ] ENach/E-mandate processing cut-off time (Contact your Razorpay Relationship Manager)

6b. BillDesk
* V1 and V2 credentials
- [ ] Merchant ID 
- [ ] Client ID 

#### 7. Postback URLs
- [ ] Default Netbanking payment postback URL
- [ ] Default e-mandate authorization postback URL
