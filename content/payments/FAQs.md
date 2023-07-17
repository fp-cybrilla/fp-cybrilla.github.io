---
title: FAQs
---
## FAQs

<br/>

::AccordionItem

:::AccordionTitle When making a payment, can I use any one of my bank account or only the default bank account?

::::AccordionContent

Any of the investor's verified bank accounts can be used for [creating a payment](https://fintechprimitives.com/docs/api/#create-a-payment) by passing bank account id as a parameter.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can I change the theme of web page received in token url?

::::AccordionContent

Currently, FP only supports customization of checkout page for razorpay as a payment gateway by using [SDK options](https://docs.fintechprimitives.com/payments/Razorpay-SDK-options/).

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle How do i enable Razorpay SDK options in payment response?

::::AccordionContent

You can reach out to FP support team for setting up SDK options.

::::EndAccordionContent

::EndAccordionItem


::AccordionItem

:::AccordionTitle After a successful payment, can I generate payment again for the same order ID?

::::AccordionContent

You can create multiple payments against an AMC order ID as long as the order is in `pending` state in RTA gateway and `confirmed` state in BSE gateway.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle If payment fails for a purchase, what are the steps to re-initiate the payment process?

::::AccordionContent

You can use the [Retry API](#https://fintechprimitives.com/docs/api/#retry-mf-purchase) to change the order state from `failed` to `pending` and you can re-initiate the payment process for the order.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle How long does it take generally for the payment to move from `pending` to `approved` state?

::::AccordionContent

If the payment is successfully processed, payment state will move from `pending` to `successful` almost instantly. It may take an additional T+1 days for the payment to change from `successful` to `approved` state.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle What to do if in any case, the amount gets deducted from investor’s bank account but doesn’t get transferred to AMC’s bank account?

::::AccordionContent

If the amount doesn't get transferred to AMC's bank account, FP coordinates with the payment aggregator to get the transfer initiated. You can reach out to FP support team for assistance.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle A payment is marked as failed but money is debited from the investors account? What do I do?

::::AccordionContent

If a payment is marked as `failed` and money is debited from investors account, it could be due to inactivity or delayed realisation of payment. You can reach out to FP support team for assistance.

::::EndAccordionContent

::EndAccordionItem


::AccordionItem

:::AccordionTitle What will happen to my SIP order if the payment gets failed for the installment?

::::AccordionContent

If the payment gets failed for an installment, SIP order will be marked as failed.

::::EndAccordionContent

::EndAccordionItem



::AccordionItem

:::AccordionTitle In case the payment fails after the amount gets deducted from the investor’s bank account,where will the reversal gets credited? Will it be the original payment source or the bank account mentioned in the folio?

::::AccordionContent

The amount will be credited back to the original payment source through which payment is done.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can I place an order with a pending eNACH mandate?

::::AccordionContent

Transaction plans can be created using a pending eNACH mandate. The installment will not be generated unless the mandate is moved to the approved state.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can investor make a recurring payment using UPI ?

::::AccordionContent

Currently, FP allows UPI payments only for one-time purchases and does not support UPI for recurring purchases. We are currently working on adding UPI Autopay functionality to FP.

::::EndAccordionContent

::EndAccordionItem


<br>
<hr/>

If you have any other questions, feel free to drop an email to [FP Support](https://fintechprimitives.com/sales.html) and we would get back to you at the earliest.

