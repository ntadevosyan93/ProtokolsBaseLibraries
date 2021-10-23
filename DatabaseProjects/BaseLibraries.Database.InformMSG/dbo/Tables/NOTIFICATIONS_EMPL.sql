CREATE TABLE [dbo].[NOTIFICATIONS_EMPL] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [date_in]     DATETIME     CONSTRAINT [DF_NOTIFICATIONS_EMPL_date_in] DEFAULT (getdate()) NULL,
    [user_in]     VARCHAR (50) NULL,
    [guid_notifi] VARCHAR (50) NULL,
    [idm_empl]    INT          NULL,
    [readed]      TINYINT      CONSTRAINT [DF_NOTIFICATIONS_EMPL_readed] DEFAULT ((0)) NULL,
    [date_read]   DATETIME     NULL,
    [ip_read]     VARCHAR (50) NULL,
    CONSTRAINT [PK_NOTIFICATIONS_EMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

