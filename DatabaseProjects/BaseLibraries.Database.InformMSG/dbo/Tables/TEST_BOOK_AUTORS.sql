CREATE TABLE [dbo].[TEST_BOOK_AUTORS] (
    [id]    INT          IDENTITY (1, 1) NOT NULL,
    [autor] VARCHAR (50) NULL,
    CONSTRAINT [PK_TEST_BOOK_AUTORS] PRIMARY KEY CLUSTERED ([id] ASC)
);

