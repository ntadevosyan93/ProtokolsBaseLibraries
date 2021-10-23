-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SetNumberStorageFromDogovor]
	-- Add the parameters for the stored procedure here
	@idm_dogovor int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   declare @numberStorage int;
   declare @YearStorage int;
   select @numberStorage = klass_id+1,@YearStorage=klass_value  from KLASS where klass_name='dogovor_number_storage'

   if(@YearStorage<cast(year(getdate()) as int))
    begin
		set @YearStorage = cast(year(getdate()) as int)
		set @numberStorage = 1
	end

   BEGIN TRANSACTION
		update KLASS set klass_id = @numberStorage,klass_value=@YearStorage where  klass_name='dogovor_number_storage'
		update [DOGOVORS$REG] set number_storage =cast(@numberStorage as varchar)+'/'+cast(@YearStorage as varchar), date_reg=getdate() 
			where id = @idm_dogovor
   COMMIT TRANSACTION
END