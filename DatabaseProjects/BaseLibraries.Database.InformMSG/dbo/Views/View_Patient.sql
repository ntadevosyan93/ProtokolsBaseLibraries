Create View View$Patient 
as 
select [id], [idm_1c], [fio], [date_b], [gender], [age], [pasp_ser], [pasp_num], [pasp_date], [pasp_issued], [addr_registr], [addr_residential], [phone], [idm_1c_verstamp], [fam], [name], [otch], [is_vip], [guid], [email], [base_patient], [date_in_], [comment], [total_money], [is_non_grata], [first_visit], [last_visit]
From iClinic.dbo.Patient with (nolock)