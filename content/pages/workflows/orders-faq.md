## Frequently Asked Questions
----------------------------------

#### In goal based investment journey, a single scheme could be recommended for two different goals. In this case, how to ensure that two different transactions can be made for the two goals respectively?
- If folio number is passed in [Create Order API](https://fintechprimitives.com/api/#post-create-lumpsum-order-netbanking), then the investment is treated as additional purchase within the same folio number.
- If folio number is not passed, then the invesment is treated as a separate order, and mapped to a new folio number.