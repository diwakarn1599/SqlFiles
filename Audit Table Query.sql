create database Audit;

CREATE TABLE BusinessAudit(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Process_id int,
	RequestJsonData NVARCHAR(Max) Check(IsJSON(RequestJsonData) = 1),
	CreatedDate DateTime2 NOT NULL default SYSDATETIMEOFFSET(),
	CreatedBy int,
	RemoteIP NVARCHAR(20)
);

select * from BusinessAudit;
AuditDetails