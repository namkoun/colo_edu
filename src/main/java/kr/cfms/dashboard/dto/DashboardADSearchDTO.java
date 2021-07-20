package kr.cfms.dashboard.dto;

import kr.cfms.common.vo.BaseVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("DashboardADSearchDTO")
public class DashboardADSearchDTO extends BaseVO {

    private long centerId;
    private String centerNm;

}
