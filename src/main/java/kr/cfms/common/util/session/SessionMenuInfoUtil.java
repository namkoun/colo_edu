package kr.cfms.common.util.session;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.cfms.user.vo.MenuVO;

public class SessionMenuInfoUtil {
	
    private static final String MENU_INFO = "menuInfo";

    public static void setMenuInfo(HttpSession session, List<MenuVO> menuInfo) {
        session.setAttribute(MENU_INFO, menuInfo);
    }

    public static MenuVO getMenuInfo(HttpSession session) {
        return (MenuVO) session.getAttribute(MENU_INFO);
    }

}
