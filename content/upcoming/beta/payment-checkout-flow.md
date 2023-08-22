---
title: Payment checkout flow
---

## Payment checkout flow

This documentation will help you understand and utilize the functionalities of FP payment checkout flow

> This is supported only if payment provider is `Billdesk`

#### Supported Payment Methods

The FP checkout flow offers diverse payment methods tailored to the investor's device:

- **iOS mobile device**
  - Netbanking
  - UPI Collect
  - UPI Intent via PhonePe, Paytm, Google Pay

- **Android mobile device**
  - Netbanking
  - UPI Collect
  - UPI Intent via all UPI apps installed on the investor's mobile phone

- **Desktop/Laptop browsers**
  - Netbanking
  - UPI Collect

#### Creating a Payment

To initiate a payment, follow these steps:

1. Make a request to the [Create Payment API](https://fintechprimitives.com/docs/api/#create-a-payment).
2. Upon successful API call, you will receive a response with a token-URL.


> If payment `method` parameter is passed as `NETBANKING`, the token-URL will redirect investor to the bank's netbanking page. Else the investor is redirected to the FP payment checkout flow.


#### Payment Method Specifics

This section outlines the steps for each payment method in the payment checkout flow:

**Netbanking**

- For all devices
  - Choose "Netbanking" as payment method
  - Investor will be redirected directly to the bank's page to complete payment

**UPI Collect**

- For all devices
  - Select "UPI Collect" as payment method
  - Investor can enter VPA ID and follow the instructions provided to complete the payment

**UPI Intent**

- iOS mobile phone
  - Select "UPI Intent" and choose a UPI app which is installed on the device. Investor can choose from the available list of apps i.e `PhonePe`, `Paytm`, and `GooglePay`
  - Investor will be redirected to the selected app to complete the payment
- Android mobile device
  - Select "UPI Intent" to see a list of all UPI apps on installed the device
  - Upon selecting any app, investor will be redirected  to complete the payment



