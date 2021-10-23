CREATE TABLE [dbo].[FILE_STOR] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [date_in]       DATETIME      CONSTRAINT [DF_FILE_STOR_date_in] DEFAULT (getdate()) NULL,
    [user_in]       VARCHAR (50)  NULL,
    [ip_in]         VARCHAR (50)  NULL,
    [file_path]     VARCHAR (500) NULL,
    [file_name]     VARCHAR (250) NULL,
    [file_guid]     VARCHAR (50)  NULL,
    [module]        VARCHAR (50)  NULL,
    [db_name]       VARCHAR (50)  NULL,
    [db_table]      VARCHAR (150) NULL,
    [db_table_id]   INT           NULL,
    [db_table_guid] VARCHAR (50)  NULL,
    [del]           TINYINT       CONSTRAINT [DF_FILE_STOR_del] DEFAULT ((0)) NULL,
    [date_del]      DATETIME      NULL,
    [user_del]      VARCHAR (50)  NULL,
    [ip_del]        VARCHAR (50)  NULL,
    [description]   VARCHAR (512) NULL,
    [guid]          VARCHAR (40)  NULL,
    [comment_del]   VARCHAR (250) NULL,
    CONSTRAINT [PK_FILE_STOR] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_FILE_STOR_1]
    ON [dbo].[FILE_STOR]([db_table] ASC, [db_table_id] DESC);


GO
CREATE NONCLUSTERED INDEX [IX_FILE_STOR]
    ON [dbo].[FILE_STOR]([guid] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[FILE_STOR] TO PUBLIC
    AS [dbo];

