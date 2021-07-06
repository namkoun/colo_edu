package kr.cfms.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.cfms.common.annotation.NoLogging;
import kr.cfms.common.exception.BaseException;
import kr.cfms.common.message.BaseErrorMessage;
import kr.cfms.common.util.encrypt.MD5Encryptor;
import kr.cfms.common.util.session.SessionUserInfoUtil;
import kr.cfms.common.vo.session.Authentication;
import kr.cfms.common.vo.session.UserInfo;
import kr.cfms.user.mapper.MstCmpMapper;
import kr.cfms.user.mapper.UserMapper;
import kr.cfms.user.vo.MstCmpVO;
import kr.cfms.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class AuthService {
	
	private final UserService userService;	
	private final UserMapper userMapper;
	private final MstCmpMapper mstCmpMapper;
	
	

	public UserInfo loginAuthCheck(Authentication auth) {
		UserInfo userInfo;
		UserVO paramUserVO = new UserVO();
		paramUserVO.setMid(auth.getLoginEmail());
		List<UserVO> resultUserListVO = userMapper.selectUserList(paramUserVO);
		
		if (resultUserListVO != null && resultUserListVO.size() > 0) {
			if((MD5Encryptor.encrypt(auth.getLoginPassword())).equals(resultUserListVO.get(0).getPass())) {
				String memberStatusCode = resultUserListVO.get(0).getMemberStatusCode();
				MstCmpVO paramMstCmpVO = new MstCmpVO();
				paramMstCmpVO.setId(resultUserListVO.get(0).getCmpId());
				List<MstCmpVO> resultMstCmpListVO = mstCmpMapper.selectCmpList(paramMstCmpVO);
				
				if ("GEN".equals(memberStatusCode)) {
					userInfo = UserInfo.builder()
						.name(resultUserListVO.get(0).getName())
						.mid(resultUserListVO.get(0).getMid())
						.firstJoinYn(resultUserListVO.get(0).getFirstJoinYn())
						.memberTypeCode(resultUserListVO.get(0).getMemberTypeCode())
						.cmpCd(resultMstCmpListVO.get(0).getCmpCd())
						.cmpType(resultMstCmpListVO.get(0).getCmpType())
						.cmpNm(resultMstCmpListVO.get(0).getCmpNm())
						.cmpId(resultMstCmpListVO.get(0).getId())
						.memberStatusCode(resultUserListVO.get(0).getMemberStatusCode())
						.build();
				} else {				
					if (memberStatusCode.contains("R") || memberStatusCode.equals("CCC")) {
						userInfo = UserInfo.builder()
								.name(resultUserListVO.get(0).getName())
								.mid(resultUserListVO.get(0).getMid())
								.memberTypeCode(resultUserListVO.get(0).getMemberTypeCode())
								.cmpCd(resultMstCmpListVO.get(0).getCmpCd())
								.cmpType(resultMstCmpListVO.get(0).getCmpType())
								.cmpNm(resultMstCmpListVO.get(0).getCmpNm())
								.cmpId(resultMstCmpListVO.get(0).getId())
								.memberStatusCode(resultUserListVO.get(0).getMemberStatusCode())
								.build();
					} else {
						throw new BaseException(BaseErrorMessage.LOGIN_AUTH_NOT_ACTIVE);
					}
				}
			} else {
				throw new BaseException(BaseErrorMessage.LOGIN_PASSWORD_NOT_MATCHING);
			}
		} else {
			throw new BaseException(BaseErrorMessage.LOGIN_USER_NOT_MATCHING);
		}
		
		userService.lastLoginDateChange(resultUserListVO.get(0).getId(), resultUserListVO.get(0).getMid());
		return userInfo;
	}

	@NoLogging
	public boolean checkSession(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		UserInfo userInfo = SessionUserInfoUtil.getUserInfo(session);
		
		if (userInfo == null) {
        	return false;
        }

		return true;            
	}

	public boolean checkPasswordExpire(String mid) {
		boolean resultBool;
		int checkPassExpire = userMapper.checkPasswordExpire(mid);

		if (checkPassExpire > 0) {
			resultBool = true;
		} else {
			resultBool = false;
		}
		
		return resultBool;
	}
}
