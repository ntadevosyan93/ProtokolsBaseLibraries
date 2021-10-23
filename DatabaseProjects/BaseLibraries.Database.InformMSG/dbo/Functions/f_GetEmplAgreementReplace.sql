-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION  dbo.f_GetEmplAgreementReplace
( 
@idm_empl int
)
RETURNS  int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @res_empl int, @cc int
		
	select top(1) @cc=id from [DOGOVOR_EMPLtoEMPL] where idm_empl_parent=@idm_empl and IsReplace=1
	-- Add the T-SQL statements to compute the return value here
	if(@cc>0) 
			select top(1)  @res_empl = idm_empl_link from [DOGOVOR_EMPLtoEMPL] where id=@cc
	else set @res_empl=@idm_empl
	-- Return the result of the function
	RETURN @res_empl

END