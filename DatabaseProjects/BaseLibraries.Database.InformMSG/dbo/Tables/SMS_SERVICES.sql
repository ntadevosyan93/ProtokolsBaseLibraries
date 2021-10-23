CREATE TABLE [dbo].[SMS_SERVICES] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [description] VARCHAR (50)  NULL,
    [main_table]  VARCHAR (150) NULL,
    [disable]     TINYINT       CONSTRAINT [DF_SMS_SERVICES_disable] DEFAULT ((1)) NULL,
    [idm_smpp]    INT           NULL,
    CONSTRAINT [PK_SMS_SERVICES] PRIMARY KEY CLUSTERED ([id] ASC)
);

