CREATE TABLE [dbo].[DOGOVORS$REG_AUTOAGREEMENT_EMPL_OWNER] (
    [id]        INT IDENTITY (1, 1) NOT NULL,
    [idm_empl]  INT NULL,
    [idm_owner] INT NULL,
    CONSTRAINT [PK_DOGOVOR$REG_AUTOAGREEMENT_EMPL_OWNER] PRIMARY KEY CLUSTERED ([id] ASC)
);

