CREATE TABLE [dbo].[_projects_problems] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [data_in]     DATETIME      CONSTRAINT [DF__projects_problems_data_in] DEFAULT (getdate()) NOT NULL,
    [user_in]     VARCHAR (150) NULL,
    [idm_project] INT           NULL,
    [idm_status]  INT           NULL,
    [idm_type]    INT           NULL,
    [text]        VARCHAR (MAX) NULL,
    [del]         INT           CONSTRAINT [DF__projects_problems_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__projects_problems] PRIMARY KEY CLUSTERED ([id] ASC)
);

