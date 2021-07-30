package kr.cfms.dashboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("InOrdNotificationDTO")
public class InOrdNotificationDTO {
    private String custCenterNm; //업체명
    private String whCenterNm;   //창고명
    private String inOrdDt;      //입고예정날짜
    private String inOrdType;    //입고타입
}
