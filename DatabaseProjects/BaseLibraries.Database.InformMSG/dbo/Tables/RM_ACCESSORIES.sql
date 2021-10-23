CREATE TABLE [dbo].[RM$ACCESSORIES] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [user_in]     VARCHAR (20)   NULL,
    [date_in]     DATETIME       CONSTRAINT [DF_RM$ACCESSORIES_date_in] DEFAULT (getdate()) NULL,
    [text]        VARCHAR (1024) NULL,
    [idm_billing] INT            NULL,
    [idm_out_tt]  INT            NULL,
    [out_text]    VARCHAR (150)  NULL,
    [status_cor]  TINYINT        CONSTRAINT [DF_RM$ACCESSORIES_status] DEFAULT ((0)) NULL,
    [del]         TINYINT        CONSTRAINT [DF_RM$ACCESSORIES_del] DEFAULT ((0)) NULL,
    [user_cor]    VARCHAR (50)   NULL,
    [date_cor]    DATETIME       NULL,
    CONSTRAINT [PK_RM$ACCESSORIES] PRIMARY KEY CLUSTERED ([id] ASC)
);

