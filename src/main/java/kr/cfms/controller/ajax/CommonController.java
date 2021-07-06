package kr.cfms.controller.ajax;

import kr.cfms.common.service.CodeService;
import kr.cfms.common.vo.CodeDtlVO;
import kr.cfms.common.vo.session.UserInfo;
import kr.cfms.user.service.CenterService;
import kr.cfms.user.vo.MstCenterVO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/ajax/common")
public class CommonController {

	
	private final CodeService codeService;
	private final CenterService centerService;

	
    @PostMapping("/code-map")
    public ResponseEntity<Map<String, List<CodeDtlVO>>> getCodeMap(@RequestBody List<String> groupIdList) {
    	
    	Map<String, List<CodeDtlVO>> codeMap = codeService.getCodeMap(groupIdList);
    	
    	return ResponseEntity.ok(codeMap);
    }
    
    @PostMapping("/wh-list")
    public ResponseEntity<List<MstCenterVO>> getWhList(HttpSession session) {
    	
    	UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");    	
    	List<MstCenterVO> whList = centerService.selectWhlistForCd(userInfo.getMid(), userInfo.getMemberTypeCode());
    	
    	return ResponseEntity.ok(whList);
    }
    
    @PostMapping("/sl-list")
    public ResponseEntity<List<MstCenterVO>> getSlList(HttpSession session) {
    	
    	UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");    	
    	List<MstCenterVO> slList = centerService.selectSllist(userInfo.getMid(), userInfo.getMemberTypeCode());
    	
    	return ResponseEntity.ok(slList);
    }
}
