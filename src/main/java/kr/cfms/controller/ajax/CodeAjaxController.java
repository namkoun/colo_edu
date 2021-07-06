package kr.cfms.controller.ajax;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.cfms.common.service.CodeService;
import kr.cfms.common.vo.CodeDtlVO;
import lombok.RequiredArgsConstructor;


@RestController
@RequiredArgsConstructor
@RequestMapping("ajax/code")
public class CodeAjaxController {

	private final CodeService codeService;
    
    @PostMapping("/code-map")
    public ResponseEntity<Map<String, List<CodeDtlVO>>> getCodeMap(@RequestBody List<String> groupIdList) {
    	
    	return ResponseEntity.ok(codeService.getCodeMap(groupIdList));
    }
    
}
