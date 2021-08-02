package kr.cfms.dashboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("OutOrdVO")
public class OutOrdVO {
    private long id;
    private long custId;
    private String outOrdNo;

    private String outOrdDt;
    private String outType;   // 출고타입 일반출고(OTAM, OTPM, OTSP), B2B(OTBB)
    private String outMethod; // 출고방식(PC, PI, CR)
}
