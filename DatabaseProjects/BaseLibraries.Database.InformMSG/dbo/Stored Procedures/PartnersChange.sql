-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PartnersChange]	
	@from int,
	@to int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	/*
	получить список задвоенных 
	 SELECT [id]
      ,[text] ,inn     
  FROM [InformMSG].[dbo].[PARTNER]
  where inn in( SELECT  inn 
  FROM [InformMSG].[dbo].[PARTNER]
    group by inn
	having count(inn) >1 )
	order by inn
	*/

update DISPATCH$INCOMING set idm_partner = @to where idm_partner = @from
update DISPATCH$OUTCOMING set idm_partner = @to where idm_partner = @from
update DOGOVORS$AGREEMENT_AUTO_INSERT set idm_owner = @to where idm_owner = @from
update DOGOVORS$REG set idm_partner = @to where idm_partner = @from
update DOGOVORS$REG set idm_owner = @to where idm_owner = @from


update DOGOVORS$REG_AUTOAGREEMENT_EMPL_OWNER set idm_owner = @to where idm_owner = @from
update DOGOVORS$REG_EMPLByOWNER set idm_owner = @to where idm_owner = @from
update DOGOVORS$REG_HISTORY set idm_partner = @to where idm_partner = @from
update KAD$EMPLOYEE set idm_partner = @to where idm_partner = @from
update KAD$EMPLOYEE set idm_org = @to where idm_org = @from

update KAD$EMPLOYEE_HISTORY set idm_partner = @to where idm_partner = @from
update RM$INVOICE set idm_partner = @to where idm_partner = @from

update RM$OS set idm_partner = @to where idm_partner = @from
update RM$OS set idm_org = @to where idm_org = @from

update RM$OS$BILLING set idm_partner = @to where idm_partner = @from
update RM$OS$BILLING set idm_owner = @to where idm_owner = @from


update RM$OS$BILLING_HISTORY set idm_partner = @to where idm_partner = @from
update RM$OS$BILLING_INVOICE set idm_partner = @to where idm_partner = @from
update RM$OS_HISTORY set idm_partner = @to where idm_partner = @from


delete from PARTNER where id = @from


END