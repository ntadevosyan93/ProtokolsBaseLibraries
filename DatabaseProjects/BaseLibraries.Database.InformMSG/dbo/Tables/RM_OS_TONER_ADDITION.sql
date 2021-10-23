CREATE TABLE [dbo].[RM$OS$TONER_ADDITION] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [user_in]     VARCHAR (50) NULL,
    [date_in]     DATETIME     CONSTRAINT [DF_RM$OS_TONER_ADDITION_date_in] DEFAULT (getdate()) NULL,
    [idm_toner]   INT          NULL,
    [count_toner] INT          NULL,
    [idm_billing] INT          NULL,
    [del]         INT          CONSTRAINT [DF_RM$OS$TONER_ADDITION_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_RM$OS_TONER_ADDITION] PRIMARY KEY CLUSTERED ([id] ASC)
);

