SELECT TOP (1) 
[TRS_Merchants].*,(SELECT TOP (1) [TRS_Deals].[InitialFixedDailyPaymentAmount] FROM [TRS_Deals]   WHERE  ((([TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID])) AND ((([TRS_Deals].[DealStatusID] = (5)) OR ([TRS_Deals].[DealStatusID] = (1))) AND (([TRS_Deals].[IsUnderwriting] = (0))) ) )     ORDER BY  [TRS_Deals].[DateFunded] ASC) AS [CurrentInitialFixedDailyPaymentAmount],(SELECT COUNT([TRS_Deals].[NumericID]) FROM [TRS_Deals]   WHERE  ((([TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID])) AND (([TRS_Deals].[IsUnderwriting] = (0))) )) AS [DealCount],(SELECT COUNT([TRS_MerchantNotes].[NumericID]) FROM [TRS_MerchantNotes]   WHERE  ((([TRS_MerchantNotes].[MerchantID] = [TRS_Merchants].[NumericID])) )) AS [NotesCount],(SELECT MAX([TRS_FileLineEntries].[TransactionStartDate]) FROM [TRS_Syndicating_LedgerEntries] LEFT JOIN [TRS_FileLineEntries] ON (([TRS_Syndicating_LedgerEntries].[LineEntryID] = [TRS_FileLineEntries].[NumericID])) LEFT JOIN [TRS_Deals] ON (([TRS_Syndicating_LedgerEntries].[DealID] = [TRS_Deals].[NumericID]))   WHERE  ((([TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID])) AND (([TRS_Syndicating_LedgerEntries].[EntryAmount] > (0)) AND (([TRS_Syndicating_LedgerEntries].[Classification] = (8192)) OR ([TRS_Syndicating_LedgerEntries].[Classification] = (2048))) AND (([TRS_Syndicating_LedgerEntries].[Ledger] = (65))) ) )) AS [LastReceivedPaymentDate],ISNULL((SELECT ROUND(SUM([TRS_Syndicating_LedgerEntries].[FactorReceivable]), 2) FROM [TRS_Syndicating_LedgerEntries] LEFT JOIN [TRS_Deals] ON (([TRS_Syndicating_LedgerEntries].[DealID] = [TRS_Deals].[NumericID]))   WHERE  ((([TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID])) AND (([TRS_Syndicating_LedgerEntries].[SubClassification] = (256)) AND ([TRS_Syndicating_LedgerEntries].[Classification] = (1024)) AND ([TRS_Syndicating_LedgerEntries].[Ledger] = (65))) )), (0)) AS [Originally_Funded_FactorReceivable],ISNULL((SELECT ROUND(SUM([TRS_Syndicating_LedgerEntries].[ProfitAmount]), 2) FROM [TRS_Syndicating_LedgerEntries] LEFT JOIN [TRS_Deals] ON (([TRS_Syndicating_LedgerEntries].[DealID] = [TRS_Deals].[NumericID]))   WHERE  ((([TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID])) AND (([TRS_Syndicating_LedgerEntries].[SubClassification] = (256)) AND ([TRS_Syndicating_LedgerEntries].[Classification] = (1024)) AND ([TRS_Syndicating_LedgerEntries].[Ledger] = (65))) )), (0)) AS [Originally_Funded_ProfitAmount],ISNULL((SELECT ROUND(SUM([TRS_Syndicating_LedgerEntries].[FactorReceivable]), 2) FROM [TRS_Syndicating_LedgerEntries] LEFT JOIN [TRS_Deals] ON (([TRS_Syndicating_LedgerEntries].[DealID] = [TRS_Deals].[NumericID]))   WHERE  ((([TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID])) AND (([TRS_Syndicating_LedgerEntries].[Classification] = (1024)) AND ([TRS_Syndicating_LedgerEntries].[Ledger] = (65))) )), (0)) AS [Actual_FactorReceivable],ISNULL((SELECT ROUND(SUM([TRS_Syndicating_LedgerEntries].[ProfitAmount]), 2) FROM [TRS_Syndicating_LedgerEntries] LEFT JOIN [TRS_Deals] ON (([TRS_Syndicating_LedgerEntries].[DealID] = [TRS_Deals].[NumericID]))   WHERE  ((([TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID])) AND (([TRS_Syndicating_LedgerEntries].[Classification] = (1024)) AND ([TRS_Syndicating_LedgerEntries].[Ledger] = (65))) )), (0)) AS [Actual_ProfitAmount],ISNULL((SELECT ROUND(SUM([TRS_Syndicating_LedgerEntries].[FactorReceivable]), 2) FROM [TRS_Syndicating_LedgerEntries] LEFT JOIN [TRS_Deals] ON (([TRS_Syndicating_LedgerEntries].[DealID] = [TRS_Deals].[NumericID]))   WHERE  ((([TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID])) AND (([TRS_Syndicating_LedgerEntries].[Classification] = (2048)) AND ([TRS_Syndicating_LedgerEntries].[Ledger] = (65))) )), (0)) AS [PaidIn_FactorReceivable],ISNULL((SELECT ROUND(SUM([TRS_Syndicating_LedgerEntries].[ProfitAmount]), 2) FROM [TRS_Syndicating_LedgerEntries] LEFT JOIN [TRS_Deals] ON (([TRS_Syndicating_LedgerEntries].[DealID] = [TRS_Deals].[NumericID]))   WHERE  ((([TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID])) AND (([TRS_Syndicating_LedgerEntries].[Classification] = (2048)) AND ([TRS_Syndicating_LedgerEntries].[Ledger] = (65))) )), (0)) AS [PaidIn_ProfitAmount],ISNULL((SELECT ROUND(SUM([TRS_Syndicating_LedgerEntries].[UnappliableFunds]), 2) FROM [TRS_Syndicating_LedgerEntries] LEFT JOIN [TRS_Deals] ON (([TRS_Syndicating_LedgerEntries].[DealID] = [TRS_Deals].[NumericID]))   WHERE  ((([TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID])) AND (([TRS_Syndicating_LedgerEntries].[Classification] = (8192)) AND ([TRS_Syndicating_LedgerEntries].[Ledger] = (65))) )), (0)) AS [PaidIn_UnappliedFunds],[TRS_LegalEntities].[EntityType] AS LegalEntityType,[TRS_IndustryTypes].[IndustryName] AS IndustryTypeName,[ManagedBy].[Username] AS ManagedByUsername,[ManagedBy].[FirstName] AS ManagedByFirstName,[ManagedBy].[LastName] AS ManagedByLastName,[MerchUser].[Username] AS LoginUsername,[MerchUser].[FirstName] AS LoginFirstName,[MerchUser].[LastName] AS LoginLastName,[MerchUser].[EmailAddress] AS LoginEmailAddress,[PO].[FirstName] AS PrimaryOwnerFirstName,[PO].[LastName] AS PrimaryOwnerLastName,[PO].[EmailAddress1] AS PrimaryOwnerEmailAddress1,[PO].[PhoneNumber1] AS PrimaryOwnerPhoneNumber1,[PO].[CellPhone] AS PrimaryOwnerCellPhone,[PO].[TextMessageBlocked] AS PrimaryOwnerCellPhoneTextBlocked,[PO].[Address1] AS PrimaryOwnerAddress1,[PO].[Address2] AS PrimaryOwnerAddress2,[PO].[City] AS PrimaryOwnerCity,[PO].[State] AS PrimaryOwnerState,[PO].[PostalCode] AS PrimaryOwnerPostalCode,[SO].[FirstName] AS SecondaryOwnerFirstName,[SO].[LastName] AS SecondaryOwnerLastName,[SO].[PhoneNumber1] AS SecondaryOwnerPhoneNumber1,[SO].[CellPhone] AS SecondaryOwnerCellPhone,[SO].[TextMessageBlocked] AS SecondaryOwnerCellPhoneTextBlocked,[TO].[FirstName] AS ThirdOwnerFirstName,[TO].[LastName] AS ThirdOwnerLastName,[TO].[PhoneNumber1] AS ThirdOwnerPhoneNumber1,[TO].[CellPhone] AS ThirdOwnerCellPhone,[TO].[TextMessageBlocked] AS ThirdOwnerCellPhoneTextBlocked,[FO].[FirstName] AS FourthOwnerFirstName,[FO].[LastName] AS FourthOwnerLastName,[FO].[PhoneNumber1] AS FourthOwnerPhoneNumber1,[FO].[CellPhone] AS FourthOwnerCellPhone,[FO].[TextMessageBlocked] AS FourthOwnerCellPhoneTextBlocked,[EIDL].[Status] AS EIDLSBAStatusType,[PPP].[Status] AS PPPSBAStatusType,[TRS_Lists_ReferringPartners].[CompanyName] AS ReferringPartnerCompanyName
 FROM [TRS_Merchants] 
LEFT JOIN [dbo].[TRS_LegalEntities] ON [TRS_Merchants].[LegalEntityID] = [TRS_LegalEntities].[NumericID]
LEFT JOIN [dbo].[TRS_IndustryTypes] ON [TRS_Merchants].[IndustryTypeID] = [TRS_IndustryTypes].[NumericID]
LEFT JOIN [dbo].[Security_Users] AS [ManagedBy] ON [TRS_Merchants].[ManagedByID] = [ManagedBy].[NumericID]
LEFT JOIN [dbo].[Security_Users] AS [MerchUser] ON [TRS_Merchants].[UserID] = [MerchUser].[NumericID]
LEFT JOIN [dbo].[TRS_BusinessPersons] AS [PO] ON [TRS_Merchants].[PrimaryOwnerID] = [PO].[NumericID]
LEFT JOIN [dbo].[TRS_BusinessPersons] AS [SO] ON [TRS_Merchants].[SecondaryOwnerID] = [SO].[NumericID]
LEFT JOIN [dbo].[TRS_BusinessPersons] AS [TO] ON [TRS_Merchants].[ThirdOwnerID] = [TO].[NumericID]
LEFT JOIN [dbo].[TRS_BusinessPersons] AS [FO] ON [TRS_Merchants].[FourthOwnerID] = [FO].[NumericID]
LEFT JOIN [dbo].[TRS_SBALoanPursuitStatuses] AS [EIDL] ON [TRS_Merchants].[EIDLSBAStatus] = [EIDL].[NumericID]
LEFT JOIN [dbo].[TRS_SBALoanPursuitStatuses] AS [PPP] ON [TRS_Merchants].[PPPSBAStatus] = [PPP].[NumericID]
LEFT JOIN [dbo].[TRS_Lists_ReferringPartners] ON [TRS_Merchants].[ReferringPartnerID] = [TRS_Lists_ReferringPartners].[NumericID]
   WHERE  (([TRS_Merchants].[UserID] = 85597))   ORDER BY  [TRS_Merchants].[NumericID] DESC

   
   SELECT  
[TRS_Deals].[NumericID],[MerchantID],[DealStatusID],[FactorRatio],[Term],[DateFunded],[AmountFunded],[HoldbackRate],[ResidualRate],[AdvanceType],[AmountToPayback],[PercentEmpireFunded],[AmountEmpireFunded],[DaysInMonth],[DailyPaymentAmount],[InitialFixedDailyPaymentAmount],[TRS_Deals].[PricingProgramTypeID],[TRS_Deals].[IsUnderwriting],[SubCollectionsStatusID],[OriginatorPartnerID],[TRS_Deals].[ProcessingPlatformID],[TRS_Deals].[BrandedCompanyID],[SalesRepresentativeID],[RenewalManagerRepID],[SyndicatedPartnerID],[TRS_Deals].[Created],[CollectionsStatus],[PublicAccessToken],(SELECT TOP (1) [TRS_Syndicating_LedgerEntries].[BankSettlementDate] FROM [TRS_Syndicating_LedgerEntries]   WHERE  ((([TRS_Syndicating_LedgerEntries].[DealID] = [TRS_Deals].[NumericID])) AND (([TRS_Syndicating_LedgerEntries].[EntryAmount] > (0)) AND ([TRS_Syndicating_LedgerEntries].[ClearedStatus] = (2)) AND ([TRS_Syndicating_LedgerEntries].[Classification] = (2048))) )     ORDER BY  [TRS_Syndicating_LedgerEntries].[BankSettlementDate] ASC) AS [FirstSettledActivity],[CompanyName],[CompanyLegalName],[TRS_Merchants].[Address1] AS MerchantAddress,[TRS_Merchants].[PhoneNumber1] AS MerchantPhoneNumber,[TRS_Merchants].[EmailAddress] AS MerchantEmailAddress,[TRS_Merchants].[IsActive],[SalesRep].[UserID] AS SalesRepUserID,[SalesRep].[ParentISOID] AS SalesRepISOID,[SalesRep].[RelationshipManagerID] AS SalesRepRelationshipManagerID,[SalesRep].[IsExternal] AS SalesRepIsExternal,[TRS_Site_BrandedCompanies].[Company] AS BrandedCompanyName,[TRS_Site_BrandedCompanies].[CompanyAbbreviation] AS BrandedCompanyAbbreviation,[TRS_DealStatuses].[StatusName] AS DealStatusName,[TRS_Syndicating_Partners].[BrandedCompanyID] AS SyndicatingPartnerBrandedCompanyID
 FROM [TRS_Deals] 
LEFT JOIN [dbo].[TRS_Merchants] ON [TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID]
LEFT JOIN [dbo].[TRS_SalesRepresentatives] AS [SalesRep] ON [TRS_Deals].[SalesRepresentativeID] = [SalesRep].[NumericID]
LEFT JOIN [dbo].[TRS_Site_BrandedCompanies] ON [TRS_Deals].[BrandedCompanyID] = [TRS_Site_BrandedCompanies].[NumericID]
LEFT JOIN [dbo].[TRS_DealStatuses] ON [TRS_Deals].[DealStatusID] = [TRS_DealStatuses].[NumericID]
LEFT JOIN [dbo].[TRS_Syndicating_Partners] ON [TRS_Deals].[SyndicatedPartnerID] = [TRS_Syndicating_Partners].[NumericID]
   WHERE  (([TRS_Deals].[merchantID] =  370768))
   --update security_users set Password='s42qCUnfp8A4Sa3+k++nQg==' where NumericID=85597
   --1.
   select * from security_users where EmailAddress in ('jeff@duntonconstruction.com','test@hello.com','ROBERTSFAMILY@ZAMTOWN.COM','samsimovski@gmail.com','barnesrealestateco@gmail.com','kingdomdevelopment36@gmail.com');
   --2.
   select * from TRS_Merchants where USERID = 70814;
   --3.
   SELECT  
[TRS_Deals].[NumericID],[MerchantID],[DealStatusID],[FactorRatio],[Term],[DateFunded],[AmountFunded],[HoldbackRate],[ResidualRate],[AdvanceType],[AmountToPayback],[PercentEmpireFunded],[AmountEmpireFunded],[DaysInMonth],[DailyPaymentAmount],[InitialFixedDailyPaymentAmount],[TRS_Deals].[PricingProgramTypeID],[TRS_Deals].[IsUnderwriting],[SubCollectionsStatusID],[OriginatorPartnerID],[TRS_Deals].[ProcessingPlatformID],[TRS_Deals].[BrandedCompanyID],[SalesRepresentativeID],[RenewalManagerRepID],[SyndicatedPartnerID],[TRS_Deals].[Created],[CollectionsStatus],[PublicAccessToken],(SELECT TOP (1) [TRS_Syndicating_LedgerEntries].[BankSettlementDate] FROM [TRS_Syndicating_LedgerEntries]   WHERE  ((([TRS_Syndicating_LedgerEntries].[DealID] = [TRS_Deals].[NumericID])) AND (([TRS_Syndicating_LedgerEntries].[EntryAmount] > (0)) AND ([TRS_Syndicating_LedgerEntries].[ClearedStatus] = (2)) AND ([TRS_Syndicating_LedgerEntries].[Classification] = (2048))) )     ORDER BY  [TRS_Syndicating_LedgerEntries].[BankSettlementDate] ASC) AS [FirstSettledActivity],[CompanyName],[CompanyLegalName],[TRS_Merchants].[Address1] AS MerchantAddress,[TRS_Merchants].[PhoneNumber1] AS MerchantPhoneNumber,[TRS_Merchants].[EmailAddress] AS MerchantEmailAddress,[TRS_Merchants].[IsActive],[SalesRep].[UserID] AS SalesRepUserID,[SalesRep].[ParentISOID] AS SalesRepISOID,[SalesRep].[RelationshipManagerID] AS SalesRepRelationshipManagerID,[SalesRep].[IsExternal] AS SalesRepIsExternal,[TRS_Site_BrandedCompanies].[Company] AS BrandedCompanyName,[TRS_Site_BrandedCompanies].[CompanyAbbreviation] AS BrandedCompanyAbbreviation,[TRS_DealStatuses].[StatusName] AS DealStatusName,[TRS_Syndicating_Partners].[BrandedCompanyID] AS SyndicatingPartnerBrandedCompanyID
 FROM [TRS_Deals] 
LEFT JOIN [dbo].[TRS_Merchants] ON [TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID]
LEFT JOIN [dbo].[TRS_SalesRepresentatives] AS [SalesRep] ON [TRS_Deals].[SalesRepresentativeID] = [SalesRep].[NumericID]
LEFT JOIN [dbo].[TRS_Site_BrandedCompanies] ON [TRS_Deals].[BrandedCompanyID] = [TRS_Site_BrandedCompanies].[NumericID]
LEFT JOIN [dbo].[TRS_DealStatuses] ON [TRS_Deals].[DealStatusID] = [TRS_DealStatuses].[NumericID]
LEFT JOIN [dbo].[TRS_Syndicating_Partners] ON [TRS_Deals].[SyndicatedPartnerID] = [TRS_Syndicating_Partners].[NumericID]
   WHERE  (([TRS_Deals].[merchantID] =  304021));
   select PricingProgramTypeID,PaymentInterval,RenewalManagerRepID,SalesRepresentativeID, *  from Trs_Deals where MerchantID = 304021;

   --update  trs_deals set PricingProgramTypeID=522 where numericid=494196


   select InitialFixedDailyPaymentAmount,DailyPaymentAmount,* from Trs_Deals where NumericID = 446448;
   select DailyPaymentAmount,InitialFixedDailyPaymentAmount,PricingProgramTypeID,PricingProgramTierID,PaymentInterval 
   from TRS_Deals where PricingProgramTypeID in (529,522,1546,1547) and InitialFixedDailyPaymentAmount is Not Null and MerchantID = 385904;

   select * from [dbo].[TRS_DealStatuses] 
   select DailyPaymentAmount,InitialFixedDailyPaymentAmount ,* from Trs_Deals where MerchantID = 370768;
   select DailyPaymentAmount,InitialFixedDailyPaymentAmount ,* from Trs_Deals where MerchantID = 385904;
   --datefunded
   --amountfunded
   --amounttopayback
   --pricingprogramtypeid

   --4.

   select Sum(FactorReceivable) as sum from TRS_Syndicating_LedgerEntries where DealId=472185 and classification = 2048 and ledger=65;
	select Sum(ProfitAmount) as sum from TRS_Syndicating_LedgerEntries where DealId=472185 and classification = 2048 and ledger=65;

	select Sum(FactorReceivable) as sum from TRS_Syndicating_LedgerEntries where DealId=472185 and classification = 1024 and ledger=65;
	select Sum(ProfitAmount) as sum from TRS_Syndicating_LedgerEntries where DealId=472185 and classification = 1024 and ledger=65;

	select AmountToPayback from TRS_Deals where NumericID = 472185
		 --paid amount
		 --balance
		 --percentpaidback

   -------------------------------------------------------------------------------------------------------
   select * from TRS_Syndicating_LedgerEntries where dealId=386106 and created in('2020-12-21 08:51:11.437', '2020-12-22 09:25:23.823','2020-12-23 09:26:37.643');
   select Created,BankSettlementDate,EntryAmount, ClearedStatus from TRS_Syndicating_LedgerEntries where dealId=386106 and (Classification=8192 or Classification=2048) and Ledger=65 
   select * from security_users where numericid=85597
   --update security_users set password='s42qCUnfp8A4Sa3+k++nQg==' where numericid=2692
    select * form ledger  
   select * from TRS_Deals where MerchantId=370768
   select * from [dbo].[TRS_Lists_ProgramTypes]
   select * from TRS_FileLineEntries where MerchantId=370768  and transactionStartDate in ('2020-12-21 00:00:00.000', '2020-12-22 00:00:00.000','2020-12-23 00:00:00.000');
  --update TRS_Deals set DealStatusId=2  where numericId=386106
  select * from TRS_Deals where NumericID=476984

  select top 20 UnappliableFunds,* from TRS_Syndicating_LedgerEntries where UnappliableFunds !=0.0000 --where DealID=472185 and LineEntryID=4062367
select * from TRS_FileLineEntries where MerchantID=370768
select * from TRS_FileLineEntries where MerchantID=385904

select * from TRS_Syndicating_LedgerEntries where LineEntryID=4099455
--select userId from trs_merchants where NumericID=370768
select AmountToPayback from trs_deals where numericid=472185;
select * from  Trs_Pro


select d.DateFunded,s.UnappliableFunds, f.TransactionStartDate,s.BankSettlementDate,f.TransactionAmount,d.PricingProgramTypeID,s.ClearedStatus from TRS_Syndicating_LedgerEntries as s
inner join TRS_FileLineEntries as f
on s.LineEntryID = f.NumericID
inner join TRS_Deals as d
on d.NumericID = s.DealID
where s.DealID=484152 and s.Ledger=65 
and s.Target=1
and s.Classification=4096
 and s.OwnerType !=4
 and s.LedgerEntryType in(56,312)
  order by f.TransactionStartDate desc;

select s.UnappliableFunds, f.TransactionStartDate,s.BankSettlementDate from TRS_Syndicating_LedgerEntries as s
inner join TRS_FileLineEntries as f
on s.LineEntryID = f.NumericID
inner join TRS_Deals as d
on d.NumericID = s.DealID
where s.DealID=27279 and s.Ledger=65 
and s.Target=1
and s.Classification=4096
 and s.OwnerType !=4
 and s.ApplicationStatus !=1
  order by f.TransactionStartDate desc;

 select  BankSettlementDate,UnappliableFunds,LedgerEntryType ,* from TRS_Syndicating_LedgerEntries where classification=4096 and DealID=36179
 select * from TRS_FileLineEntries where
 select * from TRS_Deals where MerchantID=25451
 select Userid,* from Trs_merchants where UserID = 2692
 select USERID,* from TRS_Merchants where NumericID=25451
 select * from Security_Users where NumericID = 2692
 select * from TRS_DealStatuses