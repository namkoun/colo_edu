package kr.cfms.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.cfms.common.util.session.SessionMenuInfoUtil;
import kr.cfms.common.util.session.SessionUserInfoUtil;
import kr.cfms.common.vo.session.UserInfo;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("login")
public class LoginController {
	
	@RequestMapping("login-form")
    public String loginForm() {
    	return "user/login";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
    	
    	UserInfo userInfo = SessionUserInfoUtil.getUserInfo(session);
    	String userId = null;

    	if(userInfo != null) {
    		userId = userInfo.getMid();
    	}

    	SessionUserInfoUtil.setUserInfo(session, null);
        SessionMenuInfoUtil.setMenuInfo(session, null);
        
        log.info("########### >> logout : user=[{}] << ###########", userId);
        return "redirect:/login/login-form";
    }
}
