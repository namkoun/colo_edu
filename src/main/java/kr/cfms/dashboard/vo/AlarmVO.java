package kr.cfms.dashboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("AlarmVO")
public class AlarmVO {
    private long id;
//    private String isChecked;
    private String typeCd;
    private String regDate;
//    private Date modDate;
}
