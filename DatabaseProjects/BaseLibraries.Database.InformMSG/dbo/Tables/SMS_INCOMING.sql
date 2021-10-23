CREATE TABLE [dbo].[SMS_INCOMING] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [date_in]   DATETIME      CONSTRAINT [DF_SMS_INCOMING_date_in] DEFAULT (getdate()) NULL,
    [phoneFrom] VARCHAR (50)  NULL,
    [text]      VARCHAR (MAX) NULL,
    CONSTRAINT [PK_SMS_INCOMING] PRIMARY KEY CLUSTERED ([id] ASC)
);

