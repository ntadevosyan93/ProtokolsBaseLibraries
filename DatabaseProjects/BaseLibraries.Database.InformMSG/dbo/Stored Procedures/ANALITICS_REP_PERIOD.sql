-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ANALITICS#REP_PERIOD] 
	-- Add the parameters for the stored procedure here
	@dstart datetime, @dstop datetime,  @idm_report int
AS
BEGIN
	/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/

declare @tname varchar(50)
--declare @dstart varchar(20)
--declare @dstop varchar(20)
declare @sql_t varchar(1024)
declare @descr varchar(1024)
declare @tmp varchar(20)
declare @step_max int
declare @step int

--declare @idm_report int
--set @idm_report=2

declare @out table
(
out numeric(18,2)
)

set @tname= newid()
--set @dstart='01.07.2015'
set @dstop=@dstop+' 23:59:59'


select @step_max=max(step) from ANALITICS$REPORT_BY_DATE_LIST where idm_rbd=@idm_report
set @step=1
while @step<=@step_max
begin
	select @sql_t=sql_text, @descr=text from ANALITICS$REPORT_BY_DATE_LIST where step=@step
	select @sql_t=replace(@sql_t,'@dstart',@dstart)
	select @sql_t=replace(@sql_t,'@dstop',@dstop)
	insert into @out execute(@sql_t)
	select @tmp=out from @out 
	insert into  analitics$tmp_report(guid,text,cc1) values(@tname,@descr,@tmp)
	set @step=@step+1
end
SET NOCOUNT on;
  select text as Наименование,cc1 as Значение  from ANALITICS$TMP_REPORT where guid=@tname
  delete from ANALITICS$TMP_REPORT where guid=@tname
END