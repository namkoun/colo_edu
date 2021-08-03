package kr.cfms.dashboard.service;

import kr.cfms.dashboard.dto.NotificationListDTO;
import kr.cfms.dashboard.dto.NotificationResultDTO;
import kr.cfms.dashboard.mapper.NotificationMapper;
import kr.cfms.dashboard.vo.AdNotificationVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class NotificationService {

    private final NotificationMapper notificationMapper;

    /**
     * 새로운 알림정보 조회 -> (있으면 insert)
     */
    public List<Long> selectNewInfoId(AdNotificationVO adNotificationVO) {
        return notificationMapper.selectNewInfoId(adNotificationVO);
    }
    public void insertNewInfo(AdNotificationVO adNotificationVO) {
        notificationMapper.insertNewInfo(adNotificationVO);
    }

    /**
     * 안 읽은 알림 있는지 체크
     */
    public Integer selectIsReadNotification(AdNotificationVO adNotificationVO) {
        return notificationMapper.selectIsReadNotification(adNotificationVO);
    }

    /**
     * 알림 종류별 안 읽은 알림 있는지 체크
     */
    public NotificationResultDTO selectIsReadNotificationByTypeCd(AdNotificationVO adNotificationVO) {
        return notificationMapper.selectIsReadNotificationByTypeCd(adNotificationVO);
    }


    /**
     * read notification
     */
    public List<NotificationListDTO> selectInOrdNotificationList(AdNotificationVO adNotificationVO) {
        return notificationMapper.selectInOrdNotificationList(adNotificationVO);
    }
    public List<NotificationListDTO> selectOutOrdNotificationList(AdNotificationVO adNotificationVO) {
        return notificationMapper.selectOutOrdNotificationList(adNotificationVO);
    }
    public List<NotificationListDTO> selectUnFinishedOutNotificationList(AdNotificationVO adNotificationVO) {
        return notificationMapper.selectUnFinishedOutNotificationList(adNotificationVO);
    }
    public List<NotificationListDTO> selectJoinNotificationList(AdNotificationVO adNotificationVO) {
        return notificationMapper.selectJoinNotificationList(adNotificationVO);
    }

    public void updateReadYn(AdNotificationVO adNotificationVO) {
        notificationMapper.updateReadYn(adNotificationVO);
    }
}