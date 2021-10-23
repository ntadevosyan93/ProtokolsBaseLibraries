-- =============================================
-- Author:		Гайдай Владимир
-- Create date: 08.05.2019
-- Description:	Получение ФИО сотрудника + мобильный номер по внутреннему телефону
-- =============================================
CREATE PROCEDURE GetFIOandMobilePhone_by_extNumber
	-- Add the parameters for the stored procedure here
	@phone varchar(5)
	
AS
BEGIN
declare @name varchar(100)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
set @name=''
SELECT top(1) @name=([fam]+' '+[name]+' '+[otch]+' т.моб. '+phone_mob )
  FROM [InformMSG].[dbo].[KAD$EMPLOYEE] with (nolock)
  where del=0 and actual=1 and phone_vn=@phone
	
if @phone='2777' 
	set @name='Волков Виталий Юрьевич'
if @phone='1331' 
	set @name='Селезнева Елена Эдуардовна'

if @name<>'' 
	select @name as [name]



END