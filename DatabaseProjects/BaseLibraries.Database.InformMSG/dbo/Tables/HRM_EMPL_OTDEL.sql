CREATE TABLE [dbo].[HRM$EMPL_OTDEL] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [user_in]     VARCHAR (50) NULL,
    [date_in]     DATETIME     CONSTRAINT [DF_HRM$EMPL_OTDEL_date_in] DEFAULT (getdate()) NULL,
    [idm_empl]    INT          NULL,
    [idm_hrmType] INT          NULL,
    [IsNess]      INT          CONSTRAINT [DF_HRM$EMPL_OTDEL_IsNess] DEFAULT ((0)) NULL,
    [idm_depart]  INT          NULL,
    CONSTRAINT [PK_HRM$EMPL_OTDEL] PRIMARY KEY CLUSTERED ([id] ASC)
);

