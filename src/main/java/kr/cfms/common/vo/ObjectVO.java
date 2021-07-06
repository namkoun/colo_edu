package kr.cfms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ObjectVO implements ResponseVO {
	
	private Object response; 

}
