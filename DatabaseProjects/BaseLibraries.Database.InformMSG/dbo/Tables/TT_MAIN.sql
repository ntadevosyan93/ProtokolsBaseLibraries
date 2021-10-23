CREATE TABLE [dbo].[TT$MAIN] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [user_in]         VARCHAR (50)  NULL,
    [date_in]         DATETIME      CONSTRAINT [DF_TT$MAIN_date_in] DEFAULT (getdate()) NULL,
    [idm_departments] INT           NULL,
    [text_problem]    VARCHAR (MAX) NULL,
    [date_start]      DATETIME      NULL,
    [date_stop]       DATETIME      NULL,
    [text_solution]   VARCHAR (MAX) NULL,
    [idm_empl]        INT           NULL,
    [status]          INT           NULL,
    [guid]            VARCHAR (80)  NULL,
    [del]             INT           CONSTRAINT [DF_TT$MAIN_del] DEFAULT ((0)) NULL,
    [idm_activity]    INT           NULL,
    [idm_place]       INT           NULL,
    [idm_object]      INT           NULL,
    [idm_os]          INT           NULL,
    [os_inv]          VARCHAR (50)  NULL,
    [date_cor]        DATETIME      NULL,
    [date_stop_plan]  DATETIME      NULL,
    [status_continue] INT           NULL,
    [idm_os_sost]     INT           NULL,
    [idm_control]     INT           NULL,
    [date_cor_update] DATETIME      NULL,
    [user_cor_update] VARCHAR (50)  NULL,
    [idm_patient]     INT           NULL,
    [idm_1c]          CHAR (9)      NULL,
    CONSTRAINT [PK_TT$MAIN] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TTMAIN_HIST] 
   ON  dbo.TT$MAIN
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
insert into TT$MAIN_HISTORY select * from deleted 
    -- Insert statements for trigger here

END