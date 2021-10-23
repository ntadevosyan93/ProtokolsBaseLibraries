CREATE TABLE [dbo].[MAILINGS_SERVICES] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [user_in]      VARCHAR (50) NULL,
    [date_in]      DATETIME     CONSTRAINT [DF_MAILINGS_SERVICES_date_in] DEFAULT (getdate()) NULL,
    [idm_mailing]  INT          NULL,
    [idm_services] INT          NULL,
    [del_date]     DATETIME     NULL,
    [del]          INT          CONSTRAINT [DF_MAILINGS_SERVICES_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MAILINGS_SERVICES] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_MAILINGS_SERVICES_1]
    ON [dbo].[MAILINGS_SERVICES]([del] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MAILINGS_SERVICES]
    ON [dbo].[MAILINGS_SERVICES]([idm_mailing] ASC, [del] ASC);

