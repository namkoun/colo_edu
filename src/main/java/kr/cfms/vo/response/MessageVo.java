package kr.cfms.vo.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
public class MessageVo implements ResponseVo {
    private String message;
}
