

 --

CREATE PROCEDURE [dbo].[CreateSmilePretension]

@guid as varchar(80)=null,
@idm_1c as char(9)=null,
@zakazNum as varchar(50)=null,
@DateFull as datetime=null,
@fio as varchar(250)=null,
@DateB  as datetime=null,
@phone as varchar(50)=null,
@email as varchar(50)=null,
@Filial1C as char(9) = null
AS
BEGIN
SET NOCOUNT ON;
declare @idm_depart as int 
declare @text_problem as varchar(max)

Select @idm_depart = id
From DEPARTMENTS d
where d.idm_1c_ = @Filial1C

Set @text_problem = 'Отзыв о негативном впечатлении от посещения клиники.'+ char(13)+ '№ заказа: ' + isnull(@zakazNum,'')+  char(13)
+'Дата обращения: ' + isnull(convert(varchar(12), @DATEFull ,104),'')  +char(13)+'ФИО: ' + isnull( @fio,'') +  char(13)+'Дата рождения: ' 
+ isnull(convert(varchar(12), @DateB ,104),'') +char(13) + ' Телефон: ' + isnull(@phone,'') +char(13)+'Email: ' +isnull( @eMail ,'') ;

 INSERT INTO [TT$Pretensions] ([user_in], date_in, [description], [status], [guid], [idm_source] ,[idm_1c], 
 zakazNum, DateFull, fio, DateB, phone, email,del, idm_empl, date_stop_plan,idm_departments
 ) 
 VALUES ('VIPCG\\nobody', getdate(), @text_problem, 5, @guid, 8, @idm_1c,
  @zakazNum, @DateFull, @fio, @DateB, @phone, @email,0,2709,dateadd(d,5, Getdate() ),@idm_depart
 )

end