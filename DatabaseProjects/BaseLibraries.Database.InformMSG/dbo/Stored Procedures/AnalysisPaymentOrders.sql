-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AnalysisPaymentOrders]
	@date_pay datetime,
	@number_pay varchar(50),
	@summ decimal(18,2),
	@n_billing varchar(50),
	@date_bill datetime,
	@partner_text varchar(50),
	@user_in varchar(50),
	@idm_file int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @idm_partner int
	declare @count int
	declare @id_bill int
	declare @status_bill int
	declare @nom_paid varchar(50)
	declare @date_paid datetime
	declare @number_bill varchar(50)

	set @number_bill=''
	set @id_bill =0

	select @idm_partner=id from [PARTNER] with (nolock) where [text] like @partner_text

	if @date_bill is null begin
	select @count=count(id) from RM$OS$BILLING with (nolock) where
		 number = @n_billing and del=0 and summ=@summ
		 and cast(date_pay_purpose as date) =cast(@date_pay as date) 
		 or cast(date_bill as date)=cast(@date_bill as date)	
		 if(@count >1)
			 select @id_bill=id,@status_bill=[status],@nom_paid=nom_paid,@date_paid=date_paid,@number_bill=number from RM$OS$BILLING with (nolock) where
			number = @n_billing and del=0  and summ=@summ
			and cast(date_pay_purpose as date) =cast(@date_pay as date) 
			or cast(date_bill as date)=cast(@date_bill as date) and idm_partner=@idm_partner
		 else
			select @id_bill=id,@status_bill=[status],@nom_paid=nom_paid,@date_paid=date_paid,@number_bill=number from RM$OS$BILLING with (nolock) where
			number = @n_billing and del=0 and summ=@summ
			and cast(date_pay_purpose as date) =cast(@date_pay as date) 
			or cast(date_bill as date)=cast(@date_bill as date)	 
	end
	else 
	begin
		select  @count=count(id) from RM$OS$BILLING with (nolock) where
		number = @n_billing and del=0 and summ=@summ
		and cast(date_pay_purpose as date) =cast(@date_pay as date) 
		and cast(date_bill as date)=cast(@date_bill as date)
		if(@count >1)
			select  @id_bill=id,@status_bill=[status],@nom_paid=nom_paid,@date_paid=date_paid,@number_bill=number from RM$OS$BILLING with (nolock) where
			number = @n_billing and del=0 and summ=@summ
			and cast(date_pay_purpose as date) =cast(@date_pay as date) 
			and cast(date_bill as date)=cast(@date_bill as date) and idm_partner=@idm_partner
		else	
			select @id_bill=id,@status_bill=[status],@nom_paid=nom_paid,@date_paid=date_paid,@number_bill=number from RM$OS$BILLING with (nolock) where
			cast(date_bill as date)=cast(@date_bill as date)
			and number = @n_billing and del=0 and summ=@summ
			and cast(date_pay_purpose as date) =cast(@date_pay as date)
	end
	if(@nom_paid is null and @date_paid is null) begin
		if(@status_bill='7' ) begin 
			update RM$OS$BILLING set [status]='2', nom_paid=@number_pay, date_paid = @date_pay,user_cur=@user_in, date_cur=getdate()
			,idm_file_store=@idm_file where id =@id_bill
		end 
		else 
			update RM$OS$BILLING set  nom_paid=@number_pay, date_paid = @date_pay,user_cur=@user_in, date_cur=getdate()
			,idm_file_store=@idm_file where id =@id_bill
	end
    
	select @id_bill as id,@number_bill as number_bill
END