---
title: One time purchases
---
## One time purchases
#### Facilitate lumpsum investments for your investor

> ##### Ensure the following before placing a purchase order
> 1. Your investor is [kyc compliant](/identity/overview)
> 2. You have an [investment account created](/mf-transactions/overview) for your investor

Once you have the investor and investment account created, follow the below steps to place a purchase order.  
1. Create a purchase order
2. Make payment
3. Check the order state

#### 1. Create a purchase order
Some funds are not allowed for purchases and some might temporarily stop accepting purchase orders. Make sure you check the `purchase_allowed` field is `true` for the fund scheme(s) you are placing the order for, using the [FPDocs, Get fund scheme](https://fintechprimitives.com/api/#get-single-fund-schemes-detail).

FP uses `MF Purchase` object to represent all the mutual fund purchase orders. You need to create a `MF Purchase` as a first step for placing a one time purchase order.

Call the [FPDocs, Create mf purchase](https://fintechprimitives.com/docs/api/#create-a-mf-purchase) with the following json. Use the investment account of the investor for whom you are placing the order for.

```json
{
  "mf_investment_account": "mfia_367a75826694614a539c0f82b196027",
  "scheme": "INF173K01FE6",
  "amount": 10000
}
```

A MF Purchase gets created for which you need to make a payment. Keep a note of the object `id` and `old_id`; you'll need these for making payments and checking the status of the order later on.

```json
# Displaying only a part of the object for brevity
{
  "object": "mf_purchase",
  "id": "mfp_177177219f634373b01072986d2eea7d",
  "old_id": 9123,
  "mf_investment_account": "mfia_367a75826694614a539c0f82b196027",
  "amount": 10000
}
```

#### 2. Make payment

You can use FP Payment APIs or work with payment providers directly to faciliate a payment for the order.

<div class="tabs">
	<div class="tabs-bar">
		<div class="tabs-item active">
			<span class="inline md:hidden">Option 1</span> 
			<span class="hidden md:block">You are using FP payment APIs</span>
		</div>
		<div class="tabs-item">
			<span class="inline md:hidden">Option 2</span> 
			<span class="hidden md:block">You are using payment providers directly</span>
		</div>
	</div>
	<div class="tabs-content">
		<div class="tab-pane">
		<h4 class="block md:hidden mt-0">You are using FP payment APIs</h4> 
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
				the investor, with which you want him to make the payment.
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
				<a href="/pages/workflows/payment-status" title="">Learn more about payment states</a>.
			</p>
		</div>

		<div class="tab-pane">
		<h4 class="block md:hidden mt-0">You are using payment providers directly</h4> 
			<p>
				After you have collected the money from your investor, confirm the purchase order by calling
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
			<p>
				After the money is settled into the scheme's bank account, call the
				<a
					href="https://fintechprimitives.com/docs/api/#create-a-mf-settlement-detail"
					title=""
					class="api-link
						inline-flex
						items-center
						hover:text-primary-B110
						rounded-5
					"
					target="_blank"
				>
					Create mf settlement detail
				</a>
				to give us the settlement details so we can reconcile the order with the money received. You
				need to send the following details about the settlement:
			</p>
			<div class="highlight">
				<pre class="highlight json"><code><span class="p">{</span><span class="w">
  </span><span class="nl">"mf_purchase"</span><span class="p">:</span><span class="w"> </span><span class="s2">"mfp_177177219f634373b01072986d2eea7d"</span><span class="p">,</span><span class="w">
  </span><span class="nl">"payment_type"</span><span class="p">:</span><span class="w"> </span><span class="s2">"netbanking"</span><span class="p">,</span><span class="w">
  </span><span class="nl">"utr_no"</span><span class="p">:</span><span class="w"> </span><span class="s2">"889121212"</span><span class="p">,</span><span class="w">
  </span><span class="nl">"bank_account_no"</span><span class="p">:</span><span class="w"> </span><span class="s2">"18603051137433"</span><span class="p">,</span><span class="w">
  </span><span class="nl">"beneficiary_account_no"</span><span class="p">:</span><span class="w"> </span><span class="s2">"1143005051340"</span><span class="p">,</span><span class="w">
  </span><span class="nl">"beneficiary_account_title"</span><span class="p">:</span><span class="w"> </span><span class="s2">"AMC Mutual Fund Pool AC"</span><span class="p">,</span><span class="w">
  </span><span class="nl">"settlement_processed_at"</span><span class="p">:</span><span class="w"> </span><span class="s2">"2020-04-09T12:00:09"</span><span class="w">
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

#### 3. Track the order

Call the [FPDocs, fetch mf purchase](https://fintechprimitives.com/docs/api/#fetch-a-mf-purchase) to check the `state` of the order.  
When the payment is successful, the order state becomes `confirmed`. [Learn more about the order states](/mf-transactions/order-states)


### Order Processing

Orders in `confirmed` state will be sent for processing and the object state will move to `submitted`. After the order is processed successfully (typically takes one day) - units are allotted and the object state will move to `successful`.  
For a successful order, review the following key attributes of the `mf_purchase` object:  
`allotted_units`: the number of units issued for the purchase amount  
`purchased_price`: the price per unit at which the units are issued  
`folio_number`: the folio (aka mutual fund account) in which the units are issued. You'll need this to place additional purchases and redemption orders

### Testing

In sandbox, use the [FPDocs, simulation](https://fintechprimitives.com/api/#post-order-simulation) to simulate `successful` and `failed` orders to help you during the integration process. Use the following json to simulate the order to `successful` state.

```json
{
  "status": "SUCCESSFUL"
}
```
A testing folio number is issued during simulation, which you can use to place additional purchase orders or redemption orders.