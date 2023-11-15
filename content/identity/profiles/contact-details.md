---
title: Contact Details
---
## Contact Details
#### Capture and store your investor's contact details

>Works with
- Individal Investor Profile
- Non Individual Investor Profile

#### Addresses

You can store an Indian or overseas address for a Investor. If your country is set to INDIA then your postal code would be checked, the state and city values would be auto filled accordingly. You cannot enter the city or state not matching to the postal code if the country is set to INDIA.

To capture an address, call [FPDocs, create address](https://fintechprimitives.com/docs/api/#create-an-address) with the below json

Sample Request
```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "line1": "342, 2nd main, 1st crosss",
  "country": "IN",
  "postal_code": "560078"
}
```

You can use modify a address API to add not mandatory attributes that are line2 and line3 if you have not added it before.

---

#### Phone numbers

You can add both Indian and international phone numbers for an investor profile. These phone numbers could belong to the investor or some other relative. you can set the belongs_to parameter to available values to define whom the number belongs to.

You can create a phone number object by calling [phone numbers](https://fintechprimitives.com/docs/api/#phone-numbers) API with below json request

Sample Request
```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "isd": "91",
  "number": "9012893478"
}
```

You could add the belongs_to with modify phone number API.

---

#### Email addresses

The email entered should be a valid email. These emails could belong to the investor or some other relative. you can set the belongs_to parameter to available values to define whom the email belongs to.

You can create a email object by calling [email address](https://fintechprimitives.com/docs/api/#email-addresses) API with below json request

Sample Request
```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "email": "abc@cybrilla.com"
}
```

You could add the belongs_to with modify email API