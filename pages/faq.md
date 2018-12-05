## Frequently Asked Questions
----------------------------------
#### How can I keep my investors updated in case an order or payment fails or gets rejected?
> The payments API and orders API provide a status with the rejected reason which can be used to keep the end user informed about their payments or orders related queries.

#### Which API can be used to figure out if the order is lumpsum or SIP?
> The parameter “type” in the Get Orders API helps in indicating the same.

#### Is Mandate Id different from SIP Id?
> Yes. Mandate Id is a one time Id generated for each investor for payments. SIP Id is related to the actual SIP order placed through the system.

#### Is there a need to create multiple mandate id’s?
> No. The same mandate Id can be used for different SIP orders for an investor, subject to the mandate amount provided by the investor.

#### What is the installment parameter in Create SIP order API used for?
> It’s the number of instalments the SIP should run for. For a monthly SIP order, its the number of months the SIP should run for.

#### How do I get the payment mode for a particular order?
> An API provides the payment mode for a particular order. The details of the same shall be updated soon.

#### How do I get current value of funds and invested value? > Is it available for all orders or only successful orders?
> It is available for successful orders only. Using investment account holdings API

#### How do I come to know if a transaction has failed?
> Get Orders API with state = failed

#### What is the schedule for payment report?
> The payment report is sent at 10 AM and 1 PM.
The confirmation upload for the same is at 5 PM.

#### How many times does the reverse feed come in a day?
> Once a day.

#### How do we get a confirmation about SIP?
> Get Orders API

#### Are there any escalations from RTA? > How does Cybrilla handle them?
> None that has happened in our experience. In case something happens, they will be handled through a manual intervention by the Operations team.

#### Which part of the Operations process is most susceptible to failure or exceptions?
> Reverse feeds - In the case of exceptions, they are handled through a manual intervention by the Operations team.
UTR report - If an API is available from the payment gateway, then it is easier to track all details. In the case of a payment gateway like TPSL, exceptions are handled through a manual intervention by the Operations team.

#### Do you integrate with Winsoft?
> We currently do not offer any integrations with Winsoft.

#### How do we get operations related details?
> Operations API’s will soon be available respectively.
