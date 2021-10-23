CREATE TABLE [dbo].[SMS_ERRORS] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [date_in]    DATETIME      CONSTRAINT [DF_SMS_ERRORS_date_in] DEFAULT (getdate()) NULL,
    [table_name] VARCHAR (50)  NULL,
    [idm_sms]    INT           NULL,
    [idm_smpp]   INT           NULL,
    [error]      VARCHAR (MAX) NULL,
    CONSTRAINT [PK_SMS_ERRORS] PRIMARY KEY CLUSTERED ([id] ASC)
);

