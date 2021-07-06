package kr.cfms.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.cfms.common.exception.BaseException;
import kr.cfms.common.message.BaseErrorMessage;
import kr.cfms.user.mapper.UserMapper;
import kr.cfms.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserMapper userMapper;

	public List<UserVO> getUserInfoList(UserVO userVO) {
		return userMapper.selectUserList(userVO);
	}
	
	public String getUserStatusCode(String mid) {
		return userMapper.getUserStatusCode(mid);
	}
	
	public void lastLoginDateChange(long id, String mid) {
		UserVO paramUserVO = new UserVO();
		paramUserVO.setId(id);
		paramUserVO.setMid(mid);
		
		int updateResult = userMapper.updateLastLoginDate(paramUserVO);
		
		if (updateResult <= 0) {
			throw new BaseException(BaseErrorMessage.UPDATE_FAILED);
		} 
	}

}
