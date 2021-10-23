-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UPDATECuratorDogovorReg] 
	-- Add the parameters for the stored procedure here
	@id int,
	@idm_new_empl int
		
	,@number_storage varchar(MAX)	
	,@date_reg datetime
	,@r_number varchar(MAX)	
	,@r_date datetime
	,@idm_partner int	
	,@idm_dog_type int
	,@subject varchar(MAX)	
	,@cost_summ varchar(50)	
	,@r_date_deadline datetime	
	,@idm_empl int
	,@notes_conflicts varchar(MAX)
	,@notes_agreement varchar(MAX)
	,@notes varchar(MAX)
	,@idm_owner int	
	,@idm_template int
	,@pay_rules varchar(MAX)
	,@date_deadline datetime	
	,@some_status int	
	,@idm_isp int

	,@user_in varchar(50)
	,@idm_parent int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @idm_old_empl varchar(50)
	declare @idm_dogovor int

	Select @idm_old_empl = idm_empl from DOGOVORS$REG where id=@id

	--Обновляем поля договора
		UPDATE [DOGOVORS$REG] SET [number_storage] = @number_storage,
         [date_reg] = @date_reg, [r_number] = @r_number, [r_date] = @r_date, [idm_partner] = @idm_partner, 
        [idm_dog_type] = @idm_dog_type, [subject] = @subject, [cost_summ] = @cost_summ, [r_date_deadline] = @r_date_deadline,
         [idm_empl] = @idm_empl, [notes_conflicts] = @notes_conflicts, [notes_agreement] = @notes_agreement,
         [notes] = @notes, idm_owner = @idm_owner, idm_template = @idm_template, pay_rules = @pay_rules,
         date_deadline = @date_deadline, some_status=@some_status, idm_isp = @idm_isp,idm_parent=@idm_parent, user_del=@user_in, date_del=getdate() WHERE [id] = @id

	if @idm_new_empl != @idm_old_empl 
begin
		-- Добавляем в таблицу согласования нового куратора
		 Insert into DOGOVORS$AGREEMENT (date_in,date_reason , idm_empl,text_reason,idm_dogovor,idm_reason, user_in ) 
		 values (getdate(),getdate(),@idm_new_empl, 'СОГЛАСОВАНО АВТОМАТИЧЕСКИ',@id,1,@user_in);
end
END