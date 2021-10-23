CREATE TABLE [dbo].[KAD$PSY_TEST_Protocol_CAND_HISTORY3] (
    [id]                 INT           NOT NULL,
    [idm_empl]           INT           NULL,
    [user_in]            VARCHAR (50)  NULL,
    [date_in]            DATETIME      CONSTRAINT [DF_KAD$PSY_TEST_Protocol_CAND_HISTORY_date_in] DEFAULT (getdate()) NULL,
    [idm_dolgn]          INT           NULL,
    [feature_text]       VARCHAR (MAX) NULL,
    [relative_empl]      VARCHAR (MAX) NULL,
    [idm_result]         INT           NULL,
    [idm_psytest]        INT           NULL,
    [education]          VARCHAR (50)  NULL,
    [date_test]          DATETIME      NULL,
    [date_cur]           DATETIME      NULL,
    [date_start_editing] DATETIME      NULL
);

