package kr.cfms.common.errorcode;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;


@Getter
@AllArgsConstructor
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ForbiddenErrorCode implements ErrorCode {
    NO_AUTHORITY(40301, "접근 권한이 없습니다");

    final private int code;
    final private String message;
}
