package kr.cfms.user.service;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import kr.cfms.user.mapper.MstMenuMapper;
import kr.cfms.user.vo.MenuVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MenuService {

	private final MstMenuMapper mstMenuMapper;


	public List<MenuVO> getMenu() {
		return mstMenuMapper.selectMenuList();
	}
	
}
