



  CREATE view [dbo].[View_File_Candidat] as  
  select [id], [date_in], [user_in], [ip_in], [file_path], [file_name], [file_guid], [module], [db_name], [db_table], [db_table_id], [db_table_guid], [del], [date_del], [user_del], [ip_del], [description], [guid]  
  From [InformMSG]..file_stor  where module = 'PersonalDepart'