select * from dic_jz_manage_type where manage_program_id in ('00010050','00010070','00010020')
select * from jz_app where manage_program_id = '00010020' and organ_id = '0026102000' 
and cetf_id = '150105198505022640'
--特殊救济
--person_name,cetf_id,family_id
--南宫,150105198505022640, 261022015000465080
--继续申请"重残无业"业务
--咚咚咚,210105198506023940, 261022015000465158
--重残无业
--kkk,630105198506021599, 261022016000465940
select person_id,family_id,person_name,cetf_id,organ_id,file_no,status 
from jz_basic_person 
where organ_id = '0026102000'  and cetf_id = '150105198505022640'
select * from jz_basic_person where cetf_id = '150105198505022640'
select * from jz_app where family_id = '100162004000076747'
and cetf_id = '310110198605285158'

--
select * from dic_jz_applications 
where application_name like '%练习%'
select * from sysm_jz_user_group
delete from jz_app where person_name in ('jjjj','tmt','ffff')
