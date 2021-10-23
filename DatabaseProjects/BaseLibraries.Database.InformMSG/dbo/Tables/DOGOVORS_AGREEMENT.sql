CREATE TABLE [dbo].[DOGOVORS$AGREEMENT] (
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [date_in]        DATETIME      CONSTRAINT [DF_DOGOVORS$AGREEMENT_date_in] DEFAULT (getdate()) NULL,
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
    [del]            INT           CONSTRAINT [DF_DOGOVORS$AGREEMENT_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_DOGOVORS$AGREEMENT] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER dbo.DogovorAgree_History
   ON   dbo.DOGOVORS$AGREEMENT
   AFTER DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here	
insert into DOGOVORS$AGREEMENT_HISTORY select * from deleted 
END