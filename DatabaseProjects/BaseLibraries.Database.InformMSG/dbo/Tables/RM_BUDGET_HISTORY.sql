CREATE TABLE [dbo].[RM$BUDGET_HISTORY] (
    [id]               INT           NOT NULL,
    [date_in]          DATETIME      CONSTRAINT [DF_RM$BUDGET_HISTORY_date_in] DEFAULT (getdate()) NULL,
    [user_in]          VARCHAR (50)  NULL,
    [idm_Parent_group] INT           NULL,
    [idm_Child_group]  INT           NULL,
    [description]      VARCHAR (450) NULL,
    [month]            INT           NULL,
    [summ]             FLOAT (53)    NULL,
    [idm_curator]      INT           NULL,
    [idm_department]   INT           NULL,
    [del]              INT           CONSTRAINT [DF_RM$BUDGET_HISTORY_del] DEFAULT ((0)) NULL,
    [ParentID]         INT           NULL
);

