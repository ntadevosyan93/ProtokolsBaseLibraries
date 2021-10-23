-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployee]
	-- Add the parameters for the stored procedure here
	@filter varchar(150),
	@actual int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	declare @act int;
	set @act =  case when @actual is null  then 0 else @actual end

    if(@filter !=null or (@filter !=' ' and @filter !=''))
	begin
	if(@act >0)
		SELECT a.*, b.fio_full, c.text, d.text as otdel_text, p.text as org_text,a.wt_check_fact_only  FROM [KAD$EMPLOYEE] a with (nolock)
		left join View$KAD$EMPLOYEE b  with (nolock) on b.id=a.id
		left join KAD$DOLJN c  with (nolock) on c.id = a.idm_doljn
		left join DEPARTMENTS d  with (nolock) on d.id = a.idm_otdel 
		left join  PARTNER p  with (nolock) on p.id =a.idm_org
		left join View$KAD$EMPLOYEE curat  with (nolock) on curat.id = a.idm_controller
		where a.fam like '[а-я]%' and a.del=0 and (a.fam like '%'+@filter+'%'  or a.name like '%'+@filter+'%' or b.fio_full=@filter  or a.otch like '%'+@filter+'%'  or c.text like '%'+@filter+'%'
		or d.text like '%'+@filter+'%'  or p.text like '%'+@filter+'%'  or a.phone_mob like '%'+@filter+'%'  or a.phone_gor like '%'+@filter+'%'
		or a.login_ad like '%'+@filter+'%'  or a.phone_vn like '%'+@filter+'%'   or a.email like '%'+@filter+'%'
		 or cast( a.id as varchar) like  '%'+@filter+'%') 
		and actual=@act
		order by b.fio_full asc
	else
		SELECT a.*, b.fio_full, c.text, d.text as otdel_text, p.text as org_text,a.wt_check_fact_only  FROM [KAD$EMPLOYEE] a with (nolock)
		left join View$KAD$EMPLOYEE b  with (nolock) on b.id=a.id
		left join KAD$DOLJN c  with (nolock) on c.id = a.idm_doljn
		left join DEPARTMENTS d  with (nolock) on d.id = a.idm_otdel 
		left join  PARTNER p  with (nolock) on p.id =a.idm_org
		left join View$KAD$EMPLOYEE curat  with (nolock) on curat.id = a.idm_controller
		where a.fam like '[а-я]%' and a.del=0 and (a.fam like '%'+@filter+'%'  or b.fio_full=@filter  or a.name like '%'+@filter+'%'  or a.otch like '%'+@filter+'%'  or c.text like '%'+@filter+'%'
		or d.text like '%'+@filter+'%'  or p.text like '%'+@filter+'%'  or a.phone_mob like '%'+@filter+'%'  or a.phone_gor like '%'+@filter+'%'
		or a.login_ad like '%'+@filter+'%'  or a.phone_vn like '%'+@filter+'%'   or a.email like '%'+@filter+'%' 
		or cast( a.id as varchar) like  '%'+@filter+'%' ) 
		order by b.fio_full asc
	end
else
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
		where a.fam like '[а-я]%'  and a.del=0  order by b.fio_full asc
	end

END