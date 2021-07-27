package kr.cfms.dashboard.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AlarmMapper {
    Integer insertInApplyAlarm();
    Integer insertOutSpecialAlarm();
    Integer insertOutBtoBAlarm();
    Integer insertJoinAlarm();
}
