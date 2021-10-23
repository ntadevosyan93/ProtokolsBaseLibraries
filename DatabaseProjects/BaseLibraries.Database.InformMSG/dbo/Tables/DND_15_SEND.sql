CREATE TABLE [dbo].[DND_15_SEND] (
    [id]        INT      IDENTITY (1, 1) NOT NULL,
    [date_in]   DATETIME CONSTRAINT [DF_DND_15_SEND_date_in] DEFAULT (getdate()) NULL,
    [idm_dnd]   INT      NULL,
    [idm_email] INT      NULL,
    CONSTRAINT [PK_DND_15_SEND] PRIMARY KEY CLUSTERED ([id] ASC)
);

