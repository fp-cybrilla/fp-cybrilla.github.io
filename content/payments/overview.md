---
title: Overview
---
## Payments

FP payments APIs enable you to collect payments from your investors for their MF purchases. FP internally integrates with BSE, Billdesk, and Razorpay, providing simple-to-use APIs for your payment collection needs.


Currently, we support payment collection via the following modes:

|Payment gateway|Netbanking|UPI|eNACH Mandates| UPI Autopay|
|---|---|---|---|---|
|Razorpay|Supported|Supported|Supported|Supported|
|BSE|Supported|Supported|Supported(SIPs only)|Not Supported|
|BillDesk|Supported|Supported|Supported| Supported|

FP payment APIs support one-time payments via Netbanking, UPI, eNACH and UPI Autopay mandates, as well as recurring payments via eNACH and UPI Autopay mandates.


The FP payment API provides the following capabilities:

1. [Setup eNACH and UPI Autopay mandates](/payments/managing-eNACH/)
2. [Payments via Netbanking/UPI](/payments/payments-via-Netbanking-UPI/)
3. [Payments via eNACH and UPI Autopay Mandate](/payments/payment-via-eNACH/)


> Note: If you choose to collect payments on your own, you can use the [FPDocs, Settlement](https://fintechprimitives.com/docs/api/#mf-settlement-details) and provide the UTRN (Unique Transaction Reference Number) for the payments collected.

To sign up with the respective payment gateways, please refer to the following:

1. [Going Live with Razorpay](/going-live/signing-up-with-razorpay/)
2. [Going Live with Billdesk](/going-live/signing-up-with-billdesk/)

For any further assistance or queries, please feel free to reach out to us at [fpsupport@cybrilla.com](mailto:fpsupport@cybrilla.com).







