CREATE TABLE [dbo].[SBS$STEP_USER] (
    [id]           INT NOT NULL,
    [idm_step]     INT NULL,
    [idm_user]     INT NULL,
    [idm_algoritm] INT NULL,
    CONSTRAINT [PK_SBS$STEP_USER] PRIMARY KEY CLUSTERED ([id] ASC)
);

