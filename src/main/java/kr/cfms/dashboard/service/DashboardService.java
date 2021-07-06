package kr.cfms.dashboard.service;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import kr.cfms.dashboard.mapper.DashboardMapper;
import kr.cfms.dashboard.vo.DashboardResultDTO;
import kr.cfms.dashboard.vo.DashboardSearchDTO;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
@RequiredArgsConstructor
public class DashboardService {
	
	private final DashboardMapper dashboardMapper;


	/**
	 * 대쉬보드 출고현황 호출 
	 */
	public List<DashboardResultDTO> selectDashboardOut(DashboardSearchDTO dashboardSearchDTO) {
		return dashboardMapper.selectDashboardOut(dashboardSearchDTO);
	}
	
	/**
	 * 대쉬보드 입고현황 호출 
	 */
	public List<DashboardResultDTO> selectDashboardIn(DashboardSearchDTO dashboardSearchDTO) {
		return dashboardMapper.selectDashboardIn(dashboardSearchDTO);
	}
	
	/**
	 * 대쉬보드 보관량 호출 
	 */
	public List<DashboardResultDTO> selectDashboardStoreWeight(DashboardSearchDTO dashboardSearchDTO) {
		return dashboardMapper.selectDashboardStoreWeight(dashboardSearchDTO);
	}
	
	/**
	 * 대쉬보드 출고상품 순위 호출 
	 */
	public List<DashboardResultDTO> selectDashboardGoodsRank(DashboardSearchDTO dashboardSearchDTO) {
		return dashboardMapper.selectDashboardGoodsRank(dashboardSearchDTO);
	}
	
	/**
	 * 대쉬보드 출고상품 순위 기간별 호출 
	 */
	public List<DashboardResultDTO> selectDashboardGoodsRankRange(DashboardSearchDTO dashboardSearchDTO) {
		return dashboardMapper.selectDashboardGoodsRankRange(dashboardSearchDTO);
	}
	
	
	/**
	 * 대쉬보드 안전재고 부족 호출 
	 */
	public List<DashboardResultDTO> selectDashboardStockLack(DashboardSearchDTO dashboardSearchDTO) {
		return dashboardMapper.selectDashboardStockLack(dashboardSearchDTO);
	}
}

