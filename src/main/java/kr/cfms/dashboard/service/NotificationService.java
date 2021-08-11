package kr.cfms.dashboard.service;

import kr.cfms.dashboard.dto.NotificationListDTO;
import kr.cfms.dashboard.dto.NotificationResultDTO;
import kr.cfms.dashboard.dto.UnFinishedResultDTO;
import kr.cfms.dashboard.mapper.NotificationMapper;
import kr.cfms.dashboard.vo.AdNotificationVO;
import kr.cfms.dashboard.vo.NotificationInfoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class NotificationService {

    private final NotificationMapper notificationMapper;

    /**
     * 미진행 출고건 조회
     */
    public List<UnFinishedResultDTO> selectUnFinishedOut() {
        return notificationMapper.selectUnFinishedOut();
    }

    /**
     * 오늘 만들어진 미진행 출고건 알림 있는지
     */
    public Integer selectTodayUnFinishedOutCheck() {
        return notificationMapper.selectTodayUnFinishedOutCheck();
    }

    /**
     * 미진행 출고건 알림 생성
     */
    public void insertUnFinishedOutNotificationInfo(NotificationInfoVO notificationInfoVO, List<UnFinishedResultDTO> unFinishedResult) throws ParseException {
        for (int i = 0; i < unFinishedResult.size(); i++) {
            notificationInfoVO.setCustId(unFinishedResult.get(i).getCustId());
            notificationInfoVO.setContent(notificationInfoVO.makeUnFinishedOutContent(unFinishedResult.get(i).getCenterNm(),
                                                                                      unFinishedResult.get(i).getOutOrdDt(),
                                                                                      unFinishedResult.get(i).getCountUnFinishedOut()));
            notificationInfoVO.setTypeCd(notificationInfoVO.makeUnFinishedOutTypeCd());
            notificationMapper.insertUnFinishedOutNotificationInfo(notificationInfoVO);
        }
    }

    /**
     * 새로운 알림정보 조회 -> (있으면 insert) -> 안읽은 알림 개수 count
     */
    public List<Long> selectNewInfoId(AdNotificationVO adNotificationVO) {
        return notificationMapper.selectNewInfoId(adNotificationVO);
    }
    public void insertNewInfo(AdNotificationVO adNotificationVO, List<Long> infoIdList) {
        for (int i = 0; i < infoIdList.size(); i++) {
            adNotificationVO.setInfoId(infoIdList.get(i));
            notificationMapper.insertNewInfo(adNotificationVO);
        }
    }
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