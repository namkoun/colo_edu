package kr.cfms.dashboard.mapper;

import kr.cfms.dashboard.dto.InOrdNotificationDTO;
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
    Integer insertNotificationInfo(@Param("notificationInfoVO") NotificationInfoVO notificationInfoVO);

    /**
     * 업체명, 신청일시, 신청종류
     *
     */
    InOrdNotificationDTO selectInOrdMstById(@Param("inMstId") long inMstId);

    /**
     * 셀러 입/출고 신청 테스트용
     */
    Long insertInOrd(@Param("inOrdVO") InOrdVO inOrdVO);
    Integer insertOutOrd(@Param("outOrdVO") OutOrdVO outOrdVO);
    Integer insertUser(@Param("joinVO") JoinVO joinVO);
}
