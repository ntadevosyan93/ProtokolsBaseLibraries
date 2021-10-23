CREATE TABLE [dbo].[PARTNER_REQUIS] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [idm_partner] INT           NULL,
    [rs]          VARCHAR (50)  NULL,
    [bank]        VARCHAR (150) NULL,
    [bik]         VARCHAR (150) NULL,
    [cor]         VARCHAR (150) NULL,
    CONSTRAINT [PK_PARTNER_REQUIS] PRIMARY KEY CLUSTERED ([id] ASC)
);

