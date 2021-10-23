CREATE TABLE [dbo].[PROJECT$MAIN_EMPL] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [date_in]     DATETIME     CONSTRAINT [DF_PROJECT$MAIN_EMPL_date_in] DEFAULT (getdate()) NULL,
    [user_in]     VARCHAR (50) NULL,
    [idm_project] INT          NULL,
    [idm_empl]    INT          NULL,
    CONSTRAINT [PK_PROJECT$MAIN_EMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

