package kr.cfms.dashboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("InOutResultDTO")
public class InOutResultDTO {

    // 입/출고 현황
    private String inAll;
    private String inTobe;
    private String inWorking;
    private String inComplete;
    private String inCancle;
    private long outAll;
    private long outTobe;
    private long outWorking;
    private long outComplete;
    private long outCancle;

}
