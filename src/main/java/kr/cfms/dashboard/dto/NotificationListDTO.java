package kr.cfms.dashboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("NotificationListDTO")
public class NotificationListDTO {
    private String createDt;
    private String content;
    private String readYn;
    private String typeCd;
}
