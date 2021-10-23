CREATE TABLE [dbo].[RD$TASK_EMPL_TO_EMPL] (
    [id]            INT IDENTITY (1, 1) NOT NULL,
    [idm_empl]      INT NULL,
    [idm_empl_link] INT NULL,
    CONSTRAINT [PK_RD$TASK_EMPL_TO_EMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

