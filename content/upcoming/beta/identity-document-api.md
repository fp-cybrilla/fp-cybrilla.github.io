### Identity Documents

This can be used to fetch a document and its details from an external source. You need to give the requesting entity details in order to fetch these details. Currently, the only supported requesting entity is a `kyc_request` object.

**Endpoints:**

`POST /v2/identity_documents`  
`GET /v2/identity_documents/:id`  
`GET /v2/identity_documents`

Refer to below links to know more about this 

## Identity Document Object

> Identity Document Object

```json
{
    "object": "identity_document",
    "id": "iddoc_20ecb2ee966a45b48ff2da70ec45ff01",

    "type": "aadhaar",
    "kyc_request": "kycr_96a0ccde4bb74ce6b79bab6b720d479c",

    "fetch": {
        "redirect_url": null,
        "postback_url": "https://fintechprimitives.com",

        "status": "successful",
        "reason": null,

        "expires_at": "2023-04-21T18:06:22+05:30"
    },

    "data": {
        "number": "0000000000000512",
        "line_1": "36TH CROSS SOUTH JAYANAGAR BENGALURU",
        "city": "Bengaluru",
        "pincode": "560041",
        "country": "in"
    },

    "created_at": "2023-04-21T17:06:22+05:30",
    "updated_at": "2023-04-21T17:08:22+05:30"
}
```

This object can be used to store a document and its details that are fetched from an external source.

### Identity Document object attributes

| Name | Type | Comments |
| - | - | - |
| object | string | Value is `identity_document`. String representing the object type. Objects of the same type share the same value |
| id | string | Unique identifier of the `identity_document` object |
| type | string | Type of the identity document |
| kyc_request | string | ID of the `kyc_request` object that consumes this identity document |
| fetch | hash | Stores the details on fetching an `identity_document` |
| data | hash | Stores the details that were fetched along with an associated identity document |
| created_at | string | Creation timestamp in ISO Local Date Time `yyyy-MM-ddThh:mm:ss` format |
| updated_at | string | Last updated timestamp in ISO Local Date Time `yyyy-MM-ddThh:mm:ss` format. This would indicate when the document fetching reached a final state |

### Identity Document Fetch hash attributes

| Name | Type | Comments |
| - | - | - |
| redirect_url | string | URL to intiate document fetching |
| postback_url | string | URL to redirect the investor back, after document fetching workflow |
| status | string | Status of the document fetching. Possible values are `pending`, `successful`, `failed` and `expired` |
| reason | string | Reason for the fetching action to be in a current state. This would be present only in the failure scenarios |
| expires_at | string | Expiry timestamp of the `redirect_url` in ISO Local Date Time `yyyy-MM-ddThh:mm:ss` format. The URL would expire after 1 hour from creation |

NOTE:
1. `fetch.redirect_url` will be `null` if `fetch.status` != `pending`
2. While redirecting to the `postback_url`, you will also receive the ID of the associated `identity_document` and the corresponding `fetch.status`
3. You can consume the last 4 digits of the Aadhaar number that would be present in the `data` hash to populate the `kyc_request.aadhaar_number` attribute
4. If `fetch.redirect_url` link is expired, then you would have to create a new `identity_document` object against the KYC Request
5. `identity_document` mapped to a KYC Request object cannot be reused for any other KYC Request object. 


---
## Create an Identity Document

`POST /v2/identity_documents`

This API can be used to create a `identity_document` object.

> JSON Request

```shell
curl -X POST "api.fintechprimitives.com/v2/identity_documents" \
  -H "x-tenant-id: <tenant name>"
  -H "Authorization: Bearer ACCESS_TOKEN"
  -d '{
    "kyc_request": "kycr_057ca178104c45cf86d0d9c75b60d1d7",
    "type": "aadhaar",
    "postback_url": "https://fintechprimitives.com"
}'
```
### Request Parameters

| Name | Mandatory | Type | Comments |
|-|-|-|-|
| kyc_request | yes | string | ID of the KYC Request object where this identity document would be consumed |
| type | yes | string | Type of the identity document that has to be fetched. Currently, the only supported value is `aadhaar` |
| postback_url | yes | string | URL to redirect the investor back, after document fetching workflow |

> JSON Response

```json
{
    "object": "identity_document",
    "id": "iddoc_20ecb2ee966a45b48ff2da70ec45ff01",

    "type": "aadhaar",
    "kyc_request": "kycr_96a0ccde4bb74ce6b79bab6b720d479c",

    "fetch": {
        "redirect_url": "https://s.finprim.com/v2/identity_documents/iddoc_20ecb2ee966a45b48ff2da70ec45ff01/redirect_to_digilocker",
        "postback_url": "https://fintechprimitives.com",

        "status": "pending",
        "reason": null,
        
        "expires_at": "2023-04-21T18:06:22+05:30"
    },

    "data": null,

    "created_at": "2023-04-21T17:06:22+05:30",
    "updated_at": "2023-04-21T17:08:22+05:30"
}
```

---
## Fetch an Identity Document

`GET /v2/identity_documents/:id`

This API can be used to fetch the details of an identity document.

> JSON Request

```shell
curl -X GET "api.fintechprimitives.com/v2/identity_documents/iddoc_20ecb2ee966a45b48ff2da70ec45ff01"
  -H "x-tenant-id: <tenant name>"
  -H "Authorization: Bearer ACCESS_TOKEN"
```

### Query parameters

|Name|Mandatory|Type|Comments|
|-|-|-|-|
|id|yes|string|V2 ID of a `identity_document` object|

> JSON Response

```json
{
    "object": "identity_document",
    "id": "iddoc_20ecb2ee966a45b48ff2da70ec45ff01",

    "type": "aadhaar",
    "kyc_request": "kycr_96a0ccde4bb74ce6b79bab6b720d479c",

    "fetch": {
      "redirect_url": null,
      "postback_url": "https://fintechprimitives.com",

      "status": "successful",
      "reason": null,

      "expires_at": null
    },

    "data": {
      "number": "0000000000000512",
      "line_1": "36TH CROSS SOUTH JAYANAGAR BENGALURU",
      "city": "Bengaluru",
      "pincode": "560041",
      "country": "in"
    },

    "created_at": "2023-04-21T17:06:22+05:30",
    "updated_at": "2023-04-21T17:08:22+05:30"
}
```

---
## List all Identity Documents

`GET /v2/identity_documents`

This API can be used to fetch all the identity documents.

> JSON Request

```shell
curl -X GET "api.fintechprimitives.com/v2/identity_documents"
  -H "x-tenant-id: <tenant name>"
  -H "Authorization: Bearer ACCESS_TOKEN"
```

### Query parameters

|Name|Mandatory|Type|Comments|
|-|-|-|-|
|kyc_request|no|string|`id` of an Identity Document|
|fetch.status|no|string|`status` of the Identity Document fetch|

**NOTE**: The response can contain 100 latest folios at max.

> JSON Response

```json
{
    "object": "list",
    "data": [
      {
        "object": "identity_document",
        "id": "iddoc_20ecb2ee966a45b48ff2da70ec45ff01",

        "type": "aadhaar",
        "kyc_request": "kycr_96a0ccde4bb74ce6b79bab6b720d479c",

        "fetch": {
          "redirect_url": "https://s.finprim.com/v2/identity_documents/iddoc_20ecb2ee966a45b48ff2da70ec45ff01/redirect_to_digilocker",
          "postback_url": "https://fintechprimitives.com",

          "status": "pending",
          "reason": null,

          "expires_at": "2023-04-21T18:06:22+05:30"
        },
        
        "data": null,

        "created_at": "2023-04-21T17:06:22+05:30",
        "updated_at": "2023-04-21T17:08:22+05:30"
      },

      {
        "object": "identity_document",
        "id": "iddoc_fad581bbdf4441c5ae2eff48a88cec90",

        "type": "aadhaar",
        "kyc_request": "kycr_96a0ccde4bb74ce6b79bab6b720d479c",

        "fetch": {
          "redirect_url": null,
          "postback_url": "https://fintechprimitives.com",

          "status": "failed",
          "reason": "user cancelled",

          "expires_at": null
        },

        "data": null,

        "created_at": "2023-04-21T17:06:22+05:30",
        "updated_at": "2023-04-21T17:08:22+05:30"
      }
    ]
}
```
