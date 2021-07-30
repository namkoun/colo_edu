package kr.cfms.dashboard.service;

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

    public List<Long> selectNewInfoId(AdNotificationVO adNotificationVO) {
        return notificationMapper.selectNewInfoId(adNotificationVO);
    }

    public void insertNewInfo(AdNotificationVO adNotificationVO) {
        notificationMapper.insertNewInfo(adNotificationVO);
    }

    public Integer selectIsReadNotification(AdNotificationVO adNotificationVO) {
        return notificationMapper.selectIsReadNotification(adNotificationVO);
    }
}
