package kr.cfms.dashboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.cfms.dashboard.dto.InOrdNotificationDTO;
import kr.cfms.dashboard.service.TestInsertService;
import kr.cfms.dashboard.vo.InOrdVO;
import kr.cfms.dashboard.vo.JoinVO;
import kr.cfms.dashboard.vo.NotificationInfoVO;
import kr.cfms.dashboard.vo.OutOrdVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.cfms.common.util.session.SessionUserInfoUtil;
import kr.cfms.common.vo.session.UserInfo;
import kr.cfms.dashboard.dto.NoticeDTO;
import kr.cfms.dashboard.dto.NoticeSearchDTO;
import kr.cfms.dashboard.service.NoticeService;
import kr.cfms.user.service.AuthService;
import kr.cfms.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class DashboardController {

	private final NoticeService noticeService;
	private final UserService userService;
	private final AuthService authService;
	private final TestInsertService testInsertService;

	//	메인페이지
	@RequestMapping({"", "dashboard/main"})
	public String dashboard(HttpServletRequest request, HttpServletResponse response) {

		boolean checkSessionTF = authService.checkSession(request, response);  // 1. 세션 있는지 없는지 체크

		// 1-1. 세션 있으면
		if (checkSessionTF) {
			UserInfo userInfo = SessionUserInfoUtil.getUserInfo(request.getSession());  // 사용자정보
			String statusCd = userService.getUserStatusCode(userInfo.getMid());  // cwt_user테이블에 member_status_code값

			if (statusCd.contains("R") || statusCd.equals("CCC")) {
				return "redirect:/login/stay";
			}

			if ("SL".equals(userInfo.getMemberTypeCode())) {
				return "dashboard/dashboardSL";
			}
			return "dashboard/dashboard";
		}

		// 1-2. 세션 없으면 로그인페이지로 리다이렉트
		return "redirect:/login/login-form";
	}

	//  공지사항 - 단건조회
	@RequestMapping("dashboard/notice-detail")
	public String noticeDetail(@RequestParam("id") long id, HttpSession session, Model model) throws Exception {
		NoticeSearchDTO paramNoticeDTO = new NoticeSearchDTO();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");

		model.addAttribute("usertype", userInfo.getMemberTypeCode());

		paramNoticeDTO.setId(id);

		NoticeDTO resultNoticeDTO = noticeService.selectNotice(paramNoticeDTO);

		model.addAttribute("notice", resultNoticeDTO);

		return "dashboard/noticeDetail";
	}

	//  셀러 대쉬보드
	@RequestMapping("dashboard/new")
	public String dashboardBefore() {
		return "dashboard/dashboardSL";
	}

	//  이용약관
	@RequestMapping("terms")
	public String terms() {
		return "dashboard/terms";
	}

	//  개인정보 처리방침
	@RequestMapping("privacy")
	public String privacy() {
		return "dashboard/privacy";
	}

	/**
	 * test input
	 */
	@PostMapping("insertInOrd")
	public String insertInOrd(HttpSession session, @ModelAttribute InOrdVO inOrdVO, @ModelAttribute NotificationInfoVO notificationInfoVO) {

		//insert in_ord_mst
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		inOrdVO.setCustId(userInfo.getCenterId());
		Long inMstId = testInsertService.insertInOrd(inOrdVO);

		//select 업체명, 창고명, 입고예정날짜, 입고타입
		InOrdNotificationDTO inOrdNotificationDTO = testInsertService.selectInOrdMstById(inMstId);

		//insert notification_info
		String typeCd = notificationInfoVO.makeTypeCd(inOrdNotificationDTO.getInOrdType());
		String content = notificationInfoVO.makeContent(inOrdNotificationDTO.getCustCenterNm()
														, inOrdNotificationDTO.getWhCenterNm()
														, inOrdNotificationDTO.getInOrdType()
														, inOrdNotificationDTO.getInOrdDt());
		notificationInfoVO.setInMstId(inMstId);
		notificationInfoVO.setTypeCd(typeCd);
		notificationInfoVO.setContent(content);
		testInsertService.insertNotificationInfo(notificationInfoVO);

		return "redirect:/";
	}

	@PostMapping("insertOutOrd")
	public String insertOutOrd(HttpSession session, @ModelAttribute OutOrdVO outOrdVO) {

		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		outOrdVO.setCustId(userInfo.getCenterId());

		testInsertService.insertOutOrd(outOrdVO);

		return "redirect:/";
	}

    @PostMapping("insertUser")
    public String insertUser(@ModelAttribute JoinVO joinVO) {

        testInsertService.insertUser(joinVO);

        return "redirect:/";
    }


}
