---
title: Pause an STP
---
## Pause installments of an existing STP
> The use case explained here is implemented via APIs which are in Alpha Stage. The API specs might change.

Using FP APIs, you can pause a SIP indefinitely or you can pause an SIP for a specific period of time.

#### 1. Create a skip instruction

With the help of skip instructions you can pause your installments. For example if you have active STP with purchase plan id `mfsp_dbabb25ba34c48329dbfbeff70c846f0`, This is how you can pause this SWP by creating a skip instruction 

`POST /v2/mf_switch_plans/mfsp_dbabb25ba34c48329dbfbeff70c846f0/skip_instructions`
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
        "object":"skip_instruction",
        "id":"skip_dbabb25ba34c48329dbfbeff70c846f0",
        "plan":"mfsp_dbabb25ba34c48329dbfbeff70c846f0",
        "state":"active",
        "from":"2022-09-01",
        "to":"2022-11-01",
        "remaining_installments":2,
        "skipped_installments":0,
    }
```
Upon calling this API, a skip instruction is created. All the installments having their installment dates between  `from`  and  `to`  date range will be marked as  `cancelled`. If you want to pause indefinitely, you can only provide  `from`  date while creating a skip instruction against the plan.

Note: Pause STP feature is not supported for BSE STPs.

#### 2. List all MF Switches by skip instruction id
You can list all mf switch orders with skip instruction id using FP APIs. Use `GET /v2/mf_switches?skip_instruction=skip_dbabb25ba34c48329dbfbeff70c846f0`  [API](https://fintechprimitives.com/docs/api/#list-all-mf-switches) to list all installments skipped due to a particular skip instruction.

#### 3. Cancel Skip instruction
You can also cancel the skip instructions created using FP APIs. Use `POST /v2/mf_switch_plans/skip_instructions/skip_dbabb25ba34c48329dbfbeff70c846f0/cancel` to cancel the skip instruction and resume your STP.
