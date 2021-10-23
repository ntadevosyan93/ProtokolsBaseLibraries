CREATE TABLE [dbo].[RLS$1C] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [fileName] VARCHAR (50)  NULL,
    [raw]      VARCHAR (MAX) NULL,
    [name]     VARCHAR (350) NULL,
    [html]     VARCHAR (MAX) NULL,
    CONSTRAINT [PK_RLS$1C] PRIMARY KEY CLUSTERED ([id] ASC)
);

