select * from JZ_INCOMECHECK_ENTRUST_APP
select * from jz_app
--业务查询，收入核对申请表，救助申请表
SELECT a.*,
       t.RECEIVE_STATUS,
       t.OPERATOR_TIME,
       t.UNIT_IDS,
       t.INCOME_CHECK_STARTDATE,
       t.INCOME_CHECK_ENDDATE,
       t.REFUSE_REASON,
       t.HDCONTENT   
  FROM JZ_APP a, JZ_INCOMECHECK_ENTRUST_APP t
  WHERE a.ENTRUST_ID=t.ENTRUST_ID and a.app_no=t.app_no and
--待录入调查结果:s002, 准予救助:s021, 不准予救助:s022
select * from dic_jz_status where status_id = 's019'
select * from dic_jz_flows
select HDCONTENT from JZ_INCOMECHECK_ENTRUST_APP
--FLOW_ID:流程标识, STATUS_ID:状态标识
--f10001:支出型贫困申请流程, f00001:最低生活保障申请
--ENTRUST_ID:核对编号(jz_app表), 委托编号(JZ_INCOMECHECK_ENTRUST_APP) 
--JZ_INCOMECHECK_ENTRUST_APP:收入核对申请表
select *
  from (select rownum as prownum, pview.*
          from (SELECT a.*,
                       t.RECEIVE_STATUS, --核对状态
                       t.OPERATOR_TIME,  --申请核对时间、待委托确认的时间
                       t.UNIT_IDS,       --复核需对比的委办
                       t.INCOME_CHECK_STARTDATE,--可支配收入核对起始日期，YYYY-MM-DD，三个月
                       t.INCOME_CHECK_ENDDATE,	--可支配收入核对截止日期
                       t.REFUSE_REASON,         --不接受委托的理由
                       t.HDCONTENT              --核对内容：01:收入财产,02:个人自负医疗费用,03:
                  FROM JZ_APP a, JZ_INCOMECHECK_ENTRUST_APP t
                 WHERE a.ENTRUST_ID = t.ENTRUST_ID
                   and a.app_no = t.app_no
                   and a.MANAGE_PROGRAM_ID = '00010001'
                   AND a.ORGAN_ID = '0026102000'
                   AND a.flow_id = 'f00001'
                   AND a.status_id in ('s002')
                 order by a.file_no) pview
         where rownum >= 1
           and rownum <= 10)
 where prownum >= ?
 
--查询
select * from jz_app where organ_id = '0026102000' and 
manage_program_id not in('00010020', '00010001', '00120001')
--area_id, 查询街道对应的名称
select * from dic_organ where area_id = '2610211'
organ_id = '0026102000' reside_organ = '26102102' 
--**业务受理
select *
  from (select rownum as prownum, pview.*
          from (SELECT distinct p.PERSON_ID,
                                p.family_id,
                                p.file_no,
                                p.PERSON_NAME,
                                p.CETF_ID,
                                p.rpr_type,               --户籍性质
                                p.LIVE_ADDRESS,           --居住地址
                                p.RESIDE_ORGAN,           --居委
                                p.organ_ID,               --街道
                                p.create_date,            --产生日期
                                o.no,                     --
                                o.if_single_old           --是否孤老
                  FROM JZ_basic_person p, jz_person_other_info o
                 where p.person_id = o.person_id(+)
                   and (p.status = '00' or p.status is null)
                   AND p.person_name like '%ym%'
                   AND p.cetf_id = '220112197506020257') pview
         where rownum >= 1
           and rownum <= 10)
 where prownum >= ?
select * from jz_person_other_info

--**定期复审
--测试：klkl,26102110127,头桥一居委,2018-04-01
select * from jz_app where organ_id = '0026102000' and manage_program_id = '00010001'
select person_name,cetf_id,file_no,reside_organ,organ_id,review_date from jz_app
where organ_id = '0026102000' and manage_program_id = '00010001'
select * from dic_organ where organ_id = '0026102000'
select * from dic_area where area_name like '%奉%'
select * from dic_area where area_id = '26102101'
--查询居委名称, organcode,organregion
select * from community_organ where organname like '%洪东村%'
select * from community_organ where organregion = '26102101'
--**不定期变动
select person_name,cetf_id,file_no,address,reside_organ from jz_app
where organ_id = '0026102000' and manage_program_id = '00010001'
