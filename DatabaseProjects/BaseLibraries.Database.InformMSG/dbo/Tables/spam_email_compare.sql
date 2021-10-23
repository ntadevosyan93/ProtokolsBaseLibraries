CREATE TABLE [dbo].[spam_email_compare] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [date_in] DATETIME      CONSTRAINT [DF_spam_email_compare_date_in] DEFAULT (getdate()) NULL,
    [email]   VARCHAR (250) NULL,
    [idm_1c]  VARCHAR (50)  NULL,
    [guid]    VARCHAR (50)  CONSTRAINT [DF_spam_email_compare_guid] DEFAULT (newid()) NULL,
    CONSTRAINT [PK_spam_email_compare] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_spam_email_compare_guid]
    ON [dbo].[spam_email_compare]([guid] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_spam_email_compare]
    ON [dbo].[spam_email_compare]([idm_1c] ASC);


GO
CREATE NONCLUSTERED INDEX [enailind]
    ON [dbo].[spam_email_compare]([email] ASC);

