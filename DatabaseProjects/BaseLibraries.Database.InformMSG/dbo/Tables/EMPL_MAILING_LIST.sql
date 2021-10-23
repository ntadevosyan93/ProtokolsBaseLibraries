CREATE TABLE [dbo].[EMPL_MAILING_LIST] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [date_in]       DATETIME     CONSTRAINT [DF_EMPL_MAILING_LIST_date_in] DEFAULT (getdate()) NULL,
    [user_in]       VARCHAR (50) NULL,
    [db_table_name] VARCHAR (50) NULL,
    [db_table_id]   INT          NULL,
    [IsSend]        TINYINT      CONSTRAINT [DF_EMPL_MAILING_LIST_IsSend] DEFAULT ((0)) NULL,
    [idm_empl]      INT          NULL,
    [user_cur]      VARCHAR (50) NULL,
    [date_cur]      DATETIME     NULL,
    [del]           TINYINT      CONSTRAINT [DF_EMPL_MAILING_LIST_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_EMPL_MAILING_LIST] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_EMPL_MAILING_LIST_3]
    ON [dbo].[EMPL_MAILING_LIST]([IsSend] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EMPL_MAILING_LIST_2]
    ON [dbo].[EMPL_MAILING_LIST]([idm_empl] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EMPL_MAILING_LIST_1]
    ON [dbo].[EMPL_MAILING_LIST]([del] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EMPL_MAILING_LIST]
    ON [dbo].[EMPL_MAILING_LIST]([db_table_id] ASC, [db_table_name] ASC);

