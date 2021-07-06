package kr.cfms.service.authentication;

import kr.cfms.common.exception.BaseException;
import kr.cfms.common.message.BaseErrorMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import kr.cfms.common.errorcode.AuthenticationErrorCode;
import kr.cfms.common.exception.AuthenticationException;
import kr.cfms.common.util.encrypt.MD5Encryptor;
import kr.cfms.common.vo.session.UserInfo;
import kr.cfms.mapper.MemberMapper;
import kr.cfms.vo.authentication.AuthenticationRequest;
import kr.cfms.vo.member.MemberVo;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class AuthenticationService {

    private final MemberMapper memberMapper;


    public UserInfo doAuthenticate(AuthenticationRequest authenticationRequest) {
        UserInfo userInfo;
        MemberVo memberVo;

        try {
        	memberVo = memberMapper.selectMemberByMidAndPassword(authenticationRequest.getPrincipal(), null);
        } catch (Exception e) {
            throw new AuthenticationException(AuthenticationErrorCode.NOT_EXIST_ID_OR_PASSWORD);
        }

        if (memberVo != null) {
            if ("MS02".equals(memberVo.getMemberStatusCode())) {
            	String inputPass = MD5Encryptor.encrypt(authenticationRequest.getCredentials());
            	if (inputPass.equals(memberVo.getPass())) {
            		userInfo = UserInfo.builder()
                            .mid(memberVo.getMid())
                            .rid(memberVo.getRid())
                            .corpName(memberVo.getCorpName())
                            .name(memberVo.getName())
                            .memberTypeCode(memberVo.getMemberTypeCode())
                            .build();
            	} else {
            		throw new AuthenticationException(AuthenticationErrorCode.NOT_EXIST_ID_OR_PASSWORD);
            	}
            } else {
                throw new AuthenticationException(AuthenticationErrorCode.NOT_APPROVED_MEMBER);
            }
        } else {
            throw new AuthenticationException(AuthenticationErrorCode.NOT_EXIST_MEMBER);
        }

        try {
            memberMapper.updateMemberLastLoginDate(memberVo.getMid());
        } catch (Exception e) {
            throw new BaseException(BaseErrorMessage.PROCESS_FAILED);
        }

        return userInfo;
    }
}
