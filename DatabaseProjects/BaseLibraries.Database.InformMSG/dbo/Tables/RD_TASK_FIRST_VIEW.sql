CREATE TABLE [dbo].[RD$TASK_FIRST_VIEW] (
    [id]       INT          IDENTITY (1, 1) NOT NULL,
    [idm_task] INT          NULL,
    [idm_empl] INT          NULL,
    [date_in]  DATETIME     CONSTRAINT [DF_RD$TASK_FIRST_VIEW_date_in] DEFAULT (getdate()) NULL,
    [visible]  INT          CONSTRAINT [DF_RD$TASK_FIRST_VIEW_visible] DEFAULT ((1)) NULL,
    [ip_in]    VARCHAR (50) NULL,
    CONSTRAINT [PK_RD$TASK_FIRST_VIEW] PRIMARY KEY CLUSTERED ([id] ASC)
);

