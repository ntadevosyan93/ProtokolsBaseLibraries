-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectMedOrderAll]
	-- Add the parameters for the stored procedure here
	@idm_med int,
	@month int,
	@year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		DECLARE @sql NVARCHAR(4000),
		 @d_var datetime,
		 @Error nvarchar(MAX),
		 @c_buy varchar(max)
		 set @c_buy=''

	SELECT @c_buy=cast((select cast(idm_med_ToOrder as varchar(50)) + ',' AS 'data()' from medicines_buy a   with (nolocK) 
	   left join MEDICINES_TO_ORDER b  with (nolock) on b.id = idm_med_ToOrder
	 where  month_order =@month and year_order=@year and idm_med_ToOrder is not null and a.del=0  and b.GlobalParentID=@idm_med 
	 FOR XML PATH(''))  AS VARCHAR(MAX)) 

	SET @sql = 'select a.id as id,a.GlobalParentID,a.idm_parent,a.[text]as name,klass_value as textED,
	NULL as [all_summ], c.[text] as p_name, dbo.f_GetIsGroupMedicine_Order(a.id) as IsGroup '
	
	if(@c_buy!='') begin
		SELECT @sql= @sql+',NULL as '+REPLACE(REPLACE([text],'.','_'),' ','_')
		FROM DEPARTMENTS
		WHERE id IN
		(SELECT idm_depart FROM MEDICINES_BUY WITH (nolock) WHERE del=0 and month_order =@month and year_order=@year and idm_med_ToOrder is not null GROUP BY idm_depart)
		SET @sql = @sql+N' from MEDICINES_TO_ORDER a with (nolock) 
		join [MEDICINES_TO_ORDER] c  with (nolock) on c.id= a.idm_parent
		left join KLASS  with (nolock) on klass_id=a.idm_ED and klass_name=@class_name 
		where a.GlobalParentID=@idm_med and a.ID not in(select data from iClinic.dbo.Split(@c_buy,@flag))
		and dbo.f_GetIsGroupMedicine_Order(a.id)=0 and a.del=0'
	
		SET @sql = @sql+' union 
		select a.id as id,a.GlobalParentID,a.idm_parent,a.[text]as name,klass_value as textED,
		(select sum([count]) from  MEDICINES_BUY   with (nolocK) where MEDICINES_BUY.idm_med_ToOrder = a.id and MEDICINES_BUY.[month_order] = @d_month 
		and MEDICINES_BUY.[year_order] = @d_year and del=0) as [all_summ], c.[text] as p_name,
		 dbo.f_GetIsGroupMedicine_Order(a.id) as IsGroup'
	 
		SELECT @sql = @sql + N', (select sum([count]) from  MEDICINES_BUY   with (nolocK) where MEDICINES_BUY.idm_med_ToOrder = a.id and MEDICINES_BUY.[month_order] = @d_month 
		and MEDICINES_BUY.[year_order] = @d_year and del=0 and idm_depart= '+ cast(id AS varchar(20))+')'
		FROM DEPARTMENTS  with (nolock) WHERE id IN (SELECT idm_depart FROM MEDICINES_BUY WITH (nolock) WHERE del=0 and month_order =@month and year_order=@year and idm_med_ToOrder is not null GROUP BY idm_depart)

		SET @sql = @sql + ' from MEDICINES_BUY b with (nolock) 
		join [MEDICINES_TO_ORDER] a  with (nolock) on a.id= b.idm_med_ToOrder
		join [MEDICINES_TO_ORDER] c  with (nolock) on c.id= a.idm_parent
		left join KLASS  with (nolock) on klass_id=a.idm_ED and klass_name=@class_name
		where  b.idm_med_ToOrder in(select data from iClinic.dbo.Split(@c_buy,@flag)) and b.del=0 
		order by a.id'
	end
	else begin
		SET @sql = @sql+N' from MEDICINES_TO_ORDER a with (nolock) 
		join [MEDICINES_TO_ORDER] c  with (nolock) on c.id= a.idm_parent
		left join KLASS  with (nolock) on klass_id=a.idm_ED and klass_name=@class_name 
		where a.GlobalParentID=@idm_med and dbo.f_GetIsGroupMedicine_Order(a.id)=0 and a.del=0 
		
		order by a.id'
	end
BEGIN try print @sql 
		EXEC sp_executesql @sql,
        N'@d_month int,@d_year int,@class_name varchar(50),@flag varchar(50),@idm_med int,@c_buy varchar(max)',
        @d_year=@year,
        @d_month = @month,
        @class_name='medicine_ED', 
		@flag = ',',
		@idm_med=@idm_med,
		@c_buy=@c_buy
		--select @sql
END try BEGIN catch
SET @Error = 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10)) + '; ' + 'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(10)) + '; ' + 'Error State: ' + CAST(ERROR_STATE() AS VARCHAR(10)) + '; ' + 'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR(10)) + '; ' + 'Error Message: ' + ERROR_MESSAGE()
SELECT @sql +' --- ',
       @Error END catch RETURN 
 
END