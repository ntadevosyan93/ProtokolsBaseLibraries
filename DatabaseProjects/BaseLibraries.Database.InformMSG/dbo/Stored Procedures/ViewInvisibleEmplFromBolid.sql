-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ViewInvisibleEmplFromBolid]
	-- Add the parameters for the stored procedure here
	@xml varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @xmlIn  XML;
	
	set @xmlIn = cast(@xml as XML)

    -- Insert statements for procedure here
	SELECT
	NEWID() as id,
	Tab.Col.value('@TimeVal','datetime') AS TimeVal,
	KAD$EMPLOYEE.id as idm_empl, 
	KAD$WORK_TIME_DEPART_BOLID.idm_depart
	FROM   @xmlIn.nodes('/pdata') Tab(Col)
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.idm_bolid = Tab.Col.value('@HozOrgan','int')
	left join KAD$WORK_TIME_DEPART_BOLID on KAD$WORK_TIME_DEPART_BOLID.idm_bolid = Tab.Col.value('@DoorIndex','int')
	where KAD$EMPLOYEE.del=0 or KAD$EMPLOYEE.del is null
	
END