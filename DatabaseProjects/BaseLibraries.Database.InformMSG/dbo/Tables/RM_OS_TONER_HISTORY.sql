CREATE TABLE [dbo].[RM$OS$TONER_HISTORY] (
    [id]            INT           NOT NULL,
    [text]          VARCHAR (150) NULL,
    [_count]        INT           NULL,
    [count_blocked] INT           NULL,
    [user_in]       VARCHAR (50)  NULL,
    [date_in]       DATETIME      NULL,
    [del]           INT           CONSTRAINT [DF_RM$OS$TONER_HISTORY_del] DEFAULT ((0)) NULL
);

