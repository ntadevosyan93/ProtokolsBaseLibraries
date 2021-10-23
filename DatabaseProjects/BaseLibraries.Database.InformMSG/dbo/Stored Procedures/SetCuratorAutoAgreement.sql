







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetCuratorAutoAgreement]
	-- Add the parameters for the stored procedure here
	@user_in varchar(50),
	@dogovor_guid varchar(50)
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    set @user_in =ltrim(rtrim(@user_in))
	declare @idm_user int, @idm_empl as int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)	
	
	declare @idm_dogovor int, @idm_owner int, @idm_type int
	select @idm_dogovor=id, @idm_owner = idm_owner,@idm_type=idm_dog_type,@idm_empl = idm_empl from DOGOVORS$REG where guid = @dogovor_guid
	
	select distinct  @idm_dogovor= dr.id, @idm_owner = dr.idm_owner,@idm_type=dr.idm_dog_type,@idm_empl = dr.idm_empl
	from DOGOVORS$REG  dr
	 --left join  [DOGOVOR_EMPLtoEMPL] dee with (nolock)  on dr.idm_empl = dee.idm_empl_parent and dee.IsReplace=1
where  dr.guid = @dogovor_guid


	declare @c int;	
	create table #Temp (user_in  varchar(50), [idm_empl] int, [idm_dogovor] int, idm_reason int ,text_reason varchar(500), date_reason datetime ,del int)
	select @c=COUNT(id) from DOGOVORS$AGREEMENT  where idm_dogovor = @idm_dogovor-- and idm_empl = @idm_user-- and DOGOVORS$AGREEMENT.del=0;

	 

	if (@c=0) begin	

		insert into #Temp ([idm_empl], [idm_dogovor], idm_reason,text_reason, date_reason,del)
		 select  p.idm_buh, @idm_dogovor , 4,'', getdate(), 0
		 From [PARTNER] p where  @idm_owner = p.id and p.idm_buh is not null
		 union all
		  select D.idm_empl ,  @idm_dogovor, 4,'', getdate(),0
		  From (Select 2502 as idm_empl union all select 1393) D 
		   




/*

		--insert into DOGOVORS$AGREEMENT (user_in,idm_reason,text_reason,date_reason,idm_dogovor,idm_empl)
		insert into #Temp(user_in,idm_reason,text_reason,date_reason,idm_dogovor,idm_empl)
		values (@user_in,1,'СОГЛАСОВАНО АВТОМАТИЧЕСКИ', GETDATE(),@idm_dogovor,@idm_user)	
		declare @ByOwner int, @ByType int
		select @ByOwner=count(id) from DOGOVORS$AGREEMENT_AUTO_INSERT
		where  idm_owner=@idm_owner

		select @ByType=count(id) from DOGOVORS$AGREEMENT_AUTO_INSERT
		where   idm_dog_type=@idm_type 

		if(@ByOwner>0 and @ByType =0) begin --3. нет типа и есть орган (тип =0 и (орган=ОР))
			--insert into DOGOVORS$AGREEMENT (user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
			insert into #Temp(user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
			(select distinct @user_in,4, '', @idm_dogovor, dbo.f_GetEmplAgreementReplace(idm_empl)
			from DOGOVORS$AGREEMENT_AUTO_INSERT
			where dbo.f_GetEmplAgreementReplace(idm_empl) not in (select idm_empl from #Temp)
			and (idm_owner=@idm_owner) and idm_dog_type is null )
		end



		if(@ByOwner>0 and @ByType >0) begin --2. есть тип и есть орган (те где (орган =ОР и (тип=Т или тип=0)) или орган=0 и тип=Т)
			--insert into DOGOVORS$AGREEMENT (user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
			insert into #Temp(user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
			(select distinct @user_in,4, '', @idm_dogovor, dbo.f_GetEmplAgreementReplace(idm_empl)
			from DOGOVORS$AGREEMENT_AUTO_INSERT
			where dbo.f_GetEmplAgreementReplace(idm_empl) not in (select idm_empl from #Temp)
			and ( (idm_owner=@idm_owner and (idm_dog_type=@idm_type or idm_dog_type is null)) 
			or (idm_owner is null and idm_dog_type=@idm_type)))
		end

		if(@ByOwner=0 and @ByType >0) begin --1. есть тип и нет организации (те где тип =Т или (нет ОР и нет Т))
			--insert into DOGOVORS$AGREEMENT (user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
			insert into #Temp(user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
			(select distinct @user_in,4, '', @idm_dogovor, dbo.f_GetEmplAgreementReplace(idm_empl)
			from DOGOVORS$AGREEMENT_AUTO_INSERT
			where dbo.f_GetEmplAgreementReplace(idm_empl) not in (select idm_empl from #Temp)
			and (idm_owner is null and (idm_dog_type is null or idm_dog_type=@idm_type)))
		end

		if(@ByOwner=0 and @ByType =0) begin --4. нет типа и нет орган (тип =0 и орган =0) 
			--insert into DOGOVORS$AGREEMENT (user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
			insert into #Temp(user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
			(select distinct @user_in,4, '', @idm_dogovor, dbo.f_GetEmplAgreementReplace(idm_empl)
			from DOGOVORS$AGREEMENT_AUTO_INSERT
			where dbo.f_GetEmplAgreementReplace(idm_empl) not in (select idm_empl from #Temp )
			and (idm_owner is null and idm_dog_type is null))
		end

		--Добавляем юристов
		--insert into DOGOVORS$AGREEMENT (user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
		insert into #Temp(user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
			(select @user_in,4, '', @idm_dogovor, dbo.f_GetEmplAgreementReplace(idm_empl) 
			from EMPL_TO_OTDEL
			where  dbo.f_GetEmplAgreementReplace(idm_empl)  not in (select idm_empl from #Temp )
			and   [sogl]  =1  )

	  */


/*
	--Если договор на Орехову, то добавим ее к согласованию
	if(@idm_owner=751) begin
		declare @c_owner int
		select @c_owner=count(id) from #Temp where idm_dogovor = @idm_dogovor and #Temp.del=0 and idm_empl=56
		if(@c_owner=0)
			--insert into DOGOVORS$AGREEMENT (user_in,idm_reason,text_reason,idm_dogovor,idm_empl)
			insert into #Temp(user_in,idm_reason,text_reason,idm_dogovor,idm_empl) 
			values( @user_in,4, '', @idm_dogovor,56)
	  end
*/

	  if not exists( select 49 from #Temp where idm_empl = @idm_empl) begin
	  		--insert into DOGOVORS$AGREEMENT ([idm_empl], [idm_dogovor], idm_reason,text_reason, date_reason)
			insert into #Temp ([idm_empl], [idm_dogovor], idm_reason,text_reason, date_reason)
		select  @idm_empl, @idm_dogovor , 1,'СОГЛАСОВАНО АВТОМАТИЧЕСКИ', getdate()
		end
		
		
		if(@idm_empl = 1393)  begin
			delete From #Temp where idm_empl=1393
  			insert into #Temp ([idm_empl], [idm_dogovor], idm_reason,text_reason, date_reason)
			select  @idm_empl, @idm_dogovor , 1,'СОГЛАСОВАНО АВТОМАТИЧЕСКИ', getdate()
		end

		if(@idm_empl = 2233) begin
		delete From #Temp where idm_empl=1393
		end

	  insert into DOGOVORS$AGREEMENT(user_in, [idm_empl] , [idm_dogovor] , idm_reason  ,text_reason , date_reason   )

	  -- Select distinct user_in  ,  isnull(dee.idm_empl_link, [idm_empl] ), [idm_dogovor] , idm_reason ,text_reason , date_reason  
		 --From #Temp t
		 --left join  [DOGOVOR_EMPLtoEMPL] dee with (nolock)  on t.idm_empl = dee.idm_empl_parent and IsReplace = 1
			--	 where not( @idm_empl = 172 and t.idm_empl= 1393 )   

			   Select distinct user_in  ,  isnull(dee.idm_empl_link, [idm_empl] ), [idm_dogovor]
			   , case when idm_empl = @idm_empl then 4  else idm_reason end 
			   ,case when idm_empl = @idm_empl then ''  else text_reason end   
			   ,case when idm_empl = @idm_empl then null  else date_reason end  
			   --, date_reason  
		 From #Temp t

		 left join  [DOGOVOR_EMPLtoEMPL] dee with (nolock)  on t.idm_empl = dee.idm_empl_parent and IsReplace = 1
		 
		 where not( @idm_empl = 172 and t.idm_empl= 1393 ) 

	  	end

			   Select distinct user_in  ,  isnull(dee.idm_empl_link, [idm_empl] ), [idm_dogovor]
			   , case when idm_empl = @idm_empl then 4  else idm_reason end 
			   ,case when idm_empl = @idm_empl then ''  else text_reason end   
			   ,case when idm_empl = @idm_empl then null  else date_reason end  
			   --, date_reason  
		 From #Temp t

		 left join  [DOGOVOR_EMPLtoEMPL] dee with (nolock)  on t.idm_empl = dee.idm_empl_parent and IsReplace = 1
		 
		 where not( @idm_empl = 172 and t.idm_empl= 1393 ) 

	END