package kr.cfms.dashboard.dto;

import kr.cfms.dashboard.vo.NoticeVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("NoticeDTO")
public class NoticeDTO extends NoticeVO {
	
    private String categoryCodeName;
    private String regDateString;
    private String modDateString;
    
}
