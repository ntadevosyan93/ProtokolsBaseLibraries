CREATE TABLE [dbo].[SBS$STEP_NEXT] (
    [id]            INT IDENTITY (1, 1) NOT NULL,
    [idm_step]      INT NULL,
    [idm_step_next] INT NULL,
    CONSTRAINT [PK_SBS$STEP_NEXT] PRIMARY KEY CLUSTERED ([id] ASC)
);

