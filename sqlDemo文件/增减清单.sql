--page: 0,1,2,3... ,pageSize: 
--传参：(page+1)*pageSize, page*pageSize
select * from (         --分页，11到20
select rownum rowno,provide_id,family_id, person_id,person_name p_name,cetf_id,manage_program_id mp_id,provide_month,help_fund fund,status
from jz_provide_info where rownum<=20 ) t
where t.rowno > 10
--返回系统当前时间，dual 是 Oracle中的一个实际存在的表，任何用户均可读取，常用在没有目标表的select语句块中。
select sysdate from dual
--获取本年份记录
--取月
select extract(month from provide_month) thisMonth from jz_provide_info --正常执行
select to_char(provide_month,'mm')  pre_month from jz_provide_info  --正常执行

--增加测试数据 to_date('2014-02-14','yyyy-mm-dd')
select * from jz_provide_info
insert into 
jz_provide_info(provide_id,family_id,cetf_id,person_name,help_fund,organ_id,provide_month)
values('20180816140732','1230004000012','310109199506010034','测试125',1911,'0026102000',to_date('2018-07-15','yyyy-mm-dd') )

--本月新增/减少家庭，换to_date()
select rownum,family_id from(
  select rownum rowno,family_id from (
    select family_id  from jz_provide_info where provide_month>= to_date('20180801','yyyymmdd') and
    provide_month<= to_date('20180831','yyyymmdd') and organ_id = '0026102000'
    minus 
    select family_id  from jz_provide_info where provide_month>= to_date('20180701','yyyymmdd') and
    provide_month<= to_date('20180731','yyyymmdd') and organ_id = '0026102000'
  ) where rownum<=5 
) t where t.rowno >0
--本月金额减少/增加家庭	--, this.help_fund thisFund, pre.help_fund preFund 
select this.family_id familyID, this.help_fund thisFund, pre.help_fund preFund from (
       select family_id,help_fund from jz_provide_info  --本月记录
       where extract(year from provide_month)= extract(year from sysdate) and 
       extract(month from provide_month)= extract(month from sysdate)
) this, (
  select family_id,help_fund from jz_provide_info  --上月记录
  where extract(year from provide_month)=extract(year from sysdate-interval'1' month) and 
       extract(month from provide_month)=extract(month from sysdate-interval'1' month) 
) pre where this.family_id = pre.family_id and this.help_fund < pre.help_fund
--查询数目(金额)
select count(1) from (
  select this.family_id familyID, this.sumFundThis thisFund, pre.sumFundPre preFund from (
       select family_id,sum(help_fund) sumFundThis from jz_provide_info  --本月记录
       where provide_month>= to_date('20180801','yyyymmdd') and
       provide_month<= to_date('20180831','yyyymmdd') and organ_id = '0026102000' group by family_id
    ) this, (
      select family_id,sum(help_fund) sumFundPre from jz_provide_info  --上月记录
      where provide_month>= to_date('20180701','yyyymmdd') and
      provide_month<= to_date('20180731','yyyymmdd') and organ_id = '0026102000' group by family_id
    ) pre where this.family_id = pre.family_id and this.sumFundThis < pre.sumFundPre
)



--  not exists 本月新增/减少家庭--
select family_id, cetf_id, person_name from jz_provide_info a
where a.organ_id = '0026102000' and (a.manage_program_id = '' or a.help_type='00010006')
and a.provide_month>= to_date('20180401','yyyymmdd') and a.provide_month<= to_date('20180430','yyyymmdd')
and not exists (
select 1 from jz_provide_info b
where b.organ_id = '0026102000' and (b.manage_program_id = '' or b.help_type='00010006')
and b.family_id=a.family_id and b.cetf_id=a.cetf_id and b.person_name=a.person_name
and b.provide_month>=to_date('20180501','yyyymmdd') and b.provide_month<=to_date('20180530','yyyymmdd')  
)
--集合相减
select family_id,cetf_id,person_name,manage_program_id,help_type from jz_provide_info 
where organ_id = '0026102000' and help_type='00010001' and
provide_month>= to_date('20180401','yyyymmdd') and provide_month<= to_date('20180430','yyyymmdd') 
minus
select family_id,cetf_id,person_name,manage_program_id,help_type from jz_provide_info
where organ_id='0026102000' and help_type = '00010001' and  
provide_month>= to_date('20180501','yyyymmdd') and provide_month<= to_date('20180530','yyyymmdd')
