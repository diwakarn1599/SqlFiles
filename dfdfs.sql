SELECT COLUMN_NAME AS 'ColumnName'
,TABLE_NAME AS 'TableName'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%LedgerEntryType%'
ORDER BY TableName
,ColumnName;

select Count(LedgerEntryType) as LedgerEntryType from TRS_Syndicating_LedgerEntries group by LedgerEntryType
total = 4398234
56 = 3424223
312 = 7329
16391 = 
2113543 = 

select top 1000 LedgerEntryType,* from TRS_Syndicating_LedgerEntries where 
LedgerEntryType not in (56,312,16391,2113543,81927,65592) and EntryAmount is not null
select ParticipationType, * from TRS_Syndicating_Participation