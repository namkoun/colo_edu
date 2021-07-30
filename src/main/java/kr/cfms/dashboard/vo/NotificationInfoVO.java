package kr.cfms.dashboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@ToString
@Alias("NotificationInfoVO")
public class NotificationInfoVO {
    private long inMstId;
    private long outMstId;
    private long userId;

    private String typeCd;
    private String content;
    private String createDt;

    private String regDate;
    private String modDate;

    //알림 종류 만들기
    public String makeTypeCd(String inOrdType) {
        String realTypeCd = "";
        if(inOrdType.equals("INAM") || inOrdType.equals("INPM") || inOrdType.equals("INSP")) realTypeCd = "IN01";

        return realTypeCd;
    }

    //알림 내용 만들기
    public String makeContent(String custCenterNm, String whCenterNm, String inOrdType, String inOrdDate) {
        String realInOrdType;
        if(inOrdType.equals("INAM")) realInOrdType = "오전(9~11) 입고";
        else if(inOrdType.equals("INPM")) realInOrdType = "오후(13~15) 입고";
        else if(inOrdType.equals("INSP")) realInOrdType = "오후(15~16) 입고";
        else realInOrdType = "입고";

        String content = custCenterNm + "에서 " + whCenterNm + "(으)로<br>"
                + inOrdDate + "에 " + realInOrdType + "신청이 접수되었습니다.";
        return content;
    }
}
