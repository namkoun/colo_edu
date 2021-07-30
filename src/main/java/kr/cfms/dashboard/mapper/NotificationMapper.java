package kr.cfms.dashboard.mapper;

import kr.cfms.dashboard.dto.NotificationListDTO;
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

    List<NotificationListDTO> selectNotificationList(@Param("adNotificationVO") AdNotificationVO adNotificationVO);
}
