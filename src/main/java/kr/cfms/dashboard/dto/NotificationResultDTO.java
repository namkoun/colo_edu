package kr.cfms.dashboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("NotificationResultDTO")
public class NotificationResultDTO {
    private int countInOrd;
    private int countOutOrd;
    private int countUnFinishOut;
    private int countJoin;
}
