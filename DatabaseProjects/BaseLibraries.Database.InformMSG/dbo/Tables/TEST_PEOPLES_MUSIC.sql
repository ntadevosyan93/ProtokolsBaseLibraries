CREATE TABLE [dbo].[TEST_PEOPLES_MUSIC] (
    [id]         INT      IDENTITY (1, 1) NOT NULL,
    [idm_people] INT      NULL,
    [idm_music]  INT      NULL,
    [deadline]   DATETIME NULL,
    CONSTRAINT [PK_TEST_PEOPLES_MUSIC] PRIMARY KEY CLUSTERED ([id] ASC)
);

