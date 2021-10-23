

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ClearNumberDogovor]
	-- Add the parameters for the stored procedure here
	@guid varchar(50),
	@comment varchar(max),
	@user_cur as varchar(50)

AS
BEGIN
	SET NOCOUNT ON;
	declare @num as varchar(10),
	@year as varchar(50),
	@idm_owner as int,
	@max_pk as int

	
select
@num = substring(number_storage, 0, CHARINDEX('/',number_storage)),
@year=  substring(number_storage, CHARINDEX('/',number_storage)+1, len(number_storage) - CHARINDEX('/',number_storage))  ,
 @idm_owner = idm_owner
 From DOGOVORS$REG
 where [guid] = @guid
 --если номер распарсился
 if (@num is not null and len(@num)>0 ) and (@year is not null and len(@year)>0 ) 
 BEGIN  
 --если номер и год числа
		if ISNUMERIC(@num)=1 and ISNUMERIC(@year)=1
		BEGIN
		--если номер == максимальному
		if exists(
				select 0
				From KLASS 
				where klass_name='dog_numb' and klass_value = cast(@year as int)
				and klass_id= @idm_owner and klass_value_int = cast(@num as int)
				)
				BEGIN
					update klass
					set klass_value_int = klass_value_int-1
					where klass_name='dog_numb' and klass_value = cast(@year as int)
					and klass_id= @idm_owner  and klass_value_int = cast(@num as int)
				END
		END
END
 --go
	update DOGOVORS$REG
	set
	 [number_storage] = null
	 ,[date_reg] = null
	 ,[set_numb_automat] = null
	 ,comment_clearNum = @comment
	 , date_clear = getdate()
	 , user_clear = @user_cur
	 where [guid] = @guid





END