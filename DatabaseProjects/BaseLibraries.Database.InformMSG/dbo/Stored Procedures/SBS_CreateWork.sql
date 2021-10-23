-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SBS$CreateWork
	-- Add the parameters for the stored procedure here
	@id_algoritm int, 
	@work_text varchar(1024)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @id_work int
declare @guid varchar(50)

set @guid=NEWID()

set @id_algoritm=1

insert into SBS$WORK(guid,idm_sbs_algoritm,text) values (@guid,@id_algoritm,@work_text)
select @id_work=@@IDENTITY

declare @idm_work int, @idm_step int ,@sequence int, @step_text varchar(1000), @step_type smallint

DECLARE step_cursor CURSOR FOR 
	select id,[text],[type],[sequence],[text] from SBS$STEP where idm_algoritm=@id_algoritm

open step_cursor

FETCH NEXT FROM step_cursor 
INTO @idm_step,@step_text, @step_type, @sequence, @step_text

WHILE @@FETCH_STATUS = 0
BEGIN

insert into SBS$WORK_STEP(idm_work,idm_algoritm,idm_step,[sequence],[type],[text]) 
	values (@id_work,@id_algoritm,@idm_step,@sequence,@step_type,@step_text)

FETCH NEXT FROM step_cursor INTO @idm_step,@step_text, @step_type, @sequence, @step_text
END
CLOSE step_cursor;
DEALLOCATE step_cursor;

select @id_work
END