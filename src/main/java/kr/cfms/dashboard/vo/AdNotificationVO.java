package kr.cfms.dashboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("AdNotificationVO")
public class AdNotificationVO {
    private long id;
    private long infoId;
    private String adMid;
    private String readYn;
    private String typeCd;
}
