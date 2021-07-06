package kr.cfms.dashboard.vo;

import kr.cfms.common.vo.BaseVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("DashboardResultDTO")
public class DashboardResultDTO extends BaseVO {
	
	//출고 
	private long outPcCount;
	private long outCrCount;
	private long outWdCount;
	
	//입고 
	private String inOrdIn01;
	private String inOrdIn02;
	private String inOrdIn04;
	
	//보관량
	private String storeWeight;
	
	//출고 순위
	private long custId;
	private String goodsCd;
	private String goodsNm;
	private long goodsCount;
	private String outOrdDt;
	
	//재고부족
	private long safeStkQty;
	private long stkQty;
	private long exCount;
	private String lastInOrdDt;
	

}