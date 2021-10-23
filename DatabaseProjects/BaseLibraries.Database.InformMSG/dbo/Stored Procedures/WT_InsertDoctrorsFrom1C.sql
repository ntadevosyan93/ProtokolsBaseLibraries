-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$InsertDoctrorsFrom1C]
 @estimated_start datetime,
 @estimated_stop datetime,
 @idm_1c varchar(10),
 @idm_1c_filial varchar(10) 
AS
BEGIN

	SET NOCOUNT ON;
	declare @idm_empl int
	select @idm_empl = id
from KAD$EMPLOYEE with(nolock) 
where guid_iclinic = (SELECT top(1)  [iClinic].[dbo].[EMPLOYEE].guid  FROM [iClinic].[dbo].[EMPLOYEE] with(nolock)  where idm_1c = @idm_1c) 

if @idm_empl is null return

	if not exists (select * from KAD$WORK_TIME with(nolock) where estimated_start = @estimated_start and estimated_stop = @estimated_stop and idm_empl = @idm_empl and del = 0)
	begin
	insert into KAD$WORK_TIME
	(user_in, idm_empl, estimated_start, estimated_stop, del, idm_status, idm_depart, from_1c, idm_doljn)
		select 
		'auto_23_00' as user_in,
		@idm_empl as idm_empl,
		@estimated_start as estimated_start,
		@estimated_stop  as estimated_stop ,
		0 as del,
		1 as idm_status,
		(select top(1) id from DEPARTMENTS with(nolock)  where idm_iclinic_places = (select top(1) id from  [iClinic].[dbo].[PLACES] with(nolock) where LTRIM(RTRIM(idm_1c)) = LTRIM(RTRIM(@idm_1c_filial)))) as idm_depart,
		1 as from_1c,
		87 as idm_doljn


	end



END