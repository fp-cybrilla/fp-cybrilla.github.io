---
title: Pause an SWP
---
## Pause installments of an existing SWP
> The use case explained here is implemented via APIs which are in Alpha Stage. The API specs might change.

You can pause a SWP indefinetly or for a specific period of time using FP APIs.

#### 1. Create a skip instruction

With the help of skip instructions you can pause your installments. For example if you have active SWP with redemption plan id `mfrp_b999a6bc37f5444fa5ad03e7cf581e20`, This is how you can pause this SWP by creating a skip instruction 

`POST /v2/mf_redemption_plans/mfrp_b999a6bc37f5444fa5ad03e7cf581e20/skip_instructions`
```json

    {  
    "from":"2022-09-01",  
    "to":"2022-11-01"  
    }
```
Response
```json

    # Displaying only a part of the object for brevity
    {
        "object":"plan_skip_instruction",
        "id":"psi_4bdbe7eed18842b8a704d79929cc6b44",
        "plan":"mfrp_5bf60b9b6aac4c63a64f9ca4df9f48a4",
        "state":"active",
        "from":"2022-09-01",
        "to":"2022-11-01",
        "remaining_installments":2,
        "skipped_installments":0,
    }
```
Upon calling this API, a skip instruction is created. All the installments having their installment dates between  `from`  and  `to`  date range will be marked as  `cancelled`. If you want to pause indefinitely, you can only provide  `from`  date while creating a skip instruction against the plan.

Note: Pause SWP feature is not supported for BSE SWPs.

#### 2. List all MF Redemptions by skip instruction id
You can list all mf redemptions with skip instruction id using FP APIs. Use `GET /v2/mf_redemptions?skip_instruction=psi_4bdbe7eed18842b8a704d79929cc6b44`  [API](https://fintechprimitives.com/docs/api/#list-all-mf-redemptions) to list all installments skipped due to a particular skip instruction.

#### 3. Cancel skip instruction
If you want to resume an SWP and cancel the skip instruction,you can use

`POST /v2/mf_redemption_plans/skip_instructions/psi_4bdbe7eed18842b8a704d79929cc6b44/cancel`
