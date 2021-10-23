CREATE TABLE [dbo].[KAD$WORK_TIME_DOLJN_GROUP] (
    [id]         INT          IDENTITY (1, 1) NOT NULL,
    [date_in]    DATETIME     CONSTRAINT [DF_KAD$WORK_TIME_DOLJN_GROUP_date_in] DEFAULT (getdate()) NULL,
    [user_in]    VARCHAR (50) NULL,
    [idm_parent] INT          CONSTRAINT [DF_KAD$WORK_TIME_DOLJN_GROUP_idm_parent] DEFAULT ((0)) NULL,
    [idm_doljn]  INT          CONSTRAINT [DF_KAD$WORK_TIME_DOLJN_GROUP_idm_doljn] DEFAULT ((0)) NULL,
    [groupName]  VARCHAR (50) NULL,
    [del]        INT          CONSTRAINT [DF_KAD$WORK_TIME_DOLJN_GROUP_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_DOLJN_GROUP] PRIMARY KEY CLUSTERED ([id] ASC)
);

