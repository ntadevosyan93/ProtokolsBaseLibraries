CREATE TABLE [dbo].[SMS_MAIN_EUROLAB] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [phone_to]     VARCHAR (50)  NOT NULL,
    [text]         VARCHAR (512) NOT NULL,
    [date_in]      DATETIME      DEFAULT (getdate()) NOT NULL,
    [module]       VARCHAR (50)  NOT NULL,
    [status]       TINYINT       DEFAULT ((1)) NOT NULL,
    [MessageId]    VARCHAR (50)  NULL,
    [date_sending] DATETIME      NOT NULL,
    [date_sended]  DATETIME      NULL,
    [priority]     TINYINT       DEFAULT ((0)) NOT NULL,
    [date_expired] DATETIME      DEFAULT (getdate()+(1)) NULL,
    [f_type]       TINYINT       CONSTRAINT [DF_SMS_MAIN_EUROLAB_f_type] DEFAULT ((0)) NULL,
    [pushOnly]     INT           NULL,
    [smsOnly]      INT           CONSTRAINT [DF_SMS_MAIN_EUROLAB_smsOnly] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_SMS_MAIN_EUROLAB] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_EUROLAB_MessageId]
    ON [dbo].[SMS_MAIN_EUROLAB]([MessageId] DESC);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_EUROLAB]
    ON [dbo].[SMS_MAIN_EUROLAB]([status] ASC, [date_sending] ASC, [priority] ASC, [date_expired] ASC);

