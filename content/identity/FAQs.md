---
title: FAQs
---
## FAQs

<br/>

:Accordion

::AccordionItem

:::AccordionTitle Who can make use of the KYC Status Check APIs on FP?

::::AccordionContent

Any partner with an ARN / RIA / AMC licence can make use of these APIs.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle What are the differences between checking a KYC status and fetching the KYC data features offered by FP?

::::AccordionContent

- ***Status Check*** - You can only get to know if the investor is KYC compliant or not by entering his / her PAN number as an input. This would also return you the name registered against that PAN.

- ***Fetching data from KRAs*** - This is an extended version of the above mentioned feature. This would require the investor's date of birth as an additional parameter with the PAN number as a part of the input. The response would contain the KYC status and the demographic information of the user such as identity, address and contact details as explained [here](https://docs.fintechprimitives.com/identity/kyc-check). Please note that these details can be fetched only if the investor is KYC compliant.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Who can make use of FPs capability to fetch data from KRA databases?

::::AccordionContent

Only SEBI registered entities (like RIA / AMC / etc) can get an access to fetch the KYC data present on KRA databases. However, the entities (with an ARN licence) who are registered with AMFI cannot avail this feature.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle If we are a SEBI registered entity and we get an access to fetching the KRA data, should we still make two separate API calls to check status and to fetch the data?

::::AccordionContent

No, fetching the data would also return the status of the KYC holder.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle When can a KYC request object creation fail?

::::AccordionContent

- If the authentication token is invalid, you would not be able to access this API
- If the mandatory fields to create a KYC request object are not given during creation of the KYC request object, the API call would not return a success response. You can refer to [this](https://fintechprimitives.com/docs/api/#create-a-kyc-request) API for more information
- If validations are not handled or data correctness is not ensured, a KYC request object creation can fail

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can I submit a KYC applications for investors who belong to NRI / Minor / other categories of `residential_status`?

::::AccordionContent

No

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle How do I get to know about the status changes?

::::AccordionContent

Currently, you have to poll the [Fetch a KYC Request](https://fintechprimitives.com/docs/api/#fetch-a-kyc-request) API to check the status of a KYC request object.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Are there any webhooks available?

::::AccordionContent

Yes

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Are all the fields mentioned in the Create a KYC request API required to submit a KYC application?

::::AccordionContent

Create a KYC request API taken 5 inputs as a mandatory requirement to create a KYC request object. This does not mean that only these 5 inputs are sufficient to submit a KYC application. All the details mentioned [here](https://docs.fintechprimitives.com/identity/required-information/) are needed to submit a KYC application.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Does FP offer a feature to prefill relevant data after scanning/uploading documents?

::::AccordionContent

No

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Is last 4 digits of Aadhaar number mandatory to submit a KYC request? 

::::AccordionContent

Yes

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can Aadhaar be used as POA while submitting a KYC request?

::::AccordionContent

Yes. Please check [here](https://docs.fintechprimitives.com/upcoming/beta/aadhaar-as-poa/) for more details on the same.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle What is the recommended way to collect details inorder to reduce overall TAT?

::::AccordionContent

You need to collect 5 mandatory inputs to create a KYC request object. The other inputs can be collected incrementally. However, bank account details are verified asynchronously against the cancelled cheque that is submitted. Hence, it is recommended to collect bank account details as early as possible to reduce any overall delay.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle In a KYC submission, how can I know if the bank account details are successfully verified or not?

::::AccordionContent

If the bank account is not successfully verified, the KYC request object would change its status to `rejected`, indicating the corresponding reason as well. If it is successfully verified, the status would be changed to `esign_required` once all the inputs are collected.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can we use pennydrop instead of a cancelled cheque for bank account verification during KYC request submission?

::::AccordionContent

No

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Do I need to strictly adhere to the file size constraints while uploading?

::::AccordionContent

Yes

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can KYC applications without e-sign be submitted?

::::AccordionContent

No

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle How do I know when to create an e-sign object?

::::AccordionContent

Whenever the status of a KYC request object is `esign_required`, you need to create an e-sign object against the same.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can I create multiple e-sign objects?

::::AccordionContent

Yes, only if the existing e-sign URL is no longer valid.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle While performing signature to submit a KYC application can I use a photo of a signature made on a paper instead of an e-sign?

::::AccordionContent

No

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle How can I come back to my app after finishing the e-sign?

::::AccordionContent

You would have to configure a `postback_url` while creating an e-sign object. The investor would be redirected to this URL post e-sign completion.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Does `successful` and `rejected` statuses mean a KYC application is verified at KRA?

::::AccordionContent

No. `successful` means that our AMC partner has successfully verified the KYC application and they have submitted it to the KRA for final verification. `rejected` means that the application could not be verified at our AMC partner's end and the same was not submitted to the KRA.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle How long does it take for a KYC request to move from `submitted` to `successful` or `rejected`?

::::AccordionContent

This would be processed by our AMC partner in 1-2 working days, on an average.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle If a KYC request is `rejected` or `expired`, can I edit and submit the same KYC request object again?

::::AccordionContent

No, you will have to create a new KYC request object and submit it for processing.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can I get to know if a KRA verified the KYC application that I submitted?

::::AccordionContent

No, currently KRAs do not have a way to track the submitted KYC applications. You can however check the KYC status using investor's PAN, which would indicate the status as present at the KRA.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle What happens if KRA rejects a KYC application?

::::AccordionContent

The investor will have to create a new KYC request object and submit the same.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Can investors use a bank account other than the bank account provided in the KYC application to make payments for purchasing Mutual fund scheme units?

::::AccordionContent

Yes. They can use bank accounts other than the bank account provided in the KYC application for making payments. However, it is the partner's responsibility to ensure that the bank account details are valid and they belong to the investor.

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle Should cancelled cheque be collected for bank accounts which are added post KYC application submission for making a transaction?

::::AccordionContent

No

::::EndAccordionContent

::EndAccordionItem

::AccordionItem

:::AccordionTitle If a customer submits bank account in the course of KYC application submission and if the penny drop validation is successful and if the KYC application is rejected because of some issues in the cancelled cheque, can that bank account be used for making payments?

::::AccordionContent

As long as it can be ensured that the bank account details are valid and belongs to the investor, that bank account can be used for making payments.

::::EndAccordionContent

::EndAccordionItem

:EndAccordion

<br>
<hr/>

If you have any other questions, feel free to drop an email to [FP Support](https://fintechprimitives.com/sales.html) and we would get back to you at the earliest.
