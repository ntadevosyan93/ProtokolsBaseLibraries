CREATE TABLE [dbo].[spam_patient_detected] (
    [id]         INT          IDENTITY (1, 1) NOT NULL,
    [date_in]    DATETIME     CONSTRAINT [DF_spam_patient_detected_date_in] DEFAULT (getdate()) NULL,
    [ip_in]      VARCHAR (50) NULL,
    [email_guid] VARCHAR (50) NULL,
    [spam_guid]  VARCHAR (50) NULL,
    CONSTRAINT [PK_spam_patient_detected] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_email_guid]
    ON [dbo].[spam_patient_detected]([email_guid] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_spam_guid]
    ON [dbo].[spam_patient_detected]([spam_guid] ASC);

