package kr.cfms.dashboard.mapper;

import kr.cfms.dashboard.dto.NotificationListDTO;
import kr.cfms.dashboard.dto.NotificationResultDTO;
import kr.cfms.dashboard.vo.AdNotificationVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface NotificationMapper {

    List<Long> selectNewInfoId(@Param("adNotificationVO") AdNotificationVO adNotificationVO);

    void insertNewInfo(@Param("adNotificationVO") AdNotificationVO adNotificationVO);

    Integer selectIsReadNotification(@Param("adNotificationVO") AdNotificationVO adNotificationVO);

    NotificationResultDTO selectIsReadNotificationByTypeCd(@Param("adNotificationVO") AdNotificationVO adNotificationVO);

    List<NotificationListDTO> selectInOrdNotificationList(@Param("adNotificationVO") AdNotificationVO adNotificationVO);
    List<NotificationListDTO> selectOutOrdNotificationList(@Param("adNotificationVO") AdNotificationVO adNotificationVO);
    List<NotificationListDTO> selectUnFinishedOutNotificationList(@Param("adNotificationVO") AdNotificationVO adNotificationVO);
    List<NotificationListDTO> selectJoinNotificationList(@Param("adNotificationVO") AdNotificationVO adNotificationVO);

    void updateReadYn(@Param("adNotificationVO") AdNotificationVO adNotificationVO);
}