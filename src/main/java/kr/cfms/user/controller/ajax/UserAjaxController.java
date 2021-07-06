package kr.cfms.user.controller.ajax;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.cfms.common.util.session.SessionMenuInfoUtil;
import kr.cfms.common.util.session.SessionUserInfoUtil;
import kr.cfms.common.vo.ObjectVO;
import kr.cfms.common.vo.session.Authentication;
import kr.cfms.common.vo.session.UserInfo;
import kr.cfms.user.service.AuthService;
import kr.cfms.user.service.CenterService;
import kr.cfms.user.service.MenuService;
import kr.cfms.user.service.UserService;
import kr.cfms.user.vo.MenuVO;
import kr.cfms.user.vo.MstCenterVO;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("ajax/user")
public class UserAjaxController {
	
	
	private final CenterService centerService;
	private final AuthService authService;
	private final MenuService menuService;


	@PostMapping("login")
	public ResponseEntity<ObjectVO> login(HttpSession session, @RequestBody Authentication authentication) {
		UserInfo userInfo = authService.loginAuthCheck(authentication);
		MstCenterVO centerVO = centerService.selectCenterInfoByMid(userInfo.getMid());

        if (centerVO != null) {
        	userInfo.setCenterId(centerVO.getId());	
        	userInfo.setCenterCd(centerVO.getCenterCd());
        	userInfo.setCenterNm(centerVO.getCenterNm());
		}
        
		List<MenuVO> menuInfo = menuService.getMenu();
		SessionUserInfoUtil.setUserInfo(session, userInfo);
        SessionMenuInfoUtil.setMenuInfo(session, menuInfo);
		boolean checkPasswordExpire = authService.checkPasswordExpire(userInfo.getMid());
		ObjectVO resultObjectVO = new ObjectVO(checkPasswordExpire);
		
		return ResponseEntity.ok(resultObjectVO);
	}
}
