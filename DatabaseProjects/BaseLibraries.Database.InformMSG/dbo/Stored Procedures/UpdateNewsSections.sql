-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.UpdateNewsSections
	-- Add the parameters for the stored procedure here
 @idm_news int,
 @SelectList varchar(1024),
 @UnSelectList varchar(1024),
 @user_in varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @NewSelect varchar(max)
	--1. Отменим удаленные
	update NEWS_SECTIONS set del=0,user_cur=@user_in,date_cur=getdate() 
	where idm_news=@idm_news and idm_section in(select data from dbo.Split(@SelectList,',')) and del=1	
	--2. Удалим существующие
	update NEWS_SECTIONS set del=1,user_cur=@user_in,date_cur=getdate() 
	where idm_news=@idm_news and idm_section in(select data from dbo.Split(@UnSelectList,',')) and del=0

	--Получим строки,которые нужно вставить
	select  @NewSelect= cast ((select data + ',' AS 'data()'
	from  dbo.Split(@SelectList,',') where  not data in ( select idm_section from NEWS_SECTIONS where idm_news=@idm_news and del=0)
	FOR XML PATH(''))  AS VARCHAR(MAX)) 

	--3. добавим новые
	INSERT INTO [dbo].[NEWS_SECTIONS] (user_in,[idm_news],[idm_section]) 
	 select @user_in,@idm_news, klass_id from KLASS where klass_name='news_section'
	  and klass_id in(select data from dbo.Split(@NewSelect,','))
END