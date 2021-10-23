CREATE TABLE [dbo].[EMPL_TO_EMPL] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [idm_empl_parent] INT          NULL,
    [idm_empl_link]   INT          NULL,
    [type]            VARCHAR (50) NULL,
    CONSTRAINT [PK_EMPL_TO_EMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

