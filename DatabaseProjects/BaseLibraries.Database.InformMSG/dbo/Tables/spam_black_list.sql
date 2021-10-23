CREATE TABLE [dbo].[spam_black_list] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [email]   VARCHAR (250) NULL,
    [comment] VARCHAR (MAX) NULL,
    [date_in] DATETIME      CONSTRAINT [DF_spam_black_list_date_in] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_smap_black_list] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_spam_black_list]
    ON [dbo].[spam_black_list]([email] ASC);

