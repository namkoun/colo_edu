package kr.cfms.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.cfms.user.vo.UserVO;

@Mapper
@Repository
public interface UserMapper {

	public List<UserVO> selectUserList(@Param("userVO") UserVO userVO);
	public int updateLastLoginDate(@Param("userVO") UserVO userVO);
	public String getUserStatusCode(@Param("mid") String mid);
	public int checkPasswordExpire(@Param("mid") String mid);
	
}
