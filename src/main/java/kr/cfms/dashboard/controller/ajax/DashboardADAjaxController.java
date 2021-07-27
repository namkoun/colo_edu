package kr.cfms.dashboard.controller.ajax;

import kr.cfms.dashboard.dto.*;
import kr.cfms.dashboard.service.AlarmService;
import kr.cfms.dashboard.service.DashboardADService;
import kr.cfms.vo.response.MessageVo;
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
	private final AlarmService alarmService;

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

	/**
	 * 재고부족
	 */
	@GetMapping("get/searchStockLackAll")
	public ResponseEntity<List<StockLackResultDTO>> searchStockLackAll() {
		List<StockLackResultDTO> stockLackAll = dashboardADService.selectStockLackAll();
		return ResponseEntity.ok(stockLackAll);
	}

	@GetMapping("get/searchStockLackBySL")
	public ResponseEntity<List<StockLackResultDTO>> searchStockLackBySL(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		List<StockLackResultDTO> stockLackBySL = dashboardADService.selectStockLackBySL(inOutSearchDTO);
		return ResponseEntity.ok(stockLackBySL);
	}

	@GetMapping("get/searchStockLackByWH")
	public ResponseEntity<List<StockLackResultDTO>> searchStockLackByWH(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		List<StockLackResultDTO> stockLackByWH = dashboardADService.selectStockLackByWH(inOutSearchDTO);
		return ResponseEntity.ok(stockLackByWH);
	}

	@GetMapping("get/searchStockLackByWHAndSL")
	public ResponseEntity<List<StockLackResultDTO>> searchStockLackByWHAndSL(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		List<StockLackResultDTO> stockLackByWHAndSL = dashboardADService.selectStockLackByWHAndSL(inOutSearchDTO);
		return ResponseEntity.ok(stockLackByWHAndSL);
	}

	/**
	 * 테스트용
	 */
	//입고신청 등록
	@PostMapping("add/insertInApplyAlarm")
	public ResponseEntity<MessageVo> insertInApplyAlarm() {

		alarmService.insertInApplyAlarm();

		return ResponseEntity.ok(new MessageVo("알림 등록"));
	}
	//특수출고 등록
	@PostMapping("add/insertOutSpecialAlarm")
	public ResponseEntity<MessageVo> insertOutSpecialAlarm() {

		alarmService.insertOutSpecialAlarm();

		return ResponseEntity.ok(new MessageVo("알림 등록"));
	}
	//B2B출고 등록
	@PostMapping("add/insertOutBtoBAlarm")
	public ResponseEntity<MessageVo> insertOutBtoBAlarm() {

		alarmService.insertOutBtoBAlarm();

		return ResponseEntity.ok(new MessageVo("알림 등록"));
	}
	//회원가입 등록
	@PostMapping("add/insertJoinAlarm")
	public ResponseEntity<MessageVo> insertJoinAlarm() {

		alarmService.insertJoinAlarm();

		return ResponseEntity.ok(new MessageVo("알림 등록"));
	}
}
