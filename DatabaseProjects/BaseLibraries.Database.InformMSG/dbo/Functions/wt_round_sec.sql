-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION wt_round_sec
(
	-- Add the parameters for the function here
	@totalsec int,
	@roundsec int
)
RETURNS float
AS
BEGIN
 
 declare @res float
 if (@totalsec % @roundsec = 0) begin

 set @res =  @totalsec 
 
 end else begin

	set @res =  @totalsec - (@totalsec % @roundsec);

 end 

 return @res
END