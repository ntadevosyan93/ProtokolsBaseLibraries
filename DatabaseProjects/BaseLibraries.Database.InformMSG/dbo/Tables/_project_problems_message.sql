CREATE TABLE [dbo].[_project_problems_message] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [date_in]     DATETIME      CONSTRAINT [DF__project_problems_message_date_in] DEFAULT (getdate()) NULL,
    [user_in]     VARCHAR (50)  NULL,
    [idm_problem] INT           NULL,
    [text]        VARCHAR (MAX) NULL,
    [del]         INT           CONSTRAINT [DF__project_problems_message_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__project_problems_message] PRIMARY KEY CLUSTERED ([id] ASC)
);

