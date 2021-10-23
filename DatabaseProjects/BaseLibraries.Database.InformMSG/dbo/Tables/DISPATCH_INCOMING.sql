CREATE TABLE [dbo].[DISPATCH$INCOMING] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [date_in]          DATETIME      CONSTRAINT [DF_DISPATCH$INCOMING_date_in] DEFAULT (getdate()) NULL,
    [user_in]          VARCHAR (50)  NULL,
    [date_doc]         DATETIME      NULL,
    [number]           INT           NULL,
    [idm_partner]      INT           NULL,
    [idm_partner_text] VARCHAR (MAX) NULL,
    [idm_self]         INT           NULL,
    [type_dispatch]    INT           NULL,
    [text]             VARCHAR (MAX) NULL,
    [reg_number_blank] VARCHAR (50)  NULL,
    [notes]            VARCHAR (MAX) NULL,
    [del]              INT           CONSTRAINT [DF_DISPATCH$INCOMING_del] DEFAULT ((0)) NULL,
    [org_text]         VARCHAR (200) NULL,
    CONSTRAINT [PK_DISPATCH$INCOMING] PRIMARY KEY CLUSTERED ([id] ASC)
);

