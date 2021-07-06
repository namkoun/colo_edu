package kr.cfms.vo.member;



import kr.cfms.vo.warehouse.WarehouseVo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;


@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberVo {

    private String mid;
    private String rid;
    private String pass;
    private String corpNo;
    private String memberTypeCode;
    private String memberTypeCodeName;
    private char firstJoinYn;
    private String memberStatusCode;
    private String memberStatusCodeName;
    private String corpName;
    private String corpZip;
    private String corpJibunAddr;
    private String corpRoadAddr;
    private String corpDetailAddr;
    private String corpAddr;
    private String corpTelNo;
    private String corpFaxNo;
    private String corpEmail;
    private String name;
    private String mobile;
    private String telNo;
    private char useTermYn;
    private char personalInfoTermYn;
    private char cfmsServiceTermYn;
    private char marketingTermYn;
    private char sendAlimTalkTargetYn;
    private LocalDateTime passChangeDate;
    private LocalDateTime lastLoginDate;
    private List<WarehouseVo> warehouseVoList;
    private char useYn;
    private LocalDateTime regDate;
    private String regMid;
    private LocalDateTime modDate;
    private String modMid;

}
