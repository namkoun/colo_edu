package kr.cfms.dashboard.mapper;

import kr.cfms.dashboard.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DashboardADMapper {

	TodayInOutDTO selectTodayInOut();
	
	List<CenterIdNameDTO> selectSLCenterNameAll();
	List<CenterIdNameDTO> selectWHCenterNameAll();
	List<CenterIdNameDTO> selectWHCenterNameBySLCenterId(@Param("id") long id);
	List<CenterIdNameDTO> selectSLCenterNameByWHCenterId(@Param("id") long id);

	InOutResultDTO selectInOutStatus(@Param("inOutSearchDTO") InOutSearchDTO inOutSearchDTO);
	InOutResultDTO selectInOutStatusBySL(@Param("inOutSearchDTO") InOutSearchDTO inOutSearchDTO);
	InOutResultDTO selectInOutStatusByWH(@Param("inOutSearchDTO") InOutSearchDTO inOutSearchDTO);
	InOutResultDTO selectInOutStatusByWHAndSL(@Param("inOutSearchDTO") InOutSearchDTO inOutSearchDTO);

	List<StockLackResultDTO> selectStockLackAll();
	List<StockLackResultDTO> selectStockLackBySL(@Param("inOutSearchDTO") InOutSearchDTO inOutSearchDTO);
	List<StockLackResultDTO> selectStockLackByWH(@Param("inOutSearchDTO") InOutSearchDTO inOutSearchDTO);
	List<StockLackResultDTO> selectStockLackByWHAndSL(@Param("inOutSearchDTO") InOutSearchDTO inOutSearchDTO);
}
