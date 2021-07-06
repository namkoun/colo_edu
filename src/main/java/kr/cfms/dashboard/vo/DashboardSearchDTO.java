package kr.cfms.dashboard.vo;

import kr.cfms.common.vo.BaseVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("DashboardSearchDTO")
public class DashboardSearchDTO extends BaseVO {
	
	private long custId;
	private String mid;
	private String fromDate;
	private String toDate;
	private long goodsCd;
	private long searchDay;

}