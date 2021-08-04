package kr.cfms.dashboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("UnFinishedResultDTO")
public class UnFinishedResultDTO {
    private long custId;
    private String centerNm;
    private int countUnFinishedOut;
    private String outOrdDt;
}
