CREATE TABLE [dbo].[GARAGE$AUTO_LIST] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [fio]             VARCHAR (150) NULL,
    [doljn]           VARCHAR (150) NULL,
    [telefon]         VARCHAR (50)  NULL,
    [auto_mark]       VARCHAR (50)  NULL,
    [auto_reg_number] VARCHAR (50)  NULL,
    [tid]             INT           NULL,
    [date_in]         DATETIME      CONSTRAINT [DF_GARAGE$AUTO_LIST_date_in] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_GARAGE$AUTO_LIST] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER auto_list_histor
   ON  GARAGE$AUTO_LIST
   AFTER INSERT, DELETE, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	INSERT INTO [InformMSG].[dbo].[GARAGE$AUTO_LIST_HISTORY] SELECT * FROM inserted
    -- Insert statements for trigger here

END