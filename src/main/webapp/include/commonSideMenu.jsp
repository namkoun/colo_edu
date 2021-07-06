<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/tagLibs.jsp"%>

<c:set var="memberTypeCode" value="${sessionScope.userInfo.memberTypeCode}" />
<c:set var="menuInfo" value="${sessionScope.menuInfo}" />

<div class="sideMenu-shrinked">
	<div class="sideMenu-container">
		<div class="user-info">
			<img src="${contextPath}/assets/images/default-userimage.png" class="user-image">
		</div>
		<div class="login-info">
			<span class="login-time"><span>25:58</span></span>
			<button class="btn-logout"><a href="${contextPath}/login/logout">로그아웃</a></button>
			<!-- js -->
		</div>
		<div class="btn-accordian-wrapper">
            <button class="btn-accordian"></button>
            <div class="btn-accordian-m-wrapper">
                <button class="btn-accordian-m"></button>
            </div>
        </div>
        <%-- 사이드 메뉴 - 접었을 때 --%>
		<a role="button" class="btn-dashboard" title="대시보드" href="/dashboard/main"><img src="${contextPath}/assets/images/icon/CFMS_dashboard.svg"></a>
		<ul id="nav">
		
			<c:forEach var="i" begin="0" end="${sessionScope.menuInfo.size()-1}" varStatus="iStatus">
				<c:if test="${sessionScope.menuInfo.get(iStatus.current).menuParent eq '0' and fn:contains(sessionScope.menuInfo.get(iStatus.current).menuMemberType, memberTypeCode)}">
					<li class="menu-wrapper"><img src="${sessionScope.menuInfo.get(iStatus.current).menuLink}">
						<ul class="menu">
								<a href="#"><li><span class="menu-title"> ${sessionScope.menuInfo.get(iStatus.current).menuName}</span></li></a>
							<c:forEach var="j" begin ="${iStatus.current}" end="${sessionScope.menuInfo.size()-1}" varStatus="jStatus">
								<c:if test="${sessionScope.menuInfo.get(iStatus.current).menuId eq sessionScope.menuInfo.get(jStatus.current).menuParent and fn:contains(sessionScope.menuInfo.get(jStatus.current).menuMemberType, memberTypeCode)}">
								<a href="${sessionScope.menuInfo.get(jStatus.current).menuLink}"><li class="menu-options">${sessionScope.menuInfo.get(jStatus.current).menuName}</li></a>
								</c:if>
							</c:forEach>
						</ul>
					</li>
				</c:if>
			</c:forEach>
			<div class="logoWrapper1" style="display:none;">
				<img src="${contextPath}/assets/images/icon/CFMS_colosseum_logo_markonly.svg" title="콜로세움 로고" class="logo">
			</div>
		</ul>
	</div>
	<div class="menu-footer">
	</div>
</div>
<!-- sideMenu basic -->
<div class="sideMenu-basic" style="min-height: 1074px;">
	<div class="sideMenu-container side1" style="height: 100%; box-sizing: border-box;">
		<div class="user-info">
			<c:if test="${sessionScope.userInfo.memberTypeCode == 'AD'}">
				<h2 class="admin">${sessionScope.userInfo.name}</h2>
			</c:if>
			<c:if test="${sessionScope.userInfo.memberTypeCode == 'SL'}">
				<h2 class="seller">${sessionScope.userInfo.name}</h2>
			</c:if>
			<c:if test="${sessionScope.userInfo.memberTypeCode == 'WH'}">
				<h2 class="warehouse">${sessionScope.userInfo.name}</h2>
			</c:if>
			<c:if test="${sessionScope.userInfo.memberTypeCode == 'GD'}">
				<h2 class="godo">${sessionScope.userInfo.name}</h2>
			</c:if>
			
			<span class="user-job">${sessionScope.userInfo.cmpNm}</span>
		</div>
		<div class="login-info">
			<span class="login-time">로그인 유지시간 | <span>180:00</span></span>
			<button class="btn-logout" style="margin-left:0;"><a href="${contextPath}/login/logout">로그아웃</a></button>
		</div>
		<div class="btn-accordian-wrapper">
			<button class="btn-accordian"></button>
		</div>
		<a role="button" class="btn-dashboard" href="/dashboard/main">대시보드</a>
		<%-- 사이드메뉴 - 펼쳤을 때 --%>
		<nav>
			<c:forEach var="i" begin="0" end="${sessionScope.menuInfo.size()-1}" varStatus="iStatus">
				<c:if test="${sessionScope.menuInfo.get(iStatus.current).menuParent eq '0' and fn:contains(sessionScope.menuInfo.get(iStatus.current).menuMemberType, memberTypeCode)}">
					<ul class="menu">
						<li><img src="${sessionScope.menuInfo.get(iStatus.current).menuLink}"> <a href="#"><span class="menu-title"> ${sessionScope.menuInfo.get(iStatus.current).menuName}</span></a></li>
						<c:forEach var="j" begin ="${iStatus.current}" end="${sessionScope.menuInfo.size()-1}" varStatus="jStatus">
							<c:if test="${sessionScope.menuInfo.get(iStatus.current).menuId eq sessionScope.menuInfo.get(jStatus.current).menuParent and fn:contains(sessionScope.menuInfo.get(jStatus.current).menuMemberType, memberTypeCode)}">
								<a href="${sessionScope.menuInfo.get(jStatus.current).menuLink}">
									<li class="menu-options" style="display: flex; align-items: center;">
										<div style="margin-right: 4px;">${sessionScope.menuInfo.get(jStatus.current).menuName}</div>
										<c:if test="${sessionScope.menuInfo.get(jStatus.current).menuName eq ''}">
											<div class="sideMenu-new-badge-middle">new</div>
										</c:if>
									</li>
								</a>
							</c:if>
						</c:forEach>
					</ul>
				</c:if>
			</c:forEach>
			<ul id="sideMenu-guide-wrapper" style="margin-top: 32px;">
				<c:if test="${sessionScope.userInfo.memberTypeCode == 'AD'}">
					<li><a href="https://www.notion.so/colosseumkr/COLO-96a7f4ef51ab479f95ceaa1cbb4dbd43" target="_blank"><div class="sideMenu-guide-item">(셀러용)콜로 이용가이드<div class="sideMenu-new-badge-top">new</div></div></a></li>
					<li><a href="https://www.notion.so/colosseumkr/2770b540a369436ba3f4b53c3744e614" target="_blank"><div class="sideMenu-guide-item">(창고용)콜로 이용가이드<div class="sideMenu-new-badge-top">new</div></div></a></li>
				</c:if>
				<c:if test="${sessionScope.userInfo.memberTypeCode == 'SL'}">
					<li><a href="https://www.notion.so/colosseumkr/COLO-96a7f4ef51ab479f95ceaa1cbb4dbd43" target="_blank"><div class="sideMenu-guide-item">콜로 이용가이드<div class="sideMenu-new-badge-top">new</div></div></a></li>
				</c:if>
				<c:if test="${sessionScope.userInfo.memberTypeCode == 'WH'}">
					<li><a href="https://www.notion.so/colosseumkr/2770b540a369436ba3f4b53c3744e614" target="_blank"><div class="sideMenu-guide-item">콜로 이용가이드<div class="sideMenu-new-badge-top">new</div></div></a></li>
				</c:if>
				<li><a href="https://www.notion.so/colosseumkr/fb3537c9efe944008843a89766b4cead" target="_blank"><div class="sideMenu-guide-item">입고 · 출고 가이드<div class="sideMenu-new-badge-top">new</div></div></a></li>
			</ul>
		</nav>
		<div class="logoWrapper2" style="margin-left: -19px; display: flex; justify-content: center; margin-top: 32px; position: absolute; transform: translate(10px, 10px); left: 50%; bottom: 54px;">
			<img src="${contextPath}/assets/images/icon/CFMS_colosseum_logo.svg" title="콜로세움 로고" class="logo">
		</div>
	</div>
	<div class="menu-footer">
	</div>
</div>

<style>
.sideMenu-new-badge-middle,
.sideMenu-new-badge-top {
	display: inline-block;
	padding: 1px 4px;
	font-size: 10px;
	font-weight: 600;
	line-height: 1;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	transition: all .2s ease-in-out;
	color: #1e2022;
	background-color: #ffe200;
	border-radius: 6px;
}
.sideMenu-new-badge-top {
	position: absolute;
    top: -5px;
}
#sideMenu-guide-wrapper {
	margin-top: 32px;
}
#sideMenu-guide-wrapper li {
	margin-bottom: 8px;
}
#sideMenu-guide-wrapper li:last-child {
	margin-bottom: unset !important;
}
.sideMenu-guide-item {
	position: relative;
	display: inline-block;
	font-size: 12px;
	color: #fff;
	background-color: #2c4eaa;
	padding: 2px 12px;
	border-radius: 12px;
	font-weight: 400;
}
</style>

<script type="text/javascript">

	var timerId;
	var timerSec = 10800;
	
	$(document).ready(function() {
		for(let i = 0; i < $('nav ul.menu li.menu-options').length; i++) {
			if ( $($('nav ul.menu li.menu-options')[i]).text().trim() === localStorage.getItem('selectedMenuName') ) {
				$($('nav ul.menu li.menu-options')[i]).addClass('active-menu');
			}
		}
	})
	
	// 화면 로드와 함께 시작
	window.onload = function() {
		timerId = setInterval('timer()', 1000);
	};
	
	// 마우스 움직이는 경우
	document.onmousemove = function() {
		resetTimer();
	};
	
	// 키보드 키 누르는 경우
	document.onkeypress = function() {
		resetTimer();
	};
	
	// 터치스크린 누르는 경우
	document.onmousedown = function() {
		resetTimer();
	};
	
	// 마우스클릭
	document.onclick = function() {
		resetTimer();
	};
	
	// 마우스 스크롤 하는 경우
	document.onscroll = function() {
		resetTimer();
	};
	
	function resetTimer() {
		timerSec = 10800;
	};
	
	function timer() {

		var min = Math.floor(timerSec / 60);
		var sec = timerSec % 60;
		
		var msg = (min < 10 ? "0" + min : min) + ":" + (sec < 10 ? "0" + sec : sec);
		timerSec--;

		if (timerSec < 0) {
			location.href = '${contextPath}/login/logout';
		}
		
		$(".login-time span").html(msg);
	};
	
</script>