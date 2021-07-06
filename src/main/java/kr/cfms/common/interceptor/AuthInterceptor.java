package kr.cfms.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.cfms.common.util.session.SessionUserInfoUtil;
import kr.cfms.common.vo.session.UserInfo;
import kr.cfms.user.service.AuthService;
import kr.cfms.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
@RequiredArgsConstructor
public class AuthInterceptor extends HandlerInterceptorAdapter {

	private final AuthService authService;
	private final UserService userService;
	
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	boolean checkSessionTF = authService.checkSession(request, response);
    	
    	log.debug("AuthInterceptor : checkSessionTF : [{}]", checkSessionTF);
    	
        if (checkSessionTF) {
        	
        	UserInfo userInfo = SessionUserInfoUtil.getUserInfo(request.getSession());
        	String statusCd = userService.getUserStatusCode(userInfo.getMid());
        	
        	if (!(statusCd.contains("R") || statusCd.contentEquals("CCC"))) {
        		return super.preHandle(request, response, handler);
        	}
        	
        } 

        response.sendRedirect("/login/login-form");
    	return false;
    	
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }
}
