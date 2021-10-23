CREATE TABLE [dbo].[KAD$PSY_TEST_Protocol_EMPL] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [user_in]     VARCHAR (50)  NULL,
    [date_in]     DATETIME      CONSTRAINT [DF_KAD$PSY_TEST_Protocol_EMPL_date_in] DEFAULT (getdate()) NULL,
    [idm_empl]    INT           NULL,
    [idm_maneger] INT           NULL,
    [experiense]  VARCHAR (50)  NULL,
    [w_job]       BIT           NULL,
    [w_exp]       BIT           NULL,
    [w_carer]     BIT           NULL,
    [w_collect]   BIT           NULL,
    [w_shedule]   BIT           NULL,
    [w_value]     BIT           NULL,
    [w_empl]      BIT           NULL,
    [w_relative]  BIT           NULL,
    [feature]     VARCHAR (MAX) NULL,
    [result]      INT           NULL,
    [date_test]   DATETIME      NULL,
    [idm_psytest] INT           NULL,
    [education]   VARCHAR (50)  NULL
);

