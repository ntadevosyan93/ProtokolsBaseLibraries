-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION GetTimeDNDonPhone
(
	-- Add the parameters for the function heredeclare 
	@phone smallint,   @date datetime,  @time1 datetime,   @time2 datetime

	
)
RETURNS int
AS
BEGIN
  declare @dt1 datetime
  declare @dt2 datetime
  declare @ResultVar int
  set @dt1=@date+@time1
  set @dt2=@date+@time2
select @ResultVar=sum(DATEPART(minute, dnd_deactivated-dnd_activated)) from PBX$DND_SET where phone=@phone and dnd_activated>@dt1 and dnd_deactivated<@dt2
	-- Declare the return variable here

	-- Add the T-SQL statements to compute the return value here
	

	-- Return the result of the function
	RETURN @ResultVar

END