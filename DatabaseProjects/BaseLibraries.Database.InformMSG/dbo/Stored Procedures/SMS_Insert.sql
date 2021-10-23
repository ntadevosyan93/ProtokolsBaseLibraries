-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SMS_Insert]
  @phone varchar(50),
  @text varchar(1024),
  @module varchar(50),
  @priority int = 0,
  @date_sending datetime = NULL,
  @expired_minutes int = 1440,
  @pushOnly int = 0,
  @smsOnly int = 0,
  @external_guid varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	set @phone = Ltrim(Rtrim(@phone))
	set @text = Ltrim(Rtrim(@text))
	set @module = Ltrim(Rtrim(@module))

	if( @smsOnly>0 and @pushOnly > 0) begin select 'err-sms-push-conflict' as status return end
	if (not LEN(@phone)=11) begin  select 'err-phone-len' as status return end
	if (not SUBSTRING(@phone,1,1) = '7') begin  


			if (not SUBSTRING(@phone,2,1) = '9')begin

				select 'err-phone-format' as status 
				return 
	
			end else begin

				set @phone =  '7'+SUBSTRING(@phone,2,11) 
			 

			end
	
	
	end
	if (LEN(@text)=0) begin  select 'err-text-len' as status return end
	if (LEN(@module)=0) begin  select 'err-text-module' as status return end

	if (@date_sending is null)  begin set @date_sending = getdate() end
	declare @date_expired datetime
	set @date_expired = DATEADD(MINUTE, @expired_minutes, @date_sending)

	if not exists(select * from SMS_MAIN where (external_guid = @external_guid and  (not @external_guid is null and LEN(external_guid)>0)) and module = @module) begin

		insert into SMS_MAIN(phone_to, text, module, date_sending, date_expired, priority, smsOnly, pushOnly, external_guid, status)
		VALUES (@phone, @text, @module, @date_sending, @date_expired, @priority, @smsOnly, @pushOnly, @external_guid, 0)

		select 'ok' as status return

	end else begin
		
		select 'err-sms-exist' as status return 

	end
END