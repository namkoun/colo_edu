package kr.cfms.dashboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.cfms.dashboard.vo.DashboardResultDTO;
import kr.cfms.dashboard.vo.DashboardSearchDTO;

@Mapper
@Repository
public interface DashboardMapper {
	
	public List<DashboardResultDTO> selectDashboardOut(@Param("dashboardSearchDTO") DashboardSearchDTO dashboardSearchDTO);
	public List<DashboardResultDTO> selectDashboardIn(@Param("dashboardSearchDTO") DashboardSearchDTO dashboardSearchDTO);
	public List<DashboardResultDTO> selectDashboardStoreWeight(@Param("dashboardSearchDTO") DashboardSearchDTO dashboardSearchDTO);
	public List<DashboardResultDTO> selectDashboardGoodsRank(@Param("dashboardSearchDTO") DashboardSearchDTO dashboardSearchDTO);
	public List<DashboardResultDTO> selectDashboardGoodsRankRange(@Param("dashboardSearchDTO") DashboardSearchDTO dashboardSearchDTO);
	public List<DashboardResultDTO> selectDashboardStockLack(@Param("dashboardSearchDTO") DashboardSearchDTO dashboardSearchDTO);

}
