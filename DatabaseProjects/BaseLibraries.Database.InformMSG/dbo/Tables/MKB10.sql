CREATE TABLE [dbo].[MKB10] (
    [id]   INT           IDENTITY (1, 1) NOT NULL,
    [text] VARCHAR (500) NULL,
    CONSTRAINT [PK_MKB10] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [INDTEXT]
    ON [dbo].[MKB10]([text] ASC);

