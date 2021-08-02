package kr.cfms.dashboard.service;

import kr.cfms.dashboard.dto.InOrdNotificationDTO;
import kr.cfms.dashboard.dto.OutOrdNotificationDTO;
import kr.cfms.dashboard.mapper.TestInsertMapper;
import kr.cfms.dashboard.vo.InOrdVO;
import kr.cfms.dashboard.vo.JoinVO;
import kr.cfms.dashboard.vo.NotificationInfoVO;
import kr.cfms.dashboard.vo.OutOrdVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class TestInsertService {

    private final TestInsertMapper testInsertMapper;


    public Long insertInOrd(InOrdVO inOrdVO) {
        testInsertMapper.insertInOrd(inOrdVO);
        return inOrdVO.getId();
    }
    public Long insertOutOrd(OutOrdVO outOrdVO) {
        testInsertMapper.insertOutOrd(outOrdVO);
        return outOrdVO.getId();
    }
    public Long insertUser(JoinVO joinVO) {
        testInsertMapper.insertUser(joinVO);
        return joinVO.getId();
    }

    public void insertInOrdNotificationInfo(NotificationInfoVO notificationInfoVO) {
        testInsertMapper.insertInOrdNotificationInfo(notificationInfoVO);
    }
    public void insertOutOrdNotificationInfo(NotificationInfoVO notificationInfoVO) {
        testInsertMapper.insertOutOrdNotificationInfo(notificationInfoVO);
    }
    public void insertJoinNotificationInfo(NotificationInfoVO notificationInfoVO) {
        testInsertMapper.insertJoinNotificationInfo(notificationInfoVO);
    }

    public InOrdNotificationDTO selectInOrdMstById(long inMstId) {
        return testInsertMapper.selectInOrdMstById(inMstId);
    }
    public OutOrdNotificationDTO selectOutOrdMstById(long outMstId) {
        return testInsertMapper.selectOutOrdMstById(outMstId);
    }
//    public JoinNotificationDTO selectUserById(long userId) {
//        return testInsertMapper.selectUserById(userId);
//    }
}
