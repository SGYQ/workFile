select * from jz_app where manage_program_id = '00010001'
select person_id,family_id,person_name,cetf_id,member_title_id,organ_id status 
from jz_basic_person where organ_id='0026102000'
--person_name,cetf_id,family_id
--高红,310109197607296029,100062004000081486
--程文玲,310110196108155425,100092004000095244
--何苏青,310110195707150429,100012004000087690
--刘凯，330482199201253017，261022015000464973
select person_id,family_id,person_name,cetf_id,member_title_id,organ_id,status 
from jz_basic_person where family_id = '261022015000464973' 
-- 查询业务
select app_no,family_id,person_id,person_name,cetf_id,manage_program_id,status_id
from jz_app where family_id in ('261022015000464973')
--organ_id: 奉贤区民政局：0026000000，奉城镇：0026102000
--manage_program_id: 城乡低保：00010001,
--                   支出型贫困：00120001,
--                   民政特殊对象救济: 0001、0020,三项业务互斥
select * from dic_organ where organ_name like '%奉%'

--查询业务明细
select * from dic_jz_manage_type
where manage_program_name like '%特%'

