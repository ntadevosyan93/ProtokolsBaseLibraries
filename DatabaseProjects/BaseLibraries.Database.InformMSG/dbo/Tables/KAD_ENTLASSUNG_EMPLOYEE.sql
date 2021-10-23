CREATE TABLE [dbo].[KAD$ENTLASSUNG_EMPLOYEE] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [user_in]      VARCHAR (50)  NULL,
    [date_in]      DATETIME      NULL,
    [user_cur]     VARCHAR (50)  NULL,
    [date_cur]     DATETIME      NULL,
    [idm_employee] INT           NULL,
    [idm_dolj]     INT           NULL,
    [idm_otdel]    INT           NULL,
    [idm_org]      INT           NULL,
    [date_ext]     DATETIME      NULL,
    [Note]         VARCHAR (500) NULL,
    [idm_chif]     INT           NULL,
    [del]          BIT           NULL,
    CONSTRAINT [PK_KAD$ENTLASSUNG_EMPLOYEE] PRIMARY KEY CLUSTERED ([id] ASC)
);

