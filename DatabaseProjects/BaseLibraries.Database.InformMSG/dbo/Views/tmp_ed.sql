create view tmp_ed
as
Select e.* , ff.guid [guidfile], ff.file_name
    FRom [InformMSG].[dbo].[Employee_Education] e  with (nolock) 
    outer apply (select top 1 guid, file_name From [InformMSG]..FILE_STOR f where f.db_table = 'docScan2' and f.db_table_id=e.id order by date_in desc ) ff
 WHERE [del] = 0 AND  ([idm_employee] = 1933)