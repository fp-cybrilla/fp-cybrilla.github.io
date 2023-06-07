---
title: Hosted Workflows
---

## Hosted Workflows


### Introduction

Hosted workflows allow an investor to perform a specifc use case while buying or selling mutual funds. For example an investor needs to establish his\her identity as per KYC guidelines before an investment can be done. FP brings these activities as independent hosted workflows that can be plugged readily into any application. 

You can use these workflows directly via URLs, embed in any of your applications.

> 1. Ensure you have all the prerequisites as per [go live checklist](/going-live/checklist/). 
> 2. Refer [this script](/upcoming/beta/embed-hosted-workflow) to embed the hosted workflows.

#### Branding guidelines for hosted workflows

If you wish to apply your brand guidelines, email the below details to us at [fpsupport@cybrilla.com](mailto:fpsupport@cybrilla.com) as part of go live checklist.

1. Your website URL (*For color theme*)
2. Images (*in svg or png or jpg format*)
   - Business logo under 200 KB (*Width between 100px and 200px & height between 20px and 40px*)
   - Favicon under 1 KB (*16px X 16px*)


### Hosted Workflow - use cases

#### KYC

Mutuals funds in India are regulated by SEBI and it mandates to follow certain guidelines in establishing and verifying the identity of an investor before accepting any investments from them. It is commonly called as KYC (Know your customer). 

KYC hosted workflow allows submission of online KYC application

1. Register investor 
2. Provide details necessary for completing the KYC application
3. Choose proof of address
   - If proof of adderss is `aadhaar`, then perform digilocker account verification to complete KYC application
   - If the proof of address is other than aadhaar, record an `online IPV` to complete video KYC application
4. Ensure your browser has permission to access the location, mic, camera from your device as needed during the application process
5. E-sign the KYC application
6. Your application will be submitted to KRA for verification


<div>
<button class="btn btn-primary inline-block w-auto px-4" onclick="handleOpen('https://prueba.sandbox.fpapps.io/kyc?mtm_campaign=beta_live')">
	Try KYC workflow
</button>
</div> 

#### Invest

Investor can make a one time or a recurring purchase and also switch from one fund scheme to another.

1. Choose a fund scheme
2. Select a folio to invest
3. Place an investment order
   - **Purchase** one time  or as a recurring purchase plan
   - **Switch** amount invested in an existing scheme to a new schme - one time or as a recurring plan
4. Pay investment amount
   - Pay online via Netbanking or UPI
   - Setup auto pay for recurring purchase plans
5. Upon successful payment\auto pay setup, the order will be submitted to AMC to process

If the investor is visting for the first time, invest workflow will facilitate investor onboarding.

1. Register with a PAN
2. Setup details necessary to setup investment account
   - Includes personal, financial, bank, KYC, communication and nomination information


<div>
<button class="btn btn-primary inline-block w-auto px-4" onclick="handleOpen('https://prueba.sandbox.fpapps.io/checkout?mtm_campaign=beta_live')">
	Try invest workflow
</button>
</div>

