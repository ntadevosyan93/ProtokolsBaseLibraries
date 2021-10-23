CREATE TABLE [dbo].[ACTION_AREA] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [idm_action] INT           NULL,
    [date_start] DATETIME      NULL,
    [date_by]    DATETIME      NULL,
    [form]       VARCHAR (MAX) NULL,
    [activ]      BIT           NULL,
    [idm_area]   INT           NULL,
    CONSTRAINT [PK_ACTION_AREA] PRIMARY KEY CLUSTERED ([id] ASC)
);

