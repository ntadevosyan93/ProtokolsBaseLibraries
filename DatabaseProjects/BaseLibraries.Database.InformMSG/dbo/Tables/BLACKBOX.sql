CREATE TABLE [dbo].[BLACKBOX] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [date_in] DATETIME      CONSTRAINT [DF_LOG_date_in] DEFAULT (getdate()) NULL,
    [user_in] VARCHAR (150) NULL,
    [msg]     VARCHAR (MAX) NULL,
    [module]  VARCHAR (50)  NULL,
    [ip]      VARCHAR (20)  NULL,
    CONSTRAINT [PK_BLACKBOX] PRIMARY KEY CLUSTERED ([id] ASC)
);

