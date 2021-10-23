CREATE TABLE [dbo].[RM$OS$REFILING_CARTRIGES_HISTORY] (
    [id]             INT          NOT NULL,
    [idm_cartridges] INT          NULL,
    [date_in]        DATETIME     CONSTRAINT [DF_RM$OS$REFILING_CARTRIGES_HISTORY_date_in] DEFAULT (getdate()) NULL,
    [user_in]        VARCHAR (50) NULL,
    [count_toner]    INT          NULL,
    [idm_services]   INT          NULL,
    [del]            INT          CONSTRAINT [DF_RM$OS$REFILING_CARTRIGES_HISTORY_del] DEFAULT ((0)) NULL
);

