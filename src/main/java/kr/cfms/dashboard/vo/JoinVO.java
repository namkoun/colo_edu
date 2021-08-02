package kr.cfms.dashboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("JoinVO")
public class JoinVO {
    private long id;
    private long cmpId;
    private String mid;  //이메일
    private String memberTypeCode;
    private String mobile;
}
