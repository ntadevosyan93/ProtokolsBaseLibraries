CREATE TABLE [dbo].[SMS_VIBER_SENDED] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME       CONSTRAINT [DF_SMS_VIBER_SENDED_date_in] DEFAULT (getdate()) NULL,
    [phone]        VARCHAR (50)   NULL,
    [responseText] VARCHAR (1000) NULL,
    [text]         VARCHAR (2000) NULL,
    CONSTRAINT [PK_SMS_VIBER_SENDED] PRIMARY KEY CLUSTERED ([id] ASC)
);

