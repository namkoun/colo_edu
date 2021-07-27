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
	<div class="item-container item-wrapper" >
		<div class="item-title">
			<span>대시보드</span>
			<h1>대시보드</h1>
		</div>
		<div class="Alert-Box">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="inWE" data-bs-toggle="tab" data-bs-target="#Alert1" type="button" role="tab" aria-controls="home" aria-selected="true">알림1</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="outWE" data-bs-toggle="tab" data-bs-target="#Alert2" type="button" role="tab" aria-controls="profile" aria-selected="false">알림2</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="noOutSt" data-bs-toggle="tab" data-bs-target="#Alert3" type="button" role="tab" aria-controls="contact" aria-selected="false">알림3</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="join" data-bs-toggle="tab" data-bs-target="#Alert4" type="button" role="tab" aria-controls="contact" aria-selected="false">알림4</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="Alert1" role="tabpanel" aria-labelledby="inWE">...</div>
				<div class="tab-pane fade" id="Alert2" role="tabpanel" aria-labelledby="outWE">...2</div>
				<div class="tab-pane fade" id="Alert3" role="tabpanel" aria-labelledby="noOutSt">...3</div>
				<div class="tab-pane fade" id="Alert4" role="tabpanel" aria-labelledby="join">...4</div>
			</div>
		</div>
		<div class="p-box" style="display: flex; background-color: #f3f3f3;">
			<h2>전체입고량</h2><h2>전체출고량</h2>
		</div>
		<div class="total-sum" style="width: 100%; box-sizing: border-box; padding: 0 0 20px 0; display: flex; flex-flow: row nowrap; justify-content: space-around; background-color: #f3f3f3; border-bottom: 2px solid #0e0e0e;">
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
		<!--   <div class="mainChart" style="display: flex; justify-content: space-around; flex-flow: row nowrap; border-bottom: 2px solid #0e0e0e; box-sizing: border-box;
                      padding: 20px 0; background-color: #e2e2e2;">
                <div style="width: 400px; height: 400px;">
                   <canvas id="myChart" style="width: 300px; height: 300px;"></canvas>
                </div>
                <div>
                   <canvas id="myChart2" style="width: 300px; height: 300px;"></canvas>
                </div>
             </div> -->
		<!-- 선택 -->

		<div class="select-home" style="width: 100%; padding-bottom: 20px;  border-bottom: 2px solid #0e0e0e; box-sizing: border-box;
            padding: 20px 9px; background-color: #efefef;">
			<div >
				<button type="button" class="btn btn-sm buttonmwd status tdwdmd btn-select-m btn-on-select" data-type="month">한달</button>
				<button type="button" class="btn btn-sm buttonmwd status tdwdmd btn-select-w" data-type="week">일주일</button>
				<button type="button" class="btn btn-sm buttonmwd status tdwdmd btn-select-t" data-type="day">오늘</button>
			</div>
			<div style="display: flex" >
				<input class="btn-success" data-width="160" id="input-data" data-style="slow" type="checkbox" checked data-toggle="toggle" data-on="셀러 " data-off="창고 " data-onstyle="light" data-offstyle="light">
				<select id="in-select" name="in-select"  class="form-select " style="margin: 0 20px" ></select>
				<select id="out-select" name="out-select" class="form-select" ></select>
			</div>
		</div>
		<div style="display: flex; width: 100% ;border: 1px solid #D3D3D3;border-radius: 6px;padding: 9px; ">
			<div style="display: flex; width: 450px ;flex-direction: column; margin: 0 auto;">
				<div class="span-font-size" style="margin-bottom: 15px">
					<span>입고</span>
				</div>
				<div style="display: flex; justify-content: space-between;align-items: center; margin:10px 0;">
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img style="margin-left: 5px;" src="${contextPath}/assets/images/icon/dashboard/in1.png" /> </span>
						<span>입고 예정</span>
						<span id="in_expected">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-caret-right "></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/in3.png" /> </span>
						<span>입GO 작업중</span>
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
			<div style="display: flex;width: 450px ;flex-direction: column; margin: 0 auto;">
				<div class="span-font-size" style="margin-bottom: 15px">
					<span>출고</span>
				</div>
				<div style="display: flex; justify-content: space-between;align-items: center;margin:10px 0;">
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
		<div class="inventory-detail" >
			<table id="inventoryTable" class="table table-dark text-center table-hover" data-height="450" style="text-align: center;" no-records-found="dnjseogh">
				<thead style="display: none;">
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
<div style="position: relative; ">
	<div class="accordion" id="accordionPanelsStayOpenExample" style=" width: 300px;position: fixed;right: 0;bottom: 0; z-index: 99;">
		<div class="accordion-item">

			<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
				<div class="accordion-body">
					<div class="toast-container">
						<div class="toast-box" style="z-index: 1000">


						</div>
					</div>
				</div>
			</div>
			<h2 class="accordion-header" id="panelsStayOpen-headingOne">
				<button class="accordion-button cccc" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
					<div style="margin-right: 10px;" >

						<div style="position: relative; text-align: center">
               <span id="test-a" style="text-align: center; position: absolute;width: 20px;height: 20px;background-color: red;border-radius: 50%;
               color: white;top: -3px;right: 10px">0</span>
							<a id="icon">   <span> <i  class="fas fa-bell fa-2x"></i></span> </a>
						</div>
					</div>
					알림!
				</button>
			</h2>
		</div>
	</div>
</div>
<button type="button" class="btn btn-primary" id="liveToastBtn">Show live toast</button>

<div class="wrap-loading display-none">

	<div><img src="https://www.hanja4u.org/public/common/images/common/loading.gif" /></div>

</div>

<style type="text/css">
	.btn-on-select{
		background-color: #0a217f !important;
		color: whitesmoke;
	}
	.bootstrap-table .fixed-table-container .table {
		width: 100% !important;
	}

	.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
		position: fixed;
		left:0;
		right:0;
		top:0;
		bottom:0;
		background: rgba(0,0,0,0.2); /*not in ie */
		filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
	}

	.wrap-loading div{ /*로딩 이미지*/
		position: fixed;
		top:50%;
		left:50%;
		margin-left: -21px;
		margin-top: -21px;
	}
	.display-none{ /*감추기*/
		display:none;
	}
</style>
<!--------------------------script----------------------------------->

<script type="text/javascript">
	////알림기능 시작
	$("#liveToastBtn").on("click",function (){
		$(".toast-box").append("<div id=\"liveToast\" class=\"toast hide\" role=\"alert\" aria-live=\"assertive\" data-bs-autohide=\"false\" aria-atomic=\"true\">\n" +
				"\t\t\t<div class=\"toast-header\">\n" +
				"\t\t\t\t<strong class=\"me-auto\">알림!</strong>\n" +
				"\t\t\t\t<small>온 시간 저장</small>\n" +
				"\t\t\t\t<button type=\"button\" class=\"btn-close\" onclick=\"tititi();\" data-bs-dismiss=\"toast\" aria-label=\"Close\"></button>\n" +
				"\t\t\t</div>\n" +
				"\t\t\t<div class=\"toast-body\">\n" +
				"\t\t\t\ㅁㅁㅁ 알림입니다. \n" +
				"\t\t\t\t<div class=\"mt-2 pt-2 border-top\">\n" +
				"\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-sm\">바로가기!</button>\n" +
				"\n" +
				"\t\t\t\t</div>\n" +
				"\t\t\t</div>\n" +
				"\t\t</div>");
		$(".toast").toast('show');
		test111();
		// db로 랜더링될때마다 1증 증가 한다
	});
	$(".cccc").on("click",function (){
		$(".toast").toast('show');
		test111();
	})
	function tititi(){
		$(event.target).closest(".toast").remove();
		test111();
		// 삭제버튼 누를때 마다 db에서 -1 한다.
		//$(".toast-box>.toast:last").remove();
		//$(".toast-box").last().empty();
	}
	function test111(){
		var n = $(".toast").length;
		$("#test-a").text(n);
		//10 초마다 db에서 값을 가져와서 보여준다
	}
	//////여기까지 알림기능
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
	$("#out-select").append('<option value="all" selected>wh</option>');
	selectsl(day);
	stockSelectSL(one);
	$('.tdwdmd').on('click', function(e) {
		if ( $(this).data('type') === 'day' ) { // 오늘 클릭
			$(".tdwdmd").removeClass('btn-on-select');
			$(".btn-select-t").addClass('btn-on-select');  //버튼색↑
			day = getDayType();
			$("#out-select").empty();
			$("#out-select").append('<option selected value="all">wh</option>');
			selectsl(day);

		} else if ( $(this).data('type') === 'week' ) { // 이번 주 클릭
			$(".tdwdmd").removeClass('btn-on-select');
			$(".btn-select-w").addClass('btn-on-select'); //버튼색↑
			day = getWeekType();
			$("#out-select").empty();
			$("#out-select").append('<option selected value="all">wh</option>');
			selectsl(day);

		} else if ( $(this).data('type') === 'month' ) { // 이번 달 클릭
			$(".tdwdmd").removeClass('btn-on-select');
			$(".btn-select-m").addClass('btn-on-select'); //버튼색↑
			day = getMonthType();
			$("#out-select").empty();
			$("#out-select").append('<option selected value="all">wh</option>');
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
						$("#out-select").append('<option selected value="all">wh</option>');
						selectsl(day);
					} else if ( $(this).data('type') === 'week' ) { // 이번 주 클릭
						day = getWeekType();
						$("#out-select").empty();
						$("#out-select").append('<option selected value="all">wh</option>');
						selectsl(day);
					} else if ( $(this).data('type') === 'month' ) { // 이번 달 클릭
						day = getMonthType();
						$("#out-select").empty();
						$("#out-select").append('<option selected value="all">wh</option>');
						selectsl(day);
					}
				});
			}else {
				selectwh(day);
				$('.tdwdmd').on('click', function(e) {
					if ( $(this).data('type') === 'day' ) { // 오늘 클릭
						day = getDayType();
						$("#out-select").empty();
						$("#out-select").append('<option selected value="all">sl</option>');
						selectwh(day);
					} else if ( $(this).data('type') === 'week' ) { // 이번 주 클릭
						day = getWeekType();
						$("#out-select").empty();
						$("#out-select").append('<option selected value="all">sl</option>');

						selectwh(day);
					} else if ( $(this).data('type') === 'month' ) { // 이번 달 클릭
						day = getMonthType();
						$("#out-select").empty();
						$("#out-select").append('<option selected value="all">sl</option>');
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
				console.log(data);
				if(data.length>0){
					for(var i in data){
						var $a = data[0].todayInApply;
						var $b = data[0].todayInComplete;
						var $c = data[0].todayOutApply;
						var $d = data[0].todayOutComplete;
						$('#in-sum').text($a);
						$('#in-complete').text($b);
						$('#out-sum').text($c);
						$('#out-complete').text($d);
					}
				}
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
				$("#in-select").empty();
				$("#in-select").append('<option value="-1" selected> ---선택--- </option>');
				$("#in-select").append('<option value="all" id="All" > 전체 </option>');
				for (var i = 0; i < Data.length; i++) {
					$("#in-select").append('<option value="'+ Data[i].id +'" >'+Data[i].centerNm+'</option>');
				}

				$("#in-select").unbind("change");

//sl 선택후 wh부분
				$("#in-select").change(function (){
					leftselect = $("select[name=in-select]").val();
					if ($("select[name=in-select]").val() === 'all'){
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
								$("#out-select").append('<option value="all" selected> wh </option>');
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
				$("#in-select").append('<option value="-1" selected> -------- </option>');
				$("#in-select").append('<option value="all" id="all"> 전체 </option>');
				for (var i = 0; i < Data.length; i++) {
					$("#in-select").append('<option value="'+ Data[i].id +'" >'+Data[i].centerNm+'</option>');
				}

				$("#in-select").unbind("change");

//wh 선택후 sl부분
				$("#in-select").change(function (){
					leftselect = $("select[name=in-select]").val();
					if ($("select[name=in-select]").val() === 'all'){
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
								$("#out-select").append('<option value="all" selected> sl </option>');
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
		if(data.length>0){
			for(var i in data){
				var $a = data[0].inTobe.split('/');
				var $b = data[0].inWorking.split('/');
				var $c = data[0].inComplete.split('/');
				var $d = data[0].inCancle.split('/');
				var $e = data[0].outTobe;
				var $f = data[0].outWorking;
				var $g = data[0].outComplete;
				var $h = data[0].outCancle;
				$('#in_expected').text($a[0]);
				$('#in_working').text($b[0]);
				$('#in_complete').text($c[0]);
				$('#in_cancel').text($d[0]);
				$('#out_expected').text($e);
				$('#out_working').text($f);
				$('#out_complete').text($g);
				$('#out_cancel').text($h);
			}
		}
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
				console.log(data)
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
				console.log(data)
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
				console.log(data)
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
					console.log(data)
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
					console.log(data)
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
				console.log("all실행");
				console.log(inventoryOut);
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
				console.log("sl실행");
				console.log(inventoryOut);
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

	//chart

	function chart1(){
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '',
			type: "GET",
			data: {
				chartIn : getChart
			},
			datatype: 'json',
			success: function (chartIn){
				var getChart = new Array();
				var ctx = document.getElementById('myChart').getContext('2d');
				var myChart = new Chart(ctx, {
					type: 'line',
					data: {
						labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
						datasets: [{
							label: '# of Votes',
							data: getChart,
							backgroundColor: [
								'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)'
							],
							borderColor: [
								'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)'
							],
							borderWidth: 1
						}]
					},
					options: {
					}
				});
			}
		});
	}
	//test
</script>