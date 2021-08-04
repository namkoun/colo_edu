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
	 * 미진행 출고건 조회
	 */
	@PostMapping("add/searchUnFinishedOut")
	public ResponseEntity<MessageVo> selectUnFinishedOut(@ModelAttribute NotificationInfoVO notificationInfoVO) {
		// 미진행 출고건 조회
		List<UnFinishedResultDTO> unFinishedResult = notificationService.selectUnFinishedOut();

		// 당일 미진행 출고 알림 만든게 있는지 체크
		Integer countToday = notificationService.selectTodayUnFinishedOutCheck();

		// 당일 미진행 출고 알림 없으면 insert
		if (countToday > 0) {
			for (int i = 0; i < unFinishedResult.size(); i++) {
				notificationInfoVO.setCustId(unFinishedResult.get(i).getCustId());
				notificationInfoVO.setContent(notificationInfoVO.unFinishedOutContent(unFinishedResult.get(i).getCenterNm(),
																				 	  unFinishedResult.get(i).getOutOrdDt(),
																					  unFinishedResult.get(i).getCountUnFinishedOut()));
				notificationInfoVO.setTypeCd(notificationInfoVO.unFinishedOutTypeCd());
				notificationService.insertUnFinishedOutNotificationInfo(notificationInfoVO);
			}

		}

		return ResponseEntity.ok(new MessageVo("ok"));
	}

	/**
	 * 새로운 알림정보 조회 (있으면, 새 알림 Insert)
	 */
	@PostMapping("add/insertNewInfo")
	public ResponseEntity<Integer> insertNewInfo(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		Integer isExist = 0;

		//새로운 알림 정보 가져와서
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		List<Long> infoIdList = notificationService.selectNewInfoId(adNotificationVO);

		if (infoIdList.size() != 0) {
			isExist = 1;
			//값 넣어줌
			for (int i = 0; i < infoIdList.size(); i++) {
				adNotificationVO.setInfoId(infoIdList.get(i));
				notificationService.insertNewInfo(adNotificationVO);
			}
		}
		return ResponseEntity.ok(isExist);  // 새로운 알림 있으면 1, 없으면 0
	}

	/**
	 * 안 읽은 알림 있는지 체크
	 */
	@GetMapping("get/searchIsReadNotification")
	public ResponseEntity<Integer> searchIsReadNotification(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		Integer isRead = 1;

		// ad_mid로 검색
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		Integer countNotRead = notificationService.selectIsReadNotification(adNotificationVO);

		// 있으면 isRead=0
		if (countNotRead > 0) isRead = 0;

		return ResponseEntity.ok(isRead);
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
	 * 1. select 알림리스트 (알림날짜 기준)
	 * 2. update read_yn ='Y'
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
	@GetMapping("get/readOutOrdNotification")
	public ResponseEntity<List<NotificationListDTO>> readOutOrdNotification(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		List<NotificationListDTO> OutOrdNotificationList = notificationService.selectOutOrdNotificationList(adNotificationVO);

		return ResponseEntity.ok(OutOrdNotificationList);
	}

	// 미진행 출고건 알림
	@GetMapping("get/readUnFinishedOutNotification")
	public ResponseEntity<List<NotificationListDTO>> readUnFinishedOutNotification(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		List<NotificationListDTO> unFinishedOutNotificationList = notificationService.selectUnFinishedOutNotificationList(adNotificationVO);

		return ResponseEntity.ok(unFinishedOutNotificationList);
	}

	// 회원가입 알림
	@GetMapping("get/readJoinNotification")
	public ResponseEntity<List<NotificationListDTO>> selectJoinNotificationList(HttpSession session, @ModelAttribute AdNotificationVO adNotificationVO) {
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		adNotificationVO.setAdMid(userInfo.getMid());
		List<NotificationListDTO> joinNotificationList = notificationService.selectJoinNotificationList(adNotificationVO);

		return ResponseEntity.ok(joinNotificationList);
	}

	/**
	 * 읽음 처리
	 */
	@PostMapping("add/readInOrdNotification")
	public ResponseEntity<MessageVo> readInOrdNotification(@RequestBody AdNotificationVO adNotificationVO) {
		notificationService.updateReadYn(adNotificationVO);
		log.info("readInOrdNotification.id={}", adNotificationVO.getId());

		return ResponseEntity.ok(new MessageVo("finish"));
	}
}