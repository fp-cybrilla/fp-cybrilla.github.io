# Go live checklist
*Use this guide to prepare yourself for going live with your FP integration*

We recommend you review the sections below in detail to make sure you give yourself enough time to prepare your integration to go live in production.  
Email us at [fpsupport@cybrilla.com](mailto:fpsupport@cybrilla.com) when you are ready with the details.

### Identity

To activate KYC Check APIs in your production account, we need the following details

**CVL KRA** (*Time: 2-3 weeks*)

- [ ] Username
- [ ] POS Code
- [ ] Password


### Orders

To activate order processing in your production account, we need the following details about your distribution license:

**About your business** (*Time: min. 2 weeks*)
- [ ] Amfi Registration Number (ARN issued by AMFI) or RIA code (Registered investment advisor code issed by SEBI)
- [ ] Employee unique identification number (EUIN)
- [ ] Your business registered location

**To route orders through RTA gateway** (*Time: min. 4 weeks*)

*CAMS*
- [ ] User code
- [ ] Online broker code
- [ ] STP credentials
  - [ ] STP username
  - [ ] STP password

*Karvy*
- [ ] User code
- [ ] Broker code
- [ ] STP credentials
  - [ ] STP username
  - [ ] STP password
  - [ ] STP app identifier
  - [ ] STP arn number
  - [ ] STP branch code

*Franklin*
- [ ] User code
- [ ] Broker code
- [ ] STP credentials
  - [ ] STP username
  - [ ] STP password

**To route orders through BSE gateway** (*Time: min. 4 weeks*)
- [ ] BSE user id
- [ ] BSE member id
- [ ] BSE password


### Payments

To activate payments in your production account, we need the following details:

**Payment gateway (Razorpay)** (*Time: 4-6 weeks*)

*Razorpay account 1 (with third party verification enabled)*
- [ ] Merchant ID
- [ ] Live account api key id
- [ ] Live account api key secret

*Razorpay account 2 (with third party verification disabled)*
- [ ] Merchant ID
- [ ] Live account api key id
- [ ] Live account api key secret

Ensure the following in both of your Razorpay accounts:
- [ ] Payments and Route are enabled
- [ ] Send out an email to Razorpay Support to add `fintechprimitives.com` domain to the whitelisted domains/urls for your accounts. This is to ensure that the payments can be initiated from this domain.

**AMCs**

*Collection bank account details for each AMC that needs to be enabled*
- [ ] Bank name
- [ ] Account holder name
- [ ] Account number
- [ ] IFSC code

### Note(for BSE route users):
Once you have BSE credentials, please follow the following steps.

a. Download [BSE StarMF Member Admin Access Form](/going-live/BSE_StARMF_Member_Admin_Access_Forms.pdf ':ignore')<br>

b. Fill the form by following the below instructions.
  - `Kindly provide application access for below individual` : Mark `Addition` option
  - `Permission:` Check `Web service`
  - `Check Vendor(Specify)`
    - `Name` : CYBRILLA TECHNOLOGIES PVT LTD
    - `Product Name` : Fintech Primitives
    - `Product Version` : 1.0

c. Login to [BSE CRS Portal](https://bsecrs.bseindia.com/) and create a ticket to grant API Login and upload the form as an attachment in the ticket.

d. Once the API Login is granted, login to [BSE CRS Portal](https://bsecrs.bseindia.com/) again and create a ticket to disable authentication (Service Area: MF OPERATIONS, Type Of Complaint : Authentication, Complaint text : PLEASE EXCLUDE AUTHENTICATION FOR MANDATE_REG, MF_ORDER, RED_ORDER, XSIP_CAN_AUTH, XSIP_CANCEL, XSIP_REG, XSIP_REG_AUTH) and note down the ticket/complaint number.<br>

e. Write an email to BSE from your registered email id asking them to do the following. (Contact fpsupport@cybrilla.com for more details)
  - Member is using BSE StarMF Payment gateway API so don't want to send payment link to investor email. Please disable payment links
  - Member is using BSE StarMF API to create and authorize e-mandates. So, please disable communicating "BSE StarMF EMandate Authentication Link" via email.
  - Please disable UCC creation authentication
  - PLEASE EXCLUDE AUTHENTICATION FOR MANDATE_REG, MF_ORDER, RED_ORDER, XSIP_CAN_AUTH, XSIP_CANCEL, XSIP_REG, XSIP_REG_AUTH (We have already raised request for the same. Ticket/Complaint number: )

f. Share the credentials (MemberId, UserId and Password) with Cybrilla for configuration purposes.
