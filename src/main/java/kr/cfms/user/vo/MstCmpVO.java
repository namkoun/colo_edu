package kr.cfms.user.vo;

import kr.cfms.common.vo.BaseVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("MstCmpVO")
public class MstCmpVO extends BaseVO {

	private long id;
	private String cmpCd;
	private String cmpType;
	private String cmpNm;
	private String mid;
	private String cmpEmail;
	private String cmpTel;
	private String cmpFax;
	private String cmpZip;
	private String cmpJibunAddr;
	private String cmpRoadAddr;
	private String cmpDetailAddr;
	private String registNo;
	private long fileSeq;
	
}
