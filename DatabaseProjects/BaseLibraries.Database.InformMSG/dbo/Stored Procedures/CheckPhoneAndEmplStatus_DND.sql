-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckPhoneAndEmplStatus_DND]
	-- Add the parameters for the stored procedure here
	@phone varchar(20)
AS
BEGIN
	
	SET NOCOUNT ON;
	
    declare @emplExist int;
    set @emplExist = 0;
           
    select @emplExist = COUNT(phone)
    from CHECKSIT$PHONES with (nolock) 
    left join PBX$CC$WORK_TIME with (nolock)  on PBX$CC$WORK_TIME.phone = CHECKSIT$PHONES.phoneNumber    
    where phone = @phone and del=0 and
	(GETDATE() BETWEEN DATEADD(dd, 0, DATEDIFF(dd, 0, PBX$CC$WORK_TIME.work_date)) + cast(PBX$CC$WORK_TIME.work_start as time) AND         
				  DATEADD(dd, 0, DATEDIFF(dd, 0, PBX$CC$WORK_TIME.work_date)) + cast(PBX$CC$WORK_TIME.work_stop as time))
				  
	
	if (@emplExist>0) begin
	
			declare @dndActive int;
			declare @dndTime varchar(20)
			
			set @dndActive = 0;
			
			select @dndActive = COUNT(Телефон) from View$CC$DND_TIME with (nolock)  where Телефон = @phone
			select @dndTime = Длительность from View$CC$DND_TIME  with (nolock) where Телефон = @phone
			
			if (@dndActive>0) select 1 as res, @dndTime as _time else select 2 as res, '' as _time
			
			
	end else  select 0 as res, '' as _time
    
    
	
	
	
END