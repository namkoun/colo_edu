package kr.cfms.common.errorcode;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;


@AllArgsConstructor
@Getter
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum InternalServerErrorCode implements ErrorCode {
    INTERNAL_SERVER_ERROR(50000, "시스템 오류가 발생하였습니다. 관리자에게 문의해 주시기 바랍니다");

    final private int code;
    final private String message;
}
