package kr.cfms.user.service;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import kr.cfms.user.mapper.MstCenterMapper;
import kr.cfms.user.vo.MstCenterVO;

@Service
@RequiredArgsConstructor
public class CenterService {
	
	private final MstCenterMapper mstCenterMapper;
	
	public List<MstCenterVO> selectWhlistForCd(String mid, String typecd){
		return mstCenterMapper.selectWhlistForCd(mid, typecd);
	}
	
	public List<MstCenterVO> selectSllist(String mid, String typecd){
		return mstCenterMapper.selectSllist(mid, typecd);
	}
	
	public MstCenterVO selectCenterInfoByMid(String mid) {
		return mstCenterMapper.selectCenterInfoByMid(mid);
	}

}
