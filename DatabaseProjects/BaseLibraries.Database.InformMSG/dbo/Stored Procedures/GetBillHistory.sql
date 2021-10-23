CREATE PROCEDURE [dbo].[GetBillHistory]
	-- Add the parameters for the stored procedure here
	@bill_id as int
AS
BEGIN
--exec GetBillHistory 27724, '7a74f154-7bd3-41d7-a0ab-8aed6e0d536c'
declare   @bill_guid as varchar(50)
select @bill_guid = bill_guid
From RM$OS$BILLING
where id= @bill_id
--select @bill_id =27724, @bill_guid = '7a74f154-7bd3-41d7-a0ab-8aed6e0d536c'

;with act (capt, con, act) as (
select 'Файлы', 'BILLINGDETALIES' controller, 'CBPFILESBILLPARTIAL' action union all
select 'Согласование', 'BILLINGDETALIES', 'CBPSOGLPARTIAL' union all
select 'Тонер', 'BILLINGDETALIES', 'CBPBILLTONERPARTIAL' union all
select 'Расход', 'BILLINGDETALIES', 'cbpRashodPartial' union all
select 'Дополнительные документы', 'BILLINGDETALIES', 'cbpDocAdditionalPartial' union all
select 'Оборудование', 'BILLINGDETALIES', 'cbpOborudPartial' union all
select 'Оплата', 'BILLINGDETALIES', 'cbpOplataPartial' union all
select 'Оплата по плану', 'BILLINGDETALIES', 'cbpPlanOplataPartial'  
)
select *
From (
 select  ul.id, 'загрузка страницы  ' capt,  ul.user_in, ul.date_in  
 From UserLink ul
 where ul.controller = 'Billings' and ul.Action = 'Edit' and query =  'guid='+@bill_guid

 union 
select ul.id,' вкладка: '+act.capt capt, ul.user_in, ul.date_in
From UserLink ul
join act on  ul.controller = act.con and ul.Action = act.act
where query = '[{"Name":"idm_billing","Value":"'+rtrim(ltrim(str(@bill_id)))+'"}]'
 
union

 select ul.id, 'Скачивание файла : ' + fs.[file_name],  ul.user_in, ul.date_in 
 From UserLink ul
 join  FILE_STOR fs on  fs.module = 'workflow_tasks' and db_table = 'billings' and '[{"Name":"guid","Value":"'+ fs.guid+'"},{"Name":"server","Value":"1"}]' = ul.query

 where controller = 'File' and action = 'Download'
 and fs.db_table_id = @bill_id
 )D 
 order by date_in desc

end


 

--update KAD$EMPLOYEE
--set login_ad = 'VIPCG\i.novokreshchenova'
--where id = 2703