CREATE TABLE [dbo].[SMS_ID_COMPARES] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [messageId]  VARCHAR (50)  NULL,
    [baseId]     INT           NULL,
    [main_table] VARCHAR (350) NULL,
    CONSTRAINT [PK_SMS_ID_COMPARES] PRIMARY KEY CLUSTERED ([id] ASC)
);

