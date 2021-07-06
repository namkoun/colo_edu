package kr.cfms.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.cfms.user.vo.MenuVO;

@Mapper
@Repository
public interface MstMenuMapper {
	
	List<MenuVO> selectMenuList();
	
}
