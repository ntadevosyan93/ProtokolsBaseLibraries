CREATE PROCEDURE [dbo].[GetTasksByUserTypesSelectAndSoispolnitel]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50), @type int, @all int = null
AS
BEGIN
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
if(@all=0) begin
	if @type=0
		begin
			SELECT * from View$RD$TASK  with (nolock) 
			where View$RD$TASK.del=0 and status<>3 and status<>6 
			and
			( View$RD$TASK.idm_author=@idm_user 
			or View$RD$TASK.idm_author in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link  from RD$TASK_EMPL_TO_EMPL with (nolock)  where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user)
			or View$RD$TASK.idm_author in (
			/*	SELECT 	  idm_task
			FROM RD$TASK_EMPL_TO_EMPL
			left join RD$TASK_EML on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl
			where idm_empl_link is not null and del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl_link =@idm_user 
			 group by idm_task */
			 SELECT 	
			RD$TASK_EML.idm_task
			FROM RD$TASK_EMPL_TO_EMPL with (nolock) 
			left join RD$TASK_EML  with (nolock) on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl_link
			where idm_empl_link is not null and RD$TASK_EML.del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl = @idm_user
			group by RD$TASK_EML.idm_task) )
			order by date_in desc
		end
	else if @type=1	begin
			SELECT * from View$RD$TASK  with (nolock) 
			where View$RD$TASK.del=0 and status<>3 and status<>6 
			and
			( View$RD$TASK.idm_kontrol=@idm_user 
			or View$RD$TASK.idm_kontrol in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user)
			or View$RD$TASK.idm_author in (/*SELECT 	  idm_task
			FROM RD$TASK_EMPL_TO_EMPL
			left join RD$TASK_EML on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl
			where idm_empl_link is not null and del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl_link =@idm_user 
			group by idm_task */
			SELECT 	
			RD$TASK_EML.idm_task
			FROM RD$TASK_EMPL_TO_EMPL with (nolock) 
			left join RD$TASK_EML  with (nolock) on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl_link
			where idm_empl_link is not null and RD$TASK_EML.del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl = @idm_user
			group by RD$TASK_EML.idm_task)  )
			order by date_in desc
	end else if @type=2 begin
			SELECT * from View$RD$TASK  with (nolock) 
			where View$RD$TASK.del=0 and status<>3 and status<>6 
			and	(
			View$RD$TASK.idm_isp=@idm_user 
			or View$RD$TASK.idm_isp in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
			or View$RD$TASK.id in (select RD$TASK_EML.idm_task from RD$TASK_EML with (nolock)  where RD$TASK_EML.idm_empl=@idm_user and RD$TASK_EML.del=0)	
			or View$RD$TASK.idm_author in ( /*SELECT 	  idm_task
			FROM RD$TASK_EMPL_TO_EMPL
			left join RD$TASK_EML on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl
			where idm_empl_link is not null and del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl_link =@idm_user 
			group by idm_task */
			SELECT 	
			RD$TASK_EML.idm_task
			FROM RD$TASK_EMPL_TO_EMPL with (nolock) 
			left join RD$TASK_EML  with (nolock) on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl_link
			where idm_empl_link is not null and RD$TASK_EML.del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl = @idm_user
			group by RD$TASK_EML.idm_task) )
			order by date_in desc
		end 
end else begin
if @type=0
		begin
			SELECT * from View$RD$TASK  with (nolock) 
			where View$RD$TASK.del=0 --and status<>3 and status<>6 
			and
			( View$RD$TASK.idm_author=@idm_user 
			or View$RD$TASK.idm_author in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link  from RD$TASK_EMPL_TO_EMPL with (nolock)  where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user)
			or View$RD$TASK.idm_author in (
			/*	SELECT 	  idm_task
			FROM RD$TASK_EMPL_TO_EMPL
			left join RD$TASK_EML on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl
			where idm_empl_link is not null and del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl_link =@idm_user 
			 group by idm_task */
			 SELECT 	
			RD$TASK_EML.idm_task
			FROM RD$TASK_EMPL_TO_EMPL with (nolock) 
			left join RD$TASK_EML  with (nolock) on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl_link
			where idm_empl_link is not null and RD$TASK_EML.del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl = @idm_user
			group by RD$TASK_EML.idm_task) )
			order by date_in desc
		end
	else if @type=1	begin
			SELECT * from View$RD$TASK  with (nolock) 
			where View$RD$TASK.del=0 --and status<>3 and status<>6 
			and
			( View$RD$TASK.idm_kontrol=@idm_user 
			or View$RD$TASK.idm_kontrol in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user)
			or View$RD$TASK.idm_author in (/*SELECT 	  idm_task
			FROM RD$TASK_EMPL_TO_EMPL
			left join RD$TASK_EML on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl
			where idm_empl_link is not null and del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl_link =@idm_user 
			group by idm_task */
			SELECT 	
			RD$TASK_EML.idm_task
			FROM RD$TASK_EMPL_TO_EMPL with (nolock) 
			left join RD$TASK_EML  with (nolock) on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl_link
			where idm_empl_link is not null and RD$TASK_EML.del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl = @idm_user
			group by RD$TASK_EML.idm_task)  )
			order by date_in desc
	end else if @type=2 begin
			SELECT * from View$RD$TASK  with (nolock) 
			where View$RD$TASK.del=0 --and status<>3 and status<>6 
			and	(
			View$RD$TASK.idm_isp=@idm_user 
			or View$RD$TASK.idm_isp in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
			or View$RD$TASK.id in (select RD$TASK_EML.idm_task from RD$TASK_EML with (nolock)  where RD$TASK_EML.idm_empl=@idm_user and RD$TASK_EML.del=0)	
			or View$RD$TASK.idm_author in ( /*SELECT 	  idm_task
			FROM RD$TASK_EMPL_TO_EMPL
			left join RD$TASK_EML on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl
			where idm_empl_link is not null and del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl_link =@idm_user 
			group by idm_task */
			SELECT 	
			RD$TASK_EML.idm_task
			FROM RD$TASK_EMPL_TO_EMPL with (nolock) 
			left join RD$TASK_EML  with (nolock) on RD$TASK_EML.idm_empl = RD$TASK_EMPL_TO_EMPL.idm_empl_link
			where idm_empl_link is not null and RD$TASK_EML.del=0 and RD$TASK_EMPL_TO_EMPL.idm_empl = @idm_user
			group by RD$TASK_EML.idm_task) )
			order by date_in desc
		end 
end
END