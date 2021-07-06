package kr.cfms.dashboard.vo;

import kr.cfms.common.vo.BaseVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("NoticeVO")
public class NoticeVO extends BaseVO {

	private String categoryCode;
	private String title;
	private String contents;
	private int readCnt;
	
}
