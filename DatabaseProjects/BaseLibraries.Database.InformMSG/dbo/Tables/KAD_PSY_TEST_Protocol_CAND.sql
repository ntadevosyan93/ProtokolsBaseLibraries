CREATE TABLE [dbo].[KAD$PSY_TEST_Protocol_CAND] (
    [id]                 INT           IDENTITY (1, 1) NOT NULL,
    [idm_empl]           INT           NULL,
    [user_in]            VARCHAR (50)  NULL,
    [date_in]            DATETIME      CONSTRAINT [DF_KAD$PSY_TEST_Protocol_CAND_date_in] DEFAULT (getdate()) NULL,
    [idm_dolgn]          INT           NULL,
    [feature_text]       VARCHAR (MAX) NULL,
    [relative_empl]      VARCHAR (MAX) NULL,
    [idm_result]         INT           NULL,
    [idm_psytest]        INT           NULL,
    [education]          VARCHAR (50)  NULL,
    [date_test]          DATETIME      NULL,
    [date_cur]           DATETIME      NULL,
    [date_start_editing] DATETIME      NULL,
    CONSTRAINT [PK_KAD$PSY_TEST_Protocol_CAND] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE TRIGGER [dbo].[KAD$PSY_TEST_Protocol_CANDAfterUpdate]
   ON  [dbo].[KAD$PSY_TEST_Protocol_CAND]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;	
insert into KAD$PSY_TEST_Protocol_CAND_HISTORY
select [id], [idm_empl], [user_in], [date_in], [idm_dolgn], [feature_text], [relative_empl], [idm_result], [idm_psytest], [education], [date_test], [date_cur], [date_start_editing] from deleted 	

END