--低保
select family_id, cetf_id, person_name, help_fund
  from jz_provide_info a
 where not exists (select 1
          from jz_provide_info b
         where b.organ_id = '0026102000'
           and b.manage_program_id = '00010001'
           and b.help_type in ('00010001', '00010002')
           and b.family_id = a.family_id
           and b.provide_month >= to_date('20180801', 'yyyymmdd')
           and b.provide_month <= to_date('20180831', 'yyyymmdd'))
   and a.organ_id = '0026102000'
   and a.manage_program_id = '00010001'
   and a.help_type in ('00010001','00010002')
   and a.provide_month >= to_date('20180701', 'yyyymmdd')
   and a.provide_month <= to_date('20180731', 'yyyymmdd');
--救助金额变化
select aa.family_id, aa.cetf_id, aa.person_name, aa.help_fund preFund, bb.help_fund backFund
  from (select a.family_id, sum(a.help_fund) help_fund,
               max(a.cetf_id) cetf_id, max(a.person_name) person_name
          from jz_provide_info a
         where a.organ_id = '0026102000'
           and a.manage_program_id = '00120001' and a.help_type in('00120001','00120002')
           and a.provide_month >= to_date('20180801', 'yyyymmdd')
           and a.provide_month <= to_date('20180831', 'yyyymmdd')
         group by a.family_id) aa,
       (select b.family_id, sum(b.help_fund) help_fund
          from jz_provide_info b
         where b.organ_id = '0026102000'
           and b.manage_program_id = '00120001' and b.help_type in ('00120001','00120002')
           and b.provide_month >= to_date('20180701', 'yyyymmdd')
           and b.provide_month <= to_date('20180731', 'yyyymmdd')
         group by b.family_id) bb
 where bb.help_fund < aa.help_fund and bb.family_id = aa.family_id;

--  not exists 本月新增/减少家庭--
select family_id, cetf_id, person_name
  from jz_provide_info a
 where not exists
 (select 1
          from jz_provide_info b
         where b.organ_id = '0026102000'
           --and (b.manage_program_id = '' or b.help_type = '')
           and b.family_id = a.family_id
           and b.provide_month >= to_date('20180701', 'yyyymmdd')
           and b.provide_month <= to_date('20180731', 'yyyymmdd'))
   and a.organ_id = '0026102000'
   --and (a.manage_program_id = '' or a.help_type = '')
   and a.provide_month >= to_date('20180801', 'yyyymmdd')
   and a.provide_month <= to_date('20180831', 'yyyymmdd')
   
   
   
--本月金额减少/增加家庭	--, this.help_fund thisFund, pre.help_fund preFund 
select rownum,familyID,thisFund,preFund from (
  select rownum rowno,this.family_id familyID, this.help_fund thisFund, pre.help_fund preFund from (
         select family_id,help_fund from jz_provide_info  --本月记录
         where provide_month>= to_date('20180801','yyyymmdd') and
         provide_month<= to_date('20180831','yyyymmdd') and organ_id = '0026102000'
  ) this, (
    select family_id,help_fund from jz_provide_info  --上月记录
    where provide_month>= to_date('20180701','yyyymmdd') and
         provide_month<= to_date('20180731','yyyymmdd') and organ_id = '0026102000' 
  ) pre where this.family_id = pre.family_id and this.help_fund < pre.help_fund and rownum<=5
) t where t.rowno > 0
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
--本月新增/退出家庭(本月在后，新增；本月在前，退出)
select family_id, cetf_id, person_name, help_fund
  from jz_provide_info a
 where not exists (select 1
          from jz_provide_info b
         where b.organ_id = '0026102000'
           and b.family_id = a.family_id
           and b.provide_month >= to_date('20180901', 'yyyymmdd')
           and b.provide_month <= to_date('20180930', 'yyyymmdd'))
   and a.organ_id = '0026102000'
   and a.provide_month >= to_date('20180801', 'yyyymmdd')
   and a.provide_month <= to_date('20180831', 'yyyymmdd');
--
select sum(help_fund) fund,family_id from jz_provide_info 
where provide_month >= to_date('20180801', 'yyyymmdd')
   and provide_month <= to_date('20180831', 'yyyymmdd') and organ_id = '0026102000' 
   and family_id = '999888771234567893' group by family_id




--全新
select * from (
select rownum rowno,aa.family_id, aa.cetf_id, aa.person_name, aa.help_fund thisFund, bb.help_fund preFund
  from (select a.family_id, sum(a.help_fund) help_fund,
               max(a.cetf_id) cetf_id,
               max(a.person_name) person_name
          from jz_provide_info a
         where a.organ_id = '0026102000'
           and a.manage_program_id = '00010001'
           and a.help_type = '00010001'
           and a.provide_month >= to_date('20180501', 'yyyymmdd')
           and a.provide_month <= to_date('20180530', 'yyyymmdd')
         group by a.family_id) aa,
       (select b.family_id, sum(b.help_fund) help_fund
          from jz_provide_info b
         where b.organ_id = '0026102000'
           and b.manage_program_id = '00010001'
           and b.help_type = '00010001' 
           and b.provide_month >= to_date('20180401', 'yyyymmdd')
           and b.provide_month <= to_date('20180430', 'yyyymmdd')
         group by b.family_id) bb
 where bb.help_fund < aa.help_fund and bb.family_id = aa.family_id and rownum<=5
)t where t.rowno>0
--查询数目
select count(1) num from (
select aa.family_id
  from (select a.family_id, sum(a.help_fund) help_fund,
               max(a.cetf_id) cetf_id,
               max(a.person_name) person_name
          from jz_provide_info a
         where a.organ_id = '0026102000'
           and a.manage_program_id = '00010001'
           and a.help_type = '00010001'
           and a.provide_month >= to_date('20180501', 'yyyymmdd')
           and a.provide_month <= to_date('20180530', 'yyyymmdd')
         group by a.family_id) aa,
       (select b.family_id, sum(b.help_fund) help_fund
          from jz_provide_info b
         where b.organ_id = '0026102000'
           and b.manage_program_id = '00010001'
           and b.help_type = '00010001' 
           and b.provide_month >= to_date('20180401', 'yyyymmdd')
           and b.provide_month <= to_date('20180430', 'yyyymmdd')
         group by b.family_id) bb
 where bb.help_fund > aa.help_fund and bb.family_id = aa.family_id
)

--调试
select count(1) num
  from (select aa.family_id
          from (select a.family_id,
                       sum(a.help_fund) help_fund,
                       max(a.cetf_id) cetf_id,
                       max(a.person_name) person_name
                  from jz_provide_info a
                 where a.organ_id = ?
                   and a.manage_program_id = ?
                   and a.help_type = '00010001'
                   and a.provide_month >= to_date(?, 'yyyymmdd')
                   and a.provide_month <= to_date(?, 'yyyymmdd')
                 group by a.family_id) aa,
               (select b.family_id, sum(b.help_fund) help_fund
                  from jz_provide_info b
                 where b.organ_id = ?
                   and b.manage_program_id = ?
                   and b.help_type = ?
                   and b.provide_month >= to_date(?, 'yyyymmdd')
                   and b.provide_month <= to_date(?, 'yyyymmdd')
                 group by b.family_id) bb
         where bb.help_fund > aa.help_fund
           and bb.family_id = aa.family_id)

select add_months(provide_month,1) from jz_provide_info
