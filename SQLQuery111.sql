select * from [dbo].[TRS_Underwriting_UWDealStatuses] order by NumericID; [dbo].[Security_Users]

--Required Documents---
SELECT 
[TRS_Underwriting_RequiredDocumentPurposes].*,[DealID],[DocPurposeName],[TRS_Documents_DocumentPurposes].[DisplayIndex] AS DocPurposeDisplayIndex,[TRS_Documents_DocumentPurposes].[MetaDataType] AS DocPurposeMetaDataType,[TRS_Documents_DocumentPurposes].[IsActive] AS DocPurposeIsActive
 FROM [TRS_Underwriting_RequiredDocumentPurposes] 
LEFT JOIN [dbo].[TRS_Underwriting_Deals] ON [TRS_Underwriting_RequiredDocumentPurposes].[UnderwritingDealID] = [TRS_Underwriting_Deals].[NumericID]
LEFT JOIN [dbo].[TRS_Documents_DocumentPurposes] ON [TRS_Underwriting_RequiredDocumentPurposes].[DocumentPurposeID] = [TRS_Documents_DocumentPurposes].[NumericID]
   WHERE  (([TRS_Underwriting_RequiredDocumentPurposes].[UnderwritingDealID] = 425454))  