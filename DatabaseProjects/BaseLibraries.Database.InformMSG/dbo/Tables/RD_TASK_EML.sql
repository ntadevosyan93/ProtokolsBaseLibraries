CREATE TABLE [dbo].[RD$TASK_EML] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [user_in]       VARCHAR (50)  NULL,
    [date_in]       DATETIME      CONSTRAINT [DF_RD$TASK_EML_date_in] DEFAULT (getdate()) NULL,
    [idm_task]      INT           NULL,
    [idm_empl]      INT           NULL,
    [del]           INT           CONSTRAINT [DF_RD$TASK_EML_del] DEFAULT ((0)) NULL,
    [date_deadline] DATETIME      NULL,
    [msg]           VARCHAR (MAX) NULL,
    [status]        INT           NULL,
    CONSTRAINT [PK_RD$TASK_EML] PRIMARY KEY CLUSTERED ([id] ASC)
);

