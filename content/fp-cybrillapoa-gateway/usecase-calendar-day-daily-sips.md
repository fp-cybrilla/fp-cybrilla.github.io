## Calendar Day Daily SIP (Early Access)

### Schedule

#### 1. When **FOT (first instalment today) = false**

The first debit will be done **the next day** after the day of registration, as shown below:

| SIP registration day | 1st instalment | 2nd instalment | 3rd instalment |
|----------------------|----------------|----------------|----------------|
| Monday               | Tuesday        | Wednesday      | Thursday       |
| Tuesday              | Wednesday      | Thursday       | Friday         |
| Wednesday            | Thursday       | Friday         | Saturday       |
| Thursday             | Friday         | Saturday       | Sunday         |
| Friday               | Saturday       | Sunday         | Monday         |
| Saturday             | Sunday         | Monday         | Tuesday        |
| Sunday               | Monday         | Tuesday        | Wednesday      |



#### 2. When **FOT (first instalment today) = true**

The first debit will be done **on the day of registration**:

| SIP registration day | 1st instalment | 2nd instalment | 3rd instalment |
|----------------------|----------------|----------------|----------------|
| Monday               | Monday         | Tuesday        | Wednesday      |
| Tuesday              | Tuesday        | Wednesday      | Thursday       |
| Wednesday            | Wednesday      | Thursday       | Friday         |
| Thursday             | Thursday       | Friday         | Saturday       |
| Friday               | Friday         | Saturday       | Sunday         |
| Saturday             | Saturday       | Sunday         | Monday         |
| Sunday               | Sunday         | Monday         | Tuesday        |

---

### API Reference

For API specifications, refer to:  
https://fintechprimitives.com/docs/api/#create-a-purchase-plan

---

### FAQs

#### **Q. If Saturday and Sunday are bank holidays, will 3 debits happen on one day?**

**A. No.**  
Debits will still follow the schedule above.  
However, **settlement to AMC** will occur on the **next bank working day**.  
For example, debits for Friday, Saturday, and Sunday will all be settled on Monday.

*Behavior is the same for both UPI Autopay and E-NACH.*

---

#### **Q. If the SIP is created today at 9 PM and FOT = false, when will the debit happen?**

Below is the detailed **UPI Autopay** schedule:

| Time of SIP registration (T day) | Pre-debit notification (T day)     | Debit by (T+1 day)                         |
|----------------------------------|-------------------------------------|---------------------------------------------|
| Between 8:00 AM to 4:00 PM                          | Within T+1 hour                   | Between 27-28 hours PM                         |
| Between 4.01 PM to 11:00 PM                         | Between 11:00 PM to 12:00 AM                 | Between 2:00 AM – 3:00 AM (T+2)                     |
| 11:59 PM                         | 12:00 AM – 1:00 AM (T+1)            | 3:00 AM – 4:00 AM (T+2)                     |

**Note:** This schedule applies only to **UPI Autopay**.

For **E-NACH**, debit is expected **within 24 hours**, and **there is no pre-debit notification**.
