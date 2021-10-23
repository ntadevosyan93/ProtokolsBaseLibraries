-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UPDATEMedicinesBUY]
	-- Add the parameters for the stored procedure here
	@ID int,
	@user_in  varchar(50),
	@idm_depart int,
	@count int,
	@month int,
	@year int
	,@comment varchar(max),
	@idm_buy_form int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @idm int;
	declare @idm_med_ToOrder int
	set @idm=0;
	set @idm_med_ToOrder =@ID

	declare @IsGroup int
	set @IsGroup= dbo.f_GetIsGroupMedicine_Order(@ID)

	if(@IsGroup=0) begin
		select @idm =id from MEDICINES_BUY with(nolock) where idm_med_ToOrder =@idm_med_ToOrder and user_in = @user_in 
		and idm_depart = @idm_depart  and del=0 and idm_buy_form=@idm_buy_form --and month_order=@month and year_order=@year

		if(@idm >0) begin
			update MEDICINES_BUY set [count]=@count,user_cur=@user_in,date_cur=getdate(),year_order=@year,month_order=@month, comment=@comment
			where id=@idm
		end
		else begin
			insert into MEDICINES_BUY ([user_in],[idm_depart],[idm_med_ToOrder],[count],month_order,year_order,comment,idm_status,idm_buy_form) 
			values(@user_in,@idm_depart,@idm_med_ToOrder,@count,@month,@year,@comment,1,@idm_buy_form)
		end
	end
END