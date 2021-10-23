CREATE TABLE [dbo].[KAD$EMPLOYEE_CANDIDATS] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME      CONSTRAINT [DF_KAD$EMPLOYEE_CANDIDATS_date_in] DEFAULT (getdate()) NULL,
    [user_in]      VARCHAR (50)  NULL,
    [fam]          VARCHAR (50)  NULL,
    [name]         VARCHAR (50)  NULL,
    [otch]         VARCHAR (50)  NULL,
    [nomber_phone] VARCHAR (50)  NULL,
    [guid]         VARCHAR (50)  CONSTRAINT [DF_KAD$EMPLOYEE_CANDIDATS_guid] DEFAULT (newid()) NULL,
    [idm_doljn]    INT           NULL,
    [idm_otdel]    INT           NULL,
    [idm_empl]     INT           NULL,
    [del]          INT           CONSTRAINT [DF_KAD$EMPLOYEE_CANDIDATS_del] DEFAULT ((0)) NULL,
    [user_cor]     VARCHAR (50)  NULL,
    [date_cor]     DATETIME      NULL,
    [comment]      VARCHAR (MAX) NULL,
    CONSTRAINT [PK_KAD$EMPLOYEE_CANDIDATS] PRIMARY KEY CLUSTERED ([id] ASC)
);

