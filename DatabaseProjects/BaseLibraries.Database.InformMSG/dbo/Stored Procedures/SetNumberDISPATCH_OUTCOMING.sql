-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetNumberDISPATCH$OUTCOMING]
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
	@notes varchar(50),
	@idm_partner_doc_number varchar(50),
	@idm_partner_doc_date datetime,
	@resolution varchar(50),
	@idm_empl int,
	@idm_empl_date_accept DateTime,
	@date_deadline DateTime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @max_date datetime
	SELECT @max_date=max(date_in) from [DISPATCH$OUTCOMING] where del = 0 -- and year(date_in)=year(getdate())

    INSERT INTO [DISPATCH$OUTCOMING] ([user_in], [number], [date_doc], [idm_partner], [idm_partner_text], [idm_partner_doc_number]
						, [idm_partner_doc_date], [text], [resolution], [idm_empl], [idm_empl_date_accept], [date_deadline], [notes]) 
	VALUES ( @user_in, 
			(select 
				case when year(@max_date) != year(getdate()) then (select 1)	
				when year(@max_date) = year(getdate()) then (select (select  max(cast(number as int)) from [DISPATCH$OUTCOMING] 
				where  del=0 and date_in=@max_date)+1)
				end), 
			@date_doc, @idm_partner, @idm_partner_text, @idm_partner_doc_number, @idm_partner_doc_date, @text,
			@resolution, @idm_empl, @idm_empl_date_accept, @date_deadline, @notes)
END