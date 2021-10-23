CREATE TABLE [dbo].[EMPL_MAILING_ALL] (
    [id]        INT IDENTITY (1, 1) NOT NULL,
    [idm_klass] INT NULL,
    [idm_empl]  INT NULL,
    [idm_owner] INT NULL,
    [del]       INT CONSTRAINT [DF_EMPL_MAILING_ALL_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_EMPL_MAILING_ALL] PRIMARY KEY CLUSTERED ([id] ASC)
);

