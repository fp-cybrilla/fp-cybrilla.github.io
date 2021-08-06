## Check Existing Mandate
----------------

#### Story -
> As a distributor / RIA, I want to check whether a mandate has already been set up by the investor, so that I can directly enable the investor to begin a SIP / monthly investment.


|     Steps    |     Method       |    Reference    |
|--------------|------------------|-----------------|
| Fetch bank account ID | GET | [Get Investor Details](https://fintechprimitives.com/api/#get-investor-details) |
| Get the mandate ID & other mandate details of the investor using the bank account ID | GET | [Get Mandate by filters](https://fintechprimitives.com/api/#get-mandates-by-filters) |
