-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetFullAge]
(
	 @date_b datetime
)
RETURNS  int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @res int, @date_now datetime
	set @date_now = getdate();
	set @res= (Year(@date_now) - Year(@date_b) - 1)+ 
				(case when (Month(@date_now)  > Month(@date_b) or Month(@date_now)  = Month(@date_b) and Day(@date_now)  >= Day(@date_b)) 
						then 1 else 0 end)

	-- Return the result of the function
	RETURN @res

END