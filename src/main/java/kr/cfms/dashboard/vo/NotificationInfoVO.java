package kr.cfms.dashboard.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Getter
@Setter
@ToString
@Alias("NotificationInfoVO")
public class NotificationInfoVO {
    private long inMstId;
    private long outMstId;
    private long userId;
    private long custId;

    private String typeCd;
    private String content;
    private String createDt;

    private String regDate;
    private String modDate;

    /**
     * 알림 종류
     */
    //입고신청
    public String makeInOrdTypeCd(String inOrdType) {
        String realTypeCd = "";
        if(inOrdType.equals("INAM") || inOrdType.equals("INPM") || inOrdType.equals("INSP") || inOrdType.equals("INAD") || inOrdType.equals("INDS"))
            realTypeCd = "IN01";
        return realTypeCd;
    }
    //출고신청
    public String makeOutOrdTypeCd(String outOrdType) {
        String realTypeCd = "";
        if(outOrdType.equals("OTAM") || outOrdType.equals("OTBB") || outOrdType.equals("OTPM") || outOrdType.equals("OTSP")
            || outOrdType.equals("OTAD") || outOrdType.equals("OTCS") || outOrdType.equals("OTDD") || outOrdType.equals("OTWD") || outOrdType.equals("OTWG"))
            realTypeCd = "OS01";
        return realTypeCd;
    }
    //회원가입
    public String makeJoinTypeCd() {
        return "JOIN";
    }

    //미진행 출고건
    public String makeUnFinishedOutTypeCd() {
        return "UFOT";
    }

    /**
     * 알림 내용
     */
    //입고신청
    public String makeInOrdContent(String custCenterNm, String whCenterNm, String inOrdType, String inOrdDate) {
        String realInOrdType;
        if(inOrdType.equals("INAM")) realInOrdType = "오전(9~11) 입고";
        else if(inOrdType.equals("INPM")) realInOrdType = "오후(13~15) 입고";
        else if(inOrdType.equals("INSP")) realInOrdType = "오후(15~16) 입고";
        else if(inOrdType.equals("INAD")) realInOrdType = "관리자 입고";
        else if(inOrdType.equals("INDS")) realInOrdType = "드랍쉬핑 입고";
        else realInOrdType = "입고";

        String content ="<div style=\"white-space:nowrap;\"><b>" + custCenterNm + "</b>에서<b> " + whCenterNm + "</b>(으)로<br><b>"  + inOrdDate + "</b>에<b> " + realInOrdType + "</b>신청이 접수되었습니다.</div>";
        return content;
    }

    //출고신청
    public String makeOutOrdContent(String custCenterNm, String outOrdType, String outOrdDate) {
        String realInOrdType;
        if(outOrdType.equals("OTAM")) realInOrdType = "오전(10:00) 출고";
        else if(outOrdType.equals("OTBB")) realInOrdType = "B2B 출고";
        else if(outOrdType.equals("OTPM")) realInOrdType = "오후(14:00) 출고";
        else if(outOrdType.equals("OTSP")) realInOrdType = "특수(14:00이후) 출고";
        else if(outOrdType.equals("OTAD")) realInOrdType = "운영 출고";
        else if(outOrdType.equals("OTCS")) realInOrdType = "건별 출고";
        else if(outOrdType.equals("OTDD")) realInOrdType = "국내드랍쉬핑";
        else if(outOrdType.equals("OTWD")) realInOrdType = "해외드랍쉬핑";
        else if(outOrdType.equals("OTWG")) realInOrdType = "해외일반출고";
        else realInOrdType = "출고";

        String content = "<div style=\"white-space:nowrap;\"><b>" + custCenterNm + "</b>에서 <b>" + outOrdDate + "</b>에" +
                "<b><br>" + realInOrdType + "</b>신청이 접수되었습니다.</div>";
        return content;
    }

    //회원가입
    public String makeJoinContent(String memberTypeCod, String cmpNm, String mobile) {
        return "<div style=\"white-space:nowrap;\">(<b>" + memberTypeCod + "</b>)<b>" + cmpNm + "</b>(이)가<br>" +
                "<b>회원가입</b> 했습니다. 연락처(<b>" + mobile + "</b>)</div>";
    }

    //미진행출고건
    public String makeUnFinishedOutContent(String centerNm, String outOrdDt, int countUnFinishedOut) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        Date todayDate = calendar.getTime();  // 오늘 날짜
        Date outOrdDate = format.parse(outOrdDt);  // 출고 날짜

        long diffSec = (todayDate.getTime() - outOrdDate.getTime()) / 1000; //초 차이
        long diffDays = diffSec / (24*60*60); //일자수 차이

        String content = "<div style=\"white-space:nowrap;\"><b>" + centerNm + "</b>에서 <b>" + outOrdDt + "</b>기준<br><b>"
                + diffDays +"</b>일 지난 미진행 출고 <b>" + countUnFinishedOut + "</b>건이 있습니다.</div>";
        return content;
    }
}
