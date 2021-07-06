package kr.cfms.dashboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	@RequestMapping({"", "dashboard/main"})
	public String dashboard(HttpServletRequest request, HttpServletResponse response) {
		
		boolean checkSessionTF = authService.checkSession(request, response);
		
		if (checkSessionTF) {
			UserInfo userInfo = SessionUserInfoUtil.getUserInfo(request.getSession());
        	String statusCd = userService.getUserStatusCode(userInfo.getMid());

        	if(statusCd.contains("R") || statusCd.equals("CCC") ) {
        		return "redirect:/login/stay";
        	}

			if ("SL".equals(userInfo.getMemberTypeCode())) {
				return "dashboard/dashboardSL";
			}
			return "dashboard/dashboard";
		}
		
		return "redirect:/login/login-form";	
    }

	@RequestMapping("dashboard/notice-detail")
	public String noticeDetail(@RequestParam("id") long id, HttpSession session, Model model) throws Exception {
		NoticeSearchDTO paramNoticeDTO = new NoticeSearchDTO();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		
		model.addAttribute("usertype",userInfo.getMemberTypeCode());
		
		paramNoticeDTO.setId(id);
		
		NoticeDTO resultNoticeDTO = noticeService.selectNotice(paramNoticeDTO);
		
		model.addAttribute("notice", resultNoticeDTO);
		
		return "dashboard/noticeDetail";
	}

	@RequestMapping("dashboard/new")
	public String dashboardBefore(){
        return "dashboard/dashboardSL";
    }
	
	@RequestMapping("terms")
	public String terms(){
        return "dashboard/terms";
    }
	
	@RequestMapping("privacy")
	public String privacy(){
        return "dashboard/privacy";
    }
}
