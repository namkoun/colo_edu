package kr.cfms.dashboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Getter
@Setter
@ToString
@Alias("AlarmVO")
public class AlarmVO {
    private String isChecked;
    private String typeCd;
    private Date regDate;
//    private Date modDate;
}
