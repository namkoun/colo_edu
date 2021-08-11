package kr.cfms.dashboard.controller.ajax;

import kr.cfms.common.vo.session.UserInfo;
import kr.cfms.dashboard.dto.*;
import kr.cfms.dashboard.service.DashboardADService;
import kr.cfms.dashboard.service.NotificationService;
import kr.cfms.dashboard.vo.AdNotificationVO;
import kr.cfms.dashboard.vo.NotificationInfoVO;
import kr.cfms.vo.response.MessageVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("ajax/dashboard")
@RequiredArgsConstructor
public class DashboardADAjaxController {

	private final DashboardADService dashboardADService;
	private final NotificationService notificationService;

	/**
	 * 오늘의 출/입고 현황
	 * @return 입고신청건수, 입고완료건수, 출고신청건수, 출고완료건수
	 */
	@GetMapping("get/searchTodayInOut")
	public ResponseEntity<TodayInOutDTO> searchTodayInOut() {
		TodayInOutDTO todayInOut = dashboardADService.selectTodayInOut();
		return ResponseEntity.ok(todayInOut);
	}

	/**
	 * 셀러 업체명 전체 조회
	 * @return 셀러업체명 리스트
	 */
	@GetMapping("get/searchSLCenterList")
	public ResponseEntity<List<CenterIdNameDTO>> searchSLCenterList() {
		List<CenterIdNameDTO> slCenterList = dashboardADService.selectSLCenterNameAll();
		return ResponseEntity.ok(slCenterList);
	}

	/**
	 * 창고명 전체 조회
	 * @return 창고명 리스트
	 */
	@GetMapping("get/searchWHCenterList")
	public ResponseEntity<List<CenterIdNameDTO>> searchWHCenterList() {
		List<CenterIdNameDTO> whCenterList = dashboardADService.selectWHCenterNameAll();
		return ResponseEntity.ok(whCenterList);
	}

	/**
	 * custId로 연결된 창고명 전체 조회
	 * @param id
	 * @return 창고명 리스트
	 */
	@GetMapping("get/searchWHCenterListBySLCenterId")
	public ResponseEntity<List<CenterIdNameDTO>> searchWHCenterListBySLCenterId(long id) {
		List<CenterIdNameDTO> whCenterList = dashboardADService.selectWHCenterNameBySLCenterId(id);
		return ResponseEntity.ok(whCenterList);
	}

	/**
	 * whId로 연결된 셀러 업체명 전체 조회
	 * @param id
	 * @return 셀러 업체명 리스트
	 */
	@GetMapping("get/searchSLCenterListByWHCenterId")
	public ResponseEntity<List<CenterIdNameDTO>> searchSLCenterListByWHCenterId(long id) {
		List<CenterIdNameDTO> slCenterList = dashboardADService.selectSLCenterNameByWHCenterId(id);
		return ResponseEntity.ok(slCenterList);
	}

	/**
	 * 날짜별 전체 입/출고 현황
	 * @param inOutSearchDTO (fromDate, toDate)
	 * @return 출고예정/작업중/완료/취소 건수, 입고예정/작업중/완료/취소 건수
	 */
	@GetMapping("get/searchInOutStatus")
	public ResponseEntity<InOutResultDTO> searchInOutStatus(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		InOutResultDTO inOutStatus = dashboardADService.selectInOutStatus(inOutSearchDTO);
		return ResponseEntity.ok(inOutStatus);
	}

	/**
	 * 날짜, 셀러별 전체 입/출고 현황
	 * @param inOutSearchDTO (fromDate, toDate, custId)
	 * @return 출고예정/작업중/완료/취소 건수, 입고예정/작업중/완료/취소 건수
	 */
	@GetMapping("get/searchInOutStatusBySL")
	public ResponseEntity<InOutResultDTO> searchInOutStatusBySL(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		InOutResultDTO inOutStatusBySL = dashboardADService.selectInOutStatusBySL(inOutSearchDTO);
		return ResponseEntity.ok(inOutStatusBySL);
	}

	/**
	 * 날짜, 창고별 전체 입/출고 현황
	 * @param inOutSearchDTO (fromDate, toDate, whId)
	 * @return 출고예정/작업중/완료/취소 건수, 입고예정/작업중/완료/취소 건수
	 */
	@GetMapping("get/searchInOutStatusByWH")
	public ResponseEntity<InOutResultDTO> searchInOutStatusByWH(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		InOutResultDTO inOutStatusByWH = dashboardADService.selectInOutStatusByWH(inOutSearchDTO);
		return ResponseEntity.ok(inOutStatusByWH);
	}

	/**
	 * 날짜, 창고, 셀러별 입/출고 현황
	 * @param inOutSearchDTO (fromDate, toDate, whId, custId)
	 * @return 출고예정/작업중/완료/취소 건수, 입고예정/작업중/완료/취소 건수
	 */
	@GetMapping("get/searchInOutStatusByWHAndSL")
	public ResponseEntity<InOutResultDTO> searchInOutStatusByWHAndSL(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		InOutResultDTO inOutStatusByWHAndSL = dashboardADService.selectInOutStatusByWHAndSL(inOutSearchDTO);
		return ResponseEntity.ok(inOutStatusByWHAndSL);
	}

	/**
	 * 전체 재고 부족 / 결품 현황
	 * @return 상품명, 현재고량, 결품수량(0), 입고중인 상품수, 최종입고일, 안전재고 수량 기준
	 */
	@GetMapping("get/searchStockLackAll")
	public ResponseEntity<List<StockLackResultDTO>> searchStockLackAll() {
		List<StockLackResultDTO> stockLackAll = dashboardADService.selectStockLackAll();
		return ResponseEntity.ok(stockLackAll);
	}

	/**
	 * 셀러별 재고 부족 / 결품 현황
	 * @param inOutSearchDTO (custId)
	 * @return 상품명, 현재고량, 결품수량(0), 입고중인 상품수, 최종입고일, 안전재고 수량 기준
	 */
	@GetMapping("get/searchStockLackBySL")
	public ResponseEntity<List<StockLackResultDTO>> searchStockLackBySL(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		List<StockLackResultDTO> stockLackBySL = dashboardADService.selectStockLackBySL(inOutSearchDTO);
		return ResponseEntity.ok(stockLackBySL);
	}

	/**
	 * 창고별 재고 부족 / 결품 현황
	 * @param inOutSearchDTO (whId)
	 * @return 상품명, 현재고량, 결품수량(0), 입고중인 상품수, 최종입고일, 안전재고 수량 기준
	 */
	@GetMapping("get/searchStockLackByWH")
	public ResponseEntity<List<StockLackResultDTO>> searchStockLackByWH(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		List<StockLackResultDTO> stockLackByWH = dashboardADService.selectStockLackByWH(inOutSearchDTO);
		return ResponseEntity.ok(stockLackByWH);
	}

	/**
	 * 창고, 셀러별 재고 부족 / 결품 현황
	 * @param inOutSearchDTO (whId, custId)
	 * @return 상품명, 현재고량, 결품수량(0), 입고중인 상품수, 최종입고일, 안전재고 수량 기준
	 */
	@GetMapping("get/searchStockLackByWHAndSL")
	public ResponseEntity<List<StockLackResultDTO>> searchStockLackByWHAndSL(@ModelAttribute InOutSearchDTO inOutSearchDTO) {
		List<StockLackResultDTO> stockLackByWHAndSL = dashboardADService.selectStockLackByWHAndSL(inOutSearchDTO);
		return ResponseEntity.ok(stockLackByWHAndSL);
	}

	/**
	 * 미진행 출고건 조회
	 */
	@PostMapping("add/searchUnFinishedOut")
	public ResponseEntity<MessageVo> searchUnFinishedOut(@ModelAttribute NotificationInfoVO notificationInfoVO) throws ParseException {
		// 당일 미진행 출고 알림 만든게 있는지 체크
		Integer countToday = notificationService.selectTodayUnFinishedOutCheck();

		// 당일 미진행 출고 알림 없으면 insert
		if (countToday == 0) {
			// 미진행 출고건 조회
			List<UnFinishedResultDTO> unFinishedResult = notificationService.selectUnFinishedOut();
			notificationService.insertUnFinishedOutNotificationInfo(notificationInfoVO, unFinishedResult);
		}

		return ResponseEntity.ok(new MessageVo("ok"));
	}

	/**
	 * 새로운 알림정보 조회
	 * 있으면 알림정보 추가
	 * 안 읽은 알림 개수 (종에 New표시)
	 */
	@PostMapping("add/insertNewInfo")
	public ResponseEntity<MessageVo> insertNewInfo(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		//새로운 알림정보 조회
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		List<Long> infoIdList = notificationService.selectNewInfoId(adNotificationVO);

		//있으면 알림정보 추가
		if (infoIdList.size() > 0) notificationService.insertNewInfo(adNotificationVO, infoIdList);

		//안 읽은 알림 개수 (종에 New표시)
		String countNotRead = "" + notificationService.selectIsReadNotification(adNotificationVO);

		return ResponseEntity.ok(new MessageVo(countNotRead));
	}

	/**
	 * 알림 종류별 안 읽은 알림 있는지 체크
	 */
	@GetMapping("get/searchIsReadNotificationByTypeCd")
	public ResponseEntity<NotificationResultDTO> searchIsReadNotificationByTypeCd(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		NotificationResultDTO notificationResultDTO = notificationService.selectIsReadNotificationByTypeCd(adNotificationVO);

		return ResponseEntity.ok(notificationResultDTO);
	}

	/**
	 * 알림 종류 버튼 클릭시
	 * select 알림리스트 (알림날짜 기준)
	 */
	// 입고신청 알림
	@GetMapping("get/searchInOrdNotification")
	public ResponseEntity<List<NotificationListDTO>> searchInOrdNotification(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		List<NotificationListDTO> InOrdNotificationList = notificationService.selectInOrdNotificationList(adNotificationVO);

		return ResponseEntity.ok(InOrdNotificationList);
	}


	// 출고신청 알림
	@GetMapping("get/searchOutOrdNotification")
	public ResponseEntity<List<NotificationListDTO>> searchOutOrdNotification(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		List<NotificationListDTO> OutOrdNotificationList = notificationService.selectOutOrdNotificationList(adNotificationVO);

		return ResponseEntity.ok(OutOrdNotificationList);
	}

	// 미진행 출고건 알림
	@GetMapping("get/searchUnFinishedOutNotification")
	public ResponseEntity<List<NotificationListDTO>> searchUnFinishedOutNotification(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		List<NotificationListDTO> unFinishedOutNotificationList = notificationService.selectUnFinishedOutNotificationList(adNotificationVO);

		return ResponseEntity.ok(unFinishedOutNotificationList);
	}

	// 회원가입 알림
	@GetMapping("get/searchJoinNotification")
	public ResponseEntity<List<NotificationListDTO>> searchJoinNotification(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		List<NotificationListDTO> joinNotificationList = notificationService.selectJoinNotificationList(adNotificationVO);

		return ResponseEntity.ok(joinNotificationList);
	}

	/**
	 * 읽음 처리
	 */
	@PostMapping("add/readNotification")
	public ResponseEntity<MessageVo> readNotification(@RequestBody AdNotificationVO adNotificationVO) {
		notificationService.updateReadYn(adNotificationVO);

		return ResponseEntity.ok(new MessageVo("finish"));
	}
}