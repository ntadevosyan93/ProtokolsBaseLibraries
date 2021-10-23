-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE WT$BuildNormalHours
	-- Add the parameters for the stored procedure here
	@user_cur varchar(50),
	@date_mount datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

declare @idm_empl int
set @idm_empl = 0

select top(1) @idm_empl = id from KAD$EMPLOYEE where login_ad = @user_cur and (del=0 or del is null) and actual = 1


insert into KAD$WORK_TIME_NORMA (date_mount, idm_empl)
(
select @date_mount, idm_empl 
from 
KAD$WORK_TIME_CURATORS 
where 
idm_empl in (select idm_empl from KAD$WORK_TIME_CURATORS where idm_curator = @idm_empl)
and
idm_curator = @idm_empl
and
(select COUNT(id) from KAD$WORK_TIME_NORMA where idm_empl=KAD$WORK_TIME_CURATORS.idm_empl and  date_mount = @date_mount)=0
)

END