CREATE TABLE [dbo].[GARAGE$AUTO_LIST_HISTORY] (
    [id]              INT           NULL,
    [fio]             VARCHAR (150) NULL,
    [doljn]           VARCHAR (150) NULL,
    [telefon]         VARCHAR (50)  NULL,
    [auto_mark]       VARCHAR (50)  NULL,
    [auto_reg_number] VARCHAR (50)  NULL,
    [tid]             INT           NULL,
    [date_in]         DATETIME      CONSTRAINT [DF_GARAGE$AUTO_LIST_HISTORY_date_in] DEFAULT (getdate()) NULL
);

