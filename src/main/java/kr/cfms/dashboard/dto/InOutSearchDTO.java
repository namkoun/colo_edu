package kr.cfms.dashboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("InOutSearchDTO")
public class InOutSearchDTO {

    private String fromDate;
    private String toDate;
}
