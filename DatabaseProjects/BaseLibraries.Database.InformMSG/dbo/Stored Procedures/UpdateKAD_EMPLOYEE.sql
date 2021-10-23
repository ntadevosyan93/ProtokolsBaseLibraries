



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateKAD$EMPLOYEE]
		   @fam varchar(150),
           @name  varchar(150),
           @otch  varchar(150),
           @actual int,
           @data_b DateTime,
           @idm_doljn int,
           @idm_otdel int,
           @idm_org int,
           @status int,
           @phone_mob  varchar(50)=null,
           @phone_vn  varchar(50)=null,
           @phone_gor  varchar(50)=null,
           @user_in  varchar(50)=null,
           @login_ad  varchar(50)=null,
           @login_1c_t  varchar(50),
           @login_1c_id  varchar(50),
           @bolid_card_num  varchar(50),
           @bolid_card_id int,
           @email  varchar(50),
           @idm_partner int,
           @view_only_otdel int,
           @view_only_self int,
           @idm_controller int,
           @curator_dog int,
           @wt_check_fact_only int,
           @user_cur varchar(50),
           @call_center_worker int,
           @IsLaborant int,
           @guid_iclinic varchar(50),
           @id int,
           @sms_only int,
		   @standing int=null,
		   @password_email varchar(50) = null
		   ,@NotSendApplication int =0
		   ,@sertificate_date_expir datetime = null		   
           ,@ecp_status int = null
           ,@ecp_date_expir datetime = null
			,@date_start_work datetime = null
			,@idm_sert int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @actual_old int
	select @actual_old=actual from [KAD$EMPLOYEE] where id=@id
	set @phone_mob= LTRIM(RTRIM(@phone_mob))

	if(@actual!=@actual_old) begin
		declare @date_dismissal datetime
		if(@actual=1) 
			set @date_dismissal=null
		if(@actual=0 or @actual is null) 
			set @date_dismissal=getdate()

		if(not @password_email is null) begin
			UPDATE [KAD$EMPLOYEE] 
			SET [fam] = @fam, [name] = @name, [actual]=@actual, 
			[otch] = @otch, [data_b] = @data_b, [idm_doljn] = @idm_doljn,
			[idm_otdel] = @idm_otdel, [idm_org] = @idm_org,
			[status] = @status, [phone_mob] = @phone_mob, [phone_vn] = @phone_vn, 
			[phone_gor] = @phone_gor, [user_in] = @user_in, 
			[login_ad] = @login_ad, [login_1c_t] = @login_1c_t, [login_1c_id] = @login_1c_id,
			[bolid_card_num] = @bolid_card_num, [bolid_card_id] = @bolid_card_id, [email] = @email,
			[idm_partner]=@idm_partner, [view_only_otdel]=@view_only_otdel, [view_only_self]=@view_only_self,
			[idm_controller]=@idm_controller, curator_dog=@curator_dog, wt_check_fact_only=@wt_check_fact_only,[date_cur]=getdate()
			,[user_cur]=@user_cur,call_center_worker=@call_center_worker,IsLaborant=@IsLaborant,guid_iclinic=@guid_iclinic,password_email=@password_email
			,date_dismissal=@date_dismissal, NotSendApplication=@NotSendApplication
			,sertificate_date_expir= @sertificate_date_expir
           ,ecp_status=@ecp_status            ,ecp_date_expir=@ecp_date_expir, date_start_work= @date_start_work
		   ,standing = @standing, idm_sert = @idm_sert
			 WHERE [id] = @id
		end
		else begin
			UPDATE [KAD$EMPLOYEE] 
			SET [fam] = @fam, [name] = @name, [actual]=@actual, 
			[otch] = @otch, [data_b] = @data_b, [idm_doljn] = @idm_doljn,
			[idm_otdel] = @idm_otdel, [idm_org] = @idm_org,
			[status] = @status, [phone_mob] = @phone_mob, [phone_vn] = @phone_vn, 
			[phone_gor] = @phone_gor, [user_in] = @user_in, 
			[login_ad] = @login_ad, [login_1c_t] = @login_1c_t, [login_1c_id] = @login_1c_id,
			[bolid_card_num] = @bolid_card_num, [bolid_card_id] = @bolid_card_id, [email] = @email,
			[idm_partner]=@idm_partner, [view_only_otdel]=@view_only_otdel, [view_only_self]=@view_only_self,
			[idm_controller]=@idm_controller, curator_dog=@curator_dog, wt_check_fact_only=@wt_check_fact_only,[date_cur]=getdate()
			,[user_cur]=@user_cur,call_center_worker=@call_center_worker,IsLaborant=@IsLaborant,guid_iclinic=@guid_iclinic,sms_only=@sms_only 
			,date_dismissal=@date_dismissal, NotSendApplication=@NotSendApplication
			,sertificate_date_expir= @sertificate_date_expir
			,ecp_status=@ecp_status            ,ecp_date_expir=@ecp_date_expir, date_start_work= @date_start_work
		   ,standing = @standing, idm_sert = @idm_sert
			WHERE [id] = @id
		end
	end
	else begin
		if(not @password_email is null) begin
			UPDATE [KAD$EMPLOYEE] 
			SET [fam] = @fam, [name] = @name, [actual]=@actual, 
			[otch] = @otch, [data_b] = @data_b, [idm_doljn] = @idm_doljn,
			[idm_otdel] = @idm_otdel, [idm_org] = @idm_org,
			[status] = @status, [phone_mob] = @phone_mob, [phone_vn] = @phone_vn, 
			[phone_gor] = @phone_gor, [user_in] = @user_in, 
			[login_ad] = @login_ad, [login_1c_t] = @login_1c_t, [login_1c_id] = @login_1c_id,
			[bolid_card_num] = @bolid_card_num, [bolid_card_id] = @bolid_card_id, [email] = @email,
			[idm_partner]=@idm_partner, [view_only_otdel]=@view_only_otdel, [view_only_self]=@view_only_self,
			[idm_controller]=@idm_controller, curator_dog=@curator_dog, wt_check_fact_only=@wt_check_fact_only,[date_cur]=getdate()
			,[user_cur]=@user_cur,call_center_worker=@call_center_worker,IsLaborant=@IsLaborant,guid_iclinic=@guid_iclinic,password_email=@password_email
			, NotSendApplication=@NotSendApplication
			,sertificate_date_expir= @sertificate_date_expir
			,ecp_status=@ecp_status            ,ecp_date_expir=@ecp_date_expir, date_start_work= @date_start_work
		   ,standing = @standing, idm_sert = @idm_sert
			 WHERE [id] = @id
		end
		else begin
			UPDATE [KAD$EMPLOYEE] 
			SET [fam] = @fam, [name] = @name, [actual]=@actual, 
			[otch] = @otch, [data_b] = @data_b, [idm_doljn] = @idm_doljn,
			[idm_otdel] = @idm_otdel, [idm_org] = @idm_org,
			[status] = @status, [phone_mob] = @phone_mob, [phone_vn] = @phone_vn, 
			[phone_gor] = @phone_gor, [user_in] = @user_in, 
			[login_ad] = @login_ad, [login_1c_t] = @login_1c_t, [login_1c_id] = @login_1c_id,
			[bolid_card_num] = @bolid_card_num, [bolid_card_id] = @bolid_card_id, [email] = @email,
			[idm_partner]=@idm_partner, [view_only_otdel]=@view_only_otdel, [view_only_self]=@view_only_self,
			[idm_controller]=@idm_controller, curator_dog=@curator_dog, wt_check_fact_only=@wt_check_fact_only,[date_cur]=getdate()
			,[user_cur]=@user_cur,call_center_worker=@call_center_worker,IsLaborant=@IsLaborant,guid_iclinic=@guid_iclinic,sms_only=@sms_only 
			, NotSendApplication=@NotSendApplication
			,sertificate_date_expir=@sertificate_date_expir
			,ecp_status=@ecp_status            ,ecp_date_expir=@ecp_date_expir, date_start_work= @date_start_work
		   ,standing = @standing, idm_sert = @idm_sert
			WHERE [id] = @id
		end
	end
END