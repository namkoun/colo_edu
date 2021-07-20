package kr.cfms.dashboard.dto;

import kr.cfms.common.vo.BaseVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("DashboardADResultDTO")
public class DashboardADResultDTO extends BaseVO {
	
	// 업체&창고 목록
	private String centerNm;

}