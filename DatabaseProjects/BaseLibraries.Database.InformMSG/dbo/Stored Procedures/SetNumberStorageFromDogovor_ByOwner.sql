-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetNumberStorageFromDogovor_ByOwner]
	-- Add the parameters for the stored procedure here
	@idm_dogovor int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   declare @numberStorage int;
   declare @YearStorage int;
   declare @idm_owner int;
   declare @klass_name varchar(50)
BEGIN TRANSACTION
   select @idm_owner = idm_owner from DOGOVORS$REG where id=@idm_dogovor

   if(@idm_owner is not null) 
   begin
   set @klass_name = 'dog_numb'
		select @numberStorage = klass_value_int+1,@YearStorage=klass_value  from KLASS where klass_name=@klass_name and klass_id=@idm_owner
		
		if(@YearStorage<cast(year(getdate()) as int))
			begin
				set @YearStorage = cast(year(getdate()) as int)
				set @numberStorage = 1
			end
					
			update KLASS set klass_value_int = @numberStorage,klass_value=@YearStorage where  klass_name=@klass_name and klass_id=@idm_owner
			update [DOGOVORS$REG] set number_storage =cast(@numberStorage as varchar)+'/'+cast(@YearStorage as varchar), date_reg=getdate()
			,set_numb_automat=1 
			where id = @idm_dogovor
		COMMIT TRANSACTION
   end
END