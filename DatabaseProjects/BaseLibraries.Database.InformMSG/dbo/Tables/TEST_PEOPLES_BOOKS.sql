CREATE TABLE [dbo].[TEST_PEOPLES_BOOKS] (
    [id]         INT      IDENTITY (1, 1) NOT NULL,
    [idm_people] INT      NULL,
    [idm_book]   INT      NULL,
    [deadline]   DATETIME NULL,
    CONSTRAINT [PK_TEST_PEOPLES_BOOKS] PRIMARY KEY CLUSTERED ([id] ASC)
);

