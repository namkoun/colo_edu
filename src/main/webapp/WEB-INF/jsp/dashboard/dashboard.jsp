<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/tagLibs.jsp" %>
<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.4.1/dist/chart.min.js"></script>
<!-- 아이콘 -->
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>
<!-- 테이블 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
<!-- Latest compiled and minified Locales -->
<script src="https://unpkg.com/bootstrap-table@1.18.3/dist/locale/bootstrap-table-zh-CN.min.js"></script>

<div class="mainContent" >
	<div class="close-wrap"></div>
	<div class="item-container item-wrapper" >
		<div class="item-title">
			<div style="display:block;">
				<span>대시보드</span>
				<h1>대시보드</h1>
			</div>
			<div class="bell-wrap">
				<div class="msg-count" >
               <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger bell-on-off" style="display: none;">
                        <span style="color: white">N</span>
                   <span class="visually-hidden">unread messages</span>
               </span>
					<a id="ccccc"><span ><i class="fas fa-bell fa-3x"></i></span></a>
				</div>
			</div>
			<div class="Alert-Box" id="Alert-Box">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item " role="presentation">
						<span class="msg-smallBeen msg-smallBeen1" style="display: none;"></span>
						<button class="nav-link ac ac1 show active " id="inWE" data-type="inWE" data-bs-toggle="tab" data-bs-target="#Alert1" type="button" role="tab" aria-controls="home" aria-selected="true">&nbsp;&nbsp;입고신청&nbsp;</button>
					</li>
					<li class="nav-item" role="presentation">
						<span class="msg-smallBeen msg-smallBeen2" style="display: none;"></span>
						<button class="nav-link ac ac2" id="outWE" data-type="outWE" data-bs-toggle="tab" data-bs-target="#Alert2" type="button" role="tab" aria-controls="profile" aria-selected="false">&nbsp;&nbsp;출고신청&nbsp;</button>
					</li>
					<li class="nav-item" role="presentation">
						<span class="msg-smallBeen msg-smallBeen3" style="display: none;"></span>
						<button class="nav-link ac ac3" id="noOutSt" data-type="noOutSt" data-bs-toggle="tab" data-bs-target="#Alert3" type="button" role="tab" aria-controls="contact" aria-selected="false">미진행출고</button>
					</li>
					<li class="nav-item" role="presentation">
						<span class="msg-smallBeen msg-smallBeen4" style="display: none;"></span>
						<button class="nav-link ac ac4" id="join"  data-type="join" data-bs-toggle="tab" data-bs-target="#Alert4" type="button" role="tab" aria-controls="contact" aria-selected="false">&nbsp;회원가입</button>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade ac ac1 show active " id="Alert1" role="tabpanel" aria-labelledby="inWE"  >
						<%--입고신청--%>
					</div>
					<div class="tab-pane fade ac ac2" id="Alert2" role="tabpanel" aria-labelledby="outWE">
						<%--출고신청--%>
					</div>
					<div class="tab-pane fade ac ac3" id="Alert3" role="tabpanel" aria-labelledby="noOutSt">
						<%--미진행출고건--%>
					</div>
					<div class="tab-pane fade ac ac4" id="Alert4" role="tabpanel" aria-labelledby="join">
						<%--회원가입--%>
					</div>
				</div>
			</div>
		</div>
		<div class="p-box">
			<h2>오늘전체입고량</h2><h2>오늘전체출고량</h2>
		</div>
		<div class="total-sum">
			<div>
				<p>입고신청</p>
				<img src="${contextPath}/assets/images/icon/dashboard/in-object.png" alt="" style="width: 100px; height: 100px;">
				<span  id="in-sum" style="font-size: 50px; color: #0a217f">0</span>
			</div>
			<div>
				<p>입고완료</p>
				<img src="${contextPath}/assets/images/icon/dashboard/seccess.png" alt="" style="width: 100px; height: 100px;">
				<span  id="in-complete" style="font-size: 50px; color: #0a217f";>0</span>
			</div>
			<div>
				<p>출고신청</p>
				<img src="${contextPath}/assets/images/icon/dashboard/out-object.png" alt="" style="width: 100px; height: 100px;">
				<span id="out-sum" style="font-size: 50px; color: #0a217f";>0</span>
			</div>
			<div>
				<p>출고완료</p>
				<img src="${contextPath}/assets/images/icon/dashboard/seccess.png" alt="" style="width: 100px; height: 100px;">
				<span id="out-complete" style="font-size: 50px; color: #0a217f;">0</span>
			</div>
		</div>
		<!-- 선택 -->
		<div class="select-home">
			<div>
				<button type="button" class="btn btn-sm buttonmwd status tdwdmd btn-select-m btn-on-select kAw" data-type="month" style="margin-left: 120px;">한달</button>
				<button type="button" class="btn btn-sm buttonmwd status tdwdmd btn-select-w kAw" style="margin-left: 55px;" data-type="week">일주일</button>
				<button type="button" class="btn btn-sm buttonmwd status tdwdmd btn-select-t kAw" data-type="day">오늘</button>
			</div>
			<div class="select-wrap">
				<input class="btn-success kAw" data-width="160" id="input-data" data-style="slow" type="checkbox" checked data-toggle="toggle" data-on="셀러 " data-off="창고 " data-onstyle="light" data-offstyle="light">
				<select id="in-select" name="in-select"  class="form-select kAw" style="margin: 0 20px" ></select>
				<select id="out-select" name="out-select" class="form-select kAw" ></select>
			</div>
		</div>
		<div class="data-wrap">
			<div class="data-wrap-sub">
				<div class="span-font-size">
					<span>입고</span>
				</div>
				<div class="data-wrap-main">
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img style="margin-left: 5px;" src="${contextPath}/assets/images/icon/dashboard/in1.png" /> </span>
						<span>입고 예정</span>
						<span id="in_expected">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-caret-right "></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/in3.png" /> </span>
						<span>입고 작업중</span>
						<span id="in_working">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-caret-right "></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/in4.png" /> </span>
						<span>입고 완료</span>
						<span id="in_complete">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-plus-lg"></i>
					<div style="display: flex;flex-direction: column;align-items: center;">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/out-x.png" /> </span>
						<span>입고 취소</span>
						<span id="in_cancel">0</span>
						<span>건</span>
					</div>
				</div>
			</div>
			<!-- 출고 -->         <!-- width값 조정 -->
			<div class="data-wrap-sub">
				<div class="span-font-size">
					<span>출고</span>
				</div>
				<div class="data-wrap-main">
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img style="margin-left: 5px;" src="${contextPath}/assets/images/icon/dashboard/out1.png" /> </span>
						<span>출고 예정</span>
						<span id="out_expected">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-caret-right "></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/out2.png" /> </span>
						<span>출고 작업중</span>
						<span id="out_working">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-caret-right "></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/out3.png" /> </span>
						<span>출고 완료</span>
						<span id="out_complete">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-plus-lg"></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/out-x.png" /> </span>
						<span>취소</span>
						<span id="out_cancel">0</span>
						<span>건</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 재고 테이블 -->
		<div class="inventory-detail" >
			<table id="inventoryTable" class="table table-dark text-center table-hover" data-height="450" style="text-align: center;">
				<thead class="bootstrap-tableView" style="display: none;">
				<tr>
					<th data-field="goodsNm">상품명</th>
					<th data-field="stkQty">현재고량</th>
					<th data-field="missQty">결품수량</th>
					<th data-field="inStkQty">입고중인 상품 수</th>
					<th data-field="lastInOrdDt">최종입고일</th>
					<th data-field="safeStkQty">안전재고 수량 기준</th>
				</tr>
				</thead>
			</table>
		</div>
	</div>
</div>
<div class="wrap-loading display-none">
	<div><img src="https://www.hanja4u.org/public/common/images/common/loading.gif" /></div>
</div>
<!--------------------------script----------------------------------->
<script type="text/javascript">
	//알림 시작

	//입고 알림
	function selectNotiin(){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchInOrdNotification',
			type: 'GET',
			dataType: 'json',
			contentType: 'application/;charset=UTF-8',
			success:function (data){
				$("#Alert1").empty();
				for (let i = 0; i<data.length; i++){
					$("#Alert1").append("<div class=\"msg-wrap\">\n" +
							"\t\t\t\t\t\t\t\t<div class=\"msg-day\">\n" +
							data[i].createDt.substr(2,8) +"<br>"+data[i].createDt.substr(11,5)+
							"\t\t\t\t\t\t\t\t</div>\n" +
							"\t\t\t\t\t\t\t\t<a>\n" +
							"\t\t\t\t\t\t\t\t\t<div class=\"msg-text\">\n" +
							data[i].content+
							"\t\t\t\t\t\t\t\t\t</div>\n" +
							"\t\t\t\t\t\t\t\t</a>\n" +
							"\t\t\t\t\t\t\t\t<div><div class=\"msg-been msg-been1"+i+"\"></div></div>\n" +
							"\t\t\t\t\t\t\t</div>");
					if (data[i].readYn === 'N'){
						$('.msg-been1'+i).show();
						$(".msg-smallBeen1").show();
					}else {
						$('.msg-been1'+i).hide();
						$(".msg-smallBeen1").hide();
					}
					var adNotification = {
						id: data[i].id
					}
                    if (data[i].readYn === 'N'){
                        selectNotiinup(adNotification);
                    }
				}
			}
		});
	}

	//업뎃(알림)
	function selectNotiinup(id){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.add + '/readNotification',
			type: 'POST',
			data: JSON.stringify(id),
			dataType: 'json',
			contentType: 'application/json;charset=UTF-8',
			success:function (data) {
			}
		})
	}
	//출고 알림
	function selectNotiout(){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchOutOrdNotification',
			type: 'GET',
			dataType: 'json',
			contentType: 'application/;charset=UTF-8',
			success:function (data){
				$("#Alert2").empty();
				for (let i = 0; i<data.length; i++){
					$("#Alert2").append("<div class=\"msg-wrap\">\n" +
							"\t\t\t\t\t\t\t\t<div class=\"msg-day\">\n" +
							data[i].createDt.substr(2,8) +"<br>"+data[i].createDt.substr(11,5)+
							"\t\t\t\t\t\t\t\t</div>\n" +
							"\t\t\t\t\t\t\t\t<a>\n" +
							"\t\t\t\t\t\t\t\t\t<div class=\"msg-text\">\n" +
							data[i].content+
							"\t\t\t\t\t\t\t\t\t</div>\n" +
							"\t\t\t\t\t\t\t\t</a>\n" +
							"\t\t\t\t\t\t\t\t<div><div class=\"msg-been msg-been2"+i+"\"></div></div>\n" +
							"\t\t\t\t\t\t\t</div>");
					if (data[i].readYn === 'Y'){
						$('.msg-been2'+i).hide();
						$(".msg-smallBeen2").hide();
					}else {
						$('.msg-been2'+i).show();
						$(".msg-smallBeen2").show();
					}
					var adNotification = {
						id: data[i].id
					}
                    if (data[i].readYn === 'N'){
                        selectNotiinup(adNotification);
                    }
				}
			}
		});
	}
	//미진행 출고건(시작)시 값넣어주기
	function searchUnFinishedOut(){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.add + '/searchUnFinishedOut',
			type: 'POST',
			dataType: 'json',
			contentType: 'application/;charset=UTF-8',
			success:function (data) {
			}
		})
	}
	//미진행출고 알림
	function selectNotino(){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchUnFinishedOutNotification',
			type: 'GET',
			dataType: 'json',
			contentType: 'application/;charset=UTF-8',
			success:function (data){
				$("#Alert3").empty();
				for (let i = 0; i<data.length; i++){
					$("#Alert3").append("<div class=\"msg-wrap\">\n" +
							"\t\t\t\t\t\t\t\t<div class=\"msg-day\">\n" +
							data[i].createDt.substr(2,8) +"<br>"+data[i].createDt.substr(11,5)+
							"\t\t\t\t\t\t\t\t</div>\n" +
							"\t\t\t\t\t\t\t\t<a>\n" +
							"\t\t\t\t\t\t\t\t\t<div class=\"msg-text\">\n" +
							data[i].content+
							"\t\t\t\t\t\t\t\t\t</div>\n" +
							"\t\t\t\t\t\t\t\t</a>\n" +
							"\t\t\t\t\t\t\t\t<div><div class=\"msg-been msg-been3"+i+"\"></div></div>\n" +
							"\t\t\t\t\t\t\t</div>");
					if (data[i].readYn === 'N'){
						$('.msg-been3'+i).show();
						$(".msg-smallBeen3").show();
					}else {
						$('.msg-been3'+i).hide();
						$(".msg-smallBeen3").hide();
					}
					var adNotification = {
						id: data[i].id
					}
					if (data[i].readYn === 'N'){
                        selectNotiinup(adNotification);
                    }

				}
			}
		});
	}
	//회원가입 알림
	function selectNotijo(){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchJoinNotification',
			type: 'GET',
			dataType: 'json',
			contentType: 'application/;charset=UTF-8',
			success:function (data){
				$("#Alert4").empty();
				for (let i = 0; i<data.length; i++){
					$("#Alert4").append("<div class=\"msg-wrap\">\n" +
							"\t\t\t\t\t\t\t\t<div class=\"msg-day\">\n" +
							data[i].createDt.substr(2,8) +"<br>"+data[i].createDt.substr(11,5)+
							"\t\t\t\t\t\t\t\t</div>\n" +
							"\t\t\t\t\t\t\t\t<a>\n" +
							"\t\t\t\t\t\t\t\t\t<div class=\"msg-text\">\n" +
							data[i].content+
							"\t\t\t\t\t\t\t\t\t</div>\n" +
							"\t\t\t\t\t\t\t\t</a>\n" +
							"\t\t\t\t\t\t\t\t<div><div class=\"msg-been msg-been4"+i+"\"></div></div>\n" +
							"\t\t\t\t\t\t\t</div>");
					if (data[i].readYn === 'N'){
						$('.msg-been4'+i).show();
						$(".msg-smallBeen4").show();
					}else {
						$('.msg-been4'+i).hide();
						$(".msg-smallBeen4").hide();
					}
					var adNotification = {
						id: data[i].id
					}
                    if (data[i].readYn === 'N'){
                        selectNotiinup(adNotification);
                    }

				}
			}
		});
	}
	//메뉴탭bell 표시
	function selectNotise(){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchIsReadNotificationByTypeCd',
			type: 'GET',
			dataType: 'json',
			contentType: 'application/;charset=UTF-8',
			success:function (data) {
				if (data.countInOrd > 0){
					$(".msg-smallBeen1").show();
				}else {
					$(".msg-smallBeen1").hide();
				}
				if (data.countOutOrd > 0){
					$(".msg-smallBeen2").show();
				}else {
					$(".msg-smallBeen2").hide();
				}
				if (data.countUnFinishOut > 0){
					$(".msg-smallBeen3").show();
				}else {
					$(".msg-smallBeen3").hide();
				}
				if (data.countJoin > 0){
					$(".msg-smallBeen4").show();
				}else {
					$(".msg-smallBeen4").hide();
				}

			}
		})
	}
	function notiall() {
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.add + '/insertNewInfo',
			type: 'POST',
			dataType: 'json',
			contentType: 'application/json;charset=UTF-8',
			success:function (data){
			},
		});
	}
	function notibell() {
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchIsReadNotification',
			type: 'GET',
			dataType: 'json',
			contentType: 'application/json;charset=UTF-8',
			success:function (data){
				if (data === 0){
					$(".bell-on-off").show();
				}else{
					$(".bell-on-off").hide();
				}
			},
		});
	}

	//interval start
    searchUnFinishedOut();
    notibell();
    var setInterall= setInterval(notiall, 3000);
    var setInterbell =setInterval(notibell,3000);
    $(document).ready(function(){
        //종을 눌렀을때(알림)
        $("#ccccc").off().on("click",function (){
            if ($("#Alert-Box").css("display")=== "none"){
                clearInterval(setInterall);
                clearInterval(setInterbell);
                $(".ac").removeClass('show active');
                $(".ac1").addClass('show active');
                $("#Alert-Box").show();
                selectNotiin(); //입고 조회
                selectNotise(); //조회 bell
                clearInterval(setInterall);
                clearInterval(setInterbell);
                $(".nav-link").off().on("click",function (){
                    if ($(this).data('type') === "inWE"){
                        $(".ac").removeClass('show active');
                        $(".ac1").addClass('show active');
                        selectNotiin();
                        selectNotise();
                    }else if($(this).data('type') === 'outWE'){
                        $(".ac").removeClass('show active');
                        $(".ac2").addClass('show active');
                        selectNotiout();
                        selectNotise();
                    }else if($(this).data('type') === 'noOutSt'){
                        $(".ac").removeClass('show active');
                        $(".ac3").addClass('show active');
                        selectNotino();
                        selectNotise();
                    }else if($(this).data('type') === 'join'){
                        $(".ac").removeClass('show active');
                        $(".ac4").addClass('show active');
                        selectNotijo();
                        selectNotise();
                    }
                })
                // 예외성처리(알림)
                $(".close-wrap, .inventory-detail, .kAw").on("click", function (){
                    notibell();
                    $("#Alert-Box").hide();
                    setInterall = setInterval(notiall, 3000);
                    setInterbell = setInterval(notibell, 3000);
                })
            }else {
                $("#Alert-Box").hide();
                notibell();
                setInterall = setInterval(notiall, 3000);
                setInterbell = setInterval(notibell, 3000);
            }
        });
    })
	//여기까지 알림기능

	//전역변수
	var leftselect = "";
	var rightselect = "";
	var today = new Date();
	var toDate = "";
	var fromDate = "";
	var day = getMonthType();
	var one = -1;
	//선택 스위치버튼
	$("#out-select").empty();

	selectsl(day);
	stockSelectSL(one);
	$('.tdwdmd').on('click', function(e) {
		if ( $(this).data('type') === 'day' ) { // 오늘 클릭
			$(".tdwdmd").removeClass('btn-on-select');
			$(".btn-select-t").addClass('btn-on-select');  //버튼색↑
			day = getDayType();
			$("#out-select").empty();
			selectsl(day);

		} else if ( $(this).data('type') === 'week' ) { // 이번 주 클릭
			$(".tdwdmd").removeClass('btn-on-select');
			$(".btn-select-w").addClass('btn-on-select'); //버튼색↑
			day = getWeekType();
			$("#out-select").empty();
			selectsl(day);
		} else if ( $(this).data('type') === 'month' ) { // 이번 달 클릭
			$(".tdwdmd").removeClass('btn-on-select');
			$(".btn-select-m").addClass('btn-on-select'); //버튼색↑
			day = getMonthType();
			$("#out-select").empty();
			selectsl(day);
		}
	});
	$(document).ready(function(){
		getTotalSum();//전체 출/입고량 실행
		$('#input-data').change(function() {
			if ($(this).prop('checked')){
				selectsl(day);
				$('.tdwdmd').on('click', function(e) {
					if ( $(this).data('type') === 'day' ) { // 오늘 클릭
						day = getDayType();
						$("#out-select").empty();
						selectsl(day);
					} else if ( $(this).data('type') === 'week' ) { // 이번 주 클릭
						day = getWeekType();
						$("#out-select").empty();
						selectsl(day);
					} else if ( $(this).data('type') === 'month' ) { // 이번 달 클릭
						day = getMonthType();
						$("#out-select").empty();
						selectsl(day);
					}
				});
			}else {
				selectwh(day);
				$('.tdwdmd').on('click', function(e) {
					if ( $(this).data('type') === 'day' ) { // 오늘 클릭
						day = getDayType();
						$("#out-select").empty();
						selectwh(day);

					} else if ( $(this).data('type') === 'week' ) { // 이번 주 클릭
						day = getWeekType();
						$("#out-select").empty();
						selectwh(day);

					} else if ( $(this).data('type') === 'month' ) { // 이번 달 클릭
						day = getMonthType();
						$("#out-select").empty();
						selectwh(day);

					}
				});
			}
		})
// datepicker Korean option
		function initDatePickers() {
			$.datepicker.regional['ko'] = {
				closeText: '닫기',
				prevText: '이전달',
				nextText: '다음달',
				currentText: '오늘',
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				weekHeader: 'Wk',
				dateFormat: 'yy-mm-dd',
				firstDay: 0,
				isRTL: false,
				duration: 200,
				showAnim: 'show',
				showMonthAfterYear: true,
				yearSuffix: '년'
			};
			$.datepicker.setDefaults($.datepicker.regional['ko']);
			var currentYear = (new Date()).getFullYear();
			var startYear = currentYear - 10;
			var options = {
				startYear: startYear,
				finalYear: currentYear,
				pattern: 'yyyy-mm',
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
			};
			$('#schMonth').monthpicker(options);
// make year selector
			for (var i = currentYear; i >= startYear; i--) {
				if ($("#schYear").attr("pathValue") == i) {
					$("#schYear").append("<option value='" + i + "' selected>" + i + "</option>");
				} else {
					$('#schYear').append("<option value='" + i + "'>" + i + "</option>");
				}
			}
		}
		$(function() {;
			(function($) {
				var methods = {
					init: function(options) {
						return this.each(function() {
							var
									$this = $(this),
									data = $this.data('monthpicker'),
									year = (options && options.year) ? options.year : (new Date()).getFullYear(),
									settings = $.extend({
										pattern: 'mm/yyyy',
										selectedMonth: null,
										selectedMonthName: '',
										selectedYear: year,
										startYear: year - 10,
										finalYear: year + 10,
										monthNames: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
										id: "monthpicker_" + (Math.random() * Math.random()).toString().replace('.', ''),
										openOnFocus: true,
										disabledMonths: []
									}, options);
							settings.dateSeparator = settings.pattern.replace(/(mmm|mm|m|yyyy|yy|y)/ig, '');
// If the plugin hasn't been initialized yet for this element
							if (!data) {
								$(this).data('monthpicker', {
									'target': $this,
									'settings': settings
								});
								if (settings.openOnFocus === true) {
									$this.on('focus', function() {
										$this.monthpicker('show');
									});
								}
								$this.monthpicker('parseInputValue', settings);
								$this.monthpicker('mountWidget', settings);
								$this.on('monthpicker-click-month', function(e, month, year) {
									$this.monthpicker('setValue', settings);
									$this.monthpicker('hide');
								});
								// hide widget when user clicks elsewhere on page
								$this.addClass("mtz-monthpicker-widgetcontainer");
								$(document).unbind("mousedown.mtzmonthpicker").on("mousedown.mtzmonthpicker", function(e) {
									if (!e.target.className || e.target.className.toString().indexOf('mtz-monthpicker') < 0) {
										$(this).monthpicker('hideAll');
									}
								});
							}
						});
					},
					show: function() {
						$(this).monthpicker('hideAll');
						var widget = $('#' + this.data('monthpicker').settings.id);
						widget.css("top", this.offset().top + this.outerHeight());
						if ($(window).width() > (widget.width() + this.offset().left)) {
							widget.css("left", this.offset().left);
						} else {
							widget.css("left", this.offset().left - widget.width());
						}
						widget.show();
						widget.find('select').focus();
						this.trigger('monthpicker-show');
					},
					hide: function() {
						var widget = $('#' + this.data('monthpicker').settings.id);
						if (widget.is(':visible')) {
							widget.hide();
							this.trigger('monthpicker-hide');
						}
					},
					hideAll: function() {
						$(".mtz-monthpicker-widgetcontainer").each(function() {
							if (typeof($(this).data("monthpicker")) != "undefined") {
								$(this).monthpicker('hide');
							}
						});
					},
					setValue: function(settings) {
						var
								month = settings.selectedMonth,
								year = settings.selectedYear;
						if (settings.pattern.indexOf('mmm') >= 0) {
							month = settings.selectedMonthName;
						} else if (settings.pattern.indexOf('mm') >= 0 && settings.selectedMonth < 10) {
							month = '0' + settings.selectedMonth;
						}
						if (settings.pattern.indexOf('yyyy') < 0) {
							year = year.toString().substr(2, 2);
						}
						if (settings.pattern.indexOf('y') > settings.pattern.indexOf(settings.dateSeparator)) {
							this.val(month + settings.dateSeparator + year);
						} else {
							this.val(year + settings.dateSeparator + month);
						}
						this.change();
					},
					disableMonths: function(months) {
						var
								settings = this.data('monthpicker').settings,
								container = $('#' + settings.id);
						settings.disabledMonths = months;
						container.find('.mtz-monthpicker-month').each(function() {
							var m = parseInt($(this).data('month'));
							if ($.inArray(m, months) >= 0) {
								$(this).addClass('ui-state-disabled');
							} else {
								$(this).removeClass('ui-state-disabled');
							}
						});
					},
					mountWidget: function(settings) {
						var
								monthpicker = this,
								container = $('<div id="' + settings.id + '" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" />'),
								header = $('<div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all mtz-monthpicker" />'),
								combo = $('<select class="mtz-monthpicker mtz-monthpicker-year" />'),
								table = $('<table class="mtz-monthpicker" />'),
								tbody = $('<tbody class="mtz-monthpicker" />'),
								tr = $('<tr class="mtz-monthpicker" />'),
								td = '',
								selectedYear = settings.selectedYear,
								option = null,
								attrSelectedYear = $(this).data('selected-year'),
								attrStartYear = $(this).data('start-year'),
								attrFinalYear = $(this).data('final-year');
						if (attrSelectedYear) {
							settings.selectedYear = attrSelectedYear;
						}
						if (attrStartYear) {
							settings.startYear = attrStartYear;
						}
						if (attrFinalYear) {
							settings.finalYear = attrFinalYear;
						}
						container.css({
							position: 'absolute',
							zIndex: 999999,
							whiteSpace: 'nowrap',
							width: '250px',
							overflow: 'hidden',
							textAlign: 'center',
							display: 'none',
							top: monthpicker.offset().top + monthpicker.outerHeight(),
							left: monthpicker.offset().left
						});
						combo.on('change', function() {
							var months = $(this).parent().parent().find('td[data-month]');
							months.removeClass('ui-state-active');
							if ($(this).val() == settings.selectedYear) {
								months.filter('td[data-month=' + settings.selectedMonth + ']').addClass('ui-state-active');
							}
							monthpicker.trigger('monthpicker-change-year', $(this).val());
						});
// mount years combo
						for (var i = settings.startYear; i <= settings.finalYear; i++) {
							var option = $('<option class="mtz-monthpicker" />').attr('value', i).append(i);
							if (settings.selectedYear == i) {
								option.attr('selected', 'selected');
							}
							combo.append(option);
						}
						header.append(combo).appendTo(container);
// mount months table
						for (var i = 1; i <= 12; i++) {
							td = $('<td class="ui-state-default mtz-monthpicker mtz-monthpicker-month" style="padding:5px;cursor:default;" />').attr('data-month', i);
							if (settings.selectedMonth == i) {
								td.addClass('ui-state-active');
							}
							td.append(settings.monthNames[i - 1]);
							tr.append(td).appendTo(tbody);
							if (i % 3 === 0) {
								tr = $('<tr class="mtz-monthpicker" />');
							}
						}
						tbody.find('.mtz-monthpicker-month').on('click', function() {
							var m = parseInt($(this).data('month'));
							if ($.inArray(m, settings.disabledMonths) < 0) {
								settings.selectedYear = $(this).closest('.ui-datepicker').find('.mtz-monthpicker-year').first().val();
								settings.selectedMonth = $(this).data('month');
								settings.selectedMonthName = $(this).text();
								monthpicker.trigger('monthpicker-click-month', $(this).data('month'));
								$(this).closest('table').find('.ui-state-active').removeClass('ui-state-active');
								$(this).addClass('ui-state-active');
							}
						});
						table.append(tbody).appendTo(container);
						container.appendTo('body');
					},
					destroy: function() {
						return this.each(function() {
							$(this).removeClass('mtz-monthpicker-widgetcontainer').unbind('focus').removeData('monthpicker');
						});
					},
					getDate: function() {
						var settings = this.data('monthpicker').settings;
						if (settings.selectedMonth && settings.selectedYear) {
							return new Date(settings.selectedYear, settings.selectedMonth - 1);
						} else {
							return null;
						}
					},
					parseInputValue: function(settings) {
						if (this.val()) {
							if (settings.dateSeparator) {
								var val = this.val().toString().split(settings.dateSeparator);
								if (settings.pattern.indexOf('m') === 0) {
									settings.selectedMonth = val[0];
									settings.selectedYear = val[1];
								} else {
									settings.selectedMonth = val[1];
									settings.selectedYear = val[0];
								}
							}
						}
					}
				};
				$.fn.monthpicker = function(method) {
					if (methods[method]) {
						return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
					} else if (typeof method === 'object' || !method) {
						return methods.init.apply(this, arguments);
					} else {
						$.error('Method ' + method + ' does not exist on jQuery.mtz.monthpicker');
					}
				};
			})(jQuery);
			Date.prototype.yyyymmdd = function() {
				var mm = this.getMonth() + 1; // getMonth() is zero-based
				var dd = this.getDate();
				return [this.getFullYear(),
					(mm>9 ? '' : '0') + mm,
					(dd>9 ? '' : '0') + dd
				].join('-');
			};
			var date = new Date();
			var schDate = date.yyyymmdd();
			$('#schDate').val(schDate);
			$('#schMonth').val(schDate.substr(0,7));
			initDatePickers();
		});
	});
	//전체 출/입고량
	function getTotalSum(){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchTodayInOut',
			type: 'GET',
			dataType: 'json',
			contentType: 'application/json;charset=UTF-8',
			success:function (data){
						$('#in-sum').text(data.todayInApply);
						$('#in-complete').text(data.todayInComplete);
						$('#out-sum').text(data.todayOutApply);
						$('#out-complete').text(data.todayOutComplete);
			},
		});
	}
	//sl버튼
	function selectsl(day){
		$.ajax({
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchSLCenterList',
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(Data) {
				$("#out-select").empty();
				$("#in-select").empty();
				$("#in-select").append('<option value="-1" selected>셀러를 선택해주세요.</option>');
				$("#in-select").append('<option value="all" id="All" >전체</option>');
				$("#out-select").append('<option value="-1" selected>창고를 선택해주세요.</option>');
				for (var i = 0; i < Data.length; i++) {
					$("#in-select").append('<option value="'+ Data[i].id +'" >'+Data[i].centerNm+'</option>');
				}
				$("#in-select").unbind("change");
//sl 선택후 wh부분
				$("#in-select").change(function (){
					leftselect = $("select[name=in-select]").val();
					if ($("select[name=in-select]").val() === 'all'){
						$("#out-select").empty();
						$("#out-select").append('<option value="-1" selected>창고를 선택해주세요.</option>');
						stockSelectNone();
						selectAll(day,getDayType());
					}else {
						stockSelectSL(leftselect);
						selectSL(day,getDayType(),leftselect);
						$.ajax({
							url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchWHCenterListBySLCenterId',
							type : 'GET',
							data : {
								id : leftselect,
							},
							dataType : 'json',
							contentType : 'application/json;charset=UTF-8',
							success : function(whData) {
								$("#out-select").empty();
								$("#out-select").append('<option value="all" selected>창고를 선택해주세요.</option>');
								for (var i = 0; i < whData.length; i++) {
									$("#out-select").append('<option value="'+ whData[i].id +'" >'+whData[i].centerNm+'</option>');
								}
								$("#out-select").off('change');
								$("#out-select").change(function (){
									rightselect = $("select[name=out-select]").val();
									stockSelectSLWH(leftselect,rightselect);
									selectSLWH(day,getDayType(),leftselect,rightselect);
								})
							}
						})
					}
				})
			}
		});
	};
	//wh버튼
	function selectwh(day){
		$.ajax({
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchWHCenterList',
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(Data) {
				$("#in-select").empty();
				$("#out-select").empty();
				$("#in-select").append('<option value="-1" selected> 창고를 선택해주세요.</option>');
				$("#in-select").append('<option value="all" id="all">전체</option>');
				$("#out-select").append('<option value="-1" selected> 셀러를 선택해주세요.</option>');
				for (var i = 0; i < Data.length; i++) {
					$("#in-select").append('<option value="'+ Data[i].id +'" >'+Data[i].centerNm+'</option>');
				}
				$("#in-select").unbind("change");
//wh 선택후 sl부분
				$("#in-select").change(function (){
					leftselect = $("select[name=in-select]").val();
					if ($("select[name=in-select]").val() === 'all'){
						$("#out-select").empty();
						$("#out-select").append('<option value="-1" selected> 셀러를 선택해주세요.</option>');
						stockSelectNone();
						selectAll(day,getDayType());
					}else {
						stockSelectWH(leftselect);
						selectWH(day,getDayType(),leftselect);
						$.ajax({
							url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchSLCenterListByWHCenterId',
							type : 'GET',
							data : {
								id : leftselect,
							},
							dataType : 'json',
							contentType : 'application/json;charset=UTF-8',
							success : function(slData) {
								$("#out-select").empty();
								$("#out-select").append('<option value="all" selected>셀러를 선택해주세요.</option>');
								for (var i = 0; i < slData.length; i++) {
									$("#out-select").append('<option value="'+ slData[i].id +'" >'+slData[i].centerNm+'</option>');
								}
								$("#out-select").off('change');
								$("#out-select").change(function (){
									rightselect = $("select[name=out-select]").val();
									stockSelectWHSL(leftselect,rightselect);
									selectWHSL(day,getDayType(),leftselect,rightselect);
								})
							}
						})
					}
				})
			}
		});
	};
	//select data format
	function getSelectData(data){
				var $a = data.inTobe.split('/');
				var $b = data.inWorking.split('/');
				var $c = data.inComplete.split('/');
				var $d = data.inCancle.split('/');
				$('#in_expected').text($a[0]);
				$('#in_working').text($b[0]);
				$('#in_complete').text($c[0]);
				$('#in_cancel').text($d[0]);
				$('#out_expected').text(data.outTobe);
				$('#out_working').text(data.outWorking);
				$('#out_complete').text(data.outComplete);
				$('#out_cancel').text(data.outCancle);
	}
	//전체 선택
	function selectAll(fromDate,toDate){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchInOutStatus',
			type: 'GET',
			data : {
				fromDate : fromDate,
				toDate : toDate,
			},
			dataType: 'json',
			contentType: 'application/json;charset=UTF-8',
			success:function (data){
				getSelectData(data);
			},
			beforeSend:function(){
				$('.wrap-loading').removeClass('display-none');
			}
			,complete:function(){
				$('.wrap-loading').addClass('display-none');
			},
		});
	}
	//둘다선택(셀러기준)
	function selectSLWH(fromDate,toDate,leftSelect,rightSelect){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchInOutStatusByWHAndSL',
			type: 'GET',
			data : {
				whId: rightSelect,
				custId: leftSelect,
				fromDate : fromDate,
				toDate : toDate,
			},
			dataType: 'json',
			contentType: 'application/json;charset=UTF-8',
			success:function (data){
				getSelectData(data);
			},
			beforeSend:function(){
				$('.wrap-loading').removeClass('display-none');
			}
			,complete:function(){
				$('.wrap-loading').addClass('display-none');
			},
		});
	}
	//둘다선택(창고기준)
	function selectWHSL(fromDate,toDate,leftSelect,rightSelect){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchInOutStatusByWHAndSL',
			type: 'GET',
			data : {
				whId: leftSelect,
				custId: rightSelect,
				fromDate : fromDate,
				toDate : toDate,
			},
			dataType: 'json',
			contentType: 'application/json;charset=UTF-8',
			success:function (data){
				getSelectData(data);
			},
			beforeSend:function(){
				$('.wrap-loading').removeClass('display-none');
			}
			,complete:function(){
				$('.wrap-loading').addClass('display-none');
			},
		});
	}
	//셀러만 선택
	function selectSL(fromDate,toDate,leftSelect){
		if($("select[name=in-select]").val() === 'all'){
			selectAll(getMonthType(),getDayType());
		}else {
			$.ajax({
				url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchInOutStatusBySL',
				type: 'GET',
				data : {
					fromDate : fromDate,
					toDate : toDate,
					custId: leftSelect
				},
				dataType: 'json',
				contentType: 'application/json;charset=UTF-8',
				success:function (data){
					getSelectData(data);
				},
				beforeSend:function(){
					$('.wrap-loading').removeClass('display-none');
				}
				,complete:function(){
					$('.wrap-loading').addClass('display-none');
				},
			});
		}
	}
	//창고만 선택
	function selectWH(fromDate,toDate,leftselect){
		if($("select[name=in-select]").val() === 'all'){
			selectAll(getMonthType(),getDayType());
		}else {
			$.ajax({
				url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchInOutStatusByWH',
				type: 'GET',
				data : {
					fromDate : fromDate,
					toDate : toDate,
					whId: leftselect
				},
				dataType: 'json',
				contentType: 'application/json;charset=UTF-8',
				success:function (data){
					getSelectData(data);
				},
				beforeSend:function(){
					$('.wrap-loading').removeClass('display-none');
				}
				,complete:function(){
					$('.wrap-loading').addClass('display-none');
				},
			});
		}
	}
	//재고부족 테이블 시작
	//둘다 선택 안했을 때
	function stockSelectNone(){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchStockLackAll',
			type: "GET",
			datatype: 'json',
			success: function (inventoryOut){
				$('#inventoryTable').bootstrapTable('destroy');
				$('#inventoryTable').bootstrapTable({
					data: inventoryOut,
					formatNoMatches: function () {
						return 'No data found';
					}
				});
			}
		});
	}
	//셀러만 선택
	function stockSelectSL(leftSelect){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchStockLackBySL',
			type: "GET",
			data: {
				custId: leftSelect
			},
			datatype: 'json',
			success: function (inventoryOut){
				$('#inventoryTable').bootstrapTable('destroy');
				$('#inventoryTable').bootstrapTable({
					data: inventoryOut,
					formatNoMatches: function () {
						return 'No data found';
					}
				});
			}
		});
	}
	//창고만 선택
	function stockSelectWH(leftSelect){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchStockLackByWH',
			type: "GET",
			data: {
				whId: leftSelect
			},
			datatype: 'json',
			success: function (inventoryOut){
				$('#inventoryTable').bootstrapTable('destroy');
				$('#inventoryTable').bootstrapTable({
					data: inventoryOut,
					formatNoMatches: function () {
						return 'No data found';
					}
				});
			}
		});
	}
	//둘다 선택
	function stockSelectSLWH(leftSelect, rightSelect){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchStockLackByWHAndSL',
			type: "GET",
			data: {
				custId: leftSelect,
				whId: rightSelect
			},
			datatype: 'json',
			success: function (inventoryOut){
				$('#inventoryTable').bootstrapTable('destroy');
				$('#inventoryTable').bootstrapTable({
					data: inventoryOut,
					formatNoMatches: function () {
						return 'No data found';
					}
				});
			}
		});
	}
	//둘다 선택
	function stockSelectWHSL(leftSelect, rightSelect){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchStockLackByWHAndSL',
			type: "GET",
			data: {
				custId: rightSelect,
				whId: leftSelect
			},
			datatype: 'json',
			success: function (inventoryOut){
				$('#inventoryTable').bootstrapTable('destroy');
				$('#inventoryTable').bootstrapTable({
					data: inventoryOut,
					formatNoMatches: function () {
						return 'No data found';
					}
				});
			}
		});
	}
	// return today, YYYY-MM-DD
	function getDayType() {
		return today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
	}
	// return 1 week ago, YYYY-MM-DD
	function getWeekType() {
		weekLater = new Date(today.valueOf() - 7 * 1000 * 3600 * 24);
		return weekLater.getFullYear() + '-' + ('0' + (weekLater.getMonth() + 1)).slice(-2) + '-' + ('0' + weekLater.getDate()).slice(-2);
	}
	// return 1 month ago, YYYY-MM-DD
	function getMonthType() {
		monthLater = new Date(today.valueOf() - 30 * 1000 * 3600 * 24);
		return monthLater.getFullYear() + '-' + ('0' + (monthLater.getMonth() + 1)).slice(-2) + '-' + ('0' + monthLater.getDate()).slice(-2);
	}
</script>