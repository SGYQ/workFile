select * from dic_organ

select * from dic_jz_manage_type where manage_program_id = '00010070'
select * from dic_jz_obj_type where help_obj_type_name like '%粮油%'
select *
  from dic_jz_type
 where help_type in
       ('00010001', '00010002', '00010004', '00010003', '00010005',
       '00010006','00010007','00010008','00010020','');
select * from dic_jz_manage_type where manage_program_id = '00010001'
select * from dic_jz_type where help_type like '0001%'








select * from dic_jz_type where help_type 
in('00010001','00010003','00010004','00010007','00010020','00010030','00010080');

--help_type：00010001、00010002、00010003、00010004、00010005、
--00010006、00010007、00010008、00010020
--help_type_name：城镇最低生活保障金、农村最低生活保障金、城乡居民门急诊起付线补助、粮油帮困、协保人员困难补助
--粮油帮困券、城乡居民基本医疗保险补助、临时补贴、定期定量救济

--支出型贫困(00120001)：00120001、00120002、00120003(不存在)
--hely_type_name: 城镇支出型贫困救助金、农村支出型贫困救助金

--特殊救济(00010020)：00010001、00010003、00010004、00010007、00010020、00010030、00010080
--hely_type_name：城镇最低生活保障金、城乡居民门急诊起付线补助、粮油帮困、城乡居民基本医疗保险补助
--定期定量救济、实物救助、长期生活临补
select * from dic_jz_type where help_type 
in('00010004','00010006','00010007','00010020','00010071','00010072',
   '00010073','00010074','00010075','00010076','00010077','00010078');
--重残无业(00010050)：00010003、00010004、00010008、00010020、00010050
--hely_type_name：城乡居民门急诊起付线补助、粮油帮困、临时补贴、定期定量救济、增发补贴

--特困人员(00010070)：00010004、00010006、00010007、00010020、00010071、00010072、
                    --00010073、00010074、00010075、00010076、00010077、00010078
--hely_type_name：粮油帮困、粮油帮困券、城乡居民基本医疗保险补助、定期定量救济、特困供养个人救助金、特困供养机构救助金
--特困供养医疗费用、特困供养丧葬费、特困供养教育费用、特困供养护理费用、特困供养床位费用、特困供养其它费用

--粮油帮困(00010004)--manage_program_id：00010001、00010020、00010040、00010050、00010070
--城乡低保、民政特殊对象救济、农村五保户、重残无业、特困人员
select distinct help_type,manage_program_id
from jz_provide_info where manage_program_id = '00010070'
select distinct manage_program_id, help_type
from jz_provide_info where help_type = '00010004'
select * from dic_jz_manage_type where 
manage_program_id in('00010001','00010020','00010050','00010070','00010040')

