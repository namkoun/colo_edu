package kr.cfms.user.vo;

import kr.cfms.common.vo.BaseVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("MstCenterVO")
public class MstCenterVO extends BaseVO {
	
	private long cmpId;
	private String centerCd;
	private String centerTypeCd;
	private String centerNm;
	private String centerEmail;
	private String centerTel;
	private String centerFax;
	private String centerZip;
	private String centerJibunAddr;
	private String centerRoadAddr;
	private String centerDetailAddr;
	private String avlAreaKe01;
	private String avlPltKe01;
	private String avlAreaKe02;
	private String avlPltKe02;
	private String avlAreaKe03;
	private String avlPltKe03;
	private String refWhCd;

}