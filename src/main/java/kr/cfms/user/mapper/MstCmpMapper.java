package kr.cfms.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.cfms.user.vo.MstCmpVO;

@Mapper
@Repository
public interface MstCmpMapper {
	
	List<MstCmpVO> selectCmpList(@Param("mstCmpVO") MstCmpVO mstCmpVO);

}
