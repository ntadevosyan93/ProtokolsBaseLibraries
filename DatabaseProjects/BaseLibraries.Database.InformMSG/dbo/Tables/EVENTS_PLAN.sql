CREATE TABLE [dbo].[EVENTS$PLAN] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [date_in]    DATETIME      CONSTRAINT [DF_EVENTS$PLAN_date_in] DEFAULT (getdate()) NULL,
    [user_in]    VARCHAR (150) NULL,
    [text]       VARCHAR (512) NULL,
    [date_start] DATETIME      NULL,
    [date_stop]  DATETIME      NULL,
    [period]     DATETIME      NULL,
    [date_next]  DATETIME      NULL,
    [idm_parent] INT           CONSTRAINT [DF_EVENTS$PLAN_idm_parent] DEFAULT ((0)) NULL,
    [type_id]    INT           NULL,
    CONSTRAINT [PK_EVENTS$PLAN] PRIMARY KEY CLUSTERED ([id] ASC)
);

