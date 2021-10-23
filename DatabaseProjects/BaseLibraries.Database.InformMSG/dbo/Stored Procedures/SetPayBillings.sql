-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SetPayBillings]
	-- Add the parameters for the stored procedure here
	@type int,
	@date_paid DateTime,
	@nom varchar(50),
	@status int,
	@date_pay_purpose DateTime,
	@id int
	,@user_cur varchar(50)
AS
BEGIN	
	SET NOCOUNT ON;
	if @type=1
	begin
		UPDATE [RM$OS$BILLING] SET status=@status,date_pay_purpose=@date_pay_purpose,user_cur=@user_cur, date_cur=getdate() where id=@id
    end
   if @type =0
   begin
		UPDATE [RM$OS$BILLING] SET date_paid = @date_paid, nom_paid=@nom,status=@status,user_cur=@user_cur,  date_cur=getdate() where id=@id
   end
END