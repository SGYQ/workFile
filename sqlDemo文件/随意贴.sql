select * from sysm_jz_powers where user_id = '0000004656'
--根据用户id查询其权限信息
select * from sysm_jz_powers where user_id = '0000004656'
--根据用户名称查询用户信息
select * from sysm_jz_user_group where user_name = 'fxfczxx'
--为用户id为XX的赋予权限id为XX的权限
insert into sysm_jz_powers values('0000004656','010010005','sjz','','2');
--系统管理, 结束本月, 增减清单
--application_id,
--000700000, 000701000, 010010005
select * from dic_jz_applications where application_name like '%结束本月%'
select * from dic_jz_applications where application_name like '%系统管理%'
--010010005,增减清单,系统管理-结束本月-增减清单,
insert into dic_jz_applications 
values('010010005','增减清单','系统管理-结束本月-增减清单','sjz',3,3,'000701000',
       1,'','0000000000','more-less','','','010010005','1','1')
select * from dic_jz_applications where application_name like '%增减清单%'
select * from dic_jz_applications where app_page = 'more-less' 

update dic_jz_applications
   set application_name = '辅助核查',discription = '系统管理-结束本月-辅助核查'
 where application_id = '010010005'
select * from dic_jz_applications where application_id = '010010005'
select * from dic_jz_applications where application_id in('010010000','000701000')
