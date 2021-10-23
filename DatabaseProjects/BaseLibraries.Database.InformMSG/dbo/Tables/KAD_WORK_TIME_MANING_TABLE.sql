CREATE TABLE [dbo].[KAD$WORK_TIME_MANING_TABLE] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME     CONSTRAINT [DF_KAD$WORK_TIME_MANING_TABLE_date_in] DEFAULT (getdate()) NULL,
    [user_in]      VARCHAR (50) NULL,
    [idm_depart]   INT          NULL,
    [idm_dolgn]    INT          NULL,
    [countPersons] INT          NULL,
    [date_from]    DATETIME     NULL,
    [date_by]      DATETIME     NULL,
    [countByState] INT          NULL,
    [max_time]     FLOAT (53)   NULL,
    [user_cur]     VARCHAR (50) NULL,
    [date_cur]     DATETIME     NULL,
    [del]          INT          CONSTRAINT [DF_KAD$WORK_TIME_MANING_TABLE_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_MANING_TABLE] PRIMARY KEY CLUSTERED ([id] ASC)
);

