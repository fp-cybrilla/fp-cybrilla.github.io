---
title: Related Parties
---
## Related Parties
#### Capture and store information about related parties to your investor

>Works with
- Individual Investor Profiles

This object is used to store any person or a party related to an investor. These related parties could be used for nominations declared by the investor. 

You can create a related parties object by calling [related parties](https://fintechprimitives.com/docs/api/#related-parties) API with below json request

Sample Request
```json
{
  "profile": "invp_9abd706565144b83947f4b498bc95e98",
  "name": "James Soprano",
  "date_of_birth": "1972-02-29",
  "relationship": "father"
}
```

You could add all ther attributes  with modify a related party API.
