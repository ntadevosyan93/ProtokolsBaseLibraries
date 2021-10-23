-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.FilterSMS_MAIN
@filter varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if(@filter !=null or (@filter !=' ' and @filter !=''))
	begin
		select top(1000) *, (case [status] when 1 then 'Ошибка отправки' 
					when 2 then 'Отправлено'
					when 3 then 'Доставлено'
					when 0 then 'Не отправлено'
					else cast([status] as varchar(150))
					end) as _status
		 from SMS_MAIN with (nolock) where 
		/*(phone_to  like '%'+@filter+'%' 
       or convert(varchar(10),date_in,104) = @filter
       or module  like '%'+@filter+'%'  
       or convert(varchar(10),date_sending,104) = @filter
       or  convert(varchar(10),date_sended,104) = @filter    
       or spam_guid  like '%'+@filter+'%') */
	   phone_to  = @filter
	   order by id desc 
	end
	else
		select top(50)  *, (case [status] when 1 then 'Ошибка отправки' 
					when 2 then 'Отправлено'
					when 3 then 'Доставлено'
					when 0 then 'Не отправлено'
					else ' '
					end) as _status
		 from SMS_MAIN with (nolock) order by id desc 
END