package kr.cfms.dashboard.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("StockLackResultDTO")
public class StockLackResultDTO {

    //재고부족
    private String goodsNm;
    private long stkQty;
    private long missQty;
    private long inStkQty;
    private String lastInOrdDt;
    private long safeStkQty;
}
