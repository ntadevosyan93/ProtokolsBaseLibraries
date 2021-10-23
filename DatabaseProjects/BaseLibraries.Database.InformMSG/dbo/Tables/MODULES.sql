CREATE TABLE [dbo].[MODULES] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [text]        VARCHAR (50) NULL,
    [description] VARCHAR (50) NULL,
    CONSTRAINT [PK_MODULES] PRIMARY KEY CLUSTERED ([id] ASC)
);

