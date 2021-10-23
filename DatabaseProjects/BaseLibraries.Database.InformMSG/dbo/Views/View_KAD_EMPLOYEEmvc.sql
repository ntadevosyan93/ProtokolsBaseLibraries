



CREATE view [dbo].[View$KAD$EMPLOYEEmvc]
 AS

select [id], [date_in], [user_in], [fam], [name], [otch], [data_b], [idm_doljn], [idm_otdel], [idm_org], [status], [phone_mob], [phone_vn], [phone_gor], [login_ad], [login_1c_t], [login_1c_id], [bolid_card_num], [bolid_card_id], [email], [login_web], [web_pass_sha256], [idm_partner], [view_only_otdel], [view_only_self], [candidate], [idm_controller], [actual], [idm_bolid], [photo_path], [noFilial], [realId], [wt_self_depart], [wt_hide], [wt_check_fact_only], [curator_dog], [call_center_worker], [IsLaborant], [date_cur], [user_cur], [del], [guid], [guid_web], [PinCode], [auth_mobile_last_date]
from [InformMSG].[dbo].[KAD$EMPLOYEE]
WHERE        (del = 0 OR del IS NULL) --AND (actual = 1)
GO
GRANT SELECT
    ON OBJECT::[dbo].[View$KAD$EMPLOYEEmvc] TO PUBLIC
    AS [dbo];

