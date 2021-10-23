CREATE TABLE [dbo].[EVENTS$PLAN_DETAIL] (
    [id]            INT      IDENTITY (1, 1) NOT NULL,
    [idm_evp]       INT      NULL,
    [date_plan_end] DATETIME NULL,
    [date_fact_end] DATETIME NULL,
    [idm_isp]       INT      NULL,
    CONSTRAINT [PK_EVENTS$PLAN_DETAIL] PRIMARY KEY CLUSTERED ([id] ASC)
);

