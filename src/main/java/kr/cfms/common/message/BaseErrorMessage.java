package kr.cfms.common.message;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.cfms.common.errorcode.ErrorCode;
import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum BaseErrorMessage implements ErrorCode {
	
	/* ERROR CODE / MESSAGE */
	// 10001 ~ 19999 : 공통메세지
	INSERT_FAILED(10001, "생성이 정상적으로 처리되어지지 않았습니다."),
	UPDATE_FAILED(10002, "변경이 정상적으로 처리되어지지 않았습니다."),
	DELETE_FAILED(10003, "데이터 변경이 정상적으로 처리되어지지 않았습니다."),
	PROCESS_FAILED(10004, "처리가 정상적으로 이루어 지지 않았습니다."),
	WRONG_STRING_PARAM(10005, "잘못된 파라미터 입니다."),
	CONNECTION_FAILED(10006, "연결에 실패 하였습니다."),
	SELECT_DATA_EMPTY(10007, "조회된 데이터가 없습니다"),
	LOGIN_USER_NOT_MATCHING(10008, "존재하지 않는 아이디 입니다."),
	LOGIN_PASSWORD_NOT_MATCHING(10009, "비밀번호가 일치하지 않습니다."),
	LOGIN_AUTH_NOT_ACTIVE(10010, "아직 승인되지 않은 회원입니다. 가입 시 기입하신 이메일을 확인 해 주세요"),
	WRONG_MID(10011, "정상적이지 않은 유저ID 입니다."),
	MASKING_TYPE_NONE(10012, "존재하지 않는 마스킹 타입입니다. 운영자에게 문의 바랍니다."),
	WRONG_DATE(10013, "기간은 YYYY-MM-DD형태로 입력해주세요.");


	private final int code;
	private final String message;
}
