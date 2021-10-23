-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[InsertRM$OS_By_RM$OS$BILLING]
	-- Add the parameters for the stored procedure here
	@inv_num varchar(50),
	@user_in varchar(50),
	@serial_num varchar(50),
	@text varchar(2000),
	@idm_partner int,
	@idm_type int,
	@idm_doc_inv int,
	--@doc_date_purchase datetime,
	--@doc_num_purchase varchar(50),
	@idm_otdel int,
	@idm_head_org int,
	@idm_billing int,
	@status int = null,
	@idm_depart_offices int = null,
	@idm_mol int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @os int;

DECLARE @type_purchase int
declare @doc_date_purchase datetime
declare @doc_num_purchase varchar(50)
 set @os =0
SELECT @os=count([id])
FROM [RM$OS] with (nolock) 
WHERE inv_num = @inv_num AND del =0 

if(@os <=0) BEGIN
  SELECT @type_purchase=idm_type, @doc_date_purchase = invoice_date, @doc_num_purchase=invoice_number  
  FROM RM$OS$BILLING_INVOICE with (nolock) WHERE id =@idm_doc_inv 
  
  if(@type_purchase =1 or @type_purchase=4) BEGIN
  INSERT INTO [RM$OS] ([user_in], [serial_num], [inv_num], [text], [idm_partner], [idm_type], [doc_date_purchase], [doc_num_purchase], [idm_otdel], [idm_head_org],idm_billing
  ,status,idm_depart_offices, idm_responsible)
  VALUES (@user_in,
          @serial_num,
          @inv_num,
          @text,
          @idm_partner,
          @idm_type,
          @doc_date_purchase,
          @doc_num_purchase,
          @idm_otdel,
          @idm_head_org,
          @idm_billing,@status,@idm_depart_offices, @idm_mol)
  SELECT 1 END ELSE if(@type_purchase =2) BEGIN
  INSERT INTO [RM$OS] ([user_in], [serial_num], [inv_num], [text], [idm_partner], [idm_type], receip_date, receip_number, [idm_otdel], [idm_head_org],idm_billing
  ,status,idm_depart_offices, idm_responsible)
  VALUES (@user_in,
          @serial_num,
          @inv_num,
          @text,
          @idm_partner,
          @idm_type,
          @doc_date_purchase,
          @doc_num_purchase,
          @idm_otdel,
          @idm_head_org,
          @idm_billing,@status,@idm_depart_offices, @idm_mol)
  SELECT 1 END ELSE if(@type_purchase = 3) BEGIN
  INSERT INTO [RM$OS] ([user_in], [serial_num], [inv_num], [text], [idm_partner], [idm_type], cash_date, cash_number, [idm_otdel], [idm_head_org],idm_billing
  ,status,idm_depart_offices, idm_responsible)
  VALUES (@user_in,
          @serial_num,
          @inv_num,
          @text,
          @idm_partner,
          @idm_type,
          @doc_date_purchase,
          @doc_num_purchase,
          @idm_otdel,
          @idm_head_org,
          @idm_billing,@status,@idm_depart_offices, @idm_mol)
  SELECT 1 END ELSE
  SELECT 0
end
else
select 0

END