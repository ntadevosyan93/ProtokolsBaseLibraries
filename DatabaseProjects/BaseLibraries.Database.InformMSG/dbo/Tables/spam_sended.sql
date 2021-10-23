CREATE TABLE [dbo].[spam_sended] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [email]    VARCHAR (150) NULL,
    [date_in]  DATETIME      CONSTRAINT [DF_spam_sended_date_in] DEFAULT (getdate()) NULL,
    [msg_guid] VARCHAR (150) NULL,
    CONSTRAINT [PK_spam_sended] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_spam_sended]
    ON [dbo].[spam_sended]([msg_guid] ASC);

