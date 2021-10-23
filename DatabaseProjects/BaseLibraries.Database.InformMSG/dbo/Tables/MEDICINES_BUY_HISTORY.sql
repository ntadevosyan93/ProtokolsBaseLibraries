CREATE TABLE [dbo].[MEDICINES_BUY_HISTORY] (
    [id]              INT           NOT NULL,
    [user_in]         VARCHAR (50)  NULL,
    [date_in]         DATETIME      CONSTRAINT [DF_MEDICINES_BUY_HISTORY_date_in] DEFAULT (getdate()) NULL,
    [idm_depart]      INT           NULL,
    [idm_buy_form]    INT           NULL,
    [date_order]      DATETIME      NULL,
    [month_order]     INT           NULL,
    [year_order]      INT           NULL,
    [idm_med_ToOrder] INT           NULL,
    [count]           INT           NULL,
    [idm_status]      INT           CONSTRAINT [DF_MEDICINES_BUY_HISTORY_idm_status] DEFAULT ((1)) NULL,
    [comment]         VARCHAR (250) NULL,
    [user_cur]        VARCHAR (50)  NULL,
    [date_cur]        DATETIME      NULL,
    [del]             INT           CONSTRAINT [DF_MEDICINES_BUY_HISTORY_del] DEFAULT ((0)) NULL
);

