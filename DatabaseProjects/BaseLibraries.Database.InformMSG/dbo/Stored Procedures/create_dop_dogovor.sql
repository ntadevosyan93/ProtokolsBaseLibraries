
create procedure [dbo].create_dop_dogovor
@idm_dogovor as int, 
@user_in as varchar(50), 
@status as int = null
AS
BEGIN

declare @num_ds as int, @dogovor_guid as varchar(50)

--set @idm_dogovor = 6110
--set @user_in = 'VIPCG\n.sibiryakov'
set @dogovor_guid = newid()

select @num_ds = count(*)+1 from [dbo].[DOGOVORS$REG] dr where dr.parent_dog = @idm_dogovor

--select [id], [date_in], [guid], [user_in], [number_storage], [date_reg], [set_numb_automat], [r_number], [r_date], [idm_partner], [idm_dog_type], [subject], [cost_no_nds], [cost_nds_value], [cost_summ], [r_date_deadline], [idm_empl], [notes_conflicts], [notes_agreement], [notes], [idm_owner], [status], [idm_template], [pay_rules], [date_deadline], [some_status], [curator_sended], [idm_isp], [isp_sended], [old_dogovor], [idm_parent], [del], [user_del], [date_del], [comment_clearNum], [user_clear], [date_clear], [parent_dog]
insert into [DOGOVORS$REG] (parent_dog, [guid], date_in, user_in, date_reg, r_number, r_date,idm_parent, [subject],del)
select   [id] parent_dog, @dogovor_guid,GETDATE(),@user_in, date_reg, r_number + ' дополнительное соглашение '+ rtrim(ltrim(str(@num_ds))), r_date,idm_parent, [subject], 0 [del] 
From [dbo].[DOGOVORS$REG] dr
where dr.id = @idm_dogovor

if(@status is not null)
begin
update [DOGOVORS$REG]
set some_status =  @status
where [guid] = @dogovor_guid
end

--dbo.create_dop_dogovor @idm_dogovor, @user_in
EXEC SetCuratorAutoAgreement @user_in  , @dogovor_guid 

select @dogovor_guid [NewDogowor]

 end