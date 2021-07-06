package kr.cfms.user.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("MenuVO")
public class MenuVO {

	private int menuId;
	private int menuParent;
	private String menuName;
	private String menuLink;
	private String menuMobile;
	private String menuDesktop;
	private int menuOrder;
	private String menuMemberType;
	private String menuPath;

	
}
