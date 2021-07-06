package kr.cfms.common.mapper;

import kr.cfms.common.vo.CodeDtlVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;



@Mapper
@Repository
public interface CodeMapper {
	
	public List<CodeDtlVO> selectCodeDtl(@Param("code_group_id") String code_group_id);
	public List<CodeDtlVO> selectCodeDtlByGroupIds(@Param("groupIdList") List<String> groupIdList);
	public List<CodeDtlVO> selectCodeDtlException(@Param("codeDtlVO") CodeDtlVO codeDtlVO);
	public CodeDtlVO getCodeDtl(@Param("codeDtlVO") CodeDtlVO codeDtlVO);

}
