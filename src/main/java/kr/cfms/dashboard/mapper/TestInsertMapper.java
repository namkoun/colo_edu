package kr.cfms.dashboard.mapper;

import kr.cfms.dashboard.dto.InOrdNotificationDTO;
import kr.cfms.dashboard.dto.JoinNotificationDTO;
import kr.cfms.dashboard.dto.OutOrdNotificationDTO;
import kr.cfms.dashboard.vo.InOrdVO;
import kr.cfms.dashboard.vo.JoinVO;
import kr.cfms.dashboard.vo.NotificationInfoVO;
import kr.cfms.dashboard.vo.OutOrdVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TestInsertMapper {

    /**
     * 셀러 입/출고 신청시 insert notification_info
     */
    Integer insertInOrdNotificationInfo(@Param("notificationInfoVO") NotificationInfoVO notificationInfoVO);
    Integer insertOutOrdNotificationInfo(@Param("notificationInfoVO") NotificationInfoVO notificationInfoVO);
    Integer insertJoinNotificationInfo(@Param("notificationInfoVO") NotificationInfoVO notificationInfoVO);

    /**
     * 업체명, 신청일시, 신청종류
     */
    InOrdNotificationDTO selectInOrdMstById(@Param("inMstId") long inMstId);
    OutOrdNotificationDTO selectOutOrdMstById(@Param("outMstId") long outMstId);
    JoinNotificationDTO selectUserById(@Param("userId") long userId);

    /**
     * 셀러 - 입고신청,출고신청,회원가입 테스트용
     */
    Long insertInOrd(@Param("inOrdVO") InOrdVO inOrdVO);
    Long insertOutOrd(@Param("outOrdVO") OutOrdVO outOrdVO);
    Long insertUser(@Param("joinVO") JoinVO joinVO);
}
