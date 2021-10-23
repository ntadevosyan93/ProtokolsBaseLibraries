-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetNumberDISPATCH$INCOMING]
	-- Add the parameters for the stored procedure here
	@user_in varchar(50),
	@date_doc DateTime,
	@number varchar(50),
	@idm_partner int,
	@idm_partner_text varchar(50),
	@idm_self int,
	@type_dispatch int,
	@text varchar(50),
	@reg_number_blank varchar(50),
	@notes varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	declare @max_date datetime
	SELECT @max_date=max(date_in) from DISPATCH$INCOMING where del = 0 --and year(date_in)=year(getdate())

    INSERT INTO [DISPATCH$INCOMING] ( [user_in], [date_doc], [number], [idm_partner], [idm_partner_text], [idm_self]
                            , [type_dispatch], [text], [reg_number_blank], [notes]) VALUES ( @user_in, @date_doc,
    (select 
	 case when year(@max_date) != year(getdate()) then (select 1)	
		  when year(@max_date)  = year(getdate()) then
			 (select (select  max(cast(number as int)) from DISPATCH$INCOMING where del=0 and date_in=@max_date)+1)
	end),
		@idm_partner, @idm_partner_text, @idm_self, @type_dispatch, @text, @reg_number_blank, @notes)
END