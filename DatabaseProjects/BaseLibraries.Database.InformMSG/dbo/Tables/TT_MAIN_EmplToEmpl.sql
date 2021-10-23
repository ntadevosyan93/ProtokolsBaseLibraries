CREATE TABLE [dbo].[TT$MAIN_EmplToEmpl] (
    [id]              INT IDENTITY (1, 1) NOT NULL,
    [idm_empl_parent] INT NULL,
    [idm_empl_link]   INT NULL,
    [IsReplace]       INT CONSTRAINT [DF_TT$MAIN_EmplToEmpl_IsReplace] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TT$MAIN_EmplToEmpl] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TT$MAIN_EmplToEmpl_1]
    ON [dbo].[TT$MAIN_EmplToEmpl]([idm_empl_parent] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TT$MAIN_EmplToEmpl]
    ON [dbo].[TT$MAIN_EmplToEmpl]([idm_empl_link] ASC);

