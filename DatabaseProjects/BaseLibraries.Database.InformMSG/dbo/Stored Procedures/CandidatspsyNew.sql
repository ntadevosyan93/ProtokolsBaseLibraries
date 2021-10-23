
CREATE PROCEDURE [dbo].[CandidatspsyNew] 
	-- Add the parameters for the stored procedure here
	@Newid INT OUTPUT,
	@user_name varchar(50),
	@fam varchar(max),
	@name varchar(max), 
	@otch varchar(max), 
	@idm_doljn int, 
	@idm_otdel int,
	@datetest datetime,
	@timetest datetime,
	@res int
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 set @user_name=ltrim(rtrim(@user_name))
	declare @idm_user int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)
	insert into [KAD$EMPLOYEE_CANDIDATS]
	(user_in,fam,name,otch,idm_doljn,idm_otdel)
     VALUES    (@user_name,@fam,@name,@otch,@idm_doljn,@idm_otdel) set @Newid = SCOPE_IDENTITY()
	 
	 declare @dt datetime = @datetest + convert(datetime,@timetest,108)
    -- Insert statements for procedure here
	insert into [KAD$PSY_TEST] (idm_empl,date_test,res,module,user_in) values
	 (@Newid,@dt,@res,'cand',@user_name) 
	
END