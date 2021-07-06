package kr.cfms.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import kr.cfms.common.errorcode.AuthenticationErrorCode;
import kr.cfms.common.errorcode.BaseErrorCode;
import kr.cfms.common.errorcode.ForbiddenErrorCode;
import kr.cfms.common.errorcode.InternalServerErrorCode;
import lombok.extern.slf4j.Slf4j;

/**
 * Created by jtmoon
 * Date: 2019-01-23
 */
@ControllerAdvice
@Slf4j
public class AjaxExceptionHandler {

    @ExceptionHandler({Exception.class, RuntimeException.class})
    public ResponseEntity<InternalServerErrorCode> handleException(Exception e) {
        log.error(e.getMessage(), e);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .contentType(MediaType.APPLICATION_JSON)
                .body(InternalServerErrorCode.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(ForbiddenException.class)
    public ResponseEntity<ForbiddenErrorCode> handleException(ForbiddenException fe) {
        log.error(fe.getMessage(), fe);
        return ResponseEntity.status(HttpStatus.FORBIDDEN)
                .contentType(MediaType.APPLICATION_JSON)
                .body(fe.getForbiddenErrorCode());
    }

    @ExceptionHandler(AuthenticationException.class)
    public ResponseEntity<AuthenticationErrorCode> handleAuthenticationException(AuthenticationException ae) {
        log.error(ae.getMessage(), ae);
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .contentType(MediaType.APPLICATION_JSON)
                .body(ae.getAuthenticationErrorCode());
    }

	@ExceptionHandler(BaseException.class)
	public ResponseEntity<BaseErrorCode> handleBaseException(BaseException be) {
		log.error(be.getMessage(), be);
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
				.contentType(MediaType.APPLICATION_JSON)
				.body(be.getBaseErrorCode());
	}
}
