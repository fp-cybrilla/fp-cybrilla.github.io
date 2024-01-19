---
title: Migrate offline folios
---
## Migrate offline folios
Learn how to bring offline folios linked to your MF distribution code into your FP account

If your investors have purchased mutual funds using your distribution code, but not using your MF app running on FP account, you can bring in the folios of investors into your FP account. This will help investors get a complete view of all investments under your distribution code. Purchases via below channels can be migrated to your FP account

1. Fund house (AMC)
2. RTA branch offices
3. Any other online sites like MFU, MF Central, RTA websites
4. Assisted purchase by RM\Sales\EUINs using physical or any online modes like RTA or exchange systems

## How it works

1. FP will migrate all folios and associated transactions (buy\sell) using your daily MF reverse feed reports obtained from RTA
2. Ensure below RTA feed files are setup for autoforward to opscybrilla@cybrilla.com from your email registered with RTA
   1. WBR2 in DBF
   2. WBR9 in csv
   3. MFSD 201 in DBF
   4. MFSD 211 in Excel
3. FP will migrate a since inception feed one time to ensure all past folios are migrated into your FP account
4. FP will migrated newer folios on a daily basis

## Access migrated folios

1. FP will create `mf_folio` and link it with an MF investment account  `mf_investment_account`
   1. If the investor has onboarded on your MF App running on FP Account, then the investor would have an MF investment account already for the PAN & holding pattern. In this case FP will link newly created `mf_folio` to existing `mf_investment_account`
2. If the investor has `NOT`  onboarded on your MF App running on FP Account at the time of daily folio migration, then FP will create a new `mf_investment_account` for the PAN and holding pattern, link newly created `mf_folio`.

> 1. Ensure you do not create multiple investor profiles or MF investment accounts for your investors from your MF App
> 2. Before creating a new `mf_investment_account`, always check if an `mf_investment_account` exists for the PAN and holding pattern

## Failure scenarios

1. FP will not migrate folios to your account, if for an investor multiple `mf_investment_account` are found
   1. You will need to close the duplicate `mf_investment_account` and FP will migrate the folios in the next schedule applicable

## Capabilities supported for migrated folios

1. View [folio](https://fintechprimitives.com/docs/api/#mf-folio-object) details
2. View [holdings and returns](https://fintechprimitives.com/docs/api/#investor-reports) of investor

> Note for any MF orders on migrated user, ensure investor onboarding is completed
   

