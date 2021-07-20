package kr.cfms.dashboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("CenterIdNameDTO")
public class CenterIdNameDTO {

	// 업체&창고 목록
	private long id;
	private String centerNm;

}