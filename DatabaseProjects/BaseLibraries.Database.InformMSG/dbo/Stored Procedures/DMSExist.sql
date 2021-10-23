-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DMSExist
	-- Add the parameters for the stored procedure here
	@idm_1c varchar(20),
	@email varchar(150)
AS
BEGIN
	
	declare @idDMS int
	set @idDMS = 0;
	
	select top(1) @idDMS = id from SSMP$INSURANCE where LTRIM(RTRIM(idm_1c)) =  LTRIM(RTRIM(@idm_1c))
	
	if (@idDMS>0) begin
	
	 declare @countEmail int
	 	set @countEmail = 0;
	
		select @countEmail = COUNT(id) from SSMP$INSURANCE_EMAILS where idm_insur =  @idDMS and email = @email
		
		if @countEmail>0 begin
		 
		 select 'ok';
		
		end else begin
		
		select 'errorEmail';
		
		end
	
	end else begin
	
	select 'errorDMS';
	
	end
	
END