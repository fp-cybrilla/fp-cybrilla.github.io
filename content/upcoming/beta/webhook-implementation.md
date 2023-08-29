## Webhook notification for FP Events

### Get real-time updates by configuring webhook notifications

Webhook notifications enable you to listen to events on FP objects, so that your integration can automatically trigger reactions. Webhooks can notify your application on synchronous events like an investor placed an order, or completed a payment. It can also help listening to asynchronous events like a KYC request is verified at AMC partner or an order is successfully processed etc..

#### FP Events

Events are a way of letting you know when something interesting happens on the FP objects. When an event occurs, we create a new event object. If you have registered a webhook endpoint to receive that event, we send it to your endpoint as part of a POST request. Refer [FP events](https://fintechprimitives.com/docs/api/#event-object) which can be notified via webhooks


### Setup Webhook notification

Follow the below steps to configure a webhook notification, signature verification and handling failure & duplicate events

1. Identify the FP events you want to subscribe.
2. Create a webhook endpoint as an HTTPS endpoint (URL) on your application and make sure it is publicly accessible HTTPS URL
3. Use create webhook API to configure a webhook. You need to pass the webhook URL created in step 2 and the events identified in step 1
4. Handle incoming requests by parsing each event object and returning 2xx response status codes

Refer [Webhook object & APIs](https://fintechprimitives.com/docs/api/#webhook-notification-object) for more details

#### Verifying Webhooks using FP signature

FP signs the webhook notifications by including `FP-Signature` header. This allows you to verify that the events were sent by FP, not by any other party. 

> Note: Before you can verify the signature, you need to retrieve your secret via fpsupport@cybrilla.com. FP generates a unique secret key for your FP Account.

##### Verifying signatures manually

The FP-Signature header included in each signed notification contains an id and signature in format of `id:signature`.

`id` denotes which "secret" has been used to sign the payload. It's not necessary that you make use of `id` part, but it helps identify which secret has been used.

```
FP-Signature: ntwhsc_b33b694a02564a36a267d7cde4bfaf60:AlmqZKLKhx5hJJZakjHCx8oB87UFOzx32qMBHXYM06c=
```

In above example, `id` is `ntwhsc_b33b694a02564a36a267d7cde4bfaf60` and `signature` is `XlyiFuLJGaNo5WHbWvXO419sKxklNcMTN7ttN+D+F38=`

FP generates signatures using a hash-based message authentication code (HMAC) with SHA-256.

1. Extract the signature from the header
   * Split the header, using the `:` character as the separator, to get a list of elements.
2. Prepare the signed_payload string
   * The payload delivered to the webhook would be the "signed_payload".
3. Determine the expected signature
   * Compute an HMAC with the SHA256 hash function. Use the tenant webhook secret as the key, and use the signed_payload string as the message.
4. Compare the signature (or signatures) in the header to the expected signature.

If the signatures are same, you can trust the payload.

#### Sample Code for NodeJS

Following is a code snippet for nodejs, which can be used to verify the signature once you receive the event on your webhook endpoint. You can use this code as a reference to implement the same in your language of choice.

```js
const crypto = require("crypto");

// Function to extract signature from header
const extractSignature = (fpSignatureHeader) => {
  return fpSignatureHeader.split(":")[1];
};

// Function to generate signature using secret
const generateSignature = (payload, hmacKey) => {
  const hmac = crypto.createHmac("sha256", hmacKey);
  hmac.update(JSON.stringify(payload));
  const signature = hmac.digest("base64");
  return signature;
};

const deliveredPayload = {
  id: "evt_09ce44d58a1d4d428c4c0ab2bc1922af",
  object: "event",
  type: "mf_purchase.created",
  data: {
    object: {
      object: "mf_purchase",
      id: "mfp_6725d86d0d954af18beb7139cc6459e2",
      old_id: 15862,
      mf_investment_account: "mfia_c9e845d08b65469e92443b70d6041343",
      folio_number: null,
      state: "pending",
      amount: 5113,
      gateway: "rta",
      traded_on: null,
      scheduled_on: "2023-06-02",
      created_at: "2023-06-02T13:20:47+05:30",
      succeeded_at: null,
      submitted_at: null,
      reversed_at: null,
      failed_at: null,
      confirmed_at: null,
      retried_at: null,
      source_ref_id: null,
      user_ip: null,
      server_ip: "127.0.0.1",
      plan: null,
      initiated_by: null,
      initiated_via: null,
      euin: "E260421",
      partner: "ptnr_564c755d6c2341449654b2d46a70b1e0",
      failure_code: null,
      type: "purchase",
      scheme: "INF204K01943",
      allotted_units: null,
      purchased_amount: null,
      purchased_price: null,
    },
    previous_attributes: null,
  },
  time: "2023-06-02T13:20:47+0530",
};

// Extract signature from header
// Example - FP-Signature: ntwhsc_b33b694a02564a36a267d7cde4bfaf60:AlmqZKLKhx5hJJZakjHCx8oB87UFOzx32qMBHXYM06c=

const fpSignatureHeader = `ntwhsc_b33b694a02564a36a267d7cde4bfaf60:AlmqZKLKhx5hJJZakjHCx8oB87UFOzx32qMBHXYM06c=`;
const headerSignature = extractSignature(fpSignatureHeader);

// This is secret and unique for your integration (Get this from FP Team)
const hmacKey =
  "5d0c73ba258f0f7b5914fccccb57d6e3fe3935e24dcaf5ab4353d1e806de7e2f";
const generatedSignature = generateSignature(deliveredPayload, hmacKey);

console.log("Generated Signature:", generatedSignature);
console.log("Header Signature:", headerSignature);

if (generatedSignature === headerSignature) {
  console.log("----- Signatures Matched, You can TRUST ----");
} else {
  console.log("----- Signatures Didn't Match, Don't TRUST ----");
}
```

#### FP webhook notification delivery failure and retry mechanism

If the webhook notification does not deliver successfully in the first attempt then basis the responses recieved from the client application, further retry happens from FP. When FP calls the client application's webhook endpoint, it expects a 2XX response from the client application within timeout period of `3000 milliseconds`, else it assumed as failure and scheduled to retry.

FP attempts to deliver a webhook notification up to `5 times` with a delay of fixed interval. If the webhook notification is not acknowledged by your application after 5 attempts, the notification is not delivered further. If your endpoint has been disabled or deleted or is not functional when FP attempts a notification, future retries of the notification will be prevented.


| Type | Response from client application | Notification state | Retry webhook notification to client application?                                             |
| ---- | ----------------------- | --------------- | ------------------------------------------------------ |
| 1    | FP recieved 2XX         | Success         | No                                                     |
| 2    | FP recieved 4XX         | Failure         | No
| 3    | FP recieved 5XX         | Failure         | Retry until 5 times |
| 4    | FP recieved timeout     | Failure         | Retry until 5 times |


#### Handle duplicate events

Webhook endpoints might occasionally receive the same event more than once. For example, your application may have received an event via webhook notification, but did not acknowledge it within `timeout period` or with correct status. In this case. FP retry logic will kick-in and attempt to deliver the same notification again. We advise you to guard against duplicate event receipts by making your event processing `idempotent`. One way of doing this is logging the events you have processed, and skip an event processing basis the already logged events.

#### Order of events

FP does not guarantee delivery of events in the order in which they are generated on an object. Though most of the delivery is expected in-order, but in case of notification retry, there may be a possibility of out-of-orders events and duplicacy. 

In order to avoid issues because of out-of-orders events & duplicacy, we recommend below practises in the client application recieving the webhook notifications:

1. Store the events as soon as you receive in the client application
2. Return a 2XX code as quickly as possible
3. Process the events asynchronously over real-time
4. Use the attribute "time" in the event object and make sure the event delivered is later than the FP object you have created or updated. Consider an example that there is a MF purchase object, and you are maintaining the time when it's updated. In this case, you can compare if the "time" sent from event object is later than the MF purchase `created` or `last updated` time to decide whether to use the event notification.

Above steps not only would help you scale but also keep a log of changes to events. 

