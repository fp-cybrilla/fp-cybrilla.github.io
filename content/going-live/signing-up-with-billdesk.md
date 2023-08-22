---
title: Signing up with BillDesk
---
## Signing up with BillDesk

**Action items**
- Ensure the following:
    - You have received `Merchant ID` and `Client ID` for V2 APIs.
    - FintectPrimitives IP addresses is whitelisted.
    - FintechPrimitives webhook URLs are whitelisted.
    - FintechPrimitives authentication certificates are shared with Billdesk.
    - Auto-refund flag is enabled.



#### BillDesk FAQs
*What is the difference between V1 APIs and V2 APIs?*<br>
V1 APIs from BillDesk let you use a cart for payments using Netbanking and UPI. However, they do not include eNACH mandate functionality. In contrast, V2 APIs support UPI intent features but do not provide cart functionality.

*Does BillDesk support Third Party Validation(TPV)?*<br>
BillDesk supports Third Party Validation(TPV) for Netbanking, UPI and eNACH mandate methods.

*Why is Third Party Validation(TPV) required?*<br>
In order to reduce the risks like cybercrimes, money laundering etc, SEBI has mandated that all payments must be made by investors exclusively from the pre-registered bank accounts. To ensure this, you need Third Party Validation(TPV). 

*What is auto-refund flag?*<br>
In cases of late authorisation of payments, if the auto-refund flag is enabled, Billdesk automatically refunds the money to the investor if the payment is not moved to `SUCCESS` before T+1 working day 6am. Else the payment can be in `PENDING` state upto 5 working days.
