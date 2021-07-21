package kr.cfms.dashboard.controller.ajax;

import kr.cfms.dashboard.dto.CenterIdNameDTO;
import kr.cfms.dashboard.dto.InOutResultDTO;
import kr.cfms.dashboard.dto.InOutSearchDTO;
import kr.cfms.dashboard.dto.TodayInOutDTO;
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

	/**
	 * 오늘의 출/입고 현황
	 */
	@GetMapping("get/searchTodayInOut")
	public ResponseEntity<List<TodayInOutDTO>> searchTodayInOut() {
		List<TodayInOutDTO> todayInOut = dashboardADService.selectTodayInOut();
		return ResponseEntity.ok(todayInOut);
	}

	/**
	 * 업체명 출력
	 */
	@GetMapping("get/searchSLCenterList")
	public ResponseEntity<List<CenterIdNameDTO>> searchSLCenterList() {
		List<CenterIdNameDTO> slCenterList = dashboardADService.selectSLCenterNameAll();
		return ResponseEntity.ok(slCenterList);
	}

	@GetMapping("get/searchWHCenterList")
	public ResponseEntity<List<CenterIdNameDTO>> searchWHCenterList() {
		List<CenterIdNameDTO> whCenterList = dashboardADService.selectWHCenterNameAll();
		return ResponseEntity.ok(whCenterList);
	}

	@GetMapping("get/searchWHCenterListBySLCenterId")
	public ResponseEntity<List<CenterIdNameDTO>> searchWHCenterListBySLCenterId(long id) {
		List<CenterIdNameDTO> whCenterList = dashboardADService.selectWHCenterNameBySLCenterId(id);
		return ResponseEntity.ok(whCenterList);
	}

	@GetMapping("get/searchSLCenterListByWHCenterId")
	public ResponseEntity<List<CenterIdNameDTO>> searchSLCenterListByWHCenterId(long id) {
		List<CenterIdNameDTO> slCenterList = dashboardADService.selectSLCenterNameByWHCenterId(id);
		return ResponseEntity.ok(slCenterList);
	}

	/**
	 * 날짜, 업체별 출/입고 현황
	 */
	@GetMapping("get/searchInOutStatus")
	public ResponseEntity<List<InOutResultDTO>> searchInOutStatus(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		List<InOutResultDTO> inOutStatus = dashboardADService.selectInOutStatus(inOutSearchDTO);
		return ResponseEntity.ok(inOutStatus);
	}

	@GetMapping("get/searchInOutStatusBySL")
	public ResponseEntity<List<InOutResultDTO>> searchInOutStatusBySL(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		List<InOutResultDTO> inOutStatusBySL = dashboardADService.selectInOutStatusBySL(inOutSearchDTO);
		return ResponseEntity.ok(inOutStatusBySL);
	}

	@GetMapping("get/searchInOutStatusByWH")
	public ResponseEntity<List<InOutResultDTO>> searchInOutStatusByWH(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		List<InOutResultDTO> inOutStatusByWH = dashboardADService.selectInOutStatusByWH(inOutSearchDTO);
		return ResponseEntity.ok(inOutStatusByWH);
	}

	@GetMapping("get/searchInOutStatusByWHAndSL")
	public ResponseEntity<List<InOutResultDTO>> searchInOutStatusByWHAndSL(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		List<InOutResultDTO> inOutStatusByWHAndSL = dashboardADService.selectInOutStatusByWHAndSL(inOutSearchDTO);
		return ResponseEntity.ok(inOutStatusByWHAndSL);
	}
}
