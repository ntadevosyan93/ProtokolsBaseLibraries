CREATE TABLE [dbo].[SBS$WORK_STEP] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [idm_work]     INT            NULL,
    [idm_step]     INT            NULL,
    [idm_user]     INT            NULL,
    [idm_algoritm] INT            NULL,
    [sequence]     SMALLINT       NULL,
    [type]         SMALLINT       NULL,
    [text]         VARCHAR (1024) NULL,
    [status]       TINYINT        CONSTRAINT [DF_SBS$WORK_STEP_status] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_SBS$WORK_STEP] PRIMARY KEY CLUSTERED ([id] ASC)
);

