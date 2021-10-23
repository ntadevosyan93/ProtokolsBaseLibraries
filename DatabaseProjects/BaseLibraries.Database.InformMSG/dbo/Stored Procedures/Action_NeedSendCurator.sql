CREATE PROCEDURE [dbo].[Action_NeedSendCurator]

@action_guid varchar(50)

AS
BEGIN

SET NOCOUNT ON;

declare @id int
declare @curator_sended int
declare @curator_id int

select @id = id, @curator_sended=curator_sended,@curator_id=idm_empl from ACTION_  with (nolock) where guid=@action_guid

declare @result_send int
select @result_send=(CASE WHEN COUNT(id) = SUM(idm_reason) THEN 1 ELSE 0 END) from ACTION_AGREEMENT with (nolock)  where idm_action=@id

if(@result_send=1) AND (@curator_sended=0) AND not(@curator_id is null) begin
	update ACTION_ set curator_sended = @result_send where id=@id
	select @curator_id
end else begin
	update ACTION_ set curator_sended = @result_send where id = @id
	select 'error'
end
END