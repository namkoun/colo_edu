package kr.cfms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
public class MessageVO implements ResponseVO {
    private String message;
}
