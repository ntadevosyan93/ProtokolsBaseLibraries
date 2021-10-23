-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployeeByFilter]
	-- Add the parameters for the stored procedure here

	@actual int,
	@fio varchar(150) =null,
	@idm_otdel int =null,
	@idm_org int  =null,
	@idm_doljn int =null
,@phone_mob varchar(50) = null
,@phone_vn varchar(50) = null
,@email  varchar(50) = null,
	@idm_controller int  =null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	declare @act int, @sql nvarchar(2000);
	set @sql ='SELECT a.*, b.fio_full, c.text, d.text as otdel_text, p.text as org_text,a.wt_check_fact_only  FROM [KAD$EMPLOYEE] a with (nolock)
		left join View$KAD$EMPLOYEE b  with (nolock) on b.id=a.id
		left join KAD$DOLJN c  with (nolock) on c.id = a.idm_doljn
		left join DEPARTMENTS d  with (nolock) on d.id = a.idm_otdel 
		left join  PARTNER p  with (nolock) on p.id =a.idm_org
		left join View$KAD$EMPLOYEE curat  with (nolock) on curat.id = a.idm_controller   where a.del=0 ';

	set @act =  case when @actual is null  then 0 else @actual end
	if(@act >0)	begin
		set @sql +=' and  actual=1	'
	end

		set @sql+= (case when not @fio is null and @fio!='' then ' and b.fio_full like ''%'+@fio+'%''' else ' and  a.fam like ''[а-я]%''' end)
				+ (case when not @idm_otdel is null and @idm_otdel>0 then ' and a.idm_otdel='+ cast(@idm_otdel as varchar(10)) else '' end)
				+ (case when not @idm_org is null and @idm_org>0 then ' and  a.idm_org='+cast(@idm_org as varchar(10))  else '' end)
				+ (case when not @idm_doljn is null and @idm_doljn>0 then ' and  a.idm_doljn='+cast(@idm_doljn  as varchar(10)) else '' end)
					+(case when not @phone_mob is null and @phone_mob!='' then ' and a.phone_mob like ''%'+@phone_mob+'%''' else ' ' end)
					+(case when not @phone_vn is null and @phone_vn!='' then ' and a.phone_vn like ''%'+@phone_vn+'%''' else ' ' end)
					+(case when not @email is null and @email!='' then ' and a.email like ''%'+@email+'%''' else ' ' end)
				+ (case when not @idm_controller is null and @idm_controller>0 then ' and  a.idm_controller='+cast(@idm_controller  as varchar(10)) else '' end)

				+' order by b.fio_full asc'

				
 DECLARE @Error nvarchar(MAX); 
begin try 
EXEC sp_executesql @sql 
--select @sql
end try
begin catch

	SET @Error = 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10)) + '; ' +
        'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(10)) + '; ' +
        'Error State: ' + CAST(ERROR_STATE() AS VARCHAR(10)) + '; ' +
        'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR(10)) + '; ' +
        'Error Message: ' + ERROR_MESSAGE()
     select @sql +' --- ', @Error
end catch
/*else
	begin
	if(@act >0)
		SELECT a.*, b.fio_full, c.text, d.text as otdel_text, p.text as org_text,a.wt_check_fact_only  FROM [KAD$EMPLOYEE] a with (nolock)
		left join View$KAD$EMPLOYEE b  with (nolock) on b.id=a.id
		left join KAD$DOLJN c  with (nolock) on c.id = a.idm_doljn
		left join DEPARTMENTS d  with (nolock) on d.id = a.idm_otdel 
		left join  PARTNER p  with (nolock) on p.id =a.idm_org
		where a.fam like '[а-я]%'   and a.del=0  and actual=@act order by b.fio_full asc
	else
		SELECT a.*, b.fio_full, c.text, d.text as otdel_text, p.text as org_text,a.wt_check_fact_only  FROM [KAD$EMPLOYEE] a with (nolock)
		left join View$KAD$EMPLOYEE b  with (nolock) on b.id=a.id
		left join KAD$DOLJN c  with (nolock) on c.id = a.idm_doljn
		left join DEPARTMENTS d  with (nolock) on d.id = a.idm_otdel 
		left join  PARTNER p  with (nolock) on p.id =a.idm_org
		where a.fam like '[а-я]%'  order by b.fio_full asc
	end*/

END