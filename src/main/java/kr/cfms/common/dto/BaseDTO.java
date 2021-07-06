package kr.cfms.common.dto;

import kr.cfms.common.util.date.DateUtil;
import kr.cfms.common.vo.session.UserInfo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BaseDTO {

	private String BaseDt;								// 기준일시
	private String BaseDay;								// 기준일
	private UserInfo userInfo;							// 사용자 정보

	public BaseDTO() {
		this.BaseDt = DateUtil.getNowDate(DateUtil.YYYYMMDDHHMMSS);
		this.BaseDay = DateUtil.getStrDateToStr(BaseDt, DateUtil.YYYYMMDDHHMMSS, DateUtil.YYYY_MM_DD);
	}
}
