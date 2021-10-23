CREATE TABLE [dbo].[TEST_PEOPLES_FILMS] (
    [id]         INT      IDENTITY (1, 1) NOT NULL,
    [idm_people] INT      NULL,
    [idm_film]   INT      NULL,
    [deadline]   DATETIME NULL,
    CONSTRAINT [PK_TEST_PEOPLES_FILMS] PRIMARY KEY CLUSTERED ([id] ASC)
);

