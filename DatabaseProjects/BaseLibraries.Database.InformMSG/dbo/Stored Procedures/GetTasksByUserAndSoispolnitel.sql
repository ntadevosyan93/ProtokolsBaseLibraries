
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTasksByUserAndSoispolnitel]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50), @all int
AS
BEGIN

set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE with (nolock)  where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name) and actual = 1

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
if @all=0
begin
	SELECT * from View$RD$TASK vrt  with (nolock) 
		where 
		vrt.del=0 
		and 
		
		
	--	((status<>3 and status<>6) or () )
	
		
		( (status<>3 and status<>6) 
		
		or
		
		((status=3 or status = 6) and 
		
				(select COUNT(RD$TASK_FIRST_VIEW.id) 
				from RD$TASK_FIRST_VIEW  with (nolock) 
				where RD$TASK_FIRST_VIEW.idm_empl=@idm_user and RD$TASK_FIRST_VIEW.idm_task=vrt.id )=0	
				
				and
				
				vrt.date_in>'18.01.2016 00:00'
				
		)	 
		
		)
		
		
		
		and 
		(vrt.idm_author=@idm_user 
		or vrt.idm_author in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or vrt.idm_kontrol in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or vrt.idm_isp in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or vrt.idm_kontrol=@idm_user
		or vrt.idm_isp=@idm_user
		or vrt.user_in=@user_name
		or vrt.id in (select RD$TASK_EML.idm_task from RD$TASK_EML where RD$TASK_EML.idm_empl=@idm_user and RD$TASK_EML.del=0)
		or vrt.id in (
/*	SELECT 	  idm_task
  FROM RD$TASK_EMPL_TO_EMPL
  left join RD$TASK_EML on RD$TASK_EML.idm_empl = @idm_user
  where idm_empl_link is not null and del=0
  group by idm_task */
  SELECT 	
RD$TASK_EML.idm_task
  FROM RD$TASK_EMPL_TO_EMPL with (nolock) 
  left join RD$TASK_EML  with (nolock) on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl_link
  where idm_empl_link is not null and RD$TASK_EML.del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl = @idm_user
 group by RD$TASK_EML.idm_task)
		) order by date_in desc
end
else 
begin
SELECT * from View$RD$TASK vrt with (nolock) 
		where 
		vrt.del=0 and
		(vrt.idm_author=@idm_user 
		or vrt.idm_author in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or vrt.idm_kontrol in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or vrt.idm_isp in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or vrt.idm_kontrol=@idm_user
		or vrt.idm_isp=@idm_user
		or vrt.user_in=@user_name 
		or vrt.id in (select RD$TASK_EML.idm_task from RD$TASK_EML where RD$TASK_EML.idm_empl=@idm_user and RD$TASK_EML.del=0)
		or vrt.id in (
/*	SELECT 	  idm_task
  FROM RD$TASK_EMPL_TO_EMPL
  left join RD$TASK_EML on RD$TASK_EML.idm_empl = @idm_user
  where idm_empl_link is not null and del=0
  group by idm_task */
  SELECT 	
RD$TASK_EML.idm_task
  FROM RD$TASK_EMPL_TO_EMPL with (nolock) 
  left join RD$TASK_EML  with (nolock) on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl_link 
  where idm_empl_link is not null and RD$TASK_EML.del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl = @idm_user
 group by RD$TASK_EML.idm_task)		
		) order by date_in desc
end

END