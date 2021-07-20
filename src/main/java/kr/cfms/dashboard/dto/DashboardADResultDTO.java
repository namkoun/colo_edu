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

	//오늘의 출/입고*신청/완료 건수
	private long todayInApply;
	private long todayInComplete;
	private long todayOutApply;
	private long todayOutComplete;

	// 업체&창고 목록
	private long centerId;
	private String centerNm;

}