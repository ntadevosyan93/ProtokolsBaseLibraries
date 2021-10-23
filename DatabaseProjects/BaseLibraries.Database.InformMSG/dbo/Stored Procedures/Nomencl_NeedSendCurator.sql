CREATE PROCEDURE [dbo].[Nomencl_NeedSendCurator]

@nomenclature_guid varchar(50)

AS
BEGIN

SET NOCOUNT ON;

declare @id int
declare @curator_sended int
declare @curator_id int

select @id = id, @curator_sended=curator_sended,@curator_id=idm_empl from NOMENCLATURE where guid=@nomenclature_guid

declare @result_send int
select @result_send=(CASE WHEN COUNT(id) = SUM(idm_reason) THEN 1 ELSE 0 END) from NOMENCLATURE_AGREEMENT where idm_nomenclature=@id

if(@result_send=1) AND (@curator_sended=0) AND not(@curator_id is null) begin
	update NOMENCLATURE set curator_sended = @result_send where id=@id
	select @curator_id
end else begin
	update NOMENCLATURE set curator_sended = @result_send where id = @id
	select 'error'
end
END