CREATE TABLE [dbo].[SITE_PRIEM] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [date_in]       DATETIME      CONSTRAINT [DF_SITE_PRIEM_date_in] DEFAULT (getdate()) NULL,
    [fio]           VARCHAR (300) NULL,
    [phone]         VARCHAR (50)  NULL,
    [email]         VARCHAR (300) NULL,
    [spec]          VARCHAR (300) NULL,
    [date_incoming] VARCHAR (500) NULL,
    [description]   VARCHAR (MAX) NULL,
    [status]        INT           CONSTRAINT [DF_SITE_PRIEM_status] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_SITE_PRIEM] PRIMARY KEY CLUSTERED ([id] ASC)
);

