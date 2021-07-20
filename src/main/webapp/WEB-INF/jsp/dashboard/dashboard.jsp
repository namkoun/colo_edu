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
		<!-- 선택 -->

		<div class="select-home" style="width: 100%; padding-bottom: 20px;  border-bottom: 2px solid #0e0e0e; box-sizing: border-box;
            padding: 20px 9px; background-color: #efefef;">
			<div style="display: flex" >
				<input class="btn-success" data-width="160" id="input-data" data-style="slow" type="checkbox" checked data-toggle="toggle" data-on="셀러 " data-off="창고 " data-onstyle="light" data-offstyle="light">

				<select id="in-select" name="in-select"  class="form-select " style="margin: 0 20px" >

				</select>

				<select id="out-select"  class="form-select" >

				</select>

			</div>
			<div >
				<button type="button" class="btn btn-sm buttonmwd status" data-type="month">한달</button>
				<button type="button" class="btn btn-sm buttonmwd status" data-type="week">일주일</button>
				<button type="button" class="btn btn-sm buttonmwd status" data-type="day">오늘</button>
			</div>
		</div>

		<div class="mainChart" style="display: flex; justify-content: space-around; flex-flow: row nowrap; border-bottom: 2px solid #0e0e0e; box-sizing: border-box;
               padding: 20px 0; background-color: #e2e2e2;">
			<div style="width: 400px; height: 400px;">
				<canvas id="myChart" style="width: 300px; height: 300px;"></canvas>
			</div>
			<div>
				<canvas id="myChart2" style="width: 300px; height: 300px;"></canvas>
			</div>
		</div>

		<div style="display: flex; width: 1047px ;border: 1px solid #D3D3D3;border-radius: 6px;padding: 9px; ">
			<div style="display: flex; width: 450px ;flex-direction: column; margin: 0 auto;">
				<div class="span-font-size" style="margin-bottom: 15px">
					<span>입고</span>
				</div>
				<div style="display: flex; justify-content: space-between;align-items: center; margin:10px 0;">
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img style="margin-left: 5px;" src="${contextPath}/assets/images/icon/dashboard/in1.png" /> </span>
						<span>입고 예정</span>
						<span id="">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-caret-right "></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/in3.png" /> </span>
						<span>입GO 작업중</span>
						<span id="">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-caret-right "></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/in4.png" /> </span>
						<span>입고 완료</span>
						<span id="">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-plus-lg"></i>
					<div style="display: flex;flex-direction: column;align-items: center;">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/out-x.png" /> </span>
						<span>입고 취소</span>
						<span id="">0</span>
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
						<span id="">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-caret-right "></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/out2.png" /> </span>
						<span>출고 작업중</span>
						<span id="">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-caret-right "></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/out3.png" /> </span>
						<span>출고 완료</span>
						<span id="">0</span>
						<span>건</span>
					</div>
					<i class="bi bi-plus-lg"></i>
					<div class="display-flex-column-align-items-center">
						<span class="span-img-icon"><img src="${contextPath}/assets/images/icon/dashboard/out-x.png" /> </span>
						<span>취소</span>
						<span id="">0</span>
						<span>건</span>
					</div>

				</div>
			</div>
		</div>
		<div class="inventory-detail">
			<table id="inventoryTable" class="table table-dark table-hover" data-height="450" style="text-align: center;">
				<thead>
				<tr>
					<th data-field="">상품명</th>
					<th data-field="">현재고량</th>
					<th data-field="">결품수량</th>
					<th data-field="">입고중인 상품 수</th>
					<th data-field="">최종입고일</th>
					<th data-field="">안전재고 수량 기준</th>
				</tr>
				</thead>
			</table>
		</div>
	</div>
</div>


<script>




	var ctx = document.getElementById('myChart2').getContext('2d');
	var myChart = new Chart(ctx, {
		type: 'radar',
		data: {
			labels: ['총 입고 건수', '입고 예정', '입하완료', '입고 작업 중', '입고완료'],
			datasets: [{
				label: '# of Votes',
				data: [40, 40, 40, 40, 40],
				backgroundColor: [
					'rgba(2, 2, 180, 0.7)',
					'rgba(2, 2, 180, 0.7)',
					'rgba(2, 2, 180, 0.7)',
					'rgba(2, 2, 180, 0.7)',
					'rgba(2, 2, 180, 0.7)'
				],

				borderWidth: 1
			}]
		},
		options: {
			scales: {
				y: {
					beginAtZero: true
				}
			}
		}
	});
</script>
<script type="text/javascript">
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ['총 입·출고 건수', '입·출고예정', '입·출고 작업중', '입·출고 완료', '취소'],
			datasets: [{
				data: [12, 19, 3, 5, 2],
				backgroundColor: [
					'rgba(2, 2, 107, 1)',
					'rgba(2, 2, 150, 1)',
					'rgba(2, 2, 180, 1)',
					'rgba(2, 2, 201, 1)',
					'rgba(2, 2, 221, 1)'
				],
				order:2
			},{
				label: 'Line adas',
				data: [5,4,5,7,9],
				type: 'bar',
				backgroundColor: [
					'rgba(2, 2, 107, 1)',
					'rgba(2, 2, 150, 1)',
					'rgba(2, 2, 180, 1)',
					'rgba(2, 2, 201, 1)',
					'rgba(2, 2, 221, 1)'
				],
				order: 1
			}]
		},
		options: {
		}
	});


	var sl = "sl";
	var wh = "wh";

	// monthpicker 20.07.10

	$(document).ready(function(){

		// 선택 스위치버튼
		getTotalSum();
		selectsl(sl);
		$("#out-select").empty();
		$("#out-select").append('<option value="1" selected>wh</option>');
		$(function() {
			$('#input-data').change(function() {

				if ($(this).prop('checked')){

					selectsl(sl);



					$("select[name=in-select]").val();

					$("#out-select").empty();
					$("#out-select").append('<option value="1" selected>wh</option>');
					$("#out-select").append('<option value="2" >test</option>');


				}else {


					selectsl(wh);
					$("#out-select").empty();
					$("#out-select").append('<option selected value="1">sl</option>');
					$("#out-select").append('<option value="1">test</option>');



				}
			})
		})
		// 선택 날자
		$('.btn.status').on('click', function(e) {

			if ( $(this).data('type') === 'day' ) { // 오늘 클릭


			} else if ( $(this).data('type') === 'week' ) { // 이번 주 클릭


			} else if ( $(this).data('type') === 'month' ) { // 이번 달 클릭
				// 버튼색   예 $('.loader-wrapper').removeClass('display-none');
				// 함수실행   예 setServiceStatus(getMonthType(), getDayType());
			}
		});
		function initDatePickers() {
			// datepicker Korean option
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
			error:function(request, status, error){

				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
		});
	}
	//sl버튼

	function selectsl(CenterName){



		$.ajax({
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchSLCenterList',
			type : 'GET',
			data : {
				CenterName : CenterName,

			},
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(Data) {
				console.log(Data);

				$("#in-select").empty();
				$("#in-select").append('<option value="1" selected>'+ CenterName +'</option>');
				for (var i = 0; i < Data.length; i++) {
					$("#in-select").append('<option value='+ Data[i].centerNm +' >'+Data[i].centerNm+'</option>');
				}



			}

		});

	};





	//전체 입·출고량


	//재고부족 테이블 시작
	function getInventoryTable(){
		$.ajax({
			type: "GET",
			url: '',
			datatype: 'json',
			success: function (inventoryOut){
				$('#inventoryTable').bootstrapTable({
					data: inventoryOut
				});
			}
		});
	}

	///////////////////////////////////////////////
	$('#noticeList').jqGrid({
		autowidth : true,
		height : 'auto',
		width : 1200,
		datatype: "json",
		multiselect:false,
		colNames : ['번호', '카테고리', '제목', '등록일', '조회수'],
		colModel : [
			{name:'id', index:'id', key:true, width:80},
			{name:'categoryCodeName', index:'categoryCodeName', width:150},
			{name:'title', index:'title', width:400},
			{name:'regDateString', index:'regDateString', width:100},
			{name:'readCnt', index:'readCnt', width:100}
		],
		rowNum:20,
		viewrecordes:true,
		onCellSelect : function (rowid, icol, cellcontent, e) {
			noticeRowClick(rowid, icol, cellcontent, e);
		}
	});

	$(document).ready(function() {

		/*
          $('#noticeList tbody').on('click', 'tr td:not(.btn-area)', function (e) {
                alert("TEST");
            });
          */

		getNoticeList();

	});

	//화면 리사이징 그리드 사이즈
	$(window).resize(function(){
		$("#noticeList").setGridWidth($(".item-jqgrid").width());
	});

	function noticeRowClick(rowid, icol, cellcontent, e) {
		var data = $('#noticeList').getRowData()[rowid - 1];
		location.href = '${contextPath}/dashboard/notice-detail?id=' + data.id;
	};

	function getNoticeList() {
		$.ajax({
			url: '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/list',
			type: 'GET',
			dataType: 'json',
			contentType: 'application/json;charset=UTF-8',
			success: function (data) {
				$('#noticeList').clearGridData();
				for (var i = 0 ; i < data.length ; i++) {
					$('#noticeList').jqGrid('addRowData', i + 1, data[i]);
				}
			}
		});

	}
</script>