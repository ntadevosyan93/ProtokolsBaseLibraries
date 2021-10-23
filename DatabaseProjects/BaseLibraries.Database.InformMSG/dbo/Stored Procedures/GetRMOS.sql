
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRMOS]
	@user_name varchar(50)
	, @d_start datetime =null
	,@d_end datetime =null
	,@allowDate int =0 -- 1-не учитывать период
AS
BEGIN
set @user_name=ltrim(rtrim(@user_name));
declare @idm_user int;
declare @idm_partner int;
declare @view_only_otdel int;
declare @view_only_self int;
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE with (nolock)  where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name);
select @idm_partner=KAD$EMPLOYEE.idm_partner from KAD$EMPLOYEE  with (nolock) where KAD$EMPLOYEE.id=@idm_user;
select @view_only_otdel=KAD$EMPLOYEE.view_only_otdel from KAD$EMPLOYEE  with (nolock) where KAD$EMPLOYEE.id=@idm_user;
select @view_only_self=KAD$EMPLOYEE.view_only_self from KAD$EMPLOYEE  with (nolock) where KAD$EMPLOYEE.id=@idm_user;

declare @ownerOrg int;
select  @ownerOrg = PARTNER.owner from PARTNER  with (nolock) where PARTNER.id=@idm_partner;

SET NOCOUNT ON;

if(@allowDate=1) 
		if @idm_partner>0 AND @ownerOrg=0
		begin 
			SELECT CAST(ROW_NUMBER() OVER(ORDER BY rs.id DESC) AS varchar(50)) as RN, 
			rs.[id], rs.[date_in], rs.[user_in], rs.[idm_org], rs.[idm_type], rs.[idm_addr], rs.[idm_mol], rs.[place], isnull(rs.[text],'(наименование отсутствует)') [text], rs.[date_start], rs.[serial_num], rs.[inv_num], rs.[doc_date_purchase], rs.[doc_num_purchase], rs.[cash_date], rs.[cash_number], rs.[receip_date], rs.[receip_number], rs.[idm_partner], rs.[del], rs.[idm_invoice], rs.[status], rs.[idm_partner_service], rs.[inv_num_extended], rs.[idm_head_org], rs.[idm_otdel], rs.[idm_responsible], rs.[user_cor], rs.[date_cor], rs.[date_release], rs.[date_expired], rs.[date_check], rs.[idm_priority], rs.[idm_billing], rs.[idm_depart_offices], rs.[guid]
			
			, d.text+' ('+case when d_o.text is null   then (case when idm_depart_offices is null then '' else cast(idm_depart_offices as varchar(50)) end) else d_o.text end+') ' as dep_t
			FROM RM$OS rs with (nolock) 
			left join DEPARTMENTS_OFFICES d_o on d_o.id = idm_depart_offices
			left join DEPARTMENTS d on d.id=idm_otdel
			WHERE rs.idm_partner_service=@idm_partner AND (rs.del=0) 
			ORDER BY id DESC
		end else begin			
					if @view_only_self>0 
					begin
						    SELECT CAST(ROW_NUMBER() OVER(ORDER BY rs.id DESC) AS varchar(50)) as RN,
							rs.[id], rs.[date_in], rs.[user_in], rs.[idm_org], rs.[idm_type], rs.[idm_addr], rs.[idm_mol], rs.[place], isnull(rs.[text],'(наименование отсутствует)') [text], rs.[date_start], rs.[serial_num], rs.[inv_num], rs.[doc_date_purchase], rs.[doc_num_purchase], rs.[cash_date], rs.[cash_number], rs.[receip_date], rs.[receip_number], rs.[idm_partner], rs.[del], rs.[idm_invoice], rs.[status], rs.[idm_partner_service], rs.[inv_num_extended], rs.[idm_head_org], rs.[idm_otdel], rs.[idm_responsible], rs.[user_cor], rs.[date_cor], rs.[date_release], rs.[date_expired], rs.[date_check], rs.[idm_priority], rs.[idm_billing], rs.[idm_depart_offices], rs.[guid]
			 
							, d.text+case when d_o.text is null  then (case when idm_depart_offices is null then '' else ' ('+cast(idm_depart_offices as varchar(50))+') '  end) else ' ('+d_o.text+') '  end as dep_t
							FROM RM$OS rs with (nolock) 
							left join DEPARTMENTS_OFFICES d_o on d_o.id = idm_depart_offices
							left join DEPARTMENTS d on d.id=idm_otdel
							WHERE (idm_responsible =@idm_user OR user_in=@user_name) AND (rs.del=0)
							ORDER BY id DESC	
					end if @view_only_otdel>0  begin
							declare @idm_otdel int;
							select @idm_otdel=KAD$EMPLOYEE.idm_otdel from KAD$EMPLOYEE where KAD$EMPLOYEE.id=@idm_user;
							SELECT CAST(ROW_NUMBER() OVER(ORDER BY rs.id DESC) AS varchar(50)) as RN, 
							rs.[id], rs.[date_in], rs.[user_in], rs.[idm_org], rs.[idm_type], rs.[idm_addr], rs.[idm_mol], rs.[place], isnull(rs.[text],'(наименование отсутствует)') [text], rs.[date_start], rs.[serial_num], rs.[inv_num], rs.[doc_date_purchase], rs.[doc_num_purchase], rs.[cash_date], rs.[cash_number], rs.[receip_date], rs.[receip_number], rs.[idm_partner], rs.[del], rs.[idm_invoice], rs.[status], rs.[idm_partner_service], rs.[inv_num_extended], rs.[idm_head_org], rs.[idm_otdel], rs.[idm_responsible], rs.[user_cor], rs.[date_cor], rs.[date_release], rs.[date_expired], rs.[date_check], rs.[idm_priority], rs.[idm_billing], rs.[idm_depart_offices], rs.[guid]
			
							, d.text+case when d_o.text is null  then (case when idm_depart_offices is null then '' else ' ('+cast(idm_depart_offices as varchar(50))+') '  end) else ' ('+d_o.text+') '  end as dep_t
							FROM RM$OS rs with (nolock) 
							left join DEPARTMENTS_OFFICES d_o on d_o.id = idm_depart_offices
							left join DEPARTMENTS d on d.id=idm_otdel
							WHERE (idm_responsible =@idm_user OR user_in=@user_name OR idm_otdel=@idm_otdel) AND (rs.del=0)
							ORDER BY id DESC
					end	else  begin
							SELECT CAST(ROW_NUMBER() OVER(ORDER BY rs.id DESC) AS varchar(50)) as RN, 
							rs.[id], rs.[date_in], rs.[user_in], rs.[idm_org], rs.[idm_type], rs.[idm_addr], rs.[idm_mol], rs.[place], isnull(rs.[text],'(наименование отсутствует)') [text], rs.[date_start], rs.[serial_num], rs.[inv_num], rs.[doc_date_purchase], rs.[doc_num_purchase], rs.[cash_date], rs.[cash_number], rs.[receip_date], rs.[receip_number], rs.[idm_partner], rs.[del], rs.[idm_invoice], rs.[status], rs.[idm_partner_service], rs.[inv_num_extended], rs.[idm_head_org], rs.[idm_otdel], rs.[idm_responsible], rs.[user_cor], rs.[date_cor], rs.[date_release], rs.[date_expired], rs.[date_check], rs.[idm_priority], rs.[idm_billing], rs.[idm_depart_offices], rs.[guid]
			
							, d.text+case when d_o.text is null  then (case when idm_depart_offices is null then '' else ' ('+cast(idm_depart_offices as varchar(50))+') '  end) else ' ('+d_o.text+') '  end as dep_t
							FROM RM$OS rs with (nolock) 
							left join DEPARTMENTS_OFFICES d_o on d_o.id = idm_depart_offices
							left join DEPARTMENTS d on d.id=idm_otdel
							WHERE rs.del=0
							ORDER BY id DESC
							end
		end
	else 
	if @idm_partner>0 AND @ownerOrg=0
		begin 
			SELECT CAST(ROW_NUMBER() OVER(ORDER BY rs.id DESC) AS varchar(50)) as RN,
			 rs.[id], rs.[date_in], rs.[user_in], rs.[idm_org], rs.[idm_type], rs.[idm_addr], rs.[idm_mol], rs.[place], isnull(rs.[text],'(наименование отсутствует)') [text], rs.[date_start], rs.[serial_num], rs.[inv_num], rs.[doc_date_purchase], rs.[doc_num_purchase], rs.[cash_date], rs.[cash_number], rs.[receip_date], rs.[receip_number], rs.[idm_partner], rs.[del], rs.[idm_invoice], rs.[status], rs.[idm_partner_service], rs.[inv_num_extended], rs.[idm_head_org], rs.[idm_otdel], rs.[idm_responsible], rs.[user_cor], rs.[date_cor], rs.[date_release], rs.[date_expired], rs.[date_check], rs.[idm_priority], rs.[idm_billing], rs.[idm_depart_offices], rs.[guid]
			, d.text+' ('+case when d_o.text is null   then (case when idm_depart_offices is null then '' else cast(idm_depart_offices as varchar(50)) end) else d_o.text end+') ' as dep_t
			FROM RM$OS rs with (nolock) 
			left join DEPARTMENTS_OFFICES d_o on d_o.id = idm_depart_offices
			left join DEPARTMENTS d on d.id=idm_otdel
			WHERE rs.idm_partner_service=@idm_partner AND (rs.del=0)  
			and (cast([date_in] as date) between  cast(@d_start as date) and cast(dateadd(d,1,@d_end) as date))
			ORDER BY id DESC
		end else begin			
					if @view_only_self>0 
					begin
						    SELECT CAST(ROW_NUMBER() OVER(ORDER BY rs.id DESC) AS varchar(50)) as RN, 
							 rs.[id], rs.[date_in], rs.[user_in], rs.[idm_org], rs.[idm_type], rs.[idm_addr], rs.[idm_mol], rs.[place], isnull(rs.[text],'(наименование отсутствует)') [text], rs.[date_start], rs.[serial_num], rs.[inv_num], rs.[doc_date_purchase], rs.[doc_num_purchase], rs.[cash_date], rs.[cash_number], rs.[receip_date], rs.[receip_number], rs.[idm_partner], rs.[del], rs.[idm_invoice], rs.[status], rs.[idm_partner_service], rs.[inv_num_extended], rs.[idm_head_org], rs.[idm_otdel], rs.[idm_responsible], rs.[user_cor], rs.[date_cor], rs.[date_release], rs.[date_expired], rs.[date_check], rs.[idm_priority], rs.[idm_billing], rs.[idm_depart_offices], rs.[guid]
			
							, d.text+case when d_o.text is null  then (case when idm_depart_offices is null then '' else ' ('+cast(idm_depart_offices as varchar(50))+') '  end) else ' ('+d_o.text+') '  end as dep_t
							FROM RM$OS rs with (nolock) 
							left join DEPARTMENTS_OFFICES d_o on d_o.id = idm_depart_offices
							left join DEPARTMENTS d on d.id=idm_otdel
							WHERE (idm_responsible =@idm_user OR user_in=@user_name) AND (rs.del=0)
			and (cast([date_in] as date) between  cast(@d_start as date) and cast(dateadd(d,1,@d_end) as date))
							ORDER BY id DESC	
					end if @view_only_otdel>0  begin
							select @idm_otdel=KAD$EMPLOYEE.idm_otdel from KAD$EMPLOYEE where KAD$EMPLOYEE.id=@idm_user;
							SELECT CAST(ROW_NUMBER() OVER(ORDER BY rs.id DESC) AS varchar(50)) as RN, 
							rs.[id], rs.[date_in], rs.[user_in], rs.[idm_org], rs.[idm_type], rs.[idm_addr], rs.[idm_mol], rs.[place], isnull(rs.[text],'(наименование отсутствует)') [text], rs.[date_start], rs.[serial_num], rs.[inv_num], rs.[doc_date_purchase], rs.[doc_num_purchase], rs.[cash_date], rs.[cash_number], rs.[receip_date], rs.[receip_number], rs.[idm_partner], rs.[del], rs.[idm_invoice], rs.[status], rs.[idm_partner_service], rs.[inv_num_extended], rs.[idm_head_org], rs.[idm_otdel], rs.[idm_responsible], rs.[user_cor], rs.[date_cor], rs.[date_release], rs.[date_expired], rs.[date_check], rs.[idm_priority], rs.[idm_billing], rs.[idm_depart_offices], rs.[guid]
			
							, d.text+case when d_o.text is null  then (case when idm_depart_offices is null then '' else ' ('+cast(idm_depart_offices as varchar(50))+') '  end) else ' ('+d_o.text+') '  end as dep_t
							FROM RM$OS rs with (nolock) 
							left join DEPARTMENTS_OFFICES d_o on d_o.id = idm_depart_offices
							left join DEPARTMENTS d on d.id=idm_otdel
							WHERE (idm_responsible =@idm_user OR user_in=@user_name OR idm_otdel=@idm_otdel) AND (rs.del=0)
			and (cast([date_in] as date) between  cast(@d_start as date) and cast(dateadd(d,1,@d_end) as date))
							ORDER BY id DESC
					end	else  begin
							SELECT CAST(ROW_NUMBER() OVER(ORDER BY rs.id DESC) AS varchar(50)) as RN, 
							rs.[id], rs.[date_in], rs.[user_in], rs.[idm_org], rs.[idm_type], rs.[idm_addr], rs.[idm_mol], rs.[place], isnull(rs.[text],'(наименование отсутствует)') [text], rs.[date_start], rs.[serial_num], rs.[inv_num], rs.[doc_date_purchase], rs.[doc_num_purchase], rs.[cash_date], rs.[cash_number], rs.[receip_date], rs.[receip_number], rs.[idm_partner], rs.[del], rs.[idm_invoice], rs.[status], rs.[idm_partner_service], rs.[inv_num_extended], rs.[idm_head_org], rs.[idm_otdel], rs.[idm_responsible], rs.[user_cor], rs.[date_cor], rs.[date_release], rs.[date_expired], rs.[date_check], rs.[idm_priority], rs.[idm_billing], rs.[idm_depart_offices], rs.[guid]
			
							, d.text+case when d_o.text is null  then (case when idm_depart_offices is null then '' else ' ('+cast(idm_depart_offices as varchar(50))+') '  end) else ' ('+d_o.text+') '  end as dep_t
							FROM RM$OS rs with (nolock) 
							left join DEPARTMENTS_OFFICES d_o on d_o.id = idm_depart_offices
							left join DEPARTMENTS d on d.id=idm_otdel
							WHERE rs.del=0
			and (cast([date_in] as date) between  cast(@d_start as date) and cast(dateadd(d,1,@d_end) as date))
							ORDER BY id DESC
							end
		end

END