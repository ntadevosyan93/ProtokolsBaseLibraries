-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectMedOrderAll_1]
	-- Add the parameters for the stored procedure here
	@idm_med int,
	@month int,
	@year int,
	@type int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		DECLARE @sql NVARCHAR(4000) DECLARE @d_var datetime DECLARE @Error nvarchar(MAX);
	 declare @c_buy int

  SELECT @c_buy=count(id) from medicines_buy   with (nolocK) 
	where  month_order =@month and year_order=@year and del=0 and idm_med_ToOrder is not null

SET @sql = 'select a.id,a.GlobalParentID,a.idm_parent,a.[text]as name,klass_value as textED,
NULL as [all_summ], c.[text] as p_name, dbo.f_GetIsGroupMedicine_Order(a.id) as IsGroup '

SELECT @sql= @sql+',NULL as '+REPLACE(REPLACE([text],'.','_'),' ','_')
FROM DEPARTMENTS with (nolock) 
WHERE id IN
    (SELECT idm_depart
     FROM MEDICINES_BUY WITH (nolock)
     WHERE del=0
     GROUP BY idm_depart)
SET @sql = @sql+' from MEDICINES_TO_ORDER a with (nolock) 
join [MEDICINES_TO_ORDER] c  with (nolock) on c.id= a.idm_parent
left join KLASS  with (nolock) on klass_id=a.idm_ED and klass_name=@class_name where a.idm_parent = @idm_med'
	if(@type=1)
		SET @sql = @sql+' and a.GlobalParentID=@idm_med'

SET @sql = @sql+' and a.id not in (select  idm_med_ToOrder from MEDICINES_BUY  with (nolock) 
		where month_order =@d_month and year_order=@d_year and del=0 
		and idm_med_ToOrder is not null and a.idm_parent=@idm_med) '
	
SET @sql = @sql+'union 
 select a.id,a.GlobalParentID,a.idm_parent,a.[text]as name,klass_value as textED,
(select sum([count]) from  MEDICINES_BUY   with (nolocK) where MEDICINES_BUY.idm_med_ToOrder = a.id and MEDICINES_BUY.[month_order] = @d_month 
	and MEDICINES_BUY.[year_order] = @d_year and del=0) as [all_summ], c.[text] as p_name, dbo.f_GetIsGroupMedicine_Order(a.id) as IsGroup'
	 
 SELECT @sql = @sql + N', (select sum([count]) from  MEDICINES_BUY   with (nolocK) where MEDICINES_BUY.idm_med_ToOrder = a.id and MEDICINES_BUY.[month_order] = @d_month 
	and MEDICINES_BUY.[year_order] = @d_year and del=0 and idm_depart= '+ cast(id AS varchar(20))+')'
  FROM DEPARTMENTS  with (nolock) WHERE id IN
    (SELECT idm_depart
     FROM MEDICINES_BUY WITH (nolock)
     WHERE del=0
     GROUP BY idm_depart)

  SET @sql = @sql + ' from MEDICINES_BUY b with (nolock) 
 join [MEDICINES_TO_ORDER] a  with (nolock) on a.id= b.idm_med_ToOrder
 join [MEDICINES_TO_ORDER] c  with (nolock) on c.id= a.idm_parent
 left join KLASS  with (nolock) on klass_id=a.idm_ED and klass_name=@class_name
  where  month_order =@d_month and year_order=@d_year and b.del=0 
 and idm_med_ToOrder is not null and a.idm_parent=@idm_med'

	if(@type=1)
		SET @sql = @sql+' and a.GlobalParentID=@idm_med'

 SET @sql = @sql+' order by id ' 

BEGIN try print @sql 
		EXEC sp_executesql @sql,
        N'@d_month int,@d_year int,@class_name varchar(50),@idm_med int',
        @d_year=@year,
        @d_month = @month,
        @class_name='medicine_ED'
		,@idm_med =@idm_med 
		--select @sql
END try BEGIN catch
SET @Error = 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10)) + '; ' + 'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(10)) + '; ' + 'Error State: ' + CAST(ERROR_STATE() AS VARCHAR(10)) + '; ' + 'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR(10)) + '; ' + 'Error Message: ' + ERROR_MESSAGE()
SELECT @sql +' --- ',
       @Error END catch RETURN 
 
END