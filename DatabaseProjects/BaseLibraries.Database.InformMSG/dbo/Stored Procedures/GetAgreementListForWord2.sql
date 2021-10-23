


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAgreementListForWord2]
	-- Add the parameters for the stored procedure here
	@idm_dogovor int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare @date_dog as datetime

   select @date_dog = date_in from [DOGOVORS$REG] where id = @idm_dogovor 

SELECT 1 num, ke.id,
'Куратор, '+D.text as dolgn
,(CASE WHEN fam IS NULL THEN '' ELSE fam END )+' '+
(CASE WHEN name IS NULL THEN '' ELSE name END )+' '+
(CASE WHEN otch IS NULL THEN '' ELSE otch END ) as fio
,'СОГЛАСОВАН' text_reason, dr.date_in date_reason, 1 idm_reason
into #tmp
 FROM [DOGOVORS$REG] dr with (nolock)  
 left join KAD$EMPLOYEE ke on ke.id = idm_empl
 left join KAD$DOLJN D  with (nolock) on D.id = ke.idm_doljn
where dr.id = @idm_dogovor  and dr.idm_empl!=1393;


SELECT row_number() over(order by a.id)+1 num, K.id, K.text as dolgn, fio, text_reason, date_reason, idm_reason
into #tmp2
FROM DOGOVORS$AGREEMENT a with (nolock) 
left join (select id,
(CASE WHEN fam IS NULL THEN '' ELSE fam END )+' '+
(CASE WHEN name IS NULL THEN '' ELSE name END )+' '+
(CASE WHEN otch IS NULL THEN '' ELSE otch END ) as fio

from kad$employee) T  on T.id = idm_empl
left join KAD$DOLJN K  with (nolock) on K.id = (select idm_doljn from KAD$EMPLOYEE where id = idm_empl)
WHERE (idm_dogovor = @idm_dogovor) and del=0

;with sogl as (
select *
From #tmp
where #tmp.id not in( select id From #tmp2)
union all
select *
From #tmp2
)

select  dolgn, id, fio, text_reason, date_reason, idm_reason
From sogl
order by num
end