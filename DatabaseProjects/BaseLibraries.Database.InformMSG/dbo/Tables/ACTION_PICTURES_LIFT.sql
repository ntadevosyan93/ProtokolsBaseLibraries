CREATE TABLE [dbo].[ACTION_PICTURES_LIFT] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [date_in]    DATETIME      CONSTRAINT [DF_ACTION_PICTURES_LIFT_date_in] DEFAULT (getdate()) NULL,
    [user_in]    VARCHAR (50)  NULL,
    [file_path]  VARCHAR (MAX) NULL,
    [status]     INT           NULL,
    [idm_action] INT           NULL,
    [text]       VARCHAR (MAX) NULL,
    [resolution] VARCHAR (50)  NULL,
    [guid]       VARCHAR (50)  NULL,
    [del]        INT           CONSTRAINT [DF_ACTION_PICTURES_LIFT_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ACTION_PICTURES_LIFT] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Del]
    ON [dbo].[ACTION_PICTURES_LIFT]([del] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Del_action]
    ON [dbo].[ACTION_PICTURES_LIFT]([del] ASC, [idm_action] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Guid]
    ON [dbo].[ACTION_PICTURES_LIFT]([guid] ASC);

