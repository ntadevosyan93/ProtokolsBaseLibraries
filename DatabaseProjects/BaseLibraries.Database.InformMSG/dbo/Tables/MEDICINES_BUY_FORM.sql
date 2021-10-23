CREATE TABLE [dbo].[MEDICINES_BUY_FORM] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [user_in]     VARCHAR (50) NULL,
    [date_in]     DATETIME     CONSTRAINT [DF_MEDICINES_BUY_FORM_date_in] DEFAULT (getdate()) NULL,
    [r_number]    INT          NULL,
    [idm_depart]  INT          NULL,
    [month_order] DATETIME     NULL,
    [idm_type]    INT          NULL,
    [idm_status]  INT          NULL,
    [user_cur]    VARCHAR (50) NULL,
    [date_cur]    DATETIME     NULL,
    [guid]        VARCHAR (50) NULL,
    [del]         INT          CONSTRAINT [DF_MEDICINES_BUY_FORM_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MEDICINES_BUY_FORM] PRIMARY KEY CLUSTERED ([id] ASC)
);

