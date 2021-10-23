CREATE TABLE [dbo].[spam_list] (
    [id]             INT             IDENTITY (1, 1) NOT NULL,
    [date_in]        DATETIME        CONSTRAINT [DF_spam_list_date_in] DEFAULT (getdate()) NULL,
    [date_last_send] DATETIME        CONSTRAINT [DF_spam_list_date_last_send] DEFAULT (getdate()-(1)) NULL,
    [guid]           VARCHAR (150)   NULL,
    [title]          VARCHAR (150)   NULL,
    [html]           VARBINARY (MAX) NULL,
    [count]          INT             NULL,
    CONSTRAINT [PK_spam_list] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_spam_list]
    ON [dbo].[spam_list]([guid] ASC);

