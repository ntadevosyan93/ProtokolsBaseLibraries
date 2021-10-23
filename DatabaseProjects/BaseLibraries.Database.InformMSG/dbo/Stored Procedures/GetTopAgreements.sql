-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTopAgreements]
	-- Add the parameters for the stored procedure here
	@user_in varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT TOP 15   count([idm_empl])  as _count, idm_empl, fio_full
    FROM [dbo].[RD$TASK_EML] with (nolock) 
    left join View$KAD$EMPLOYEE b  with (nolock) on b.id = idm_empl
    where (cast(date_in as date)  between cast(DATEADD(day,-7,getdate())as date) and  cast(getdate()  as date )) and del=0 and user_in=@user_in
     group by idm_empl,fio_full
      order by count([idm_empl]) desc
END