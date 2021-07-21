package kr.cfms.dashboard.service;

import kr.cfms.dashboard.dto.CenterIdNameDTO;
import kr.cfms.dashboard.dto.InOutResultDTO;
import kr.cfms.dashboard.dto.InOutSearchDTO;
import kr.cfms.dashboard.dto.TodayInOutDTO;
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
}

