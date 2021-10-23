CREATE TABLE [dbo].[ZAPIS$MAIN] (
    [id]      INT            IDENTITY (1, 1) NOT NULL,
    [fio]     VARCHAR (250)  NULL,
    [phone]   VARCHAR (50)   NULL,
    [email]   VARCHAR (50)   NULL,
    [spec]    VARCHAR (150)  NULL,
    [date]    DATETIME       NULL,
    [dop]     VARCHAR (1024) NULL,
    [date_in] DATE           CONSTRAINT [DF_ZAPIS$MAIN_date_in] DEFAULT (getdate()) NULL,
    [status]  SMALLINT       NULL
);

