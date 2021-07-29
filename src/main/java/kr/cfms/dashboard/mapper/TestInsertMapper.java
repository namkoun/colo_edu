package kr.cfms.dashboard.mapper;

import kr.cfms.dashboard.vo.InOrdVO;
import kr.cfms.dashboard.vo.JoinVO;
import kr.cfms.dashboard.vo.OutOrdVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TestInsertMapper {
    Integer insertInOrd(@Param("inOrdVO") InOrdVO inOrdVO);
    Integer insertOutOrd(@Param("outOrdVO") OutOrdVO outOrdVO);
    Integer insertUser(@Param("joinVO") JoinVO joinVO);
}
