CREATE TABLE [dbo].[SMS_VIBER_SETTINGS] (
    [id]                INT           IDENTITY (1, 1) NOT NULL,
    [baseUrl]           VARCHAR (250) NULL,
    [login]             VARCHAR (50)  NULL,
    [password]          VARCHAR (50)  NULL,
    [validityPeriodSec] INT           NULL,
    [smsSrcAddress]     VARCHAR (50)  NULL,
    [subject]           VARCHAR (50)  NULL,
    CONSTRAINT [PK_SMS_VIBER_SETTINGS] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'имя при отправке из вайбера', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'SMS_VIBER_SETTINGS', @level2type = N'COLUMN', @level2name = N'subject';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'имя при отправке смс', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'SMS_VIBER_SETTINGS', @level2type = N'COLUMN', @level2name = N'smsSrcAddress';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'таймаут доставки вайбер сообщения в секундах', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'SMS_VIBER_SETTINGS', @level2type = N'COLUMN', @level2name = N'validityPeriodSec';

