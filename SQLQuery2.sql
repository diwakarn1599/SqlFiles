
CREATE TABLE [dbo].[AuditDetails](
[AuditDetailsId] [int] IDENTITY(1,1) NOT NULL,
[Process_Id] [int] NOT NULL,
[AuditJsonVal] [nvarchar](max) NULL,
[CreatedDate] [datetime2](7) NULL,
[CreatedBy] [int] NULL,
[RemoteIP] [nvarchar](20) NULL,
CONSTRAINT [PK_AuditDetails] PRIMARY KEY CLUSTERED
(
[AuditDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO