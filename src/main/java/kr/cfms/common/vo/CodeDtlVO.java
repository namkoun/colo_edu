package kr.cfms.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.util.List;


@Getter
@Setter
@ToString
@Alias("CodeDtlVO")
public class CodeDtlVO extends BaseVO {
	
	private String codeGroupId;	
	private String codeId;
	private String codeName;
	private String upCodeGroupId;
	private String upCodeId;
	private String desc;
	private long sortNo;
	
	private List<String> ExceptionCode;

}
