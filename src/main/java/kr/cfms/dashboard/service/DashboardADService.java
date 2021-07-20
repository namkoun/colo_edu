package kr.cfms.dashboard.service;

import kr.cfms.dashboard.dto.DashboardADResultDTO;
import kr.cfms.dashboard.dto.DashboardADSearchDTO;
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

	public List<DashboardADResultDTO> selectTodayInOut() {
		return dashboardADMapper.selectTodayInOut();
	}

	public List<DashboardADResultDTO> selectSLCenterNameAll() {
		return dashboardADMapper.selectSLCenterNameAll();
	}

	public List<DashboardADResultDTO> selectWHCenterNameAll() {
		return dashboardADMapper.selectWHCenterNameAll();
	}

	public List<DashboardADResultDTO> selectWHCenterNameBySLCenterName(DashboardADSearchDTO dashboardADSearchDTO) {
		return dashboardADMapper.selectWHCenterNameBySLCenterName(dashboardADSearchDTO);
	}

	public List<DashboardADResultDTO> selectSLCenterNameByWHCenterName(DashboardADSearchDTO dashboardADSearchDTO) {
		return dashboardADMapper.selectSLCenterNameByWHCenterName(dashboardADSearchDTO);
	}
}

