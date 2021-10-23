-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRM_Billings]
	-- Add the parameters for the stored procedure here
	@date datetime, @owner int, @OnlyPaid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  if(@owner is not null)
	SELECT b.[id], [number],  [description], [status], [summ], date_bill,summ_cy,summ_cy_type, klass_value 
	,a.text as partner, c.text as owner, percent_cy
	 FROM [RM$OS$BILLING] b with (nolock) 
	join PARTNER a  with (nolock) on a.id = idm_partner
	join PARTNER c  with (nolock) on c.id = idm_owner and c.owner=1
	left join KLASS  with (nolock) on klass_id=summ_cy_type and klass_name='currency'
	WHERE (cast( [date_pay_purpose] as date) = cast( @date as date)) and idm_owner =@owner and del=0
	and [status] in ( select data from dbo.Split(case when @OnlyPaid=1 then '7' else '2,7' end,',') ) 
	order by a.text
  else
	SELECT b.[id], [number],  [description], [status], [summ], date_bill ,summ_cy,summ_cy_type , klass_value 
	,a.text as partner, c.text as owner,percent_cy
	 FROM [RM$OS$BILLING] b with (nolock) 
	join PARTNER a  with (nolock) on a.id = idm_partner
	join PARTNER c with (nolock)  on c.id = idm_owner and c.owner=1	
	left join KLASS on klass_id=summ_cy_type and klass_name='currency'
	WHERE (cast( [date_pay_purpose] as date) = cast( @date as date)) and del=0
	and [status] in ( select data from dbo.Split(case when @OnlyPaid=1 then '7' else '2,7' end,',') ) 
	order by a.text
END