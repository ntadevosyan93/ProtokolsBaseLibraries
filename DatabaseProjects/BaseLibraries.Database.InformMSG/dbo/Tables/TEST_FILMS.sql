CREATE TABLE [dbo].[TEST_FILMS] (
    [id]                INT          IDENTITY (1, 1) NOT NULL,
    [date_in]           DATETIME     NULL,
    [film_name]         VARCHAR (50) NULL,
    [film_type]         INT          NULL,
    [film_date_release] DATETIME     NULL,
    [film_count]        INT          NULL,
    [del]               INT          CONSTRAINT [DF_TEST_FILMS_del] DEFAULT ((0)) NULL,
    [guid]              VARCHAR (50) CONSTRAINT [DF_TEST_FILMS_guid] DEFAULT (newid()) NULL,
    [parent_id]         INT          NULL,
    [order_id]          TINYINT      NULL,
    CONSTRAINT [PK_TEST_FILMS] PRIMARY KEY CLUSTERED ([id] ASC)
);

