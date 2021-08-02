package kr.cfms.dashboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("JoinNotificationDTO")
public class JoinNotificationDTO {

    //memberTypeCode, custCenterNm, typeCd, phone
    private String memberTypeCode; //회원구분코드
    private String custCenterNm;   //출고 예정날짜
    private String typeCd;         //출고 타입
    private String mobile;         //개인 휴대폰
}
