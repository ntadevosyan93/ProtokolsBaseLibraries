CREATE TABLE [dbo].[SITE_COMMENTS] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [date_in]     DATETIME      CONSTRAINT [DF_SITE_COMMENTS_date_in] DEFAULT (getdate()) NULL,
    [fio]         VARCHAR (300) NULL,
    [phone]       VARCHAR (50)  NULL,
    [email]       VARCHAR (300) NULL,
    [description] VARCHAR (MAX) NULL,
    CONSTRAINT [PK_SITE_COMMENTS] PRIMARY KEY CLUSTERED ([id] ASC)
);

