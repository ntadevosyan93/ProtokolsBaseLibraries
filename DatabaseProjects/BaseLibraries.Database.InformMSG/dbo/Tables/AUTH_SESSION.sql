CREATE TABLE [dbo].[AUTH$SESSION] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME     CONSTRAINT [DF_AUTH$SESSION_date_in] DEFAULT (getdate()) NULL,
    [ip_in]        VARCHAR (50) NULL,
    [guid_session] VARCHAR (50) CONSTRAINT [DF_AUTH$SESSION_guid_session] DEFAULT (newid()) NULL,
    [guid_user]    VARCHAR (50) NULL,
    [date_start]   DATETIME     CONSTRAINT [DF_AUTH$SESSION_date_start] DEFAULT (getdate()) NULL,
    [date_expired] DATETIME     CONSTRAINT [DF_AUTH$SESSION_date_expired] DEFAULT (getdate()+(1)) NULL,
    [closed]       INT          CONSTRAINT [DF_AUTH$SESSION_closed] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_AUTH$SESSION] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_AUTH$SESSION_1]
    ON [dbo].[AUTH$SESSION]([guid_session] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AUTH$SESSION]
    ON [dbo].[AUTH$SESSION]([date_expired] DESC, [closed] ASC, [guid_session] ASC);

