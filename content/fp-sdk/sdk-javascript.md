### `closed-beta` Installation

`npm install --save @fintechprimitives/fpapi`

or

`yarn add @fintechprimitives/fpapi`

----------------------------------------

### Usage

The general idea is that you create a `fp instance` with `new FP({options})` which you can use to call the APIs.

Intialise the config object with the `hostUrl` and `token`, then make calls to respective api's.
Make sure you have a valid token before and recreate the client if the token is expired.

The resources can be accessed via this instance. Every resource method returns a promise.

For every 2xx response, the function will return the data and others errors will be thrown as javascript exceptions.

Each object will have a standard function names such as `create`, `fetch`, `fetchAll`.
Objects supports additional functions as applicable.


```
import { fp } from '@cybrilla/fpapi';

  //Create options required to initialize the `fp` instance.
  let options = {
    hostUrl: 'https://api.fintechprimitives.com/', //required
    token: '{{generated_token}}',
  };

  //Create fp instance
  const fpClient = new fp(options);

  //Using Asyc/Await
  try {
    const mfPurchase = await fpClient.mf_purchases().fetch("mfp_177177219f634373b01072986d2eea7d");
    const mfInvestmentAccount = await fpClient.mf_investment_accounts().fetch('mfia_88d32ec56554483c8ccc1fee6f7a1b57');
  } catch(err: any) {
    console.log('Error', err);
  }

  //Using Promises
  fpClient.investors().fetch(663)
    .then(data => {
      console.log(data);
    })
    .catch(e => console.log(e));

```



### Objects Supported:
The `fp` instance created supports the following objects

- `investors`
- `bank_accounts`
- `mf_investment_accounts`
- `mf_folios`
- `mf_purchases`
- `payments`
- `bank_account_verifications`
- `mf_redemptions`
- `sips`
- `mandates`

----------------------------
#### `investors`
Detail on the investor object [documentation](https://fintechprimitives.com/api/#investors)

| Method  | Description |
| -------- | -------- |
| `create` | Create an `investor`   |
| `fetch`   | Fetch `investor` object by ID   |
| `fetchAll`  | Search `investors`   |


#### `bank_accounts`
Detail on the `bank_accounts` object [documentation](https://fintechprimitives.com/docs/api/#bank-accounts-early-access)

| Method | Description |
| -------- | -------- |
| `create`   | Create an `bank_accounts` for an investor   |
| `fetch`    | Fetch `bank_accounts` object by ID   |
| `fetchAll` | Search `bank_accounts` objects   |

#### `mf_investment_accounts`
Detail on the `mf_investment_accounts` object [documentation](https://fintechprimitives.com/docs/api/#mf-investment-accounts)

| Method | Description |
| -------- | -------- |
| `create` | Create an `mf_investment_accounts` for an investor |
| `fetch`  | Fetch `mf_investment_accounts` object by ID |


#### `mf_folios`
Detail on the `mf_folios` object [documentation](https://fintechprimitives.com/docs/api/#mf-folios)

| Method | Description |
| -------- | -------- |
| `fetchAll`  | Search  `mf_folios` objects |


#### `mf_purchases`
Detail on the `mf_purchases` object [documentation](https://fintechprimitives.com/docs/api/#mf-purchases)

| Method | Description |
| -------- | -------- |
| `create`   | Create an `mf_purchases` object  |
| `fetch`    | Fetch `mf_purchases` object by ID   |
| `fetchAll` | Search `mf_purchases` objects   |
| `update` | Patch an `mf_purchases` object by ID |
| `retry` | Retry `mf_purchases` object by ID   |

------------------------


#### `payments`
Detail on the `payment` object [documentation](https://fintechprimitives.com/docs/api/#payments)

| Method | Description |
| -------- | -------- |
| `createNetbankingPayment`   | Create an `net_banking_payment` object  |
| `createNachPayment`   | Create an `nach_banking_payment` object  |
| `fetch`    | Fetch `payment` object by ID   |
| `fetchAll` | Search `payments` objects   |
| `postBackVerification` | Hash verification of post payment |


`PostBackVerification Usage`


```
const fpc = new fp(options);
  try{
    const data = await fpc.payments().postBackVerification({
      payment_id: '123',
      status: 'success',
      failure_reason: null,
      hash: '5fb75d03778ff65b5c34ed06a1b1e6d05eb4324f751aaa36e0c8878002b2a8b9',
      tenant: 'cyberion',
    });
    console.log(data)
  } catch (e: any) {
    console.log('error', e.error);
  }
```

Response

success:
```
  {
      payment_id: '123',
      status: 'success'
   }
 ```

  error:
  ```
    error {
            status: 400,
            message: 'The hash do not match, data has been tampered!!!'
          }
  ```

------------------------


#### `bank_account_verifications`
Detail on the `mf_purchases` object [documentation](https://fintechprimitives.com/docs/api/#bank-account-verification)

| Method | Description |
| -------- | -------- |
| `create`   | Create an `bank_account_verifications` object  |
| `fetch`    | Fetch `bank_account_verifications` object by ID   |
| `fetchAll` | Search `bank_account_verifications` objects   |

------------------------

#### `mf_redemptions`
Detail on the `mf_redemptions` object [documentation](https://fintechprimitives.com/docs/api/#mf-redemptions)

| Method | Description |
| -------- | -------- |
| `create`   | Create an `mf_redemptions` object  |
| `update`   | Create an `mf_redemptions` object by ID  |
| `fetch`    | Fetch `mf_redemptions` object by ID   |
| `fetchAll` | Search `mf_redemptions` objects   |

------------------------

#### `sips`
Detail on the `sips` object [documentation](https://fintechprimitives.com/docs/api/#sips)

| Method | Description |
| -------- | -------- |
| `create`   | Create an `sips` object  |
| `update`   | Create an `sips` object by ID  |
| `fetch`    | Fetch `sips` object by ID   |
| `fetchAll` | Search `sips` objects   |
| `fetchInstallmentsSip` | Retrieve all the installments of a particular SIP   |

------------------------

#### `mandates`
Detail on the `mandates` object [documentation](https://fintechprimitives.com/docs/api/#mandates)

| Method | Description |
| -------- | -------- |
| `create`   | Create an `mandates` object  |
| `fetch`    | Fetch `mandates` object by ID   |
| `fetchAll` | Search `mandates` objects   |
| `authorize` | Authorize the `mandate` order   |
| `cancel` | Cancel `mandate`   |

------------------------

### Utils
Apart from objects, SDK provides utility functions that can be used certain datapoints.
This functions can be called without initiaing the `fp` instance.

Each function will return a `boolean`.
#### Usage

```

  import { ValidatorUtil } from "@cybrilla/fpapi";

  console.log(ValidatorUtil.phoneNumber("9994000090"));
  console.log(ValidatorUtil.ifsc('SBIN00077395'))
  console.log(ValidatorUtil.aadhar('3345 3434 4545'))
```


| Method | parameters | Description |
| -------- | -------- | ------ |
| `phoneNumber`  | `phone_number` : string : mandatory , <br> `isd` : string : optional, default to `'91'` <br>  | `10` digit without spaces |
| `ifsc`    | `ifsc` : string: mandatory | 11-character code. <br> The first four alphabetic characters representing the bank name, and the last six character. <br>The fifth character is 0 |
| `aadhar` | `aadhar` : string : mandatory | 12 digits. Should not start with 0 and 1. Contains space after every 4 digits. No alphabets and special characters.|
| `bankAccountNumber` | `bankAccountNumber` : string : mandatory | Length could be between `9` and `18`. No alphabets supported |


