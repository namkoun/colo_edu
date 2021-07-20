package kr.cfms.dashboard.controller.ajax;

import kr.cfms.dashboard.dto.DashboardADResultDTO;
import kr.cfms.dashboard.dto.DashboardADSearchDTO;
import kr.cfms.dashboard.service.DashboardADService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("ajax/dashboard")
@RequiredArgsConstructor
public class DashboardADAjaxController {

	private final DashboardADService dashboardADService;

	@GetMapping("get/searchTodayInOut")
	public ResponseEntity<List<DashboardADResultDTO>> searchTodayInOut() {
		List<DashboardADResultDTO> todayInOut = dashboardADService.selectTodayInOut();
		return ResponseEntity.ok(todayInOut);
	}

	@GetMapping("get/searchSLCenterList")
	public ResponseEntity<List<DashboardADResultDTO>> searchSLCenterList() {
		List<DashboardADResultDTO> slCenterList = dashboardADService.selectSLCenterNameAll();
		return ResponseEntity.ok(slCenterList);
	}

	@GetMapping("get/searchWHCenterList")
	public ResponseEntity<List<DashboardADResultDTO>> searchWHCenterList() {
		List<DashboardADResultDTO> whCenterList = dashboardADService.selectWHCenterNameAll();
		return ResponseEntity.ok(whCenterList);
	}

	@GetMapping("get/searchWHCenterListBySLCenterName")
	public ResponseEntity<List<DashboardADResultDTO>> searchWHCenterListBySLCenterName(@ModelAttribute DashboardADSearchDTO dashboardADSearchDTO) {
		List<DashboardADResultDTO> whCenterList = dashboardADService.selectWHCenterNameBySLCenterName(dashboardADSearchDTO);
		return ResponseEntity.ok(whCenterList);
	}

	@GetMapping("get/searchSLCenterListByWHCenterName")
	public ResponseEntity<List<DashboardADResultDTO>> searchSLCenterListByWHCenterName(@ModelAttribute DashboardADSearchDTO dashboardADSearchDTO) {
		List<DashboardADResultDTO> slCenterList = dashboardADService.selectSLCenterNameByWHCenterName(dashboardADSearchDTO);
		return ResponseEntity.ok(slCenterList);
	}
}
