package kr.cfms.common.errorcode;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class BaseErrorCode {

	private int code;
    private String message;

}
