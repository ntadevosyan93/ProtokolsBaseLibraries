-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RepTasksByRoleEmpl]

	@idm_empl int,
	@type int,
	@date_in datetime, @date_to datetime,
	@AllowDate int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	/*
	0-все
	1-завершенные
	2-Не завершенные
	*/
	/*declare @r_ispoln varchar(50),@r_autor varchar(50),@r_contr varchar(50),@r_ispAutor varchar(50),@r_IspAutContr varchar(50),
	@r_IspolnContr varchar(50),@r_AutKontr varchar(50),@r_soisp varchar(150)
	set @r_ispoln = 'Исполнитель' set @r_autor='Автор'   set @r_contr = 'Контроль'  set @r_ispAutor= 'Исполнитель+автор'  
	set @r_IspAutContr='Исполнитель+автор+контроль' set @r_soisp='Соисполнитель: '
	set @r_IspolnContr='Исполнитель+контроль'   set @r_AutKontr='Автор+контроль' */
	declare @sql nvarchar(max),@sql2 varchar(max), @Error nvarchar(MAX); 
	set @sql ='select id,date_in,tema,date_stop,status_t,autor,ispoln,
			(case 
			when (idm_isp=@idm_empl and idm_author!=@idm_empl and idm_kontrol!=@idm_empl) then @r_ispoln
			when (idm_isp!=@idm_empl and idm_author=@idm_empl and idm_kontrol!=@idm_empl) then  @r_autor
			when (idm_isp!=@idm_empl and idm_author!=@idm_empl and idm_kontrol=@idm_empl) then @r_contr
			when (idm_isp=@idm_empl and idm_author=@idm_empl and idm_kontrol!=@idm_empl) then @r_ispAutor
			when (idm_isp=@idm_empl and idm_author=@idm_empl and idm_kontrol=@idm_empl)  then  @r_IspAutContr
			when (idm_isp=@idm_empl and idm_author!=@idm_empl and idm_kontrol=@idm_empl) then @r_IspolnContr
			when (idm_isp!=@idm_empl and idm_author=@idm_empl and idm_kontrol=@idm_empl) then @r_AutKontr
			end) as type,[status_t] as task_status,role_status,v.guid
			from View$RD$TASK v  with (nolock) where (idm_isp=@idm_empl or idm_author=@idm_empl or idm_kontrol=@idm_empl) and  del=0  		'

	set @sql2 = ' union 
			select v.id,v.date_in,tema,date_stop,status_t,autor,ispoln,@r_soisp+klass_value
			, v.status_t,role_status,v.guid
			from View$RD$TASK v with (nolock) 
			left join RD$TASK_EML  with (nolock) on RD$TASK_EML.idm_empl=@idm_empl and RD$TASK_EML.idm_task=v.id
			left join KLASS  with (nolock) on KLASS.klass_id = RD$TASK_EML.status and klass_name=@klass_name
			where
			 v.id in (select RD$TASK_EML.idm_task from RD$TASK_EML with (nolock)  where RD$TASK_EML.idm_empl=@idm_empl and RD$TASK_EML.del=0) 
			and v.del=0 and not v.id  in(select id from View$RD$TASK v with (nolock)  where 
			 (idm_isp=@idm_empl or idm_author=@idm_empl or idm_kontrol=@idm_empl) and   del=0 )'
	if(@AllowDate=0) begin 
		set @sql += ' and v.date_in between @date_in and @date_to '
		set @sql2 += ' and v.date_in between @date_in and @date_to '
	end
	if(@type=1) begin		
		set @sql += ' and role_status =1 '
		set @sql2 += ' and role_status =1 '
	end	
	if(@type=2) begin		
		set @sql += ' and role_status =0 '
		set @sql2 += ' and role_status =0 '
	end	
	set @sql+=@sql2+' order by date_stop desc'

	begin try 
EXEC sp_executesql @sql ,N'@klass_name varchar(50),@date_in datetime, @date_to datetime,
	@r_ispoln varchar(50),@r_autor varchar(50),@r_contr varchar(50),@r_ispAutor varchar(50),@r_IspAutContr varchar(50),
	@r_IspolnContr varchar(50),@r_AutKontr varchar(50),@r_soisp varchar(150),@idm_empl int', @klass_name='rd_task_status'
	,@date_in =@date_in, @date_to = @date_to, @r_ispoln = 'Исполнитель', @r_autor='Автор', @r_contr = 'Контроль', @r_ispAutor= 'Исполнитель+автор'  
	, @r_IspAutContr='Исполнитель+автор+контроль', @r_soisp='Соисполнитель: '
	, @r_IspolnContr='Исполнитель+контроль', @r_AutKontr='Автор+контроль',@idm_empl=@idm_empl
 print @sql
end try
begin catch
	SET @Error = 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10)) + '; ' +
        'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(10)) + '; ' +
        'Error State: ' + CAST(ERROR_STATE() AS VARCHAR(10)) + '; ' +
        'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR(10)) + '; ' +
        'Error Message: ' + ERROR_MESSAGE()
     select @sql +' --- ', @Error
end catch
END