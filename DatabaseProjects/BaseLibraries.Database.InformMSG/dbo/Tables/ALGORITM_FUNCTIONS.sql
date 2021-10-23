CREATE TABLE [dbo].[ALGORITM$FUNCTIONS] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [idm_main] INT           NULL,
    [text]     VARCHAR (250) NULL,
    CONSTRAINT [PK_ALGORITM$FUNCTIONS] PRIMARY KEY CLUSTERED ([id] ASC)
);

