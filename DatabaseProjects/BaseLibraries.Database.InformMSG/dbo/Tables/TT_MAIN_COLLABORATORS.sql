CREATE TABLE [dbo].[TT$MAIN_COLLABORATORS] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [date_in]  DATETIME      NULL,
    [user_in]  VARCHAR (150) NULL,
    [date_cur] DATETIME      NULL,
    [user_cur] VARCHAR (150) NULL,
    [idm_empl] INT           NULL,
    [idm_main] INT           NULL,
    [del]      INT           NULL,
    CONSTRAINT [PK_MAIN_COLLABORATORS] PRIMARY KEY CLUSTERED ([id] ASC)
);

