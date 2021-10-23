CREATE TABLE [dbo].[ANDROID_REVIEWS] (
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [date_in]        DATETIME      CONSTRAINT [DF_ANDROID_REVIEWS_date_in] DEFAULT (getdate()) NULL,
    [fio]            VARCHAR (150) NULL,
    [card_number]    VARCHAR (50)  NULL,
    [phone]          VARCHAR (50)  NULL,
    [filial]         VARCHAR (50)  NULL,
    [napravl_number] VARCHAR (50)  NULL,
    [text]           VARCHAR (MAX) NULL,
    CONSTRAINT [PK_ANDROID_REVIEWS] PRIMARY KEY CLUSTERED ([id] ASC)
);

