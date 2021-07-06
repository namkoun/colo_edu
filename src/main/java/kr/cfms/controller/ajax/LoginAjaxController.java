package kr.cfms.controller.ajax;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.cfms.common.util.session.SessionMenuInfoUtil;
import kr.cfms.common.util.session.SessionUserInfoUtil;
import kr.cfms.common.vo.session.UserInfo;
import kr.cfms.service.authentication.AuthenticationService;
import kr.cfms.service.member.MemberPassExpireCheckService;
import kr.cfms.user.service.CenterService;
import kr.cfms.user.service.MenuService;
import kr.cfms.user.vo.MenuVO;
import kr.cfms.user.vo.MstCenterVO;
import kr.cfms.vo.authentication.AuthenticationRequest;
import kr.cfms.vo.response.ObjectVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("ajax/login")
public class LoginAjaxController {

    private final AuthenticationService authenticationService;
    private final MemberPassExpireCheckService memberPassExpireCheckService;
	private final MenuService menuService;
	private final CenterService centerService;
	

    @PostMapping("login")
    public ResponseEntity<ObjectVo> login(HttpSession session, 
    		@RequestBody AuthenticationRequest authenticationRequest) {
    	    	
        UserInfo userInfo = authenticationService.doAuthenticate(authenticationRequest);
        MstCenterVO centerVO = centerService.selectCenterInfoByMid(userInfo.getMid());

        if (centerVO != null) {
        	userInfo.setCenterId(centerVO.getId());	
        	userInfo.setCenterCd(centerVO.getCenterCd());
        	userInfo.setCenterNm(centerVO.getCenterNm());
		}
		
        List<MenuVO> menuInfo = menuService.getMenu();

        SessionUserInfoUtil.setUserInfo(session, userInfo);
		SessionMenuInfoUtil.setMenuInfo(session, menuInfo);
        boolean passExpireCheckResult = memberPassExpireCheckService.memberPassExpireCheck(userInfo.getMid());
        return ResponseEntity.ok(new ObjectVo(passExpireCheckResult));
    }
}
