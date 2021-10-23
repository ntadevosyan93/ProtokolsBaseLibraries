CREATE TABLE [dbo].[SSMP$INSURANCE_EMAILS] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [idm_insur] INT           NULL,
    [email]     VARCHAR (150) NULL,
    CONSTRAINT [PK_SSMP$INSURANCE_EMAILS] PRIMARY KEY CLUSTERED ([id] ASC)
);

