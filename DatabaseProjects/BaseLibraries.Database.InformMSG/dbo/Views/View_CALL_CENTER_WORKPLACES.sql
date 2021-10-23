CREATE VIEW [dbo].[View$CALL_CENTER_WORKPLACES]
AS

select [id], [date_in], [description], [guid], [phone_list], [disableLog], [hide], [idm_depart]
From [iClinic]..CALL_CENTER_WORKPLACES