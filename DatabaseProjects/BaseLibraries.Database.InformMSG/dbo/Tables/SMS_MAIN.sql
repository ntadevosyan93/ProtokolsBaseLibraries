CREATE TABLE [dbo].[SMS_MAIN] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [phone_to]      VARCHAR (50)   NOT NULL,
    [text]          VARCHAR (1024) NOT NULL,
    [date_in]       DATETIME       CONSTRAINT [DF_SMS_MAIN_date_in] DEFAULT (getdate()) NOT NULL,
    [module]        VARCHAR (50)   NOT NULL,
    [status]        TINYINT        CONSTRAINT [DF_SMS_MAIN_status] DEFAULT ((1)) NOT NULL,
    [MessageId]     VARCHAR (50)   NULL,
    [date_sending]  DATETIME       NOT NULL,
    [date_sended]   DATETIME       NULL,
    [priority]      TINYINT        CONSTRAINT [DF_SMS_MAIN_priority] DEFAULT ((0)) NOT NULL,
    [date_expired]  DATETIME       CONSTRAINT [DF_SMS_MAIN_date_expired] DEFAULT (getdate()+(1)) NULL,
    [f_type]        TINYINT        CONSTRAINT [DF_SMS_MAIN_f_type] DEFAULT ((0)) NULL,
    [date_delivery] DATETIME       NULL,
    [reserv_send]   TINYINT        CONSTRAINT [DF_SMS_MAIN_reserv_send] DEFAULT ((0)) NULL,
    [spam_guid]     VARCHAR (50)   NULL,
    [pushOnly]      INT            CONSTRAINT [DF_SMS_MAIN_pushOnly] DEFAULT ((0)) NULL,
    [smsOnly]       INT            CONSTRAINT [DF_SMS_MAIN_smsOnly] DEFAULT ((0)) NULL,
    [external_guid] VARCHAR (50)   NULL,
    CONSTRAINT [PK_SMS_MAIN] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_PhoneA_idD]
    ON [dbo].[SMS_MAIN]([phone_to] ASC, [id] DESC);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_8]
    ON [dbo].[SMS_MAIN]([external_guid] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_7]
    ON [dbo].[SMS_MAIN]([pushOnly] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_6]
    ON [dbo].[SMS_MAIN]([status] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_5]
    ON [dbo].[SMS_MAIN]([module] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_4]
    ON [dbo].[SMS_MAIN]([phone_to] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_3]
    ON [dbo].[SMS_MAIN]([spam_guid] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_2]
    ON [dbo].[SMS_MAIN]([spam_guid] ASC, [phone_to] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN_1]
    ON [dbo].[SMS_MAIN]([MessageId] DESC);


GO
CREATE NONCLUSTERED INDEX [IX_SMS_MAIN]
    ON [dbo].[SMS_MAIN]([status] ASC, [date_sending] ASC, [priority] ASC, [date_expired] ASC);


GO
/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
create trigger SMS_MAIN_UPDATE on dbo.SMS_MAIN  for update
as
declare @status int
declare @id int
select @status=[status],@id=id from inserted
if @status=3 update SMS_MAIN set date_delivery=getdate() where id=@id