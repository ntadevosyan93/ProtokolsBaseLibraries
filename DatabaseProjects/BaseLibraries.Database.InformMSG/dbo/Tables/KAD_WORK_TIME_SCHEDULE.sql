CREATE TABLE [dbo].[KAD$WORK_TIME_SCHEDULE] (
    [id]         INT          IDENTITY (1, 1) NOT NULL,
    [date_in]    DATETIME     CONSTRAINT [DF_KAD$WORK_TIME_SCHEDULE_date_in] DEFAULT (getdate()) NULL,
    [user_in]    VARCHAR (50) NULL,
    [idm_doljn]  INT          NULL,
    [work_start] DATETIME     NULL,
    [work_stop]  DATETIME     NULL,
    [user_cur]   VARCHAR (50) NULL,
    [date_cur]   DATETIME     NULL,
    [del]        INT          CONSTRAINT [DF_KAD$WORK_TIME_SCHEDULE_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_SCHEDULE] PRIMARY KEY CLUSTERED ([id] ASC)
);

