

CREATE view [dbo].[View$history_req] as
select [id], [id_OLD], [date_in], [user_in], [status], [idm_doljn], [idm_departments], [idm_chief], [cause_type], [cause_idm_empl], [cause_text], [estimated_start_date], [description_of_work], [terms], [terms_temporarily_dstart], [terms_temporarily_dstop], [schedule], [schedule_description], [age_start], [age_stop], [gender], [education], [education_description], [experience], [more_requirements], [wages], [wages_salary], [wages_bonus], [idm_hr_manager], [date_end], [guid], [del], [drug], [func], [tariffRate], [user_cur], [date_cur], [date_issue]
From (
select [id], [id_OLD], [date_in], [user_in], [status], [idm_doljn], [idm_departments], [idm_chief], [cause_type], [cause_idm_empl], [cause_text], [estimated_start_date], [description_of_work], [terms], [terms_temporarily_dstart], [terms_temporarily_dstop], [schedule], [schedule_description], [age_start], [age_stop], [gender], [education], [education_description], [experience], [more_requirements], [wages], [wages_salary], [wages_bonus], [idm_hr_manager], [date_end], [guid], [del], [drug], [func], [tariffRate], [user_cur], [date_cur], [date_issue]
From HRM$REQ_HISTORY
union  
select 0 [id],[id] [id_OLD], [date_in], [user_in], [status], [idm_doljn], [idm_departments], [idm_chief], [cause_type], [cause_idm_empl], [cause_text], [estimated_start_date], [description_of_work], [terms], [terms_temporarily_dstart], [terms_temporarily_dstop], [schedule], [schedule_description], [age_start], [age_stop], [gender], [education], [education_description], [experience], [more_requirements], [wages], [wages_salary], [wages_bonus], [idm_hr_manager], [date_end], [guid], [del], [drug], [func], [tariffRate], [user_cur], [date_cur], [date_issue]
From HRM$REQ ) D