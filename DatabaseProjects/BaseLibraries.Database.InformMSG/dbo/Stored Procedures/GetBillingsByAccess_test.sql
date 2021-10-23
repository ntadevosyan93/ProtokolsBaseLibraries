

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBillingsByAccess_test]
	@type int,
	@user varchar(50),@date_in datetime
	, @date_to datetime
	,@AllowDate int
	, @StartRowIndex int
	,@MaximumRows int
	,@f_number varchar(150)=null
	,@f_date datetime=null
	,@f_partner int=null
	,@f_owner int =null, @f_curator varchar(150)=null
	,@f_descr varchar(250)=null, @f_summ float=null, @f_depart int=null, @f_date_plan datetime=null
	,@status varchar(250)
	,@IsNal int
	,@f_pay datetime = null
AS
BEGIN	
	SET NOCOUNT ON;
	-- 1 - все
	-- 2- только свои
	-- 3 - подразделение
	declare @idm_user varchar(50);
	declare @countViewOwner int;
	set @countViewOwner=0

	declare @countWithoutOwner int;
	set @countWithoutOwner =0
	 declare @idm_control int, @idm_otdel int, @idm_links_otdel varchar(150)

	select @idm_user = cast(id as varchar(50)),@idm_control=idm_controller from KAD$EMPLOYEE with (nolock)  where login_ad = @user 
	select @idm_otdel = idm_otdel from EMPL_TO_OTDEL  with (nolock) where idm_empl=@idm_user
	select @idm_links_otdel= cast ((select cast(idm_empl as varchar(10)) + ','   from   EMPL_TO_OTDEL where  idm_otdel=@idm_otdel FOR XML PATH(''))  AS VARCHAR(MAX)) 
		
	set @idm_links_otdel =LEFT(@idm_links_otdel, LEN(@idm_links_otdel) - 1)

	select @countViewOwner = count(id) from [RM$OS$BILLING_StatusView]  with (nolock) where idm_owner is not null and idm_empl=@idm_user	
	select @countWithoutOwner = count(id) from [RM$OS$BILLING_StatusView]  with (nolock) where idm_WithoutOwner is not null and idm_empl=@idm_user

	declare @sql nvarchar(max)
	set @sql ='SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY [id] DESC) AS num, 
         1000 AS total,
		 a.* from dbo.View$RM$OS$BILLING a  where del=0  '

	if(@AllowDate =0) set @sql+=' and  cast(date_bill as date) between cast(@date_in as date) and cast(@date_to as date) '

	if @type =1	begin
			if(@countViewOwner>0)  set @sql+=' and idm_owner in(select idm_owner from  [RM$OS$BILLING_StatusView]  with (nolock) where idm_empl='+@idm_user+' and not idm_owner is  null) '
		else if(@countWithoutOwner >0)  set @sql +=' and idm_owner not in(select idm_WithoutOwner from  [RM$OS$BILLING_StatusView]  with (nolock) where idm_empl='+@idm_user+' and not idm_WithoutOwner is  null) '
			if(@idm_otdel =3) set @sql+= ' and (summ>=50000 or AllowAgreeMarceting=1)'
	end	else begin
		if @type = 2 
			set @sql+= ' and (user_in =@user_cur or idm_isp='+@idm_user+' or idm_curator='+@idm_user+')'
		else 
			if @type = 3  begin
				declare @c_link int 
				select @c_link = count(id) from RM$OS$BILLING_EMPL_TO_EMPL with (nolock) where idm_link_empl=@idm_user and del=0 and not idm_curator_empl is null
			if(not @idm_links_otdel is null ) set @sql+=' and (' else  set @sql+=' and '
				if(@c_link>0) 
					set @sql+=' (idm_curator in (select idm_curator_empl from RM$OS$BILLING_EMPL_TO_EMPL with (nolock) where idm_link_empl ='+cast(@idm_user as varchar(10))+' and del=0))'				
				else   set @sql+= ' (idm_curator =(select id from KAD$EMPLOYEE with (nolock)  where idm_controller='+@idm_user+'))'
				
				if(not @idm_links_otdel is null ) 
					set @sql +=' or idm_curator in('+@idm_links_otdel+') or idm_isp in ('+@idm_links_otdel+'))'
			end
	end 
	if(not @f_number is null) set @sql+= ' and ( number  like ''%'+@f_number+'%'') '
	if(not @f_partner is null) set @sql+= ' and idm_partner =@f_partner '
	if(not @f_owner is null) set @sql+= ' and idm_owner =@f_owner '
	if(not @f_curator is null) set @sql+= ' and ( curator like ''%'+@f_curator+'%'') '
	if(not @f_descr  is null) set @sql+= ' and (description like ''%'+@f_descr+'%'') '
	if(not @f_summ  is null) set @sql+= ' and summ =@f_summ '
	if(not @f_depart  is null) set @sql+= ' and idm_department =@f_depart '
	if(not @f_date_plan  is null) set @sql+= ' and date_pay_purpose =@f_date_plan '
	if(not @f_date  is null) set @sql+= ' and date_bill =@f_date '
	if(not @f_pay is null) set @sql+= ' and (date_pay =@f_pay and allowPurpose=1) '

	if(@IsNal=1) set @sql+= ' and (type_pay!=1)'

	set @sql+=' and  status in(select data from dbo.Split(@status,'','')) '

	set @sql+= ' ) X
	WHERE num > @StartRowIndex and num< @StartRowIndex+@MaximumRows+1;'
DECLARE @Error nvarchar(MAX); 

begin try 
EXEC sp_executesql @sql,N'@klass_name varchar(50),@user_cur varchar(50) ,@date_in datetime, @date_to datetime,@StartRowIndex int,
	@MaximumRows int,@f_number varchar(150),@f_date datetime,@f_partner int,@f_owner int, @f_curator varchar(150)
	,@f_descr varchar(250), @f_summ float, @f_depart int, @f_date_plan datetime,@status varchar(250), @f_pay datetime', @klass_name='billing',@user_cur=@user
	,@date_in =@date_in, @date_to = @date_to,@MaximumRows =@MaximumRows,@StartRowIndex=@StartRowIndex,
	@f_number =@f_number,@f_date =@f_date,@f_partner =@f_partner,@f_owner =@f_owner, @f_curator =@f_curator
	,@f_descr =@f_descr, @f_summ =@f_summ, @f_depart =@f_depart, @f_date_plan =@f_date_plan,@status=@status, @f_pay= @f_pay
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