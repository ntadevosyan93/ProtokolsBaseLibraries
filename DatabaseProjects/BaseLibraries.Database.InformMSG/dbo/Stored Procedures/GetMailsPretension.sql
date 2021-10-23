
--select *
--From KLASS
--where klass_name = 'tt_trouble_status_pretensia'
CREATE PROCEDURE [dbo].[GetMailsPretension]
	-- Add the parameters for the stored procedure here
	@pre_id as int
AS
BEGIN
--declare @pre_id as int 
declare @idm_control as int , @idm_empl as int

--set @pre_id = 12468

select @idm_control=idm_control, @idm_empl=idm_empl
From TT$Pretensions
where id = @pre_id
order by id desc

select email
From (
select @idm_control idm_empl
union  
select @idm_empl
union
select idm_empl
From [dbo].[TT$MAIN_COLLABORATORS] with(nolock)
where idm_main= @pre_id and del=0
union
select idm_empl
From TT$SPR_REGION_EMPL  
where idm_region= 2
)D join KAD$EMPLOYEE ke on D.idm_empl = ke.id
where rtrim(ltrim(isnull(email,''))) != ''

end