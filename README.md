# < colo_edu >
## 콜로세움 edu 개발

### [설정 관련] 
### `VM Options 등록 내용`  
 `-Dfile.encoding=UTF-8` <br>
 `-Dserver.port=8080` <br>
 `-Dspring.profiles.active=local` <br>
 `-Dlogs.dir=/각자지정/temp` <br>
  
- 그 외 특별한 것 없이 스프링 부트 기동!!
-------------------------------------------------
#차트 디테일 함수 정의

-------------------------------------------------

- ###selectAll(): select box에서 선택된 값이 없을 때
 
- ###selectSLWH(): select box값이 모두 선택 됐을때

- ###selectSL(): leftSelect값 불러올 때

- ###selectWH(): rightSelect값 불러올 때

# 재고부족 테이블 함수 정의

-----------------------------------------------------

- ###stockSelectNone(): select box에서 선택된 값이 없을 때

- ###stockSelectSLWH(): select box값이 모두 선택 됐을때

- ###stockSelectSL(): leftSelect값 불러올 때

- ###stockSelectWH(): rightSelect값 불러올 때

# 입고, 출고 id값

-----------------------------------------

- ###in_expected: 입고 예정

- ###in_working: 입고 작업중

- ###in_complete: 입고 완료

- ###in_cancel: 입고 취소

--------------------------------------

- ### out_expected: 출고 예정

- ### out_working: 출고 작업중

- ### out_complete: 출고 완료

- ### out_cancel: 출고 취소