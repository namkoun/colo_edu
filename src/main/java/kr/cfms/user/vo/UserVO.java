package kr.cfms.user.vo;

import kr.cfms.common.vo.BaseVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("UserVO")
public class UserVO extends BaseVO {

	private long cmpId;
	private String mid;
	private String pass;
	private char firstJoinYn;
	private String memberTypeCode;
	private String memberStatusCode;
	private String name;
	private String mobile;
	private String telNo;
	private String passChangeDate;
	private String lastLoginDate;
	private char useTermYn;
	private char personalInfoTermYn;
	private char cfmsServiceTermYn;
	private char marketingTermYn;
	private char sendAlimTalkTargetYn;
	private String formattedRegDate;
	
	private String emailAddr;
}
