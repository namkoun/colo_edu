package kr.cfms.common.exception;

import kr.cfms.common.errorcode.ForbiddenErrorCode;
import lombok.Getter;

@Getter
public class ForbiddenException extends RuntimeException {

    private ForbiddenErrorCode forbiddenErrorCode;

    public ForbiddenException(ForbiddenErrorCode forbiddenErrorCode) {
        super(forbiddenErrorCode.getMessage());
        this.forbiddenErrorCode = forbiddenErrorCode;
    }
}
