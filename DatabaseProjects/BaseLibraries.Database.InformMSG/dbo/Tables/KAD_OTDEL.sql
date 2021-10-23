CREATE TABLE [dbo].[KAD$OTDEL] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [text]    VARCHAR (150) NULL,
    [idm_org] INT           NULL,
    CONSTRAINT [PK_KAD$OTDEL] PRIMARY KEY CLUSTERED ([id] ASC)
);

