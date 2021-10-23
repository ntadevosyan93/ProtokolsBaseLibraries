CREATE PROCEDURE [dbo].[Nomencl_NeedSendCuratorAnyway]

@nomenclature_guid varchar(50)

AS
BEGIN

SET NOCOUNT ON;

declare @curator_id int

select @curator_id=idm_empl from NOMENCLATURE where guid=@nomenclature_guid

if not(@curator_id is null) begin
	select @curator_id
end else begin
	select 'error'
end
END