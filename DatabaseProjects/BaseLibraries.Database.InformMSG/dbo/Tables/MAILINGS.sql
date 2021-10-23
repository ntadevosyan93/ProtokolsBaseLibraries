CREATE TABLE [dbo].[MAILINGS] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [user_in]    VARCHAR (50)  NULL,
    [date_in]    DATETIME      CONSTRAINT [DF_MAILINGS_date_in] DEFAULT (getdate()) NULL,
    [tema]       VARCHAR (150) NULL,
    [text]       VARCHAR (MAX) NULL,
    [type]       INT           NULL,
    [date_start] DATETIME      NULL,
    [date_end]   DATETIME      NULL,
    [status]     INT           NULL,
    [guid]       VARCHAR (50)  NULL,
    [del]        INT           CONSTRAINT [DF_MAILINGS_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MAILINGS] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_MAILINGS_2]
    ON [dbo].[MAILINGS]([del] ASC, [guid] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MAILINGS_1]
    ON [dbo].[MAILINGS]([del] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MAILINGS]
    ON [dbo].[MAILINGS]([guid] ASC);

