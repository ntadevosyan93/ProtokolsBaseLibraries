CREATE TABLE [dbo].[DOGOVORS$AGREEMENT_HISTORY] (
    [id]             INT           NOT NULL,
    [date_in]        DATETIME      CONSTRAINT [DF_DOGOVORS$AGREEMENT_HISTORY_date_in] DEFAULT (getdate()) NULL,
    [user_in]        VARCHAR (50)  NULL,
    [idm_empl]       INT           NULL,
    [text_reason]    VARCHAR (MAX) NULL,
    [idm_reason]     SMALLINT      NULL,
    [sequence]       INT           NULL,
    [idm_dogovor]    INT           NULL,
    [date_getted]    DATETIME      NULL,
    [date_posted]    DATETIME      NULL,
    [date_reason]    DATETIME      NULL,
    [needRetryEmail] INT           NULL,
    [oldAgreement]   INT           NULL,
    [user_cur]       VARCHAR (50)  NULL,
    [date_cur]       DATETIME      NULL,
    [del]            INT           CONSTRAINT [DF_DOGOVORS$AGREEMENT_HISTORY_del] DEFAULT ((0)) NULL
);

