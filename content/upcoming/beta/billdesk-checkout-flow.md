
---
title: Billdesk payment checkout flow
---
## Billdesk payment checkout flow

This documentation will help you understand and utilize the functionalities of FP checkout page for Billdesk, enabling seamless payment experiences for investors.

## 2. Supported Payment Methods

FP checkout page supports different payment methods based on the investor's device:

- **iOS:**
  - Netbanking
  - UPI Collect
  - UPI Intent via PhonePe, Paytm, Google Pay

- **Android:**
  - Netbanking
  - UPI Collect
  - UPI Intent via all UPI apps installed on the investor's phone

- **Desktop/Laptop:**
  - Netbanking
  - UPI Collect

## 3. Creating a Payment

To initiate a payment, follow these steps:

1. Make a request to the [Create Payment API](https://fintechprimitives.com/docs/api/#create-a-payment) with required parameters.
2. Upon successful API call, you will receive a response containing a token-URL.

### Receiving the Token-URL

If payment `method` parameter is passed as `NETBANKING`, the token-URL is redirected to the Investor's bank netbanking page. Else the Investor is redirected to the checkout page.


## 5. Payment Method Specifics

Here's how to use each payment method:

### Netbanking

- For iOS and Desktop/Laptop users:
  - Choose "Netbanking" as your payment method.
  - You will be redirected directly to the bank's page for further steps.

### UPI Collect

- For all supported devices:
  - Select "UPI Collect" as your payment method.
  - Follow the provided instructions to complete the UPI payment process.

### UPI Intent

- For iOS:
  - Choose "UPI Intent" and select the desired UPI app (PhonePe, Paytm, Google Pay).
  - You'll be directed to the selected app to complete the payment.
- For Android:
  - Choose "UPI Intent" and you'll be presented with options from all UPI apps on your device.


For any further assistance, reach out to our support team.

