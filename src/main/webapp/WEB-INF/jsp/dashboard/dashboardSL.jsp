<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/tagLibs.jsp"%>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<fmt:formatDate var="month" value="${now}" pattern="MM" />
<fmt:formatDate var="day" value="${now}" pattern="dd" />

<div class="mainContent" style="padding: 0px; position: relative; overflow-y: hidden;">
	<div id="container">
		<div id="dashboard-background-image-top"></div>
		<div class="content-container dashboard-flex">
			<!-- 입/출고 현황 -->
			<div class="content-wrapper in-out dashboard-flex dashboard-pr-20">
				<div class="conten-in-out-items dashboard-pr-20 dashboard-pl-20 dashboard-box-sizing-border-box dashboard-bl" style="width: 266px;">
	
					<div class="content-in-out-header">
						<div class="content-in-out-icon out"></div>
						<div class="content-in-out-title ">오늘의 출고 현황</div>
					</div>
	
					<div class="content-in-out-body">
						<div class="content-in-out-item dashboard-align-items-center">
							<div
								class="content-in-out-item-icon-text dashboard-flex dashboard-align-items-center"
								style="padding: 2px 8px 2px 10px;"
								>
								<img class="dashboard-mr-6"
									src="${contextPath}/assets/images/icon/dashboard/dashboard_out_delivery.svg"
									style="height: 14px;" /> <b>택배출고</b>
							</div>
							<div class="dashboard-flex dashboard-align-items-center">
								<div class="content-in-out-item-text"><span id="out-delivery">0</span></div>
								<div class="content-in-out-item-unit">건</div>
							</div>
						</div>
						<div
							class="content-in-out-item dashboard-flex dashboard-align-items-center">
							<div
								class="content-in-out-item-icon-text dashboard-flex dashboard-align-items-center">
								<img class="dashboard-mr-4"
									src="${contextPath}/assets/images/icon/dashboard/dashboard_out_normal.svg"
									style="height: 18px;" /> <b>일반출고</b>
							</div>
							<div class="dashboard-flex dashboard-align-items-center">
								<div class="content-in-out-item-text"><span id="out-normal">0</span></div>
								<div class="content-in-out-item-unit">건</div>
							</div>
						</div>
						<div
							class="content-in-out-item dashboard-flex dashboard-align-items-center">
							<div
								class="content-in-out-item-icon-text dashboard-flex dashboard-align-items-center"
								style="padding: 1px 9px;"
								>
								<img class="dashboard-mr-4"
									src="${contextPath}/assets/images/icon/dashboard/dashbaord_out_overseas.svg"
									style="height: 16px;" /> <b>해외출고</b>
							</div>
							<div class="dashboard-flex dashboard-align-items-center">
								<div class="content-in-out-item-text"><span id="out-overseas">0</span></div>
								<div class="content-in-out-item-unit">건</div>
							</div>
						</div>
					</div>
				</div>
				<div class="conten-in-out-items dashboard-pl-20 dashboard-box-sizing-border-box dashboard-bl">
	
					<div class="content-in-out-header">
						<div class="content-in-out-icon in-current"></div>
						<div class="content-in-out-title">오늘의 입고 현황</div>
					</div>
	
					<div class="content-in-out-body">
						<div class="content-in-out-item dashboard-align-items-center">
							<div
								class="content-in-out-item-icon-text dashboard-flex dashboard-align-items-center">
								<img class="dashboard-mr-4"
									src="${contextPath}/assets/images/icon/dashboard/dashboard_in_apply.svg"
									style="height: 19px;" /> <b>입고신청</b>
							</div>
							<div class="dashboard-flex dashboard-align-items-center">
								<div class="content-in-out-item-text"><span id="in-request">0</span></div>
								<div class="content-in-out-item-sku"><span id="in-request-sku">0</span><span style="font-weight: 400">&nbsp;SKU</span></div>
							</div>
						</div>
						<div class="content-in-out-item dashboard-align-items-center">
							<div
								class="content-in-out-item-icon-text dashboard-flex dashboard-align-items-center">
								<img class="dashboard-mr-4"
									src="${contextPath}/assets/images/icon/dashboard/dashboard_three_dot.svg"
									style="height: 19px; width: 15px; margin-right: 7px;" /> <b>확정대기</b>
							</div>
							<div class="dashboard-flex dashboard-align-items-center">
								<div class="content-in-out-item-text"><span id="in-confirm">0</span></div>
								<div class="content-in-out-item-sku"><span id="in-confirm-sku">0</span><span style="font-weight: 400">&nbsp;SKU</span></div>
							</div>
						</div>
						<div class="content-in-out-item dashboard-align-items-center">
							<div
								class="content-in-out-item-icon-text dashboard-flex dashboard-align-items-center">
								<img class="dashboard-mr-4"
									src="${contextPath}/assets/images/icon/dashboard/dashboard_check.svg"
									style="height: 19px;" /> <b>입고완료</b>
							</div>
							<div class="dashboard-flex dashboard-align-items-center">
								<div class="content-in-out-item-text"><span id="in-complete">0</span></div>
								<div class="content-in-out-item-sku"><span id="in-complete-sku">0</span><span style="font-weight: 400">&nbsp;SKU</span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
			<!-- 서비스 현황 -->
			<div class="content-wrapper status dashboard-box-sizing-border-box dashboard-br dashboard-bl">
	
				<div class="dashboard-flex dashboard-justify-content-space-between">
					<div class="content-status-header">
						<div class="content-status-icon status"></div>
						<div class="content-status-title dashboard-mb-8">서비스 현황</div>
						<div
							class="content-status-item buttons dashboard-flex dashboard-justify-content-space-between dashboard-width-100">
							<button class="It-dateBtn dateToday-btn status" data-type="day">오늘</button>
							<button class="It-dateBtn dateWeek-btn status" data-type="week">이번 주</button>
							<button class="It-dateBtn dateMonth-btn status" data-type="month">이번 달</button>
						</div>
					</div>
					<div
						class="storage-amount dashboard-flex dashboard-align-items-center">
						<div
							class="dashboard-flex dashboard-justify-content-center storage-amount-wrapper">
							<div class="dashboard-flex dashboard-align-items-center">
								<img class="dashboard-mr-4 dashboard-mt-2"
									src="${contextPath}/assets/images/icon/dashboard/dashboard_wh.svg"
									style="height: 24px;" />
										<b class="title"  style="font-size: 13px; color: #0a217f; font-weight: 600;">오늘의 보관량</b>
							</div>
						</div>
						<div class="dashboard-flex dashboard-align-items-center dashboard-width-100 dashboard-justify-content-space-evenly" style="padding: 4px 0 24px 0;">
							<div>
								<span class="content-in-out-item-text" id="sku">0</span><span class="content-in-out-item-sku dashboard-font-size-11 dashboard-vertical-align-super" style="font-weight: 400;">&nbsp;SKU</span>
							</div>
							<%-- 중간선 --%>
							<div style="height: 40px;border-right: 1px solid #ccc;"></div>
							<div>
								<span class="content-in-out-item-text" id="ea">0</span><span class="content-in-out-item-sku dashboard-font-size-11 dashboard-vertical-align-super" style="font-weight: 400;">&nbsp;EA</span>
							</div>
						</div>
					</div>
				</div>
	
				<div
					class="dashboard-flex dashboard-justify-content-space-between dashboard-width-100 ">
					<div
						class="content-status-item delivery-out dashboard-flex dashboard-align-items-center dashboard-flex-direction-column">
						<img class="dashboard-mt-20 dashboard-mb-2"
							src="${contextPath}/assets/images/icon/dashboard/dashboard_out_delivery.svg"
							style="height: 15px;" />
						<div class="title">택배출고</div>
						<div class="dashboard-font-size-32"><span id="status-out-delivery">0</span></div>
						<div class="content-in-out-item-unit">건</div>
					</div>
					<div
						class="content-status-item delivery-out dashboard-flex dashboard-align-items-center dashboard-flex-direction-column">
						<img class="dashboard-mt-18"
							src="${contextPath}/assets/images/icon/dashboard/dashboard_out_normal.svg"
							style="height: 21px; margin-bottom: -1px;" />
						<div class="title">일반출고</div>
						<div class="dashboard-font-size-32"><span id="status-out-normal">0</span></div>
						<div class="content-in-out-item-unit">건</div>
					</div>
					<div
						class="content-status-item delivery-out dashboard-flex dashboard-align-items-center dashboard-flex-direction-column">
						<img class="dashboard-mt-18"
							src="${contextPath}/assets/images/icon/dashboard/dashbaord_out_overseas.svg"
							style="height: 19px;" />
						<div class="title">해외출고</div>
						<div class="dashboard-font-size-32"><span id="status-out-overseas">0</span></div>
						<div class="content-in-out-item-unit">건</div>
					</div>
				</div>
	
			</div>
	
		</div>
	
		<!-- 파이그래프, 재고부족 테이블 -->
		<div class="content-container dashboard-flex">
			<div class="content-wrapper out-ranking dashboard-flex dashboard-mr-16"
				style="height: fit-content; padding-bottom: 13px;">
				<div style='width: 100%;'>
					<div class="content-header dashboard-flex dashboard-mb-12">
						<div class="content-header-title dashboard-mr-12 dashboard-flex">
							<img
								src="${contextPath}/assets/images/icon/dashboard/dashboard_out_ranking.svg"
								style="height: 24px;" />&nbsp;
							<div class="header-title-text">출고 순위</div>
						</div>
						<div class="dashboard-flex dashboard-justify-content-space-between dashboard-mt-2" style="min-width: 116px;">
							<button class="It-dateBtn dateToday-btn chart" data-type="day">오늘</button>
							<button class="It-dateBtn dateWeek-btn chart" data-type="week">이번 주</button>
							<button class="It-dateBtn dateMonth-btn chart" data-type="month">이번 달</button>
						</div>
					</div>
					<div id="pie-chart" style="display: none;"></div>
					<div>	
						<img id="out-empty-image" src="${contextPath}/assets/images/COLO_ranking_NoData.svg" width="48%;" style="display: none;" />
					</div>
				</div>
				<div id="chart-border" style="border-right: 1px solid #ccc; margin-right: 14px; display: none;"></div>
				<div id="line-chart" style="display: none;"></div>
				<%-- <div class="content-body charts dashboard-flex" style="height: 100%;">
					<img id="out-empty-image" src="${contextPath}/assets/images/COLO_ranking_NoData.svg" width="100%;" style="padding: 36px 72px;" />
					<div id="pie-chart" style="display: none;"></div>
					<div id="line-chart" style="display: none;"></div>
				</div> --%>
			</div>
			<div class="content-wrapper inventory-shortage dashboard-ml-16" style="padding-left: 15px; padding-right: 15px;">
				<div class="content-header dashboard-flex dashboard-mb-12">
					<div class="content-header-title dashboard-mr-8">
						<div class="content-header-title dashboard-mr-4 dashboard-flex">
							<img
								src="${contextPath}/assets/images/icon/dashboard/dashboard_inventory_shortage.svg"
								style="height: 24px;" />&nbsp;
							<div class="header-title-text">재고 부족</div>
						</div>
					</div>
					<a href="/input/input_apply" class="link-input-apply-btn">입고신청</a>
				</div>
				<div class="content-body inventory-shortage">
					<div id="jqgrid-inventory-wrapper">
						<table id="jqgrid-inventory"></table>
						<div id="jqgrid-inventory-pager"></div>
					</div>
					<div id="no-stock-image" style="padding: 65px 52px 76px; text-align: center;">	
						<img id="out-empty-image" src="${contextPath}/assets/images/COLO_ranking_Stock_NoData.png" width="48%;" />
					</div>
				</div>
			</div>
		</div>
	
	
		<!-- 게시판 -->
		<div class="content-container board">
			<div class="content-wrapper board dashboard-width-100">
				<div class="content-header board dashboard-mb-14">
					<div class="dashboard-flex dashboard-mb-12">
						<img
							src="${contextPath}/assets/images/icon/dashboard/dashboard_notice.svg"
							style="height: 24px;" />&nbsp;
						<div class="header-title-text">공지사항</div>
					</div>
					<div class="dashboard-flex">
						<button class="dashboard-category selected">시스템 안내</button>
					<!-- 	&nbsp;
						<button class="dashboard-category">자료실</button>
						&nbsp;
						<button class="dashboard-category">자료실</button>
						&nbsp;
						<button class="dashboard-category">자료실</button> -->
					</div>
				</div>
				<div class="content-body board">
					<table id="jqgrid-board"></table>
					<div id="jqgrid-board-pager"></div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="loader-wrapper display-none">
		<div class="loader item-center">
			<div class="loader__bar"></div>
			<div class="loader__bar"></div>
			<div class="loader__bar"></div>
			<div class="loader__bar"></div>
			<div class="loader__bar"></div>
			<div class="loader__ball"></div>
		</div>
	</div>
</div>



<style type="text/css">
#container {
	width: 100%;
	position: relative;
}

#dashboard-background-image-top {
	position: absolute;
	width: 100%;
	height: 357px;
	background: linear-gradient(270deg, rgba(255, 247, 216, 1) 0%,
		rgba(205, 237, 252, 1) 100%);
}

.content-container {
	/* display: flex; */
	margin-bottom: 24px;
	width: 1024px;
	transform: translateX(-50%);
	position: relative;
	left: 50%;

	/* background-color: rgba(0,0,0,0.1); */
}

.content-in-out-icon, .content-status-icon {
	width: 46px;
	height: 46px;
	border-radius: 50%;
	background-color: #2c4eaa;
	margin-bottom: 10px;

	/* background-image: url(${contextPath}/assets/images/icon/dashboard/dashboard_out.svg); */
}

.content-in-out-title, .content-status-title {
	font-size: 17px;
	color: #0a217f;
	font-weight: 600;
}

.content-in-out-icon.out {
	background-image:
		url(${contextPath}/assets/images/icon/dashboard/dashboard_out.svg);
}

.content-in-out-icon.in-current {
	background-image:
		url(${contextPath}/assets/images/icon/dashboard/dashboard_in_current.svg);
}

.content-status-icon.status {
	background-image:
		url(${contextPath}/assets/images/icon/dashboard/dashboard_status.svg);
}

.content-container:last-child {
	margin-bottom: unset;
}

.content-wrapper {
	/* display: flex; */
	width: 50%;
}

.conten-in-out-items {
	width: 50%;
	padding: 32px 0px;
}

.content-in-out-header, .content-status-header {
	display: flex;
	flex-direction: column;
	align-items: center;
	border-bottom: 1px solid #d2d2d2;
	padding-bottom: 24px;
}

.content-status-header {
	border-bottom: unset;
	padding: 0px 32px 30px 26px;
	min-width: 98px;
}

.content-in-out-item {
	/* background-color: rgba(255,0,0,0.1);
	border: 1px solid rgba(255,0,0,0.5); */
	padding: 10px 6px;
	border-bottom: 1px solid #d2d2d2;
	display: flex;
	justify-content: space-between;
}

.content-in-out-item-icon-text {
	font-size: 10px;
	background-color: #fff;
	border-radius: 10px;
	padding: 0px 11px 0px 8px;
	border: 1px solid #bcbcbc;
	line-height: 1;
}

.content-in-out-item-text {
	font-size: 28px;
	margin-top: -3px;
	margin-right: 4px;
}

.content-in-out-item-text-lg {
	font-size: 34px;
	margin-top: -3px;
	margin-right: 4px;
}

.content-in-out-item-text-lg-stored {
	
	font-weight: bold;
	font-size: 15px;
	margin-top: -3px;
	margin-right: 4px;
}

.content-in-out-item-unit {
	font-size: 12px;
	font-weight: 600;
	color: #666;
}

.content-in-out-item-sku {
	font-size: 14px;
	font-weight: 500;
	color: #666;
}

.content-wrapper.status {
	/* display: flex; */
	width: 50%;
	padding: 32px 24px;
}

.content-status-items.left {
	flex-grow: 1;
}

.content-status-items.right {
	flex-grow: 4;
	display: flex;
	flex-wrap: wrap;
}

.content-status-item.buttons {
	display: flex;
	width: 116px;
}

.content-status-item.storage-amount, .content-status-item.delivery-out,
	.content-status-item.normal-out, .content-status-item.overseas-out {
	width: 148px;
	height: 148px;
	border-radius: 50%;
	background-color: #fff;
	border: 1px solid #2c4eaa;
}

.storage-amount {
	border: 1px solid #2c4eaa;
	width: 280px;
	height: fit-content;
	background-color: #fff;
	border-radius: 72px;
	padding: 0px 28px;
	flex-direction: column;
}

.storage-amount-wrapper {
	width: 250px;
	padding: 8px 0px 6px 0px;
	/* border-bottom: 1px solid #d2d2d2; */
}

b.title, div.title {
	font-size: 13px;
	color: #0a217f;
	font-weight: 600;
}

.content-wrapper.out-ranking, .content-wrapper.inventory-shortage,
	.content-wrapper.board {
	border-radius: 4px;
	padding: 16px 18px;
}

.content-wrapper.out-ranking {
	border: 1px solid #fbb03b;
}

.content-wrapper.inventory-shortage {
	border: 1px solid #ff8298;
}

.content-wrapper.board {
	border: 1px solid #2c4eaa;
	box-sizing: border-box;
}

.header-title-text {
	font-size: 17px;
	font-weight: 500;
	letter-spacing: -0.5px;
}

.content-body.inventory-shortage {
	height: 197px;
	overflow-y: scroll;
}

.content-body.board {
	height: 314px;
	overflow-y: scroll;
	overflow-x: hidden;
}

.content-container.board {
	margin-bottom: 48px;
}

.link-input-apply-btn {
	font-size: 10px;
	border: 1px solid #eee;
	padding: 2px 8px;
	height: fit-content;
	border-radius: 4px;
	margin-top: 3px;
}

#line-chart {
	padding-top: 4px;
}
#line-chart > div > div > svg > g:nth-child(2) > text {
	font-size: 13px !important;
	font-weight: 500;
	fill: rgb(0,0,0);
    /* transform: translateX(calc(50% - 50px)); */
}
#line-chart, #pie-chart {
	width: 50%;
	background-color: rgba(255, 255, 255);
/* 	background-color: rgba(255, 0, 0, 0.1);
 */	
}

.dashboard-category {
	font-size: 12px;
	font-weight: 500;
	background-color: #fff;
	color: #000;
	padding: 4px 12px;
	border-radius: 12px;
	border: 1px solid #2c4eaa;
}

.dashboard-category.selected {
	background-color: #2c4eaa;
	color: #fff;
	font-weight: 400;
}

/* icons */
.icon-out-delivery, .icon-out-normal, .icon-out-overseas {
	background-repeat: no-repeat;
}

.icon-out-delivery {
	/* background-image: url(${contextPath}/assets/images/icon/dashboard/.svg); */
	
}

.icon-out-normal {
	background-image:
		url(${contextPath}/assets/images/icon/dashboard/dashboard_out_normal.svg);
}

.icon-out-overseas {
	background-image:
		url(${contextPath}/assets/images/icon/dashboard/dashboard_out_overseas.svg);
}

/* common start */
.dashboard-flex {
	display: flex;
}
.dashboard-align-items-center {
	align-items: center;
}
.dashboard-justify-content-space-between {
	justify-content: space-between;
}
.dashboard-justify-content-space-evenly {
	justify-content: space-evenly;
}
.dashboard-justify-content-center {
	justify-content: center;
}
.dashboard-flex-direction-column {
	flex-direction: column;
}
.dashboard-width-100 {
	width: 100%;
}
.dashboard-mt-2 {
	margin-top: 2px;
}
.dashboard-mt-18 {
	margin-top: 18px;
}
.dashboard-mt-20 {
	margin-top: 20px;
}
.dashboard-mr-4 {
	margin-right: 4px;
}
.dashboard-mr-6 {
	margin-right: 6px;
}
.dashboard-mr-8 {
	margin-right: 8px;
}
.dashboard-mr-12 {
	margin-right: 12px;
}
.dashboard-mb-2 {
	margin-bottom: 2px;
}
.dashboard-mb-8 {
	margin-bottom: 8px;
}
.dashboard-mb-12 {
	margin-bottom: 12px;
}
.dashboard-mb-14 {
	margin-bottom: 14px;
}
.dashboard-mr-8 {
	margin-right: 8px;
}
.dashboard-ml-16 {
	margin-left: 16px;
}
.dashboard-mr-16 {
	margin-right: 16px;
}
.dashboard-pr-12 {
	padding-right: 12px;
}
.dashboard-pr-20 {
	padding-right: 20px;
}
.dashboard-pl-12 {
	padding-left: 12px;
}
.dashboard-pl-20 {
	padding-left: 20px;
}
.dashboard-bl {
	border-left: 1px solid #d2d2d2;
}
.dashboard-br {
	border-right: 1px solid #d2d2d2;
}
.dashboard-font-size-11 {
	font-size: 11px;
}
.dashboard-font-size-32 {
	font-size: 32px;
}
.dashboard-box-sizing-border-box {
	box-sizing: border-box;
}
.dashboard-vertical-align-super {
	vertical-align: super;
}
/* common end */

/* common.js 의 datepicker랑 물림... */
.It-dateBtn.status {
    color: #1a1a1a;
    border: 1px solid #cccccc;
    background-color: #e6e6e6;
}
.It-dateBtn-g.status {
	background-color: #0a217f;
	color: #fafafa;
}
#jqgh_jqgrid-inventory_goodsName,
#jqgh_jqgrid-inventory_currentAmount,
#jqgh_jqgrid-inventory_safeAmount,
#jqgh_jqgrid-inventory_regDate {
	font-weight: 700;
}
/* .ui-jqgrid-labels th#jqgrid-inventory_goodsName,
.ui-jqgrid-btable td[aria-describedby="jqgrid-inventory_goodsName"] {
	text-align: left !important;
} */

.ui-jqgrid-btable td[aria-describedby="jqgrid-inventory_currentAmount"] {
	color: #d4145a !important;
}
/* common.js 의 datepicker랑 물림... */
</style>

<script type="text/javascript">
	var today = new Date();
	var toDate = "";
	var fromDate = "";
	var goodsCd = "";
    var goodsArr = new Array();

	$(document).ready(function() {
		
		/* loading wrapper 관련 CSS 설정 - 추후 수정 */
		$('.loader-wrapper').css('transform', 'unset');
		$('.loader-wrapper').css('width', $('.mainContent').width());
		$('.loader-wrapper').css('height', $('body').height());
		$('.loader-wrapper').css('top', $('.item-container').height());
		$('.loader-wrapper').css('clip', 'unset');
		
		$('.loader-wrapper').removeClass('display-none');
	
		// 오늘의 초도 셋팅 (오늘의 출고 현황, 오늘의 입고 현황, 오늘의 보관량, 재고부족, 서비스현황(오늘만 한번), 출고순위(오늘만 한번))
		initDashBoardOut(getDayType(), getDayType());
		
		// GoogleChart Load 
	    google.charts.load('current', {'packages':['corechart']});

		/* jqgrid init START */
		
		// 공지사항
		const JQGRID_BOARD_WIDTH = $('.content-wrapper.board').width();
		$("#jqgrid-board").jqGrid({
			autowidth : true,
			height : 'auto',
			datatype : "local",
			// colNames : [ "id", "주문서 상품명", "주문 쇼핑몰(주문서양식)", "세트/단품여부", "매핑 완료일" ],
			colNames : [ "id", "카테고리", "제목", "등록일", "조회수" ],
			colModel : [ {
				name : 'id',
				index : 'id',
				align : 'center',
				width : 0,
				hidden : true,
			}, {
				name : 'categoryCodeName',
				index : 'categoryCodeName',
				align : 'left',
				width : parseInt(JQGRID_BOARD_WIDTH * 0.12),
			}, {
				name : 'title',
				index : 'title',
				align : 'left',
				width : parseInt(JQGRID_BOARD_WIDTH * 0.62),
			}, {
				name : 'regDateString',
				index : 'regDateString',
				align : 'center',
				width : parseInt(JQGRID_BOARD_WIDTH * 0.16),
			}, {
				name : 'readCnt',
				index : 'readCnt',
				align : 'center',
				width : parseInt(JQGRID_BOARD_WIDTH * 0.10),
			}, ],
			rowNum : 10,
			rowList : [ 10, 20, 30, 40, 50 ],
			scrollOffset : 0,
			/* pager : "#jqgrid-board-pager", */
			viewrecords : true,
			shrinkToFit : true,
			onCellSelect : function(rowId, icol, cellcontent, e) {
				noticeRowClick(rowId, icol, cellcontent, e);
			}
		});

		/* 재고부족 */
		const JQGRID_INVENTORY_WIDTH = $('.content-wrapper.inventory-shortage div.content-body').width()
		$("#jqgrid-inventory").jqGrid(
			{
				autowidth : true,
				height : 'auto',
				datatype : "local",
				colNames : [ "id", "상품명", "현재 재고량", "안전 재고량", "최종 입고일" ],
				colModel : [
						{
							name : 'id',
							index : 'id',
							align : 'center',
							width : 0,
							hidden : true,
						},
						{
							name : 'goodsNm',
							index : 'goodsNm',
							align : 'left',
							width : parseInt(JQGRID_INVENTORY_WIDTH * 0.38),
						},
						{
							name : 'stkQty',
							index : 'stkQty',
							align : 'center',
							width : parseInt(JQGRID_INVENTORY_WIDTH * 0.16),
						},
						{
							name : 'safeStkQty',
							index : 'safeStkQty',
							align : 'center',
							width : parseInt(JQGRID_INVENTORY_WIDTH * 0.16),
						},
						{
							name : 'lastInOrdDt',
							index : 'lastInOrdDt',
							align : 'center',
							width : parseInt(JQGRID_INVENTORY_WIDTH * 0.20),
						}, ],
				rowNum : 10,
				rowList : [ 10, 20, 30, 40, 50 ],
				scrollOffset : 0,
				/* pager : "#jqgrid-inventory-pager", */
				viewrecords : true,
				shrinkToFit : true,
				onCellSelect : function(rowid, icol, cellcontent, e) {}
		});
		/* jqgrid init END */
			
		
		/* 날짜 클릭 이벤트 init START */
		
		// 서비스 현황 오늘/이번 주/이번 달 클릭버튼 
		$('.It-dateBtn.status').on('click', function(e) {
			/*
				오늘의 보관량    #today-storage-amount
				택배출고        #status-out-delivery
				일반출고        #status-out-normal
				해외출고        #status-out-overseas
			*/
			if ( $(this).data('type') === 'day' ) { // 오늘 클릭
				$('.loader-wrapper').removeClass('display-none');
				setServiceStatus(getDayType(), getDayType());
			
			} else if ( $(this).data('type') === 'week' ) { // 이번 주 클릭
				$('.loader-wrapper').removeClass('display-none');
				setServiceStatus(getWeekType(), getDayType());
			
			} else if ( $(this).data('type') === 'month' ) { // 이번 달 클릭
				$('.loader-wrapper').removeClass('display-none');
				setServiceStatus(getMonthType(), getDayType());
			}
		
		});
		
		
		// 출고 순위
		$('.It-dateBtn.chart').on('click', function(e) {
			/*
				파이차트        #pie-chart
				라인차트        #line-chart
			*/
			if ( $(this).data('type') === 'day' ) { // 오늘 클릭
				$('.loader-wrapper').removeClass('display-none');
		     	google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(function() { drawChart(getDayType(), getDayType()); });
				
			} else if ( $(this).data('type') === 'week' ) { // 이번 주 클릭
				$('.loader-wrapper').removeClass('display-none');
		     	google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(function() { drawChart(getWeekType(), getDayType()); });
				
			} else { // 이번 달 클릭
				$('.loader-wrapper').removeClass('display-none');
		     	google.charts.load('current', {'packages':['corechart']});
		     	google.charts.setOnLoadCallback(function() { drawChart(getMonthType(), getDayType()); });
				
			}
		
		});
		
		/* 날짜 클릭 이벤트 init END */
		
		// 공지사항 클릭 카테고리 이벤트
		$('.dashboard-category').on('click', function(e) {
			$('.dashboard-category').removeClass('selected');
			$(this).addClass('selected');
		});
		
		// 공지사항 ajax.
		getNoticeList();

	});

	//화면 리사이징 그리드 사이즈 
	$(window).resize(function() {
		$("#jqgrid-board").setGridWidth($(".item-jqgrid").width());
	});

	// 공지사항 상세로 이동
	function noticeRowClick(rowId, icol, cellcontent, e) {
		const data = $('#jqgrid-board').getRowData()[rowId - 1];
		location.href = '${contextPath}/dashboard/notice-detail?id=' + data.id;
	};

	// 공지사항 ajax.
	function getNoticeList() {

		$.ajax({
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/list',
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
				$('#jqgrid-board').clearGridData();

				for (var i = 0; i < data.length; i++) {
					$('#jqgrid-board').jqGrid('addRowData', i + 1, data[i]);
				}
			},
		});

	}
	
	/* 초도 오늘의 출고현황 셋팅 START */
	function initDashBoardOut(fromDate, toDate){
		
		// 1) 오늘의 출고 현황
		$.ajax({ 
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchDashboardOut',
			type : 'GET',
			data : {
				fromDate : fromDate,
				toDate : toDate,
			},
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
					$('#out-delivery').text(comma(data[0].outPcCount));
					$('#out-normal').text(comma(data[0].outCrCount));
					$('#out-overseas').text(comma(data[0].outWdCount));
				}
			});
		
		// 2) 오늘의 입고 현황
		$.ajax({ 
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchDashboardIn',
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
			
				var deliverySplit = data[0].inOrdIn01.split('/');
				var normalSplit = data[0].inOrdIn02.split('/');
				var overseasSplit = data[0].inOrdIn04.split('/');

		
				 $('#in-request').text(comma(deliverySplit[0]));
				 $('#in-confirm').text(comma(normalSplit[0]));
				 $('#in-complete').text(comma(overseasSplit[0]));
				 
				 $('#in-request-sku').text(deliverySplit[1]);
				 $('#in-confirm-sku').text(normalSplit[1]);
				 $('#in-complete-sku').text(overseasSplit[1]);
				
				}
			});
		
		
		// 3) 서비스현황 초도 설정 - 이번 달
		setServiceStatus(getMonthType(), getDayType());
		$('.It-dateBtn.status[data-type="day"]').removeClass('It-dateBtn-g');
		$('.It-dateBtn.status[data-type="month"]').addClass('It-dateBtn-g');
		
		
		// 4) 오늘의 보관량 초도설정
		$.ajax({ 
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchDashboardStoreWeight',
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
					
					if ( data && data[0] && data[0].storeWeight ) {
						const skuEa = data[0].storeWeight.split('/');
						
						$('#sku').text(comma(skuEa[0]));
						$('#ea').text(comma(skuEa[1]));
					} else {
						$('#sku').text("0");
						$('#ea').text("0");
					}
				}
			});
		
		// 5) 오늘의 재고부족현황 초도설정
		$.ajax({
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchDashboardStockLack',
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
					
					if (!data || data.length === 0) {
						$('.inventory-shortage').css('overflow-y', 'hidden');
						$('#jqgrid-inventory-wrapper').hide();
					} else {
						$('#no-stock-image').hide();
						for (let i = 0; i < data.length; i++) {
							$('#jqgrid-inventory').jqGrid("addRowData", i + 1, data[i]);
						};	
					}
				
				}
			});

		// 6) 차트그리기
     	google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(function(){ drawChart(getMonthType(), getDayType()) })
			.then(function(value) {
				$('.It-dateBtn.chart[data-type="day"]').removeClass('It-dateBtn-g');
				$('.It-dateBtn.chart[data-type="month"]').addClass('It-dateBtn-g');
			})
			.catch(function(reason) {
				console.error('차트 로딩에 에러가 있습니다.');
			});
		
	}
	/* 초도 오늘의 출고현황 셋팅 END */
	
    function drawChart(fromDate, toDate) {

    	// 대시보드 출고순위 상품별 차트
		$.ajax({  
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchDashboardGoodsRank',
			type : 'GET',
		 	data : {
				fromDate : fromDate,
				toDate : toDate,
			}, 
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(outData) {
				
				// 출고순위(파이차트) 데이터가 없는경우
				if(outData.length == 0){
					
					$('#out-empty-image').show();
					$('#pie-chart').hide();
					$('#line-chart').hide();
					$('#chart-border').hide();
					
					$('#out-empty-image').parent().css('padding', '64px 82px 76px');
					$('#out-empty-image').parent().css('text-align', 'center');
					
					$('.loader-wrapper').addClass('display-none');
					
				}else{ // 출고순위(파이차트) 표현할 데이터가 있는경우
					
					$('#out-empty-image').parent().css('padding', 'unset');
					$('#out-empty-image').parent().css('text-align', 'unset');
					
					$('#out-empty-image').hide();
					$('#pie-chart').show();
					$('#line-chart').show();
					$('#chart-border').show();
					
					// Create the data table.
			        var data = new google.visualization.DataTable();
	 		        data.addColumn('string', '상품명');
			        data.addColumn('number', '출고건수');
			        data.addColumn('string', 'goodsCd');
			        
			        var arr = new Array();
					for (let i = 0; i < outData.length; i++) {
						arr[i] = [outData[i].goodsNm , outData[i].goodsCount, outData[i].goodsCd]; 
					};		
					
					data.addRows(arr);

			        // Set chart options
			        var options = {
			        				'title':'',
			        			   	'legend':'none',
			                       	'width': 215,
			                       	'height': 200,
		                 			'colors': ['#2C4EAA','#4B68B6','#758BC7','#B4C0E1','#DEE4F2'],
	 								'is3D': 'true',
 									'pieSliceText': 'percentage',
			        			};
			        
			        // Instantiate and draw our chart, passing in some options.
			        const chart = new google.visualization.PieChart(document.getElementById('pie-chart'));
			        chart.draw(data, options);

			        // 파이차트에서 특정섹션을 눌렀을 때 라인차트를 보여주기위한 리스너 등록. 
			        google.visualization.events.addListener(chart, 'select', selectHandler);
			        
			        
			        function selectHandler() {
			        	 const selection = chart.getSelection()[0];
						 if (selection && selection.row !== null) {
							 const goodsCd = data.getFormattedValue(selection.row, 2);
							 console.log('### '+ goodsCd);
							 
							 $.ajax({ // 대시보드 출고순위 상품별 차트 (라인차트)
							 	url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchDashboardGoodsRankRange',
							 	type : 'GET',
							 	data : {
							 		goodsCd : goodsCd,
							 		searchDay : 1
							 		}, 
			    				dataType : 'json',
			    				contentType : 'application/json;charset=UTF-8',
			    				success : function(goodsData) {
						    					
			    					goodsArr = new Array();
			    					for (let i = 0; i < goodsData.length; i++) {
			    						goodsArr[i] = [goodsData[i].outOrdDt ,goodsData[i].goodsCount]; 
			    					};		
						    					
			    					data.addRows(arr);
			    					
			    					google.charts.load('current', {'packages':['line']});
			    					google.charts.setOnLoadCallback(function() { drawLineChart(arr[selection.row][0]) });
						
		    					}
						    });
						 } 
			       	 };
					
			       	 // 파이차트 그리면서 라인차트 함께 그려지도록.
			       	 const selection = {row: 0, column: null};
			       	 const goodsCd = data.getFormattedValue(selection.row, 2);

			       	 $.ajax({ // 대시보드 출고순위 상품별 차트 (라인차트)
			       	 	url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchDashboardGoodsRankRange',
			       	 	type : 'GET',
			       	 	data : {
			       	 		goodsCd : goodsCd,
			       	 		searchDay : 1
		       	 		}, 
		       	 		dataType : 'json',
		       	 		contentType : 'application/json;charset=UTF-8',
		       	 		success : function(goodsData) {
		       	 			
		       	 				goodsArr = new Array();
			       	 			for (let i = 0; i < goodsData.length; i++) {
			       	 				goodsArr[i] = [goodsData[i].outOrdDt ,goodsData[i].goodsCount]; 
		       	 				};		
				        					
		       	 				data.addRows(arr);
	
		       	 				google.charts.load('current', {'packages':['line']});
		       	 				google.charts.setOnLoadCallback(function() { drawLineChart(arr[selection.row][0]) });
	       	 				}
       					});
					}
				}
			});
        
      }
	
	// 라인차트 
    function drawLineChart(goodsNm) {

        var data = new google.visualization.DataTable();
        data.addColumn('string', '');
        data.addColumn('number', '판매량');

        /* console.log('=====');
        console.log(goodsArr);
        console.log('====='); */
        
        data.addRows(goodsArr);

        var options = {
        		chart: {
        			title: goodsNm,
       			},
       			tooltip: {trigger : 'click'},
       			hAxis: {textStyle :{
					fontSize : 0
				}
          	},
          vAxis: {
        	  textStyle :{
        	  	fontSize : 9
        	  } 
          }, 
		  legend: {position: 'none'},
		  'colors': ['#2C4EAA','#4B68B6','#758BC7','#B4C0E1','#DEE4F2'],
          'width': 220,
          'height': 200
        };

        var chart = new google.charts.Line(document.getElementById('line-chart'));
        chart.draw(data, google.charts.Line.convertOptions(options));
        
        $('.loader-wrapper').addClass('display-none');
        
    }
	
	function setServiceStatus(fromDate, toDate){ // 서비스현황 오늘/이번 주/이번 달 셋팅
		
		$.ajax({
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/searchDashboardOut',
			type : 'GET',
			data : {
				fromDate : fromDate,
				toDate : toDate
			},
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {

				 $('#status-out-delivery').text(comma(data[0].outPcCount));
				 $('#status-out-normal').text(comma(data[0].outCrCount));
				 $('#status-out-overseas').text(comma(data[0].outWdCount));
				
			},
			complete: function() {
				$('.loader-wrapper').addClass('display-none');
			}
		});
		
	}

	// 1000000 -> 1,000,000 변환
	function comma(str){
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
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
    
    
	/* 
		값 위치. span 태그로 잡아둠.
		ex. $('#out-delivery').text(3920); 로 변경.

		택배출고        #out-delivery
		일반출고        #out-normal
		해외출고        #out-overseas
		
		입고신청        #in-request
		입고신청 sku    #in-request-sku
		확정대기        #in-confirm
		확정대기 sku    #in-confirm-sku
		입고완료        #in-complete
		입고완료 sku    #in-complete-sku
		
		오늘의 보관량    #today-storage-amount
		
		택배출고        #status-out-delivery
		일반출고        #status-out-normal
		해외출고        #status-out-overseas
		
		(차트위치)
		
		파이차트        #pie-chart
		라인차트        #line-chart
	*/
</script>