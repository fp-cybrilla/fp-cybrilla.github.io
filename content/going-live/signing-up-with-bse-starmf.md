---
title: Signing up with BSE StarMF
---
## Signing up with BSE StarMF
#### Learn how to signup with BSE as a mutual fund distributor (MFD) and configure your account

**Action items**
- [ ] Become a member with BSE and obtain BSE credentials.
- [ ] Download [BSE StarMF Member Admin Access Form](/going-live/BSE_StARMF_Member_Admin_Access_Forms.pdf ':ignore')
- [ ] Fill the form by following the below instructions.
   - [ ] `Kindly provide application access for below individual` : Mark `Addition` option
   - [ ] `Permission:` Check `Web service`
   - [ ] `Check Vendor(Specify)`
      - `Name` : CYBRILLA TECHNOLOGIES PVT LTD
      - `Product Name` : Fintech Primitives
      - `Product Version` : 1.0
  - [ ] Login to [BSE CRS Portal](https://bsecrs.bseindia.com/) and create a ticket to grant API Login and upload the form as an attachment in the ticket.
- [ ] Once the API Login is granted, login to [BSE CRS Portal](https://bsecrs.bseindia.com/) again and create a ticket to disable authentication (Service Area: MF OPERATIONS, Type Of Complaint : Authentication, Complaint text : PLEASE EXCLUDE AUTHENTICATION FOR MANDATE_REG, MF_ORDER, RED_ORDER, XSIP_CAN_AUTH, XSIP_CANCEL, XSIP_REG, XSIP_REG_AUTH) and note down the ticket/complaint number.
- [ ] Write an email to BSE from your registered email id asking them to do the following:
  - Member is using BSE StarMF Payment gateway API so don't want to send payment link to investor email. Please disable payment links
  - Member is using BSE StarMF API to create and authorize e-mandates. So, please disable communicating "BSE StarMF EMandate Authentication Link" via email.
  - Please disable UCC creation authentication
  - PLEASE EXCLUDE AUTHENTICATION FOR MANDATE_REG, MF_ORDER, RED_ORDER, XSIP_CAN_AUTH, XSIP_CANCEL, XSIP_REG, XSIP_REG_AUTH (We have already raised request for the same. Ticket/Complaint number: *insert the ticket number from the previous step* )
- [ ] Share the credentials (MemberId, UserId and Password) with Cybrilla for configuration purposes.
- [ ] Ensure that AMCs whose schemes you wish to sell/advise are activated from BSE portal.(Admin->Member Masters->Member AMC mapping)