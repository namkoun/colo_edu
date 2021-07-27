select
    (select ifnull(sum(oi.count_info_invc),0)
     from cwt_out_ord_mst as om
              left join(select ioi.mst_id
                             ,sum(ifnull(oiic.info_invc_count,1)) as count_info_invc
                        from cwt_out_info as ioi
                                 left join (select
                                                bb.info_id
                                                 ,count(bb.invc_no) as info_invc_count
                                            from
                                                (select DISTINCT d.info_id, e.invc_no, e.parcel_cd
                                                 from (select *
                                                       from cwt_rel_info_invc
                                                       where 1=1
                                                         and use_yn ='Y'
                                                         and rel_stats ='CN') d
                                                          left join (select *
                                                                     from cwt_out_invc
                                                                     where 1=1
                                                                       and use_yn ='Y'
                                                                       and invc_no is not NULL
                                                                       and invc_no !='') e on e.id = d.invc_id
                                                ) bb
                                            group by bb.info_id) as oiic on oiic.info_id = ioi.id
                        where ioi.use_yn ='Y'
                        group by ioi.mst_id) as oi on oi.mst_id = om.id
     where 1=1
       and om.use_yn ='Y'
       and om.out_stats is not null
       and om.out_stats != ''
 and om.cust_id = a.cust_id
 and a.to_dt >= om.out_ord_dt
 and om.out_ord_dt >= a.from_dt) as '총 출고 신청 건수',
 (select ifnull(sum(oi.count_info_invc),0)
from cwt_out_ord_mst as om
    left join(select ioi.mst_id
        ,sum(ifnull(oiic.info_invc_count,1)) as count_info_invc
    from cwt_out_info as ioi
    left join (select
    bb.info_id
        ,count(bb.invc_no) as info_invc_count
    from
    (select DISTINCT d.info_id, e.invc_no, e.parcel_cd
    from (select *
    from cwt_rel_info_invc
    where 1=1
    and use_yn ='Y'
    and rel_stats ='CN') d
    left join (select *
    from cwt_out_invc
    where 1=1
    and use_yn ='Y'
    and invc_no is not NULL
    and invc_no !='') e on e.id = d.invc_id
    ) bb
    group by bb.info_id) as oiic on oiic.info_id = ioi.id
    where ioi.use_yn ='Y'
    group by ioi.mst_id) as oi on oi.mst_id = om.id
where 1=1
  and om.use_yn ='Y'
  and om.out_stats in ('OS01', 'OS02') -- 출고 예정을 01, 02로 가정
  and om.cust_id = a.cust_id
  and a.to_dt >= om.out_ord_dt
  and om.out_ord_dt >= a.from_dt) as '출고 예정',

from
(select
(select
center_id
from cwt_rel_center_user
where use_yn ='Y' and
user_id =(select id
from cwt_user
where mid = 'test_sl@colo.kr')  -- 사용자 아이디
) as cust_id
-- 기간: 1달
    ,'2021-06-09' as from_dt
    ,'2021-07-09' as to_dt
) as a;