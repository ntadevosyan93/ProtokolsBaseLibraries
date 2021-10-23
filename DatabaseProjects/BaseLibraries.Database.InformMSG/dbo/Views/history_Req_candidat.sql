create view history_Req_candidat
as 
SELECT rc.id, rc.idm_candidate, rc.idm_req, rc.date_in, rc.user_in, rc.user_cur, rc.date_cur, rc.del, k_emp.klass_value [employment], k_st.klass_value [status], D.fio, D.id [idm_candidate_hist],
d2.doljn, d2.id [id_req_hist]

  FROM [InformMSG].[dbo].HRM$REQ_CANDIDATE_HISTORY rc
  left join KLASS k_emp with(nolock) on k_emp.klass_id = rc.type_employment and  k_emp.klass_name = 'type_employment'
  left join KLASS k_st  with(nolock) on k_st.klass_id = rc.[status] and  k_st.klass_name = 'status_depart'

  outer apply 
  (select top 1 id, fio from  
  
  ( select id, id_old, fio, date_cur, date_in from HRM$CANDIDATE_History  with(nolock) where id_old = rc.idm_candidate
 union 
  select 0 [id], id [id_old], fio, date_cur, date_in from HRM$CANDIDATE  with(nolock) where id =  rc.idm_candidate
  ) c where isnull(c.date_cur,c.date_in)< = isnull(rc.date_cur, rc.date_in) order by id desc) D
 
   outer apply 
  (select top 1 id, doljn from  
  
  ( select rh.id, id_old, kd.[text] doljn, rh.date_cur, rh.date_in from HRM$REQ_HISTORY rh with(nolock) join KAD$DOLJN kd  with(nolock) on  kd.id = rh.idm_doljn where rh.id_old = rc.idm_req
 union 
  select 0 [id], r.id [id_old], kd.[text] doljn, r.date_cur, r.date_in from HRM$REQ r  with(nolock) join KAD$DOLJN kd  with(nolock) on  kd.id = r.idm_doljn  where r.id =  rc.idm_req
  ) c where isnull(c.date_cur,c.date_in)< = isnull(rc.date_cur, rc.date_in) order by id desc) D2
 
 --order by  isnull(rc.date_cur,rc.date_in)