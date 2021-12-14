SELECT COLUMN_NAME AS 'ColumnName'
,TABLE_NAME AS 'TableName'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%LedgerEntryType%'
ORDER BY TableName
,ColumnName;

select top 25 * from TRS_Site_BrandedCompany_ProgramTypeIntervals
select top 1 * from EligibleDealsView
select top 500 PricingProgramTypeID,* from TRS_Deals order by Created desc
select LedgerEntryType,* from TRS_Syndicating_LedgerEntries
select top 25 * from TRS_Underwriting_CalculatorInfos
select top 25 * from TRS_Underwriting_PreapprovedForEntries
select top 25 * from TRS_Underwriting_UWPriorExternalBalances
select top 25 * from v_TRS_Deals
select top 25 * from vDeals
select top 25 * from vUnderwritingOffers

		DECLARE @AmountToPayback DECIMAL(10,2),
				@OutstandingBalance DECIMAL(10,2),
				@PaymentAmount DECIMAL(10,2),
				@PaymentInterval VARCHAR(50),
				@PaymentDate DATE,
				@PaymentNumber INT = 0

		SELECT	@AmountToPayback = d.AmountToPayback * ds.AmountMultiplier,
				@PaymentAmount = ds.DailyPaymentAmount * ds.AmountMultiplier,
				@PaymentInterval = ds.PaymentFrequency,
				@PaymentDate = ds.StartDate
		FROM	Deals_Summary ds
		JOIN	dbo.TRS_Deals d ON d.NumericID = ds.DealID
		WHERE	d.NumericID = 386106

