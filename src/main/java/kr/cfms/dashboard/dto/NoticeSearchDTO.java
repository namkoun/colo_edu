package kr.cfms.dashboard.dto;

import kr.cfms.dashboard.vo.NoticeVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("NoticeSearchDTO")
public class NoticeSearchDTO extends NoticeVO {

    private String searchText;
    private String searchCond;
	
}
