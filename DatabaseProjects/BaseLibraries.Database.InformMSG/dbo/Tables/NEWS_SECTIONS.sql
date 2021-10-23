CREATE TABLE [dbo].[NEWS_SECTIONS] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [user_in]     VARCHAR (50) NULL,
    [date_in]     DATETIME     CONSTRAINT [DF_NEWS_SECTIONS_date_in] DEFAULT (getdate()) NULL,
    [idm_news]    INT          NULL,
    [idm_section] INT          NULL,
    [user_cur]    VARCHAR (50) NULL,
    [date_cur]    DATETIME     NULL,
    [del]         INT          CONSTRAINT [DF_NEWS_SECTIONS_del] DEFAULT ((0)) NULL,
    [guid_news]   VARCHAR (50) NULL,
    CONSTRAINT [PK_NEWS_SECTIONS] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_NEWS_SECTIONS]
    ON [dbo].[NEWS_SECTIONS]([del] ASC, [guid_news] ASC, [idm_news] ASC);

