package kr.cfms.dashboard.dto;

import kr.cfms.vo.response.ResponseVo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class AlarmResultDTO implements ResponseVo {

    private String isChecked;
    private String typeCd;
}
