package kr.cfms.vo.warehouse;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WarehouseVo {

    private long warehouseSeq;                      /*창고고유번호*/
    private String wcode;                           /*창고고유코드*/
    private String rid;                             /*회원고유코드*/
    private String warehouseName;                   /*창고명*/
    private String warehouseZip;                    /*우편번호*/
    private String warehouseAddr;                   /*주소*/
    private String warehouseDetailAddr;             /*상세주소*/
    private String availableAreaKe01;               /*상온면적*/
    private String availableAreaKe02;               /*냉장면적*/
    private String availableAreaKe03;               /*냉동면적*/
    private String availablePalletKe01;             /*상온팔레트*/
    private String availablePalletKe02;             /*냉장팔레트*/
    private String availablePalletKe03;             /*냉동팔레트*/
    private String uuid;
    private String attachFileName;
    private String regMid;
    private String modMid;

}
