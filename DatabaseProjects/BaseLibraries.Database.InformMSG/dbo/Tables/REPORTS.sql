CREATE TABLE [dbo].[REPORTS] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [rep_name] VARCHAR (50)  NULL,
    [text]     VARCHAR (MAX) NULL,
    CONSTRAINT [PK_REPORTS] PRIMARY KEY CLUSTERED ([id] ASC)
);

