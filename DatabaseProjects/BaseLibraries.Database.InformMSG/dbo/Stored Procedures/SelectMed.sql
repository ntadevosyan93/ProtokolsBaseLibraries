-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectMed]
	-- Add the parameters for the stored procedure here
	@idm_med int,
	@month int,
	@year int,
	@user_in varchar(50),
	@idm_depart int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @sql NVARCHAR(4000)
  declare @d_var datetime
  declare @c_buy varchar(max)
  set @c_buy=''

 DECLARE @Error nvarchar(MAX);
  begin try
	 SELECT @c_buy=cast((select cast(idm_med_ToOrder as varchar(50)) + ',' AS 'data()' from medicines_buy a   with (nolocK) 
	   left join MEDICINES_TO_ORDER b  with (nolock) on b.id = idm_med_ToOrder
	 where a.user_in =@user_in and month_order =@month and year_order=@year and idm_med_ToOrder is not null
	 and idm_depart=@idm_depart and a.del=0  and b.GlobalParentID=@idm_med 
	 FOR XML PATH(''))  AS VARCHAR(MAX)) 

	if(@c_buy!='')
		(select a.id,a.GlobalParentID,a.idm_parent,klass_value as textED,
		NULL as [count],NULL as comment,NULL as idm_status,a.idm_1C,a.[text] as name,
		c.[text] as p_name, dbo.f_GetIsGroupMedicine_Order(a.id) as IsGroup  
		from MEDICINES_TO_ORDER a  with (nolock) 
		left join [MEDICINES_TO_ORDER] c  with (nolock) on c.id= a.idm_parent
		 join KLASS  with (nolock) on klass_id=a.idm_ED and klass_name='medicine_ED'
		where a.GlobalParentID=@idm_med and a.ID not in(select data from iClinic.dbo.Split(@c_buy,','))
		and dbo.f_GetIsGroupMedicine_Order(a.id)=0 and a.del=0 and (a.IsNew=0 or a.user_in= @user_in)
		union 
		select idm_med_ToOrder,a.GlobalParentID,a.idm_parent,klass_value as textED,
		[count],comment,idm_status, a.idm_1C,a.[text] as name, c.[text] as p_name, dbo.f_GetIsGroupMedicine_Order(a.id) as IsGroup 
		from MEDICINES_BUY b with (nolock) 
		left join [MEDICINES_TO_ORDER] a  with (nolock) on a.id= b.idm_med_ToOrder
		left join [MEDICINES_TO_ORDER] c  with (nolock) on c.id= a.idm_parent
		left join KLASS with (nolock)  on klass_id=a.idm_ED and klass_name='medicine_ED' 
		where b.idm_med_ToOrder in(select data from iClinic.dbo.Split(@c_buy,','))
		and b.del=0 and a.user_in =@user_in and month_order =@month and year_order=@year and idm_med_ToOrder is not null
	 and idm_depart=@idm_depart)
			order by id
	else 
		select a.id,a.GlobalParentID,a.idm_parent,klass_value as textED,
		NULL as [count],NULL as comment,NULL as idm_status,a.idm_1C,a.[text] as name,
		c.[text] as p_name, dbo.f_GetIsGroupMedicine_Order(a.id) as IsGroup  
		from MEDICINES_TO_ORDER a  with (nolock) 
		join [MEDICINES_TO_ORDER] c  with (nolock) on c.id= a.idm_parent
		left join KLASS  with (nolock) on klass_id=a.idm_ED and klass_name='medicine_ED'
		where a.GlobalParentID=@idm_med and dbo.f_GetIsGroupMedicine_Order(a.id) =0 and a.del=0 
	end try
	begin catch 
		SET @Error = 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10)) + '; ' +
        'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(10)) + '; ' +
        'Error State: ' + CAST(ERROR_STATE() AS VARCHAR(10)) + '; ' +
        'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR(10)) + '; ' +
        'Error Message: ' + ERROR_MESSAGE()
     select  @Error
	end catch

END