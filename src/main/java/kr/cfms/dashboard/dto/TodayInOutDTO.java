package kr.cfms.dashboard.dto;

import kr.cfms.common.vo.BaseVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("TodayInOutDTO")
public class TodayInOutDTO {

	//오늘의 출/입고*신청/완료 건수
	private long todayInApply;
	private long todayInComplete;
	private long todayOutApply;
	private long todayOutComplete;

}