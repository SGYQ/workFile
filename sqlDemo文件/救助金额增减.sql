--本月新增家庭 not exists不存在，字段not in 太慢
select family_id from (
       select distinct family_id from jz_provide_info  --本月记录
       where extract(year from provide_month)= extract(year from sysdate) and 
       extract(month from provide_month)= extract(month from sysdate)
)where family_id not in (
  select distinct family_id from jz_provide_info  --上月记录
  where extract(year from provide_month)=extract(year from sysdate-interval'1' month) and 
       extract(month from provide_month)=extract(month from sysdate-interval'1' month) 
)
--救助金额增加的家庭
  --1、本月救助金额(总)
  select family_id,sum(help_fund) thisAllFund from jz_provide_info 
  where extract(year from provide_month)= extract(year from sysdate) and 
  extract(month from provide_month)= extract(month from sysdate)
  group by family_id
  --2、上月救助金额(总)
  select family_id,sum(help_fund) preAllFund from jz_provide_info  
  where extract(year from provide_month)=extract(year from sysdate-interval'1' month) and 
  extract(month from provide_month)=extract(month from sysdate-interval'1' month) 
  group by family_id

--本月救助金额减少/增加的家庭
select cur.family_id,cur.thisAllFund,pre.preAllFund from (
   select family_id,sum(help_fund) thisAllFund from jz_provide_info
   where extract(year from provide_month)= extract(year from sysdate) and 
   extract(month from provide_month)= extract(month from sysdate) group by family_id
) cur, (
   select family_id,sum(help_fund) preAllFund from jz_provide_info 
   where extract(year from provide_month)=extract(year from sysdate-interval'1' month) and 
   extract(month from provide_month)=extract(month from sysdate-interval'1' month) group by family_id
) pre where cur.family_id = pre.family_id and cur.thisAllFund < pre.preAllFund

--本月记录
select provide_id,family_id,help_fund,provide_month from jz_provide_info
where extract(year from provide_month)=extract(year from sysdate) and 
extract(month from provide_month)=extract(month from sysdate)
--上月记录
select provide_id,family_id,help_fund,provide_month,cetf_id from jz_provide_info
where extract(year from provide_month)=extract(year from sysdate-interval'1' month) and 
extract(month from provide_month)=extract(month from sysdate-interval'1' month)
--低保
select provide_id,family_id,help_fund,provide_month,cetf_id,person_name,
       manage_program_id program, help_obj_type
from jz_provide_info where extract(year from provide_month)=2018 and 
extract(month from provide_month) = 4 and manage_program_id = '00010001'
--help_obj_type：00012000、00011000、00700001、00021000
--family_id：261022015000465308、261022015000465309、121022005000236401、261022018000466076
select * from dic_jz_obj_type where help_obj_type = '00021000'
select * from dic_jz_manage_type where manage_program_name like '%%'
select * from dic_jz_type where help_type_name like '%粮油%'
select * from jz_provide_info 

--低保、支出型贫困新增/退出,本街道，低保(00010001)、支出型贫困(00120001)
select family_id from jz_provide_info where extract(year from provide_month)= 2018 and
extract(month from provide_month)= 4 and manage_program_id= '00010001' and organ_id= '0026102000'
minus
select family_id from jz_provide_info where extract(year from provide_month)=2018 and
extract(month from provide_month)=3 and manage_program_id= '00010001' and organ_id= '0026102000'
--特殊救济(00010020)、重残无业(00010050)、特困人员(00010070) 新增/退出，本街道
select cetf_id,person_name from jz_provide_info where extract(year from provide_month)=2018 and
extract(month from provide_month)=3 and manage_program_id= '00010070' and organ_id= '0026102000'
minus 
select cetf_id,person_name from jz_provide_info where extract(year from provide_month)=2018 and
extract(month from provide_month)=2 and manage_program_id= '00010070' and organ_id= '0026102000'
--粮油帮困(00010006)新增/退出，本街道
select cetf_id,person_name from jz_provide_info where extract(year from provide_month)=2017 and
extract(month from provide_month)=4 and help_type='00010006' and organ_id='0026102000'
minus
select cetf_id,person_name from jz_provide_info where extract(year from provide_month)=2017 and
extract(month from provide_month)=3 and help_type='00010006' and organ_id='0026102000'

--本月的救助金额，单项
select help_fund from jz_provide_info where family_id = '' and 








