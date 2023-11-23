---
title: FAQs
---
## FAQs

<br/>

::AccordionItem

:::AccordionTitle When making a payment, can investor use any one of the bank account or only the bank account set in folio defaults?

::::AccordionContent

Any of the bank accounts associated with the investor can be used for [creating a payment](https://fintechprimitives.com/docs/api/#create-a-payment). Please ensure you have verified that the bank account belongs to your investor before making any payments.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Is it possible to change the branding\theme of payment checkout page received in token url?

::::AccordionContent

Currently, FP only supports customization of checkout page for Razorpay by using [SDK options](https://docs.fintechprimitives.com/payments/Razorpay-SDK-options/).

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle What is the procedure to enable Razorpay SDK options for payments?

::::AccordionContent

You can reach out to fpsupport@cybrilla.com to enable Razorpay SDK for your FP account.

::::EndAccordionContent

::EndAccordionItem


::AccordionItem

:::AccordionTitle After a successful payment, can I pay for the same order ID again?

::::AccordionContent

No. You can create multiple payments against an AMC order ID as long as the order is in `pending` state in RTA gateway and `confirmed` state in BSE gateway.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle If payment fails for a purchase, what are the steps to re-initiate the payment process?

::::AccordionContent

You can use the [Retry API](#https://fintechprimitives.com/docs/api/#retry-mf-purchase) to change the order state from `failed` to `pending` and you can re-initiate the payment process for the order.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle How long does it take for the payment to move from `pending` to `approved` state?

::::AccordionContent

If the payment is successfully processed, payment state will move from `pending` to `successful` almost instantly. It may take an additional T+1 days for the payment to change from `successful` to `approved` state.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle What will happen to a SIP installment if the payment gets failed?

::::AccordionContent

If the payment gets failed for an installment, SIP installment will be marked as failed. SIP will continue to work as scheduled.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle In case the payment fails after the amount gets deducted from the investor’s bank account,where will the reversal gets credited?

::::AccordionContent

The amount will be credited back to the original payment source through which payment was done.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can investor place an order with a pending eNACH mandate?

::::AccordionContent

Purchase plans can be created using a pending eNACH mandate. The installments of the plan will not be generated unless the mandate is moved to approved state.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can investor make a recurring payment using UPI ?

::::AccordionContent

Currently, FP allows UPI Autopay for Razorpay as payment provider only.

::::EndAccordionContent

::EndAccordionItem


<br>
<hr/>

If you have any other questions, feel free to drop an email to [FP Support](https://fintechprimitives.com/sales.html) and we would get back to you at the earliest.

