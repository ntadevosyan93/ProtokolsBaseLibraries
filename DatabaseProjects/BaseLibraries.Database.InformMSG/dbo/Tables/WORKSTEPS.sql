CREATE TABLE [dbo].[WORKSTEPS] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [date_in]  DATETIME      CONSTRAINT [DF_WORKSTEPS_date_in] DEFAULT (getdate()) NULL,
    [user_in]  VARCHAR (150) NULL,
    [idm_empl] INT           NULL,
    [text]     VARCHAR (MAX) NULL,
    CONSTRAINT [PK_WORKSTEPS] PRIMARY KEY CLUSTERED ([id] ASC)
);

