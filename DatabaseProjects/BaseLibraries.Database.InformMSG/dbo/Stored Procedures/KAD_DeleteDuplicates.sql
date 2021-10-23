-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[KAD$DeleteDuplicates]
	-- Add the parameters for the stored procedure here
	@realId int,
	@deleteId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   update KAD$EMPLOYEE set realId = @realId, del=1, idm_bolid=null,[login_ad] = null
      ,[login_1c_t] = null
      ,[login_1c_id] = null
      ,[bolid_card_num] = null
      ,[bolid_card_id] = null where id = @deleteId   
   update KAD$WORK_TIME set idm_empl = @realId where idm_empl=@deleteId   
   update KAD$WORK_TIME_CURATORS set idm_curator = @realId where idm_curator = @deleteId   
   update KAD$WORK_TIME_CURATORS set idm_empl = @realId where idm_empl = @deleteId    
   update KAD$WORK_TIME_SPR set idm_empl = @realId where idm_empl = @deleteId
	/*
	  ,[login_ad] = null
      ,[login_1c_t] = null
      ,[login_1c_id] = null
      ,[bolid_card_num] = null
      ,[bolid_card_id] = null
	*/
	
END