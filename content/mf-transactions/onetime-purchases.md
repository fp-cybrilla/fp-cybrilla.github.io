---
title: One time purchases
---
## One time purchases
#### Facilitate lumpsum investments for your investor

> ##### Ensure the following before placing a purchase order
> 1. Your investor is [kyc compliant](/identity/overview)
> 2. You have an [investment account created](/investment-account/overview) for your investor

#### 1. Get fund scheme details and check purchase eligibility 
Once you have decided to place a purchase order against a particular scheme, fetch the scheme details using the [FPDocs, Get fund scheme](https://fintechprimitives.com/docs/api/#fund-scheme), and ensure that the scheme is eligible for purchase. Here are the checks that you must do.

1. The scheme must be active (i.e. `active`=`true`) 
2. Lumpsum purchases must be allowed (i.e. `purchase_allowed`=`true`)
3. If a fresh purchase is being made, i.e. a purchase without providing a folio number, ensure that purchase amount is within the range of `min_initial_investment` and `max_initial_investment` and the denomination of the amount must be according to `initial_investment_multiples` of a scheme.
4. If an additional purchase is being made, i.e. a purchase in an existing folio, ensure that purchase amount is within the range of `min_additional_investment` and `max_additional_investment` and the denomination of the amount must be according to `additional_investment_multiples` of a scheme.


#### 2. Create a purchase order
FP uses `MF Purchase` object to represent all the mutual fund purchase orders. You need to create a `MF Purchase` as a first step for placing a one time purchase order.Call the [FPDocs, Create mf purchase](https://fintechprimitives.com/docs/api/#create-a-mf-purchase) with the following json. Use the investment account of the investor for whom you are placing the order for.

```json
{
  "mf_investment_account": "mfia_367a75826694614a539c0f82b196027",
  "scheme": "INF173K01FE6",
  "amount": 10000
}
```

A MF Purchase gets created for which you need to make a payment. Keep a note of the object `id` and `old_id`; you will need these for making payments and checking the status of the order later on.

```json
# Displaying only a part of the object(response) for brevity
{
  "object": "mf_purchase",
  "id": "mfp_177177219f634373b01072986d2eea7d",
  "old_id": 9123,
  "mf_investment_account": "mfia_367a75826694614a539c0f82b196027",
  "amount": 10000
}
```
**Note:** 
If you are placing a purchase order against an existing folio, you can also provide `folio_number` while creating a purchase order.

#### 3. Send OTP to mobile/email and obtain consent for nomination details before creating payment for new folio creation

**This step is applicable only for new folio creation. i.e. if it is a new investment under a new folio**

**For what purpose must the consent be taken?**

The investor has two options to manage nominations while creating a new folio.

1. Either provide nominee details (upto 3) OR
2. Opt out of nomination

Irrespective of the option chosen, obtaining consent from the investor for the nomination option is mandatory.

**How should consent be taken?**

If nominee details are provided, ensure that all the holders know their nomination preferences so that they can give consent.
1. Nominee Name
2. Nominee DOB (Mandatory & Applicable in case the Nominee is a Minor)
3. Allocation Percentage
4. Nominee Relationship
5. Name of the Guardian (Mandatory & Applicable in case the Nominee is a Minor) 
6. Guardian’s Relationship with Nominee (Mandatory & Applicable in case the Nominee is a Minor) 
7. Nominee Pan (Optional)

On the other hand, if nominee details are not provided, ensure that all holders know that they are opting out of the nomination facility.

- Send OTP to both Mobile number/Email address. This must be the mobile number/email address stored against the primary investor linked to the investment account associated with the purchase order. If there are multiple holders, send OTP to Mobile number/Email addresses of all holders.
- Accept OTP from all the holders and verify the OTP and ensure that the correct OTP is entered.
- Store all the consent-related information for audit purposes.

#### 4. Update the purchase order with investor consent
As per [SEBI regulations](https://www.sebi.gov.in/legal/circulars/sep-2022/two-factor-authentication-for-transactions-in-units-of-mutual-funds_63557.html), investor consent must be obtained by - 
1. Sending a One-Time Password to the investor at his/her email/phone number registered against the folio if a purchase order has been placed against a folio. Call the [Fetch folios](https://fintechprimitives.com/docs/api/#fetch-all-folios) API and fetch the email address and mobile number against the folio.
2. Sending a One-Time Password to the investor at his/her email/phone number available in the [Investor Object](https://fintechprimitives.com/docs/api/#investors) or the [Investor Profile](https://fintechprimitives.com/docs/api/#investor-profiles-early-access).

Once the consent has been collected, the email and mobile used to collect that consent needs to be added to the purchase object by using [FPDocs, Update a Purchase Order](https://fintechprimitives.com/docs/api/#update-a-mf-purchase).

> If the order gateway is `BSE`, you need to change the order state to `confirmed` along with the consent details using [FPDocs, Update a MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase). Once the order is `confirmed`, FP will try to submit the order to BSE asynchronously in the background. Once the order submission is successful, the purchase order state changes from `confirmed` to `submitted`. Please ensure that orders are in `submitted` state before you can accept payments. <br>

#### 5. Collect payments against purchase orders

<div class="tabs">
	<div class="tabs-bar">
		<div class="tabs-item active">
			<span class="inline md:hidden">Option 1</span> 
			<span class="hidden md:block">Collect amount via Netbanking/UPI</span>
		</div>
		<div class="tabs-item">
			<span class="inline md:hidden">Option 2</span> 
			<span class="hidden md:block">Collect amount via e-mandates</span>
		</div>
		<div class="tabs-item">
			<span class="inline md:hidden">Option 3</span> 
			<span class="hidden md:block">Collect payments without FP</span>
		</div>
	</div>
	<div class="tabs-content">
		<div class="tab-pane">
		<h4 class="block md:hidden mt-0">Collect amount via Netbanking/UPI</h4> 
		<p>
				To make a payment using internet banking or upi, make a request to
				<a
					href="https://fintechprimitives.com/api/#create-a-payment"
					title=""
					class="api-link
						inline-flex
						items-center hover:text-primary-B110
						rounded-5
					"
					target="_blank"
				>
					Create payment
				</a>
				with the following json. Use the order's <code class="prettyprint">old_id</code> from the
				previous step. Use the <code class="prettyprint">id</code> of the bank account belonging to
				the investor, with which you want him to make the payment. You can provide multiple order ids of `pending` purchase orders created against the same investment account and create a single payment.
			</p>
			<div class="highlight">
				<pre class="highlight json"><code><span class="p">{</span><span class="w">
  </span><span class="nl">"amc_order_ids"</span><span class="p">:</span><span class="w"> </span><span class="p">[</span><span class="mi">9123</span><span class="p">],</span><span class="w">
  </span><span class="nl">"bank_account_id"</span><span class="p">:</span><span class="w"> </span><span class="mi">23</span><span class="w">
</span><span class="p">}</span><span class="w">
</span></code></pre>
			</div>
			<p>
				Look for <code class="prettyprint">token_url</code> in the response and redirect your
				investor to it to complete his payment. After your investor finishes the payment, FP
				redirects him to the postback URL configured on your account or to the
				<code class="prettyprint">payment_postback_url</code> provided in the request. You'll
				receive <code class="prettyprint">success</code> or
				<code class="prettyprint">failure</code> in the
				<code class="prettyprint">status</code> param. As a good security practice, do not
				completely rely on the <code class="prettyprint">status</code> received in the postback
				call. Instead check the status of the payment from your server before giving a final
				confirmation to your investor.<br />
				<a href="/payments/payment-states" title="">Learn more about payment states</a>.
				<br>
				Upon successful payment collection, the orders willl be marked as <code class="prettyprint">confirmed</code> if the gateway is <code class="prettyprint">rta</code> and orders will be submitted to order gateway eventually for further processing.
			</p>
		</div>

		<div class="tab-pane">
		<h4 class="block md:hidden mt-0">Collect amount via e-mandates</h4> 
		<p>
				To make a payment against one-time RTA purchase orders using e-mandates, make a request to
				<a
					href="https://fintechprimitives.com/docs/api/#create-a-nach-payment"
					title=""
					class="api-link
						inline-flex
						items-center hover:text-primary-B110
						rounded-5
					"
					target="_blank"
				>
					Create a NACH payment
				</a>
				with the following json. Use the order's <code class="prettyprint">old_id</code> from the
				previous step. Use the <code class="prettyprint">id</code> of the mandate belonging to
				the investor, with which you want the investor to make the payment.
			</p>
			<div class="highlight">
				<pre class="highlight json"><code><span class="p">{</span><span class="w">
  </span><span class="nl">"mandate_id"</span><span class="p">:</span><span class="w"> </span><span class="mi">23</span><span class="w">
  </span><span class="nl">"amc_order_ids"</span><span class="p">:</span><span class="w"> </span><span class="p">[</span><span class="mi">9123</span><span class="p">],</span><span class="w">
</span><span class="p">}</span><span class="w">
</span></code></pre>
			</div>
			<p>
				For more details, please check this <a href="/payments/collect-payment-via-mandates" title="">link</a>.Upon successful payment collection, the orders willl be marked as <code class="prettyprint">confirmed</code> if the gateway is <code class="prettyprint">rta</code> and orders will be submitted to order gateway eventually for further processing.
			</p>
		</div>

		<div class="tab-pane">
		<h4 class="block md:hidden mt-0">Collect payments on your own.</h4> 
			<p>
				After you have collected the money from your investor and initiated a transfer of that amount to AMC's bank account, provide the transfer details using the
				<a
					href="https://fintechprimitives.com/docs/api/#create-a-mf-settlement-detail"
					title=""
					class="api-link
						inline-flex
						items-center hover:text-primary-B110
						rounded-5
					"
					target="_blank"
				>
					Create a MF Settlement Detail
					
				</a>
				with the following json:
			</p>
			<div class="highlight">
				<pre class="highlight json"><code><span class="p">{</span><span class="w">
  </span><span class="nl">"mf_purchase"</span><span class="p">:</span><span class="w"> </span><span class="s2">"mfp_177177219f634373b01072986d2eea7d"</span><span class="p">,</span><span class="w">
  </span><span class="nl">"payment_type"</span><span class="p">:</span><span class="w"> </span><span class="s2">"netbanking"</span><span class="w"><span class="p">,</span><span class="w">
  </span><span class="nl">"bank_account_number"</span><span class="p">:</span><span class="w"> </span><span class="s2">"999900002222"</span><span class="w"><span class="p">,</span><span class="w">
</span><span class="nl">"bank_ifsc"</span><span class="p">:</span><span class="w"> </span><span class="s2">"UTIB0003098"</span><span class="w"><span class="p">,</span><span class="w">
</span><span class="nl">"beneficiary_account_number"</span><span class="p">:</span><span class="w"> </span><span class="s2">"1233453"</span><span class="w"><span class="p">,</span><span class="w">
</span><span class="nl">"beneficiary_account_title"</span><span class="p">:</span><span class="w"> </span><span class="s2">"MF Collection A/c"</span><span class="w"><span class="p">,</span><span class="w">
</span><span class="nl">"beneficiary_bank_name"</span><span class="p">:</span><span class="w"> </span><span class="s2">"Amc Bank Name"</span><span class="w"> 
</span><span class="p">}</span><span class="w">
</span></code></pre>
			</div>
			<h4 class="block md:hidden mt-0">Collect payments on your own</h4> 
			<p>
				Once you provided the transfer initiation details, confirm the purchase order by calling
				the
				<a
					href="https://fintechprimitives.com/docs/api/#update-a-mf-purchase"
					title=""
					class="api-link
						inline-flex
						items-center hover:text-primary-B110
						rounded-5
					"
					target="_blank"
				>
					Update mf purchase
					
				</a>
				with the following json:
			</p>
			<div class="highlight">
				<pre class="highlight json"><code><span class="p">{</span><span class="w">
  </span><span class="nl">"id"</span><span class="p">:</span><span class="w"> </span><span class="s2">"mfp_177177219f634373b01072986d2eea7d"</span><span class="p">,</span><span class="w">
  </span><span class="nl">"state"</span><span class="p">:</span><span class="w"> </span><span class="s2">"confirmed"</span><span class="w">
</span><span class="p">}</span><span class="w">
</span></code></pre>
			</div>

		</div>
	</div>
</div>

<!-- 
**Option 1:** *You are using FP payment APIs*  
To make a payment using internet banking or upi, make a request to [FPDocs, create payment](https://fintechprimitives.com/api/#create-a-payment) with the following json. Use the order's `old_id` from the previous step. Use the `id` of the bank account belonging to the investor, with which you want him to make the payment.

```json
{
  "amc_order_ids": [9123],
  "bank_account_id": 23
}
```

Look for `token_url` in the response and redirect your investor to it to complete his payment. After your investor finishes the payment, FP redirects him to the postback URL configured on your account or to the `payment_postback_url` provided in the request. You'll receive `success` or `failure` in the `status` param. As a good security practice, do not completely rely on the `status` received in the postback call. Instead check the status of the payment from your server before giving a final confirmation to your investor.  
[Learn more about payment states](/pages/workflows/payment-status).

**Option 2:** *You are using FPDocs payment providers directly*  
After you have collected the money from your investor, confirm the purchase order by calling the [FPDocs, update mf purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase) with the following json:

```json
{
  "id": "mfp_177177219f634373b01072986d2eea7d",
  "state": "confirmed"
}
```

After the money is settled into the scheme's bank account, call the [FPDocs, create mf settlement detail](https://fintechprimitives.com/docs/api/#create-a-mf-settlement-detail) to give us the settlement details so we can reconcile the order with the money received. You need to send the following details about the settlement:

```json
{
  "mf_purchase": "mfp_177177219f634373b01072986d2eea7d",
  "payment_type": "netbanking",
  "utr_no": "889121212",
  "bank_account_no": "18603051137433",
  "beneficiary_account_no": "1143005051340",
  "beneficiary_account_title": "AMC Mutual Fund Pool AC",
  "settlement_processed_at": "2020-04-09T12:00:09"
}
``` -->

#### 5. Track the order
Once the payment collection is successful, you don't have to take further actions. After the order is processed successfully (typically takes one day) - units are allotted and the object state will move to `successful`.  You can track a single purchase order using [FPDocs, fetch mf purchase](https://fintechprimitives.com/docs/api/#fetch-a-mf-purchase) to check the `state` of the order or you can check the status of multiple orders at once using [FPDocs, MF Purchase List](https://fintechprimitives.com/docs/api/#mf-purchase-list-report) API. 

For a successful order, review the following key attributes of the `mf_purchase` object:  
`allotted_units`: the number of units issued for the purchase amount  
`purchased_price`: the price per unit at which the units are issued  
`folio_number`: the folio (aka mutual fund account) in which the units are issued. You'll need this to place additional purchases and redemption orders

### Testing

In sandbox, use the [FPDocs, simulation](https://fintechprimitives.com/docs/api/#simulation) to simulate `successful` and `failed` orders to help you during the integration process. Use the following json to simulate the order to `successful` state.

```json
{
  "status": "SUCCESSFUL"
}
```
A testing folio number is issued during simulation, which you can use to place additional purchase orders or redemption orders.

### Try APIs with javascript SDK

#### 1. Create a purchase order

#### Fund Scheme

```javascript

/**
 * @param string isin
 **/
fpClient.master_data().fetchScheme("INF173K01FE6")
```

[FPDocs, Fund Scheme reference](https://fintechprimitives.com/docs/api/#fund-scheme)

#### Create a MF Purchase

```javascript

/**
 * @param MfPurchaseCreateRequest object
 */
fpClient.mf_purchases().create({
    mf_investment_account: "mfia_367a75826694614a539c0f82b196027",
    scheme: "INF173K01FE6",
    amount: 10000,
})
```

[FPDocs, Create a MF Purchase reference](https://fintechprimitives.com/docs/api/#create-a-mf-purchase)

#### 2. Fetch investor contact details (to be used to collect consent for purchase order) from the folio

**This step is applicable only for purchase order placed against an existing folio.**

```javascript

/**
 * @param string folio_number
 **/
fpClient.mf_folios().fetchAll({ folio_number: "15075102" })
```

[FPDocs, Fetch all folios reference](https://fintechprimitives.com/docs/api/#fetch-all-folios)

[FPDocs, Sandbox testing reference](https://fintechprimitives.com/docs/api/#testing-fetch-all-folios-api-in-sandbox)


#### 3. Update the MF Purchase with the investor consent details

If the order gateway is RTA, you only need to add the consent details while updating the order.
```javascript
/**
 * @param MfPurchasePatchRequest object
 */
fpClient.mf_purchases().update({
    id: "mfp_177177219f634373b01072986d2eea7d",
    "consent": {
    "email": "mfp@cybrilla.com",
    "isd_code": "91",
    "mobile": "9008580644"
  }
})
```

If the order gateway is `BSE`, you need to change the order state to `confirmed` along with the consent details.
```javascript
/**
 * @param MfPurchasePatchRequest object
 */
fpClient.mf_purchases().update({
    id: "mfp_177177219f634373b01072986d2eea7d",
	state: "confirmed"
    "consent": {
    "email": "mfp@cybrilla.com",
    "isd_code": "91",
    "mobile": "9008580644"
  }
})
```


#### 4. Make payment

#### 4.1. You are using FP payment APIs

#### Create a payment

**Before the payment is made, the channel partner need to make sure that the consent is obtained from the investors.**

```javascript

  /**
   * @param PaymentCreateRequest object
   */
fpClient.payments().createNetbankingPayment({
            "amc_order_ids": [9123],
            "bank_account_id": 23
            method: 'NETBANKING',
            payment_postback_url: "https://example.com/"
        })
```

[FPDocs, Create a payment reference](https://fintechprimitives.com/docs/api/#create-a-payment)

#### 4.2. You are using payment providers directly

#### Create a MF Settlement Detail

```javascript

/**
 * @param MfSettlementDetailCreateRequest object
 */
fpClient.mf_settlement_details().create({
    mf_purchase: "mfp_177177219f634373b01072986d2eea7d",
    payment_type: "netbanking",
    utr_number: "UTB123312",
    bank_account_number: "999900002222",
    bank_ifsc: "UTIB0003098",
    beneficiary_account_number: "1233453",
    beneficiary_account_title: "AMC Mutual Fund Pool AC",
    beneficiary_bank_name: "Amc Bank Name",
    settlement_processed_at: "2022-03-17T06:30:09+05:30",
})
```

[FPDocs, Create a MF Settlement Detail reference](https://fintechprimitives.com/docs/api/#create-a-mf-settlement-detail)

#### Update a MF Purchase

```javascript

/**
 * @param MfPurchasePatchRequest object
 */
fpClient.mf_purchases().update({
    id: "mfp_177177219f634373b01072986d2eea7d",
    state: "confirmed",
})
```

Please refer [FPDocs, Update a MF Purchase](https://fintechprimitives.com/docs/api/#update-a-mf-purchase)

#### 5. Track the order

#### Fetch a MF Purchase

```javascript

/**
 * @param id V2 or V1 id of the purchase order.
 */
fpClient.mf_purchases().fetch("mfp_177177219f634373b01072986d2eea7d")
```

[FPDocs, Fetch a MF Purchase reference](https://fintechprimitives.com/docs/api/#fetch-a-mf-purchase)
