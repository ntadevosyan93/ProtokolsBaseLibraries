-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f_GetResultAgreementBillingByOtdel]
( 
	@idm_billing int,
	@idm_otdel int
)
RETURNS varchar(250)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @res varchar(250)

	SELECT top(1) @res = r.klass_value +'. ' +fio_short+', '+ convert(varchar(10),[date_reason],104) +' '+ convert(varchar(5),[date_reason],108) +
	(case when text_reason !='' and not text_reason is null then '. Комментарии: '+text_reason else '' end) 
	FROM [RM$OS$BILLING_AGREEMENT]
	with (nolock)
	left join KLASS r on r.klass_id = idm_reason and r.klass_name='billing'
	left join KLASS k on k.klass_id = idm_otdel and k.klass_name='otdel_empl'
	left join View$KAD$EMPLOYEE b on b.id =idm_empl
    where idm_bill=@idm_billing and RM$OS$BILLING_AGREEMENT.del=0 and RM$OS$BILLING_AGREEMENT.idm_otdel=@idm_otdel 
    order by RM$OS$BILLING_AGREEMENT.id desc

	return @res
END