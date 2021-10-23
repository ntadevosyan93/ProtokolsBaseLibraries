
CREATE PROCEDURE [dbo].[CreateCommentPretension]

@guid as varchar(80),
@idm_1c as char(9),
@fio as varchar(250),
@phone as varchar(50),
@email as varchar(50),
@description as varchar(max)
as 
BEGIN

set @description = 'ОТЗЫВ С САЙТА.'+ char(13)+ 'ФИО: ' + isnull(@fio,'') + char(13)+ 'Телефон: ' + isnull(@phone,'') + char(13)+ 'Email: ' + isnull(@email,'') +  char(13)+ char(13)+ 'СООБЩЕНИЕ: ' + isnull(@description,'');


 INSERT INTO [TT$Pretensions] ([user_in], [description], [status], [guid], [idm_source] ,[idm_1c], 
fio,  phone, email
 ) 
 VALUES ('VIPCG\\nobody', @description, 1, @guid, 7, @idm_1c,
 @fio, @phone, @email
 )

 end