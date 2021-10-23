CREATE TABLE [dbo].[TEST_MUSIC] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME     CONSTRAINT [DF_TEST_MUSIC_date_in] DEFAULT (getdate()) NULL,
    [music_artist] VARCHAR (50) NULL,
    [music_song]   VARCHAR (50) NULL,
    [music_type]   INT          NULL,
    [del]          INT          CONSTRAINT [DF_TEST_MUSIC_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TEST_MUSIC] PRIMARY KEY CLUSTERED ([id] ASC)
);

