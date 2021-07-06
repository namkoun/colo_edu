package kr.cfms.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.cfms.user.service.AuthService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
@RequiredArgsConstructor
public class AjaxAuthInterceptor extends HandlerInterceptorAdapter {
	
	private final AuthService authService;
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	boolean checkSessionTF = authService.checkSession(request, response);
    	log.debug("AjaxAuthInterceptor : checkSessionTF : [{}]", checkSessionTF);
    	
        if (checkSessionTF) {
        	return super.preHandle(request, response, handler);
        } else {
        	response.sendRedirect("/login/login-form");
        	return false;
        }
    }
}
