CREATE TABLE [dbo].[SMS_LOG] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [date_in] DATETIME      CONSTRAINT [DF_SMS_LOG_date_in] DEFAULT (getdate()) NULL,
    [text]    VARCHAR (MAX) NULL,
    CONSTRAINT [PK_SMS_LOG] PRIMARY KEY CLUSTERED ([id] ASC)
);

