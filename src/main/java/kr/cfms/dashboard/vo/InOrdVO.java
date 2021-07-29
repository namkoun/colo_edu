package kr.cfms.dashboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("InOrdVO")
public class InOrdVO {

    private long custId;  //세션에서 찾음
    private long whId;
    private String inOrdNo;

    private String inOrdDt;   // 입고신청날짜
    private String inOrdType; // 입고시간(INAM, INPM, INSP)
    private String inMethod;  // 입고방식(PC, PI, CR)
}
