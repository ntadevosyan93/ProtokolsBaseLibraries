-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.GetFromDefaultPage
@user_name varchar(50), 
@all_dog int ,
 @all_tasks int,
  @all_bill_ur int, 
  @all_main int,
  @all_bill_p int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  declare @count_tasks int,@count_main int,@count_dog int, @count_bill_p int, @count_bill_ur int
  declare @idm_otdel int
  set @user_name=ltrim(rtrim(@user_name))
	declare @idm_user int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)
 -- Инциденты ---
	SELECT @count_main = count(id) from View$TT$MAIN with (nolock) 
		where View$TT$MAIN.del=0 and not(status = @all_main) and (View$TT$MAIN.user_in=@user_name
		or View$TT$MAIN.idm_empl=@idm_user or @idm_user in (select TT$SPR_REGION_EMPL.idm_empl from TT$SPR_REGION_EMPL  with (nolock) 
	where TT$SPR_REGION_EMPL.idm_region = View$TT$MAIN.idm_activity) or @idm_user in (select idm_empl from LINK_EMPL with (nolock)) 	
		or View$TT$MAIN.idm_control =@idm_user) 
		--Договора ----
	SELECt @count_dog = count([DOGOVORS$AGREEMENT].id)   FROM [dbo].[DOGOVORS$AGREEMENT] with (nolock) 
	left join  DOGOVORS$REG b  with (nolock) on b.id=[DOGOVORS$AGREEMENT].idm_dogovor
	where [DOGOVORS$AGREEMENT].idm_empl = @idm_user  and [DOGOVORS$AGREEMENT].del=0
	and b.del=0 and b.id in 
		(select idm_dogovor from DOGOVORS$AGREEMENT  with (nolock) where idm_empl = @idm_user 	 and DOGOVORS$AGREEMENT.del=0
			and	not ((select top(1) idm_reason from DOGOVORS$AGREEMENT  with (nolock) where DOGOVORS$AGREEMENT.idm_dogovor = b.id and idm_empl = @idm_user
	and DOGOVORS$AGREEMENT.del=0 order by id desc) = 1) AND	
	not ((select top(1) idm_reason from DOGOVORS$AGREEMENT with (nolock)  where DOGOVORS$AGREEMENT.idm_dogovor = b.id and idm_empl = @idm_user
	and DOGOVORS$AGREEMENT.del=0 order by id desc) = 3))

	--счета ---
	select @idm_otdel=idm_otdel from EMPL_TO_OTDEL  with (nolock) where idm_empl=@idm_user

	if(@idm_otdel=1)
		select @count_bill_ur=count(id) from RM$OS$BILLING with (nolock)  where [status]=@all_bill_ur and del=0
    else 
		if(@idm_otdel=3)	
			select @count_bill_ur=count(id) from RM$OS$BILLING with (nolock)  where [status]=@all_bill_ur and del=0 and (summ>=50000 or AllowAgreeMarceting=1)
		else 		
		select @count_bill_p= count(id) from RM$OS$BILLING with (nolock)  where [status]=@all_bill_p and del=0

		--задачи-- 
 SELECT  @count_tasks =count(id) from View$RD$TASK  with (nolock) where View$RD$TASK.del=0 
		and ((status<>3 and status<>6)or((status=3 or status = 6) and 		
		(select COUNT(RD$TASK_FIRST_VIEW.id)from RD$TASK_FIRST_VIEW  with (nolock) 
		where RD$TASK_FIRST_VIEW.idm_empl=@idm_user and RD$TASK_FIRST_VIEW.idm_task=View$RD$TASK.id )=0	and	View$RD$TASK.date_in>'18.01.2016 00:00'))
		and 
		(View$RD$TASK.idm_author=@idm_user 
		or View$RD$TASK.idm_author in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or View$RD$TASK.idm_kontrol in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or View$RD$TASK.idm_isp in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or View$RD$TASK.idm_kontrol=@idm_user
		or View$RD$TASK.idm_isp=@idm_user
		or View$RD$TASK.user_in=@user_name
		or View$RD$TASK.id in (select RD$TASK_EML.idm_task from RD$TASK_EML where RD$TASK_EML.idm_empl=@idm_user and RD$TASK_EML.del=0))


	select @count_tasks as count_tasks,@count_main as count_main,@count_dog as count_dog,
	 @count_bill_p as count_bill_p, @count_bill_ur as count_bill_ur
END