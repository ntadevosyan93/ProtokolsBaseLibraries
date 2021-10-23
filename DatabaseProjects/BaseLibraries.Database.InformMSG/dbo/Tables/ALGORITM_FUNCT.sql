CREATE TABLE [dbo].[ALGORITM$FUNCT] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [idm_act]   INT           NULL,
    [idm_otdel] INT           NULL,
    [idm_doljn] INT           NULL,
    [text]      VARCHAR (250) NULL,
    CONSTRAINT [PK_ALGORITM$FUNCT] PRIMARY KEY CLUSTERED ([id] ASC)
);

