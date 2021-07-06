<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/tagLibs.jsp" %>

<!DOCTYPE html>

<html lang="ko">
	<head>
		<title> :: COLO :: </title>
		<%@ include file="/include/commonMeta.jsp" %>
		<%@ include file="/include/commonStyleSheet.jsp" %>
		<%@ include file="/include/commonScript.jsp" %>
		<%@ include file="/include/commonBodyScript.jsp" %>
		<%@ include file="/include/commonGridScript.jsp" %>
		
	</head>
	<body>
		<div class="container">
			<%@ include file="/include/commonSideMenu.jsp" %>
			
			<div class="common-wrapper" style="overflow-x: hidden; width: 100%; height: 100%; position: relative;">
				<sitemesh:write property='body' />

				<%--   Alert 공용 모달 START   --%>
				<div id="common-alert-modal" class="set-common-modal-height">
					<div id="common-alert-modal-header-wrapper">
						<div id="common-alert-modal-header">제목</div>
						<div id="common-alert-modal-header-close-btn"></div>
					</div>
					<div id="common-alert-modal-body">내용</div>
					<div id="common-alert-modal-bottom">
						<div id="common-alert-modal-bottom-line"></div>
						<div id="common-alert-modal-bottom-btn-wrapper">
							<button id="common-alert-modal-btn-normal" class="common-alert-modal-btn">확인</button>
						</div>
						<div id="common-alert-modal-bottom-confirm-btn-wrapper">
							<button id="common-alert-modal-btn-confirm" class="common-alert-modal-btn-outline">네</button>
							<button id="common-alert-modal-btn-cancel" class="common-alert-modal-btn">아니요</button>
						</div>
					</div>
				</div>
				<%--   Alert 공용 모달 END   --%>

				<div id="common-alert-modal-bg"></div>

				<div class="footer" style="color: #808080;">
	        
		            <div id="footer-web" class="footer-wrapper" style="display: none;">
				        <div style="display: flex;">
				            <div style="margin-right: 48px; min-width: 158px;">
				                <p style="margin-bottom: 4px;">주식회사 콜로세움코퍼레이션</p>
				                <p class="grey">[06247] 서울특별시 강남구 역삼로 169, 3층 (명우빌딩)</p>
				            </div>
				            <div style="margin-right: 24px; min-width: 35px;">
				                <p style="margin-bottom: 4px;">대표이사</p>
				                <p class="grey">박진수</p>
				            </div>
				            <div style="margin-right: 24px; min-width: 62px;">
				                <p style="margin-bottom: 4px;">사업자등록번호</p>
				                <p class="grey">507-86-01649</p>
				            </div>
				            <div style="margin-right: 24px; min-width: 91px;">
				                <p style="margin-bottom: 4px;">통신판매업신고</p>
				                <p class="grey">2020-서울강남-01670</p>
				            </div>
				            <div style="margin-right: 24px; min-width: 62px;">
				                <p style="margin-bottom: 4px;">고객센터</p>
				                <p class="grey">1566-9527</p>
				            </div>
				            <div style="margin-top: -3px; min-width: 68px;">
				                <p><a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=5078601649" target="_blank" style="text-decoration:underline;">사업자정보 확인</a></p>
				                <p>
				                	<a href="/terms"  target="_blank" style="text-decoration:underline;">이용약관</a>
				                	<a href="/privacy" target="_blank" style="text-decoration:underline;margin-left:5px;">개인정보처리방침</a>
				                </p>
				            </div>
				        </div>
				        
				        <div style="min-width: 246px;">
				            <p class="grey" style="text-align: right;">Colosseum Fulfillment Operating Solution ver. 1.0<br />ⓒ 2021 Colosseum Corporation, Inc. all rights reserved.</p>
				        </div>
				    </div>
				    
				    
				    <div  id="footer-mobile" class="footer-wrapper" style="flex-direction: column;">
				        <div style="display: flex; flex-direction: column;">
					        <div style="display: flex; justify-content: space-between;">
					            <div style="margin-right: 48px; min-width: 158px; margin-bottom: 6px;">
					                <p style="margin-bottom: 2px;">주식회사 콜로세움코퍼레이션</p>
					                <p class="grey">[06247] 서울시 강남구 역삼로 169 명우빌딩 3층 A호</p>
					            </div>
					            <div style="min-width: 56px; margin-bottom: 6px;">
					                <p style="margin-bottom: 2px;">대표이사</p>
					                <p class="grey">박진수</p>
					            </div>
				            </div>
				            <div style="display: flex; justify-content: space-between;">
					            <div style="min-width: 62px; margin-bottom: 6px;">
					                <p style="margin-bottom: 2px;">사업자등록번호</p>
					                <p class="grey">507-86-01649</p>
					            </div>
					            <div style="min-width: 91px; margin-bottom: 6px;">
					                <p style="margin-bottom: 2px;">통신판매업신고</p>
					                <p class="grey">2020-서울강남-01670</p>
					            </div>
					            <div style="margin-right: 24px; min-width: 62px;">
					                <p style="margin-bottom: 4px;">고객센터</p>
					                <p class="grey">1566-9527</p>
					            </div>
				            </div>
				            <div style="display: flex; margin-bottom: 8px;">
					            <div style="margin-top: -3px; min-width: 68px; display: flex; justify-content: space-between;">
					                <p>
					                	<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=5078601649" target="_blank" style="text-decoration:underline;">사업자정보 확인</a>
					                	<a href="/terms" target="_blank" style="text-decoration:underline;">이용약관</a>
					                	<a href="/privacy" target="_blank" style="text-decoration:underline;">개인정보처리방침</a>
				                	</p>
					            </div>
				            </div>
				        </div>
				        <div style="min-width: 246px;">
				            <p class="grey" style="text-align: center;">Colosseum Fulfillment Operating Solution ver. 1.0<br id="footer-mobile-copyright-br" />ⓒ 2021 Colosseum Corporation, Inc. all rights reserved.</p>
				        </div>
				    </div>
				    
		        </div>
	        </div>
	        
		</div>
        
        <script>
        	$(document).ready(function() {
        		let isMobile = false;
        		(function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) isMobile = true;})(navigator.userAgent||navigator.vendor||window.opera);

        		// init footer type
        		if (isMobile) { // 모바일로 접속했을 경우

        			$('#footer-web').hide();
        			$('#footer-mobile').show();
        			
        			$('.mainContent').css('min-height', '640px');

        		} else { // 웹으로 접속했을 경우

					if ( $(window).width() < 1280 ) { // 해상도 기준보다 작을경우 모바일 푸터로 표시하기.

						$('#footer-web').hide();
						$('#footer-mobile').show();

						if (!isMobile) {
							$('#footer-mobile-copyright-br').hide();
						}

					} else {

						$('#footer-web').show();
						$('#footer-mobile').hide();

						$('#footer-mobile-copyright-br').show();

					}
        		}
        	})
        </script>
	</body>
</html>
