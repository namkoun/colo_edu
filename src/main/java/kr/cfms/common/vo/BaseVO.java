package kr.cfms.common.vo;

import kr.cfms.common.vo.session.UserInfo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class BaseVO {
	
	private String BaseDt;				// 기준일시 
	private long index;
	private long id;
	private String statsCd;
	private String useYn;
	private Date regDate;
	private String regMid;
	private Date modDate;
	private String modMid;
	
	
	public void setMids(UserInfo userInfo) {
		this.regMid = userInfo.getMid();
		this.modMid = userInfo.getMid();
	}

}
