package kr.cfms.dashboard.mapper;

import kr.cfms.dashboard.vo.AlarmVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AlarmMapper {

    List<AlarmVO> selectAlarmAll();

    Integer insertInApplyAlarm();
    Integer insertOutSpecialAlarm();
    Integer insertOutBtoBAlarm();
    Integer insertJoinAlarm();
}
