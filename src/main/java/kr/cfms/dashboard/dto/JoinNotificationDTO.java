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

    private String memberTypeCode; //회원구분코드
    private String cmpNm;          //회사명
    private String mobile;         //개인 휴대폰
}
