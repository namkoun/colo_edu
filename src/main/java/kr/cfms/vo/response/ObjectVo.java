package kr.cfms.vo.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
public class ObjectVo implements ResponseVo {
    private Object response;
}
