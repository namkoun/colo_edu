package kr.cfms.common.util.session;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import kr.cfms.common.vo.session.UserInfo;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public final class SessionUserInfoUtil{

	private static final String USER_INFO = "userInfo";


    public static void setUserInfo(HttpSession session, UserInfo userInfoVO) {
        session.setAttribute(USER_INFO, userInfoVO);
    }

    public static UserInfo getUserInfo(HttpSession session) {
        return (UserInfo) session.getAttribute(USER_INFO);
    }
}
