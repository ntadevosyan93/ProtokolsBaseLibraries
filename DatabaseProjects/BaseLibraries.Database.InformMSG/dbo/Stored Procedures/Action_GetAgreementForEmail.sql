CREATE PROCEDURE [dbo].[Action_GetAgreementForEmail]

@action_guid varchar(50)

AS
BEGIN

SET NOCOUNT ON;

declare @id int

select @id=id from ACTION_  with (nolock) where guid=@action_guid

SELECT KAD$EMPLOYEE.fam,KLASS.klass_value,text_reason
FROM ACTION_AGREEMENT  with (nolock) 
left join KAD$EMPLOYEE  with (nolock) on KAD$EMPLOYEE.id = ACTION_AGREEMENT.idm_empl
left join KLASS  with (nolock) on KLASS.klass_id = ACTION_AGREEMENT.idm_reason
where KLASS.klass_name='action_agree' and idm_action = @id
END