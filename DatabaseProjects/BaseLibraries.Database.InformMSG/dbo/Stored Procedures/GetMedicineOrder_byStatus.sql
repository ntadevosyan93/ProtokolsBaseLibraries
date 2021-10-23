-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMedicineOrder_byStatus]
	@user_in varchar(50),
	@status int,
	@all int,
	@idm_depart int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@all=1) begin
		if(@idm_depart>0)
			select * from MEDICINES_BUY_FORM  with (nolock) where del=0  and idm_depart = @idm_depart
		else
			select * from MEDICINES_BUY_FORM  with (nolock) where del=0 
	end
	else begin
		select * from MEDICINES_BUY_FORM  with (nolock) where del=0  and (user_in =@user_in or idm_depart = @idm_depart)
	end
END