-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetAllowAgreeFromBilling]
( 
	@idm_bill int,
	@idm_otdel int
)
RETURNS int
AS
BEGIN
/*
	 1 необходимо согласование
	 0 есть результат согласования
	-1 не требует согласования

*/
	declare @res int, @status int, @summ float, @res_otdel int, @AllowAgreement int
	set @res=-1;
	select @status = status,@summ=summ from RM$OS$BILLING where id=@idm_bill
	select  top(1) @res_otdel=klass_value_int from RM$OS$BILLING_AGREEMENT 
	left join KLASS on klass_id=idm_reason and klass_name='billing'
	where idm_bill=@idm_bill and del=0 and idm_otdel=@idm_otdel

	if(@status =3 or @status = 4 or @status =5 or @status =8) 
		set @AllowAgreement =1

	if(@AllowAgreement=1)
		if(@idm_otdel=1) begin
			if(@res_otdel=2) set @res=0;
			 else set @res=1;
		end	
		else if(@idm_otdel=3 and @summ>= 50000) begin		
				if(@res_otdel=2) set @res=0;
				else set @res=1;
		end

	return @res
END