CREATE TABLE [dbo].[RM$OS$PRINTERS_MOVE_LIST] (
    [id]          INT             IDENTITY (1, 1) NOT NULL,
    [date_in]     DATETIME        CONSTRAINT [DF_RM$OS$PRINTERS_MOVE_LIST_date_in] DEFAULT (getdate()) NULL,
    [idm_os]      INT             NULL,
    [number_move] INT             NULL,
    [trouble]     VARCHAR (500)   NULL,
    [status]      INT             NULL,
    [summ]        DECIMAL (18, 2) NULL,
    [bill]        VARCHAR (50)    NULL,
    CONSTRAINT [PK_RM$OS$PRINTERS_MOVE_LIST] PRIMARY KEY CLUSTERED ([id] ASC)
);

