CREATE TABLE [dbo].[RD$TASK_LNK_ACC] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [idm_empl]        INT          NULL,
    [idm_empl_access] INT          NULL,
    [date_in]         DATETIME     CONSTRAINT [DF_RD$TASK_LNK_ACC_date_in] DEFAULT (getdate()) NULL,
    [user_in]         VARCHAR (50) NULL,
    CONSTRAINT [PK_RD$TASK_LNK_ACC] PRIMARY KEY CLUSTERED ([id] ASC)
);

