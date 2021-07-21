package kr.cfms.dashboard.mapper;

import kr.cfms.dashboard.dto.CenterIdNameDTO;
import kr.cfms.dashboard.dto.InOutResultDTO;
import kr.cfms.dashboard.dto.InOutSearchDTO;
import kr.cfms.dashboard.dto.TodayInOutDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DashboardADMapper {

	List<TodayInOutDTO> selectTodayInOut();
	
	List<CenterIdNameDTO> selectSLCenterNameAll();
	List<CenterIdNameDTO> selectWHCenterNameAll();
	List<CenterIdNameDTO> selectWHCenterNameBySLCenterId(@Param("id") long id);
	List<CenterIdNameDTO> selectSLCenterNameByWHCenterId(@Param("id") long id);

	List<InOutResultDTO> selectInOutStatus(@Param("inOutSearchDTO") InOutSearchDTO inOutSearchDTO);
}
