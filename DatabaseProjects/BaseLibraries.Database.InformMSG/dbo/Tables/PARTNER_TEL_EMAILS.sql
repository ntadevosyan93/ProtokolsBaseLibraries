CREATE TABLE [dbo].[PARTNER_TEL_EMAILS] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [idm_partner] INT          NULL,
    [telephone]   VARCHAR (50) NULL,
    [email]       VARCHAR (50) NULL,
    [isTelephone] INT          CONSTRAINT [DF_PARTNERS_TEL_EMAILS_isTelephone] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_PARTNERS_TEL_EMAILS] PRIMARY KEY CLUSTERED ([id] ASC)
);

