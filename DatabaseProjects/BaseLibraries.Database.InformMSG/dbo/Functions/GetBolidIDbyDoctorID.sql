-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION GetBolidIDbyDoctorID
(
	-- Add the parameters for the function here
	@docID varchar(10)
)
RETURNS int
AS
BEGIN
declare @id int
	SELECT  @id=CAST(RTRIM(SUBSTRING([SP1140], 9, 10)) as INT) FROM [Clinic23].[dbo].[SC1143] WHERE sp1140 between 'ОрионКН=' and 'ОрионКН=яяя'
   and sp1138 <> 'SНеЗагружать           '
and SUBSTRING([SP1138], 7, 9)=@docID
--and CAST(RTRIM(SUBSTRING([SP1140], 9, 10)) as INT)=194
return @id
END