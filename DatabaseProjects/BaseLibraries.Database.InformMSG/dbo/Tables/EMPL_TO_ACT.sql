CREATE TABLE [dbo].[EMPL_TO_ACT] (
    [id]           INT IDENTITY (1, 1) NOT NULL,
    [idm_activity] INT NULL,
    [idm_empl]     INT NULL,
    CONSTRAINT [PK_EMPL_TO_ACT] PRIMARY KEY CLUSTERED ([id] ASC)
);

