SELECT * FROM [TRS_Deals] 
LEFT JOIN [dbo].[TRS_Merchants] ON [TRS_Deals].[MerchantID] = [TRS_Merchants].[NumericID]
LEFT JOIN [dbo].[TRS_BusinessPersons] AS [PO] ON [TRS_Merchants].[PrimaryOwnerID] = [PO].[NumericID]
LEFT JOIN [dbo].[TRS_BusinessPersons] AS [SO] ON [TRS_Merchants].[SecondaryOwnerID] = [SO].[NumericID]
LEFT JOIN [dbo].[TRS_BusinessPersons] AS [TO] ON [TRS_Merchants].[ThirdOwnerID] = [TO].[NumericID]
LEFT JOIN [dbo].[TRS_BusinessPersons] AS [FO] ON [TRS_Merchants].[FourthOwnerID] = [FO].[NumericID]
LEFT JOIN [dbo].[TRS_Lists_ReferringPartners] AS [Ref] ON [TRS_Merchants].[ReferringPartnerID] = [Ref].[NumericID]
LEFT JOIN [dbo].[TRS_Syndicating_Partners] AS [Syndicated] ON [TRS_Deals].[SyndicatedPartnerID] = [Syndicated].[NumericID]
LEFT JOIN [dbo].[TRS_Syndicating_Partners] AS [Originator] ON [TRS_Deals].[OriginatorPartnerID] = [Originator].[NumericID]
LEFT JOIN [dbo].[TRS_Syndicating_Partners] AS [WhiteLabel] ON [TRS_Deals].[WhiteLabelPartnerID] = [WhiteLabel].[NumericID]
LEFT JOIN [dbo].[TRS_Lists_PricingTiers] ON [TRS_Deals].[PricingProgramTierID] = [TRS_Lists_PricingTiers].[NumericID]
LEFT JOIN [dbo].[TRS_RepaymentMethods] ON [TRS_Deals].[RepaymentMethodID] = [TRS_RepaymentMethods].[NumericID]
LEFT JOIN [dbo].[TRS_SalesRepresentatives] AS [SalesRep] ON [TRS_Deals].[SalesRepresentativeID] = [SalesRep].[NumericID]
LEFT JOIN [dbo].[TRS_SalesRepresentatives] AS [ParentISO] ON [SalesRep].[ParentISOID] = [ParentISO].[NumericID]
LEFT JOIN [dbo].[TRS_SalesRepresentatives] AS [RelationshipManager] ON [SalesRep].[RelationshipManagerID] = [RelationshipManager].[NumericID]
LEFT JOIN [dbo].[TRS_SalesRepresentatives] AS [RenewalRep] ON [TRS_Deals].[RenewalManagerRepID] = [RenewalRep].[NumericID]
LEFT JOIN [dbo].[TRS_DealStatuses] ON [TRS_Deals].[DealStatusID] = [TRS_DealStatuses].[NumericID]
LEFT JOIN [dbo].[TRS_Lists_SubDealStatuses] ON [TRS_Deals].[SubDealStatusID] = [TRS_Lists_SubDealStatuses].[NumericID]
LEFT JOIN [dbo].[TRS_Site_BrandedCompanies] AS [BC] ON [TRS_Deals].[BrandedCompanyID] = [BC].[NumericID]
LEFT JOIN [dbo].[TRS_Site_BrandedCompanies] AS [SE] ON [TRS_Deals].[ServicingEntityBrandedCompanyID] = [SE].[NumericID]
LEFT JOIN [dbo].[TRS_LeadSources] ON [TRS_Deals].[LeadSourceID] = [TRS_LeadSources].[NumericID]
LEFT JOIN [dbo].[TRS_ProcessingPlatforms] ON [TRS_Deals].[ProcessingPlatformID] = [TRS_ProcessingPlatforms].[NumericID]
LEFT JOIN [dbo].[Security_Users] AS [Underwriter] ON [TRS_Deals].[UnderwriterID] = [Underwriter].[NumericID]
LEFT JOIN [dbo].[Security_Users] AS [CreditAnalyst] ON [TRS_Deals].[CreditAnalystID] = [CreditAnalyst].[NumericID]
LEFT JOIN [dbo].[Security_Users] AS [FundingCoordinator] ON [TRS_Deals].[FundingCoordinatorID] = [FundingCoordinator].[NumericID]
LEFT JOIN [dbo].[Security_Users] AS [Collections] ON [TRS_Deals].[CollectionsAgentID] = [Collections].[NumericID]
LEFT JOIN [dbo].[Security_Users] AS [BECollections] ON [TRS_Deals].[BackendCollectionsAgentID] = [BECollections].[NumericID]
LEFT JOIN [dbo].[Security_Users] AS [FECollections] ON [TRS_Deals].[FrontendCollectionsAgentID] = [FECollections].[NumericID]
LEFT JOIN [dbo].[Security_Users] AS [CreatedBy] ON [TRS_Deals].[CreatedByID] = [CreatedBy].[NumericID]
LEFT JOIN [dbo].[Security_Users] AS [ModifiedBy] ON [TRS_Deals].[ModifiedByID] = [ModifiedBy].[NumericID]
LEFT JOIN [dbo].[TRS_Lists_FundingCompetitors] ON [TRS_Deals].[PaidOffByFundingCompetitorID] = [TRS_Lists_FundingCompetitors].[NumericID]
LEFT JOIN [dbo].[TRS_Underwriting_RiskScoreCards] ON [TRS_Deals].[ScoreCardID] = [TRS_Underwriting_RiskScoreCards].[NumericID]
  WHERE  ((([TRS_Deals].[DealStatusID] = 3) OR ([TRS_Deals].[DealStatusID] = 2) OR ([TRS_Deals].[Dea[dbo].[TRS_Underwriting_DisbursementAmounts]lStatusID] = 1) OR ([TRS_Deals].[DealStatusID] = 5)) AND (([TRS_Deals].[MerchantID] = 116660)) ) 