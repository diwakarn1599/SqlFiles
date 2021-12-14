select * from [dbo].[TRS_Deals];
SELECT DISTINCT M.EmailAddress MerchantEmailAddress, SU.EmailAddress LoginEmailAddress, SU.Password, SU.FirstName, SU.LastName, SU.Password, M.CompanyName, M.CompanyLegalName
FROM TRS_Merchants M
JOIN TRS_Deals D ON D.MerchantID = M.NumericID
--JOIN TRS_Lists_ProgramTypes PP ON D.PricingProgramTypeID = PP.NumericID
JOIN Security_Users SU ON M.PrimaryOwnerID = SU.NumericID OR M.SecondaryOwnerID = SU.NumericID
WHERE D.PricingProgramTypeID is NULL OR D.PricingProgramTypeID=0;

sELECT * FROM security_users where EmailAddress in( 'alwilliamson1@yahoo.com','tishelle.caines@forafinancial.com' ,'brian.seaman@forafinancial.com','barnesrealestateco@gmail.com');
Select * from [dbo].[TRS_SalesRepresentatives]
--update security_users set Password='s42qCUnfp8A4Sa3+k++nQg==' where NumericID=114637
;
sELECT * FROM security_users where   EmailAddress in('jeff@duntonconstruction.com','barnesrealestateco@gmail.com');
select * from [dbo].[TRS_Merchants] where EmailAddress in('jeff@duntonconstruction.com','barnesrealestateco@gmail.com');
--update security_users set Password='s42qCUnfp8A4Sa3+k++nQg==' where numericID=85597
--update [dbo].[TRS_Merchants] set IsUnderWriting=0, IsActive=1 where NumericId = 370768;
select * from Security_Authentication_ValidatePageAccess;
select * from [dbo].[TRS_Deals] where merchantId=116660
select * from [dbo].[TRS_DealStatuses]
select * from [dbo].[TRS_SalesRepresentatives] where numericId=1359
-----------------------
SELECT 
[TRS_Underwriting_RequiredDocumentPurposes].*,[DealID],[DocPurposeName],[TRS_Documents_DocumentPurposes].[DisplayIndex] AS DocPurposeDisplayIndex,[TRS_Documents_DocumentPurposes].[MetaDataType] AS DocPurposeMetaDataType,[TRS_Documents_DocumentPurposes].[IsActive] AS DocPurposeIsActive
 FROM [TRS_Underwriting_RequiredDocumentPurposes] 
LEFT JOIN [dbo].[TRS_Underwriting_Deals] ON [TRS_Underwriting_RequiredDocumentPurposes].[UnderwritingDealID] = [TRS_Underwriting_Deals].[NumericID]
LEFT JOIN [dbo].[TRS_Documents_DocumentPurposes] ON [TRS_Underwriting_RequiredDocumentPurposes].[DocumentPurposeID] = [TRS_Documents_DocumentPurposes].[NumericID]
   WHERE  (([TRS_Underwriting_RequiredDocumentPurposes].[UnderwritingDealID] = 208660))   

   select * from [TRS_Underwriting_RequiredDocumentPurposes];

   select * from [dbo].[TRS_Underwriting_UWDealStatuses] [dbo].[TRS_Merchant_Online_Checkout_Status] [dbo].[TRS_Deals_RenewalStatuses] TRS_Documents_DocumentPurposes;