package kr.cfms.dashboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("OutOrdNotificationDTO")
public class OutOrdNotificationDTO {
    private String custCenterNm; //업체명
    private String outOrdDt;     //출고 예정날짜
    private String outOrdType;   //출고 타입
}
