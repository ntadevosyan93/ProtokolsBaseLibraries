CREATE TABLE [dbo].[RLS] (
    [id]  INT           IDENTITY (1, 1) NOT NULL,
    [num] INT           NULL,
    [raw] VARCHAR (MAX) NULL,
    CONSTRAINT [PK_RLS] PRIMARY KEY CLUSTERED ([id] ASC)
);

