CREATE TABLE [dbo].[KAD$PSY_TEST_Protocol_CAND_HISTORY] (
    [pk]                 INT           IDENTITY (1, 1) NOT NULL,
    [id]                 INT           NOT NULL,
    [idm_empl]           INT           NULL,
    [user_in]            VARCHAR (50)  NULL,
    [date_in]            DATETIME      NULL,
    [idm_dolgn]          INT           NULL,
    [feature_text]       VARCHAR (MAX) NULL,
    [relative_empl]      VARCHAR (MAX) NULL,
    [idm_result]         INT           NULL,
    [idm_psytest]        INT           NULL,
    [education]          VARCHAR (50)  NULL,
    [date_test]          DATETIME      NULL,
    [date_cur]           DATETIME      NULL,
    [date_start_editing] DATETIME      NULL,
    CONSTRAINT [PK_KAD$PSY_TEST_Protocol_CAND_HISTORY2] PRIMARY KEY CLUSTERED ([pk] ASC)
);

