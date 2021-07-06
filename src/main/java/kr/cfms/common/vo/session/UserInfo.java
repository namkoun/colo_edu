package kr.cfms.common.vo.session;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
public class UserInfo {

	private String name;
	private String mid;
	private long cmpId;
	private String cmpCd;
	private String cmpNm;
	private String cmpType;
	private char firstJoinYn;
	private String memberTypeCode;
	private long centerId;
	private String centerCd;
	private String centerNm;
	
	/* 오류 발생시키지 않기 위한 입시 값 */
	private String rid;
	private String corpName;
	private String memberStatusCode;
}