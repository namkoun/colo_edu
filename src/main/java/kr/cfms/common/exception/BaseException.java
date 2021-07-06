package kr.cfms.common.exception;

import kr.cfms.common.errorcode.BaseErrorCode;
import kr.cfms.common.message.BaseErrorMessage;
import lombok.Getter;

@Getter
public class BaseException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	
	private final int code;
	private final String message;
	
	public BaseException(String message) {
		super(message);
		this.code = -1;
		this.message = message;
	}
	
	public BaseException(int code, String message) {
		super(message);
		this.code = code;
		this.message = message;
	}
	
	public BaseException(BaseErrorMessage error) {
		super(error.getMessage());
		this.code = error.getCode();
		this.message = error.getMessage();
	}

	public BaseErrorCode getBaseErrorCode() {
		return new BaseErrorCode(code, message);
	}
}