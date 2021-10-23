CREATE TABLE [dbo].[SMS_PHONE_MESSAGE_RULES] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [date_in]     DATETIME     CONSTRAINT [DF_PHONE_MESSAGE_RULES_date_in] DEFAULT (getdate()) NULL,
    [phone]       VARCHAR (50) NULL,
    [sms_only]    INT          CONSTRAINT [DF_PHONE_MESSAGE_RULES_sms_only] DEFAULT ((0)) NULL,
    [push_only]   INT          CONSTRAINT [DF_PHONE_MESSAGE_RULES_push_only] DEFAULT ((0)) NULL,
    [blacklisted] INT          CONSTRAINT [DF_PHONE_MESSAGE_RULES_blacklisted] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_PHONE_MESSAGE_RULES] PRIMARY KEY CLUSTERED ([id] ASC)
);

