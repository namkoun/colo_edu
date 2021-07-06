package kr.cfms.common.errorcode;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;


@Getter
@AllArgsConstructor
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum AuthenticationErrorCode implements ErrorCode {

    AUTHENTICATION_FAIL(40201, "로그인이 실패하였습니다"),
    NOT_EXIST_MEMBER(40202, "존재하지 않는 회원입니다"),
    NOT_APPROVED_MEMBER(40203, "승인되지 않은 회원입니다"),
	NOT_EXIST_ID_OR_PASSWORD(40204, "아이디 또는 패스워드가 올바르지 않습니다.");

    final private int code;
    final private String message;
}
