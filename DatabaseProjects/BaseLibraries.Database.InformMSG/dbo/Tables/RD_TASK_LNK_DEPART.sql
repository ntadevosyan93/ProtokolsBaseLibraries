CREATE TABLE [dbo].[RD$TASK_LNK_DEPART] (
    [id]         INT          IDENTITY (1, 1) NOT NULL,
    [idm_task]   INT          NULL,
    [idm_depart] INT          NULL,
    [date_in]    DATETIME     CONSTRAINT [DF_RD$TASK_LNK_DEPART_date_in] DEFAULT (getdate()) NULL,
    [user_in]    VARCHAR (10) NULL,
    [del]        TINYINT      CONSTRAINT [DF_RD$TASK_LNK_DEPART_del] DEFAULT ((0)) NULL,
    [lnk_type]   SMALLINT     NULL,
    CONSTRAINT [PK_RD$TASK_LNK_DEPART] PRIMARY KEY CLUSTERED ([id] ASC)
);

