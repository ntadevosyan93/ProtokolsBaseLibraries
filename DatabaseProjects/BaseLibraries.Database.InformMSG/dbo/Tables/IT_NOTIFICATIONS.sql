CREATE TABLE [dbo].[IT_NOTIFICATIONS] (
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [user_in]        VARCHAR (50)  NULL,
    [date_in]        DATETIME      CONSTRAINT [DF_IT_NOTIFICATIONS_date_in] DEFAULT (getdate()) NULL,
    [db_table]       VARCHAR (50)  NULL,
    [db_table_id]    INT           NULL,
    [type_condition] INT           NULL,
    [value]          VARCHAR (150) NULL,
    [phone_number]   VARCHAR (50)  NULL,
    [email]          VARCHAR (50)  NULL,
    [user_send]      INT           NULL,
    [user_send_fio]  VARCHAR (150) NULL,
    [del]            INT           CONSTRAINT [DF_IT_NOTIFICATIONS_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_IT_NOTIFICATIONS] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_IT_NOTIFICATIONS_2]
    ON [dbo].[IT_NOTIFICATIONS]([del] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IT_NOTIFICATIONS_1]
    ON [dbo].[IT_NOTIFICATIONS]([db_table_id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IT_NOTIFICATIONS]
    ON [dbo].[IT_NOTIFICATIONS]([db_table] ASC);

