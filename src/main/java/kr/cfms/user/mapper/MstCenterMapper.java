package kr.cfms.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.cfms.user.vo.MstCenterVO;

@Mapper
@Repository
public interface MstCenterMapper {
	
	MstCenterVO selectCenterInfoByMid(@Param("mid") String mid);
	List<MstCenterVO> selectWhlistForCd(@Param("mid") String mid, @Param("typecd") String typecd);
	List<MstCenterVO> selectSllist(@Param("mid") String mid, @Param("typecd") String typecd);
	
}
