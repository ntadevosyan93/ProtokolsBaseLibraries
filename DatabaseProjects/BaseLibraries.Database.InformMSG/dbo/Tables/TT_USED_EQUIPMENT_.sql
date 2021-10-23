CREATE TABLE [dbo].[TT$USED_EQUIPMENT_] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [idm_equipment] INT           NULL,
    [idm_unit]      INT           NULL,
    [count]         INT           NULL,
    [user_in]       VARCHAR (50)  NULL,
    [date_in]       DATETIME      CONSTRAINT [DF_TT$USED_EQUIPMENT__date_in] DEFAULT (getdate()) NULL,
    [idm_main]      INT           NULL,
    [text_main]     VARCHAR (MAX) NULL,
    [status]        INT           CONSTRAINT [DF_TT$USED_EQUIPMENT__status] DEFAULT ((0)) NULL,
    [del]           INT           CONSTRAINT [DF_TT$USED_EQUIPMENT__del] DEFAULT ((0)) NULL,
    [date_cor]      DATETIME      NULL,
    [user_cor]      VARCHAR (50)  NULL,
    CONSTRAINT [PK_TT$USED_EQUIPMENT_] PRIMARY KEY CLUSTERED ([id] ASC)
);

