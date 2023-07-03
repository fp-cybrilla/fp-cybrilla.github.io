---
title: FAQs
---
## FAQs

<br/>


::AccordionItem

:::AccordionTitle How to collect payments using e-mandate?

::::AccordionContent

For more detailed information on collecting payments using e-mandate, please check [here](https://docs.fintechprimitives.com/payments/payment-via-eNACH/).

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can investor make a payment for an eNACH-mandate using debit/credit card?

::::AccordionContent

No. According to SEBI regulations, payments for mutual funds cannot be made using credit/debit card and all investments must be made through Investor's verified bank account.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can investor make a recurring payment using UPI ?

::::AccordionContent

Currently, FP only allows UPI payments only for one-time purchases and does not support UPI for recurring purchases.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Are there any web hooks for payments?

::::AccordionContent

Currently No. However, we are actively working on developing them.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle After a successful payment can I generate payment again for the same order ID?

::::AccordionContent

No. Only one payment can be generated per one order ID.

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

T+1 working days.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle What to do if in any case the amount gets deducted from investor’s bank account but doesn’t get transferred to AMC’s bank account?

::::AccordionContent

If the amount doesn't get transferred to AMC's bank account, FP coordinates with the payment aggregator to get the transfer initiated. You can reach out to FP support team for assistance.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle What to do if amount gets deducted twice from the investor’s account?

::::AccordionContent

If the amount is deducted twice, which means that duplicate order IDs were created for the payment, and the amount has been transferred to the fund house. FP takes the necessary steps to coordinate with the fund house and get the amount refunded to the investor. In this case, you can reach out to FP support team for assistance.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle A payment is marked as failed but money is debited from the investors account? What do I do?

::::AccordionContent

If a payment is marked as `failed` and money is debited from investors account, it could be due to inactivity or delayed realisation. You can reach out to FP support team for assistance.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Do I need to ask FP to setup SDK options in payment response?

::::AccordionContent

Yes. Please reach out to FP support team for assistance.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can I change the theme of web page received in token url?

::::AccordionContent

No, It is not currently possible to change the theme of the web page. However if you are using razorpay, you can use the SDK options to customise the [checkout page](https://docs.fintechprimitives.com/payments/Razorpay-SDK-options/).

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle What will happen to my SIP order if the payment gets failed for the installment?

::::AccordionContent

If the payment gets failed for an installment, SIP order will be marked as failed.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Is there a web SDK for Bill Desk/BSE like razorpay?

::::AccordionContent

No. Currently we only support Razorpay.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle When making a payment can I use any one of my bank account or only the default bank account?

::::AccordionContent

You can use any of the investor's verified bank accounts for making a payment.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle In case the payment fails after the amount gets deducted from the investor’s bank account. Where will the reversal gets credited? Will it be the original payment source or the bank account mentioned in the folio?

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


<br>
<hr/>

If you have any other questions, feel free to drop an email to [FP Support](https://fintechprimitives.com/sales.html) and we would get back to you at the earliest.

