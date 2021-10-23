--пользуйтесь алиасами блять
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$Edit$All]
	-- Add the parameters for the stored procedure here
	@dt datetime, @dt1 datetime, @IsWork int=1
AS
BEGIN
if(@IsWork=0) 
begin

	SELECT kwt.id,kwt.date_in,
	d.text as department_t,
	d.id as department_id, 
	 (CASE WHEN fam IS NOT NULL THEN fam ELSE '' END) + ' ' + (CASE WHEN name IS NOT NULL THEN name ELSE '' END) + ' ' + (CASE WHEN otch IS NOT NULL 
                      THEN otch ELSE '' END) as fio, 
	ke.id as fio_id, 
	kwt.estimated_start, 
	kwt.estimated_stop,
	(kwt.estimated_stop - kwt.estimated_start)as planed, 
	kwt.actual_start,
	kwt.actual_stop,
	kwt.curatorComment,
	DATEDIFF(mi,kwt.estimated_start,kwt.actual_start) as lateness, 
	DATEDIFF(mi,kwt.actual_stop,kwt.estimated_stop) as leave, 
	kd.text as doljn, ke.guid,  kwt.comment,kwt.actual_stop-kwt.actual_start as factWork,
	(select vke.fio_full + ', ' AS 'data()'
	from  KAD$WORK_TIME_CURATORS
	left join View$KAD$EMPLOYEE vke on vke.id=idm_curator
	where idm_empl = kwt.idm_empl  
	FOR XML PATH('')) as curatorsText
	,kwt.idm_status
	FROM [InformMSG].[dbo].[KAD$WORK_TIME] kwt
	left join kad$employee ke on kwt.idm_empl=ke.id
	left join DEPARTMENTS d on kwt.idm_depart=d.id
	left join KAD$DOLJN kd on kd.id = kwt.idm_doljn
	where  kwt.del=0 and (kwt.estimated_start>=@dt and kwt.estimated_start<DATEADD(d,1,@dt1))  
	order by kwt.estimated_start asc
  end else begin
	SELECT kwt.id,kwt.date_in,
	d.text as department_t,d.id as department_id, (CASE WHEN fam IS NOT NULL THEN fam ELSE '' END) + ' ' + (CASE WHEN name IS NOT NULL THEN name ELSE '' END) + ' ' 
	 + (CASE WHEN otch IS NOT NULL THEN otch ELSE '' END) as fio, 
	ke.id as fio_id, 
	kwt.estimated_start, 
	kwt.estimated_stop,
	(kwt.estimated_stop - kwt.estimated_start)as planed, 
	kwt.actual_start,
	kwt.actual_stop,
	kwt.curatorComment,
	DATEDIFF(mi,kwt.estimated_start,kwt.actual_start) as lateness, 
	DATEDIFF(mi,kwt.actual_stop,kwt.estimated_stop) as leave, 
	kd.text as doljn, ke.guid,  kwt.comment,
	kwt.actual_stop-kwt.actual_start as factWork,
	(select vkd.fio_full + ', ' AS 'data()'
	from  KAD$WORK_TIME_CURATORS
	left join View$KAD$EMPLOYEE vkd on vkd.id=idm_curator
	where idm_empl = kwt.idm_empl  
	FOR XML PATH('')) as curatorsText
	,kwt.idm_status
	FROM [InformMSG].[dbo].[KAD$WORK_TIME] kwt
	left join kad$employee ke on kwt.idm_empl=ke.id
	left join DEPARTMENTS d on kwt.idm_depart=d.id
	left join KAD$DOLJN kd on kd.id = kwt.idm_doljn
	where  kwt.del=0 and (kwt.estimated_start>=@dt and kwt.estimated_start<DATEADD(d,1,@dt1))  
	and (kwt.idm_status=1 or kwt.idm_status=6)
	and kwt.estimated_start<GETDATE()
	order by kwt.estimated_start asc
  end
END