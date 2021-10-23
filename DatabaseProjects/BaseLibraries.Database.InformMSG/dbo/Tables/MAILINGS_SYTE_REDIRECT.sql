CREATE TABLE [dbo].[MAILINGS_SYTE_REDIRECT] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME     CONSTRAINT [DF_MAILINGS_SYTE_REDIRECT_date_in] DEFAULT (getdate()) NULL,
    [idm_mailings] INT          NULL,
    [ip]           VARCHAR (50) NULL,
    CONSTRAINT [PK_MAILINGS_SYTE_REDIRECT] PRIMARY KEY CLUSTERED ([id] ASC)
);

