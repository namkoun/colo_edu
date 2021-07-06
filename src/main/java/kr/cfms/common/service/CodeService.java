package kr.cfms.common.service;

import kr.cfms.common.mapper.CodeMapper;
import kr.cfms.common.vo.CodeDtlVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;



@Slf4j
@Service
@RequiredArgsConstructor
public class CodeService {
	
	private final CodeMapper codeMapper;
	

	public List<CodeDtlVO> selectCodeDtl(String code_group_id) {
        return codeMapper.selectCodeDtl(code_group_id);
    }

	public List<CodeDtlVO> selectCodeDtlByGroupIds(List<String> groupIdList) {
		return codeMapper.selectCodeDtlByGroupIds(groupIdList);
	}

	public List<CodeDtlVO> selectCodeDtlException(String code_group_id, List<String> exception_code) {
		
		CodeDtlVO paramCodeDtlVO = new CodeDtlVO();
		paramCodeDtlVO.setCodeGroupId(code_group_id);
		paramCodeDtlVO.setExceptionCode(exception_code);
		
        return codeMapper.selectCodeDtlException(paramCodeDtlVO);
    }
	
	public CodeDtlVO getCodeDtl(String codeGroupId, String codeId) {
		CodeDtlVO paramCodeDtlVO = new CodeDtlVO();
		paramCodeDtlVO.setCodeGroupId(codeGroupId);
		paramCodeDtlVO.setCodeId(codeId);
		CodeDtlVO resultCodeDtlVO = new CodeDtlVO();
		resultCodeDtlVO = codeMapper.getCodeDtl(paramCodeDtlVO);
		
		return resultCodeDtlVO;
	}
	
	public Map<String, List<CodeDtlVO>> getCodeMap(List<String> groupIdList) {
		
		Map<String, List<CodeDtlVO>> codeMap = null;
    	
    	if (CollectionUtils.isNotEmpty(groupIdList)) {

    		List<CodeDtlVO> codeList = selectCodeDtlByGroupIds(groupIdList);
    		codeMap = codeList.stream().collect(Collectors.groupingBy(CodeDtlVO::getCodeGroupId));
		}
    	
    	return codeMap;
	}
}
