CREATE TABLE [dbo].[SITE_CALLS] (
    [id]      INT            IDENTITY (1, 1) NOT NULL,
    [date_in] DATETIME       CONSTRAINT [DF_SYTE_CALLS_date_in] DEFAULT (getdate()) NULL,
    [ip]      VARCHAR (50)   NULL,
    [phone]   VARCHAR (50)   NULL,
    [referer] VARCHAR (2048) NULL,
    CONSTRAINT [PK_SYTE_CALLS] PRIMARY KEY CLUSTERED ([id] ASC)
);

