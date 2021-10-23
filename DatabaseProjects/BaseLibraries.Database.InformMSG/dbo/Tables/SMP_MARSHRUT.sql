CREATE TABLE [dbo].[SMP$MARSHRUT] (
    [id]           INT             IDENTITY (1, 1) NOT NULL,
    [idm_avto]     INT             NULL,
    [adres_start]  VARCHAR (2000)  NULL,
    [adres_stop]   VARCHAR (2000)  NULL,
    [date_in]      DATETIME        CONSTRAINT [DF_SMP$MARSHRUT_date_in] DEFAULT (getdate()) NULL,
    [date_start]   DATETIME        NULL,
    [date_stop]    DATETIME        NULL,
    [idm_smp_main] INT             NULL,
    [vuzov_num]    NCHAR (10)      NULL,
    [idm_empl]     INT             NULL,
    [descr]        VARCHAR (350)   NULL,
    [summa]        NUMERIC (18, 2) NULL,
    [del]          TINYINT         CONSTRAINT [DF_SMP$MARSHRUT_del] DEFAULT ((0)) NULL,
    [forupdate]    INT             CONSTRAINT [DF_SMP$MARSHRUT_forupdate] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_SMP$MARSHRUT] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[SMP$MARSHRUT_AfterUpdate]
   ON  [dbo].[SMP$MARSHRUT]
   AFTER UPDATE, Insert
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @date_start datetime
	declare @date_stop datetime
	declare @idm_main varchar(50)
	declare @idm_main_int int
	
	set @idm_main_int = 0
	
	select @date_start = date_start, @date_stop = date_stop, @idm_main = RTRIM(LTRIM(vuzov_num))
	from inserted
	
	SELECT @idm_main_int = (CASE WHEN ISNUMERIC(@idm_main) = 1 THEN CAST(@idm_main AS INT) ELSE 0 end)
	
	if @idm_main_int > 0 begin			
			update SSMP$MAIN set date_car_start = @date_start, date_car_stop = @date_stop where id = @idm_main_int
			
			if not (@date_stop is null) begin
				update SSMP$MAIN set date_car_diff = (select DATEADD(s, DATEDIFF(SECOND,@date_start,@date_stop), '20000101')) where id = @idm_main_int
			end
	end 

    -- Insert statements for trigger here

END
GO
GRANT SELECT
    ON OBJECT::[dbo].[SMP$MARSHRUT] TO [Inform_User]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SMP$MARSHRUT] TO [Inform_User]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[SMP$MARSHRUT] TO [Inform_User]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[SMP$MARSHRUT] TO [Inform_User]
    AS [dbo];

