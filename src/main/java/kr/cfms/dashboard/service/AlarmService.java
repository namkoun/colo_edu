package kr.cfms.dashboard.service;

import kr.cfms.dashboard.mapper.AlarmMapper;
import kr.cfms.dashboard.vo.AlarmVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class AlarmService {

    private final AlarmMapper alarmMapper;

    public void insertInApplyAlarm() {
        alarmMapper.insertInApplyAlarm();
    }
    public void insertOutSpecialAlarm() {
        alarmMapper.insertOutSpecialAlarm();
    }
    public void insertOutBtoBAlarm() {
        alarmMapper.insertOutBtoBAlarm();
    }
    public void insertJoinAlarm() {
        alarmMapper.insertJoinAlarm();
    }

    public List<AlarmVO> selectAlarmAll() {
        return alarmMapper.selectAlarmAll();
    }
}
