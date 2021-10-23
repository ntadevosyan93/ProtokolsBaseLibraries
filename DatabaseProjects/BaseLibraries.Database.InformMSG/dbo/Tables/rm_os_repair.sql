CREATE TABLE [dbo].[rm$os$repair] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [date_in]       DATETIME      CONSTRAINT [DF_rm$os$repair_date_in] DEFAULT (getdate()) NULL,
    [user_in]       VARCHAR (50)  NULL,
    [idm_rm_os]     INT           NULL,
    [idm_partner]   INT           NULL,
    [date_start]    DATETIME      NULL,
    [date_end_plan] DATETIME      NULL,
    [date_end_fact] DATETIME      NULL,
    [text]          VARCHAR (250) NULL,
    [solution]      VARCHAR (512) NULL,
    [garant]        INT           NULL,
    CONSTRAINT [PK_rm$os$repair] PRIMARY KEY CLUSTERED ([id] ASC)
);

