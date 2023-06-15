---
title: Group SIP
---
## Group SIP

### Introduction
Group SIP is a solution offered through corporate companies to help employees in wealth management. Employees setup investment in a mutual fund scheme and the investment amount is deducted from their upcoming salaries.

### How does group SIP work?

:Tabs

::TabTitle Employee

:::TabContent

<div>
  <img src="/apps/images/gsip-employee-flow.png" alt="" class="max-w-md">
</div>

:::EndTabContent 

::TabTitle Employer

:::TabContent 

<div>
  <img src="/apps/images/gsip-employer-flow.png" alt="employer-flow" class="max-w-md">
</div>

:::EndTabContent

::TabTitle AMC\Distributor

:::TabContent 

<div>
  <img src="/apps/images/gsip-tenant-flow.png" class="max-w-md" alt="">
</div>

:::EndTabContent

:EndTabs 


<br>

1. A corporate company (employer) ties up with an AMC or distributor
2. Employee places a purchase order in a mutual fund scheme
3. Employee authorises his/her company to deduct the investment amount from salary 
4. Employer deducts the investment amount from employee's salary and transfers amount to the AMC of selected scheme
5. AMC processes the investment order
6. Employee receives the mutual fund units in a folio

### Group SIP white labelled application

#### 1. Employee


FP provides a white labelled application for an employee who wants to invest in mutual funds. The employer can embed FP group SIP application into any of their applications for employee like payroll\CRM etc.. Employer can also share direct URL to employee. 

> Refer [this script](/upcoming/beta/embed-pre-built-ui) to embed the white labelled application

An employee can setup mutual fund investmet as below:

1. Choose a fund scheme
   1. Register with a PAN and company email ID
   2. An active company email ID will be used to establish the relation with the company 
   3. Verify the company email ID with an OTP
2. Setup investment account
   1. Includes personal, financial, bank, KYC, nomination and contact information
   2. Agreement for employer to deduct amount from your salary
3. Place an investment order
   1. Purchase one time or as a recurring purchase plan
   2. View  order confirmation and payment processing details (*Payment will be deducted on the upcoming salary date*)
   3. View folio and scheme wise holdings once the order is processed 

<button class="btn btn-primary inline-block w-auto px-4" onclick="handleOpen('https://prueba.sandbox.fpapps.io/group-checkout?employer=invp_5f4e7473b3514affa88ce765878dc9dd&mtm_campaign=beta_live')">
	Try Group SIP for employee
</button>


#### 2. Employer

Employer completes signup with AMC\Distributor. Team members like HR\Finance\Accounts etc.. can be designated by the employer to process the group SIP payments. Designated employer users can perform below activities in FP:

- View employees who have registered for group SIP and their mutual fund order details
- Update the payment settlment details for orders
     - Employer user views\downloads the pending payment report for employees
     - Employer user processes salary deduction outside FP (_within the payroll system of the employer_)
     - On the salary date, employer user makes the investment amount transfer to AMC offline (_via NEFT or RTGS_) via the company's bank account
     - Employer user updates the payment tranfer details for employee orders in FP on the salary date
- View previous payment settlement details
     - Report of all payment transfers to AMC by the employer


#### 3. AMC\Distributor


Team members like operations\business etc.. of from AMC\distributor can be designated to view group SIP investments. Designated users will be provided access to

- View employees who have registered for group SIP
- View investments of employees & payment settlement details from the employers

#### 4. MF Operations

FP provides managed MF operations upon payment settlement receipt from the employers

1. FP submits the orders to RTA in common order feed format once the payment settlement is recieved from employer
   - If the payment settlement is recieved before 3PM on T day, the order will be processed by RTA on same day, otherwise on next business day
2. FP accepts the reverse feed from RTAs
3. FP updates employee order status and unit holdings
   - RTA shares reverse feed on T+1 business day to AMC\distributors.
   - AMC\Distributor share the reverse feed to FP on T+1 business day and FP updates unit holdings on same day.


#### 5. Going live


> 1. Ensure you have all the prerequisites as per [go live checklist](/going-live/checklist/). 
> 2. Refer [this script](/upcoming/beta/embed-pre-built-ui) to embed the white labelled application

##### Branding guidelines for white labelled applications

If you wish to apply your brand guidelines, email the below details to us at [fpsupport@cybrilla.com](mailto:fpsupport@cybrilla.com) as part of go live checklist.

1. Your website URL (*For color theme*)
2. Images (*in svg or png or jpg format*)
   - Business logo under 200 KB (*Width between 100px and 200px & height between 20px and 40px*)
   - Favicon under 1 KB (*16px X 16px*)

#####  Register employer under your FP account

After you have completed onboarding of employer at your end, provide us the following information to register an employer. A unique employer ID will be created for the employer under your FP account

1. Employer business details
- [ ] Registered name of the company
- [ ] PAN of the company
- [ ] Phone number
- [ ] Email address
- [ ] RIA or ARN of the employer (This is optional and will be passed in order details to RTA if provided)
- [ ] Salary date (*Employer will make payment to AMC on behalf on employee on this date*)
- [ ] Cut off date for accepting orders (*Orders placed by an employee between the cut off date and salary date will be processed in the next salary cycle*)

2. Employer business details

*Corporate bank account through which employer will make payments to the AMC*
- [ ] Bank name
- [ ] Account holder name
- [ ] Account number
- [ ] IFSC code




