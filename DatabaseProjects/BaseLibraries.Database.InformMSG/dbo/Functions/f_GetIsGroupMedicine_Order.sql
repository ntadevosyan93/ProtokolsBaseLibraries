-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION f_GetIsGroupMedicine_Order
(
	-- Add the parameters for the function here
	@idm int
)
RETURNS int
AS
BEGIN

declare @res int
set @res=0

	declare @cc int
	select @cc=count(id) from MEDICINES_TO_ORDER with (nolock) where idm_parent is null and id=@idm and del=0
	if(@cc!=0) set @res= 1
	else
		begin
			select @cc =count(id) from MEDICINES_TO_ORDER with (nolock) where idm_parent =@idm and del=0 
			if(@cc>=1) set @res= 2
			else set @res= 0
		end


		 RETURN @res

END