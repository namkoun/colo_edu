package kr.cfms.dashboard.service;

import kr.cfms.dashboard.dto.*;
import kr.cfms.dashboard.mapper.DashboardADMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
@RequiredArgsConstructor
public class DashboardADService {

	private final DashboardADMapper dashboardADMapper;

	public List<TodayInOutDTO> selectTodayInOut() {
		return dashboardADMapper.selectTodayInOut();
	}

	public List<CenterIdNameDTO> selectSLCenterNameAll() {
		return dashboardADMapper.selectSLCenterNameAll();
	}
	public List<CenterIdNameDTO> selectWHCenterNameAll() {
		return dashboardADMapper.selectWHCenterNameAll();
	}
	public List<CenterIdNameDTO> selectWHCenterNameBySLCenterId(long id) {
		return dashboardADMapper.selectWHCenterNameBySLCenterId(id);
	}
	public List<CenterIdNameDTO> selectSLCenterNameByWHCenterId(long id) {
		return dashboardADMapper.selectSLCenterNameByWHCenterId(id);
	}

	public List<InOutResultDTO> selectInOutStatus(InOutSearchDTO inOutSearchDTO) {
		return dashboardADMapper.selectInOutStatus(inOutSearchDTO);
	}
	public List<InOutResultDTO> selectInOutStatusBySL(InOutSearchDTO inOutSearchDTO) {
		return dashboardADMapper.selectInOutStatusBySL(inOutSearchDTO);
	}
	public List<InOutResultDTO> selectInOutStatusByWH(InOutSearchDTO inOutSearchDTO) {
		return dashboardADMapper.selectInOutStatusByWH(inOutSearchDTO);
	}
	public List<InOutResultDTO> selectInOutStatusByWHAndSL(InOutSearchDTO inOutSearchDTO) {
		return dashboardADMapper.selectInOutStatusByWHAndSL(inOutSearchDTO);
	}

	public List<StockLackResultDTO> selectStockLackAll() {
		return dashboardADMapper.selectStockLackAll();
	}
	public List<StockLackResultDTO> selectStockLackBySL(InOutSearchDTO inOutSearchDTO) {
		return dashboardADMapper.selectStockLackBySL(inOutSearchDTO);
	}
	public List<StockLackResultDTO> selectStockLackByWH(InOutSearchDTO inOutSearchDTO) {
		return dashboardADMapper.selectStockLackByWH(inOutSearchDTO);
	}
	public List<StockLackResultDTO> selectStockLackByWHAndSL(InOutSearchDTO inOutSearchDTO) {
		return dashboardADMapper.selectStockLackByWHAndSL(inOutSearchDTO);
	}

}

