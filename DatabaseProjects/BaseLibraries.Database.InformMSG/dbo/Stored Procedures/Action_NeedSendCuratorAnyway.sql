CREATE PROCEDURE [dbo].[Action_NeedSendCuratorAnyway]

@action_guid varchar(50)

AS
BEGIN

SET NOCOUNT ON;

declare @curator_id int

select @curator_id=idm_empl from ACTION_  with (nolock) where guid=@action_guid

if not(@curator_id is null) begin
	select @curator_id
end else begin
	select 'error'
end
END