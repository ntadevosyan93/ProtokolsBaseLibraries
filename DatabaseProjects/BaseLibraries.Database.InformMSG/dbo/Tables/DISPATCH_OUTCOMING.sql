CREATE TABLE [dbo].[DISPATCH$OUTCOMING] (
    [id]                     INT           IDENTITY (1, 1) NOT NULL,
    [date_in]                DATETIME      CONSTRAINT [DF_DISPATCH$OUTCOMING_date_in] DEFAULT (getdate()) NULL,
    [user_in]                VARCHAR (50)  NULL,
    [number]                 INT           NULL,
    [date_doc]               DATETIME      NULL,
    [idm_partner]            INT           NULL,
    [idm_partner_text]       VARCHAR (MAX) NULL,
    [idm_partner_doc_number] VARCHAR (50)  NULL,
    [idm_partner_doc_date]   DATETIME      NULL,
    [text]                   VARCHAR (MAX) NULL,
    [resolution]             VARCHAR (MAX) NULL,
    [idm_empl]               INT           NULL,
    [idm_empl_date_accept]   DATETIME      NULL,
    [date_deadline]          DATETIME      NULL,
    [notes]                  VARCHAR (MAX) NULL,
    [del]                    INT           CONSTRAINT [DF_DISPATCH$OUTCOMING_del] DEFAULT ((0)) NULL,
    [org_text]               VARCHAR (200) NULL,
    [idm_depart]             INT           NULL,
    CONSTRAINT [PK_DISPATCH$OUTCOMING] PRIMARY KEY CLUSTERED ([id] ASC)
);

