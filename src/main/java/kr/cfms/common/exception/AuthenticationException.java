package kr.cfms.common.exception;

import kr.cfms.common.errorcode.AuthenticationErrorCode;
import lombok.Getter;

@Getter
public class AuthenticationException extends RuntimeException {
    private AuthenticationErrorCode authenticationErrorCode;

    public AuthenticationException(AuthenticationErrorCode authenticationErrorCode) {
        super(authenticationErrorCode.getMessage());
        this.authenticationErrorCode = authenticationErrorCode;
    }
}
