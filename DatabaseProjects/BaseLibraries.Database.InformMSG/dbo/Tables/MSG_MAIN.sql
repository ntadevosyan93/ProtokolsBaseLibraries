CREATE TABLE [dbo].[MSG$MAIN] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [date_in]     DATETIME      CONSTRAINT [DF_MSG$MAIN_date_in] DEFAULT (getdate()) NULL,
    [user_in]     VARCHAR (50)  NULL,
    [ip_in]       VARCHAR (50)  NULL,
    [text]        VARCHAR (MAX) NULL,
    [module]      VARCHAR (20)  NULL,
    [db_name]     VARCHAR (50)  NULL,
    [db_table]    VARCHAR (50)  NULL,
    [db_table_id] INT           NULL,
    [to_user]     INT           NULL,
    [del]         TINYINT       CONSTRAINT [DF_MSG$MAIN_del] DEFAULT ((0)) NULL,
    [date_del]    DATETIME      NULL,
    [user_del]    VARCHAR (50)  NULL,
    [guid]        VARCHAR (50)  NULL,
    CONSTRAINT [PK_MSG$MAIN] PRIMARY KEY CLUSTERED ([id] ASC)
);

