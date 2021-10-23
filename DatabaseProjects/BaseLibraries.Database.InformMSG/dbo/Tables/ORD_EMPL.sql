CREATE TABLE [dbo].[ORD$EMPL] (
    [id]       INT          IDENTITY (1, 1) NOT NULL,
    [user_in]  VARCHAR (50) NULL,
    [date_in]  DATETIME     CONSTRAINT [DF_ORD$EMPL_date_in] DEFAULT (getdate()) NULL,
    [idm_ord]  INT          NULL,
    [idm_empl] INT          NULL,
    [del]      INT          CONSTRAINT [DF_ORD$EMPL_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ORD$EMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

