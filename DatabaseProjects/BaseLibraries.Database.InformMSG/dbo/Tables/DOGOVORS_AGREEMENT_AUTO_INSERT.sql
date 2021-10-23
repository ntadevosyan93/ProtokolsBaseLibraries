CREATE TABLE [dbo].[DOGOVORS$AGREEMENT_AUTO_INSERT] (
    [id]           INT IDENTITY (1, 1) NOT NULL,
    [idm_empl]     INT NULL,
    [is_important] INT NULL,
    [idm_owner]    INT NULL,
    [idm_dog_type] INT NULL,
    CONSTRAINT [PK_DOGOVORS$AGREEMENT_AUTO_INSERT] PRIMARY KEY CLUSTERED ([id] ASC)
);

