CREATE TABLE [dbo].[RM$OS$TYPE] (
    [id]        INT          IDENTITY (1, 1) NOT NULL,
    [text]      VARCHAR (50) NULL,
    [parent_id] INT          NULL,
    CONSTRAINT [PK_RM$OS$TYPE] PRIMARY KEY CLUSTERED ([id] ASC)
);

