-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SelectHRM_Agree]
 @type int,/*0- Общий список; 1-Курируемые; 2- Согласование;*/
  @user_in varchar(50)
  ,@IsAll int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @idm_empl int
	select @idm_empl = id from KAD$EMPLOYEE with (nolock) where ltrim(rtrim(login_ad))=@user_in

	if(@type=2)
	begin
		if(@isAll=1)
			SELECT  hr.date_in,agr.idm_depart as idm_departments,agr.idm_doljn,hr.idm_chief,
	hr.id,hr.status ,agr.[guid] as agree_guid,hr.[guid] as  guid	
	FROM [dbo].[HRM$REQ_Agreement] agr with (nolock)
	left join HRM$REQ_CANDIDATE req_c on req_c.id = agr.idm_req_cand
	left join HRM$REQ hr on hr.id=  req_c.idm_req
	where agr.del=0  and agr.idm_status!=0 --and agr.id in (select idm_agreement from HRM$REQ_EmplAgreement where idm_empl=@idm_empl and del=0 )
	and hr.del=0
		else
	SELECT  hr.date_in,agr.idm_depart as idm_departments,agr.idm_doljn,hr.idm_chief,
	hr.id,hr.status ,agr.[guid] as agree_guid,hr.[guid] as  guid	
	FROM [dbo].[HRM$REQ_Agreement] agr with (nolock)
	left join HRM$REQ_CANDIDATE req_c on req_c.id = agr.idm_req_cand
	left join HRM$REQ hr on hr.id=  req_c.idm_req
	where agr.del=0  and agr.idm_status!=0 and agr.id in (select idm_agreement from HRM$REQ_EmplAgreement where idm_empl=@idm_empl and del=0 )and hr.del=0
	end
	if(@type=0) 
		begin
		if(@isAll=1)
		 select  hr.date_in,hr.idm_departments,hr.idm_doljn,hr.idm_chief, 
		 hr.id,hr.[status],hr.[guid],'' as agree_guid from  HRM$REQ hr with (nolock)
		 where hr.del=0 
		else
		 select  hr.date_in,hr.idm_departments,hr.idm_doljn,hr.idm_chief, 
		 hr.id,hr.[status],hr.[guid],'' as agree_guid from  HRM$REQ hr with (nolock)
		 where hr.del=0 and (idm_chief=@idm_empl or user_in=@user_in or id in(select distinct v.req_id from View$HRM$REQ_CANDIDATE v
inner join HRM$REQ_Agreement agr on agr.idm_req_cand = v.id_reqCandidate
inner join HRM$REQ_EmplAgreement m on m.idm_agreement=agr.id
where m.idm_empl=@idm_empl and agr.del=0 and m.del=0 ))and hr.del=0
	end
	if(@type=1) 
		SELECT  hr.date_in,hr.idm_departments,hr.idm_doljn,hr.idm_chief, hr.id,hr.[status],hr.[guid],'' as agree_guid
		FROM [dbo].[HRM$REQ] hr with (nolock)
		where  hr.idm_chief=@idm_empl and hr.del=0-- and hr.del=0
	END