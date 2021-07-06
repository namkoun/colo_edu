package kr.cfms.common.vo.session;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
public class MenuInfo {
	
	private int menuId;
	private int menuParent;
	private String menuName;
	private String menuLink;
	private char menuMobile;
	private char menuDesktop;
	private int menuOrder;
	private String menuMemberType;
	private String menuPath;

}
