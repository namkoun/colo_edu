package kr.cfms.dashboard.mapper;

import kr.cfms.dashboard.dto.DashboardADResultDTO;
import kr.cfms.dashboard.dto.DashboardADSearchDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DashboardADMapper {

	List<DashboardADResultDTO> selectTodayInOut();
	
	List<DashboardADResultDTO> selectSLCenterNameAll();
	List<DashboardADResultDTO> selectWHCenterNameAll(@Param("dashboardSearchDTO")DashboardADSearchDTO dashboardADSearchDTO);
	List<DashboardADResultDTO> selectWHCenterNameBySLCenterName(@Param("dashboardSearchDTO") DashboardADSearchDTO dashboardADSearchDTO);
	List<DashboardADResultDTO> selectSLCenterNameByWHCenterName(@Param("dashboardSearchDTO") DashboardADSearchDTO dashboardADSearchDTO);

}
