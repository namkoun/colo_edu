package kr.cfms.dashboard.controller.ajax;

import java.util.List;

import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.cfms.common.vo.session.UserInfo;
import kr.cfms.dashboard.dto.NoticeDTO;
import kr.cfms.dashboard.dto.NoticeSearchDTO;
import kr.cfms.dashboard.service.DashboardService;
import kr.cfms.dashboard.service.NoticeService;
import kr.cfms.dashboard.vo.DashboardResultDTO;
import kr.cfms.dashboard.vo.DashboardSearchDTO;
import kr.cfms.dashboard.vo.NoticeVO;
import kr.cfms.vo.response.MessageVo;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("ajax/dashboard")
@RequiredArgsConstructor
public class DashboardAjaxController {

	private final NoticeService noticeService;
	private final DashboardService dashboardService;

	@GetMapping("get/list")
	public ResponseEntity<List<NoticeDTO>> getNoticeList(@ModelAttribute NoticeSearchDTO noticeSearchDTO) {
		List<NoticeDTO> noticeListDTO = noticeService.selectNoticeList(noticeSearchDTO);
		return ResponseEntity.ok(noticeListDTO);
	}

	//대쉬보드 출고현황 호출
	@GetMapping("get/searchDashboardOut")
	public ResponseEntity<List<DashboardResultDTO>> searchDashboardOut(HttpSession session,
															@ModelAttribute DashboardSearchDTO dashboardSearchDTO){

		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		dashboardSearchDTO.setMid(userInfo.getMid());
		List<DashboardResultDTO> dashboardOutList;
		dashboardOutList = dashboardService.selectDashboardOut(dashboardSearchDTO);
		return ResponseEntity.ok(dashboardOutList);
	}

	//대쉬보드 입고현황 호출
	@GetMapping("get/searchDashboardIn")
	public ResponseEntity<List<DashboardResultDTO>> searchDashboardIn(HttpSession session,
															@ModelAttribute DashboardSearchDTO dashboardSearchDTO){

		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		dashboardSearchDTO.setMid(userInfo.getMid());
		List<DashboardResultDTO> dashboardInList;
		dashboardInList = dashboardService.selectDashboardIn(dashboardSearchDTO);
		return ResponseEntity.ok(dashboardInList);
	}

	//대쉬보드 보관량현황 호출
	@GetMapping("get/searchDashboardStoreWeight")
	public ResponseEntity<List<DashboardResultDTO>> searchDashboardStoreWeight(HttpSession session,
															@ModelAttribute DashboardSearchDTO dashboardSearchDTO){

		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		dashboardSearchDTO.setMid(userInfo.getMid());

		List<DashboardResultDTO> dashboardStoreWeightList;
		dashboardStoreWeightList = dashboardService.selectDashboardStoreWeight(dashboardSearchDTO);
		return ResponseEntity.ok(dashboardStoreWeightList);
	}

	//대쉬보드 출고순위 현황 호출
	@GetMapping("get/searchDashboardGoodsRank")
	public ResponseEntity<List<DashboardResultDTO>> searchDashboardGoodsRank(HttpSession session,
															@ModelAttribute DashboardSearchDTO dashboardSearchDTO){

		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		dashboardSearchDTO.setMid(userInfo.getMid());
		List<DashboardResultDTO> dashboardGoodsRankList;
		dashboardGoodsRankList = dashboardService.selectDashboardGoodsRank(dashboardSearchDTO);
		return ResponseEntity.ok(dashboardGoodsRankList);
	}

	//대쉬보드 출고순위 상품별 차트 데이터 호출
	@GetMapping("get/searchDashboardGoodsRankRange")
	public ResponseEntity<List<DashboardResultDTO>> searchDashboardGoodsRankRange(@ModelAttribute DashboardSearchDTO dashboardSearchDTO){

		List<DashboardResultDTO> dashboardGoodsRankRangeList;
		dashboardGoodsRankRangeList = dashboardService.selectDashboardGoodsRankRange(dashboardSearchDTO);
		return ResponseEntity.ok(dashboardGoodsRankRangeList);
	}

	//대쉬보드 재고부족현황 호출
	@GetMapping("get/searchDashboardStockLack")
	public ResponseEntity<List<DashboardResultDTO>> searchDashboardStockLack(HttpSession session,
															@ModelAttribute DashboardSearchDTO dashboardSearchDTO){

		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		dashboardSearchDTO.setMid(userInfo.getMid());

		List<DashboardResultDTO> dashboardStockLackList;
		dashboardStockLackList = dashboardService.selectDashboardStockLack(dashboardSearchDTO);
		return ResponseEntity.ok(dashboardStockLackList);
	}


	/**
	 * 공지사항
	 */
	@GetMapping("get/preNextDoc")
	public List<NoticeDTO> preNextDoc(@RequestParam("id") long id) {
		List<NoticeDTO> preNextDocResult;
		preNextDocResult = noticeService.preNextDoc(id);
		return preNextDocResult;
	}

	//공지사항 등록
	@PostMapping("add/insertNotice")
	public ResponseEntity<MessageVo> insertNotice(HttpSession session, @RequestBody NoticeVO noticeVO) {

		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		noticeVO.setRegMid(userInfo.getMid());

		noticeService.insertNotice(noticeVO);

		return ResponseEntity.ok(new MessageVo("공지사항 등록 완료"));
	}

	//공지사항 수정
	@PostMapping("add/updateNotice")
	public ResponseEntity<MessageVo> updateNotice(HttpSession session, @RequestBody NoticeVO noticeVO) {

		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		noticeVO.setRegMid(userInfo.getMid());

		noticeService.updateNotice(noticeVO);

		return ResponseEntity.ok(new MessageVo("공지사항 수정 완료"));
	}

	//공지사항 삭제
	@PostMapping("add/deleteNotice")
	public ResponseEntity<MessageVo> deleteNotice(HttpSession session, @RequestBody NoticeVO noticeVO) {

		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		noticeVO.setRegMid(userInfo.getMid());

		noticeService.deleteNotice(noticeVO);

		return ResponseEntity.ok(new MessageVo("공지사항 삭제 완료"));
	}
}
