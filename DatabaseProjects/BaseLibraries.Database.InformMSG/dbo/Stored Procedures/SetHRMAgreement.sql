-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetHRMAgreement]
	-- Add the parameters for the stored procedure here
	@user_in varchar(50),
	@idm_req_candidate int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		
	declare @c int, @idm_chief int,@idm_agreement int,@idm_req int, @dep int
	select @idm_chief=idm_chief,@idm_req=id, @dep= idm_departments  from HRM$REQ where id = (select idm_req from HRM$REQ_CANDIDATE c where id=@idm_req_candidate)
	select @idm_agreement=id from HRM$REQ_Agreement  where idm_req_cand = @idm_req_candidate and del=0 group by id


	select @c=Count(id) from HRM$REQ_EmplAgreement where idm_agreement=@idm_agreement and del=0 
	if (@c=0) begin
		--Добавим заказчика
		insert into HRM$REQ_EmplAgreement (user_in,idm_req,idm_empl,idm_res,idm_agreement)
		values (@user_in,@idm_req,@idm_chief,1,@idm_agreement)

		if(@user_in!='n.sibiryakov' and @user_in!='VIPCG\k.mahmudova' and @user_in!='VIPCG\v.barulina' and @user_in!='VIPCG\n.sibiryakov') begin
			--Добавим сотрудников из списка рассылки
			insert into HRM$REQ_EmplAgreement (user_in,idm_req,idm_empl,idm_res,idm_agreement)
			(select @user_in, @idm_req,idm_empl,1,@idm_agreement
			from HRM$EMPL_OTDEL 
			where idm_empl not in (select idm_empl from HRM$REQ_EmplAgreement where idm_agreement = @idm_agreement and  del=0)
			and IsNess=1 and (idm_depart is null or  idm_depart=@dep)  group by idm_empl)
			
		end
	end
END