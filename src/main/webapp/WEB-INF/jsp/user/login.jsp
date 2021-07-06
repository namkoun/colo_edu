<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/tagLibs.jsp" %>

<!-- 화면 HTML -->
<div class="login-container">
    <div class="background-image-wrapper">
        <img src="${contextPath}/assets/images/LoginPage_RollingImage/cfms_rolling_1.jpg">
        <img src="${contextPath}/assets/images/LoginPage_RollingImage/cfms_rolling_2.jpg">
        <img src="${contextPath}/assets/images/LoginPage_RollingImage/cfms_rolling_3.jpg">
        <img src="${contextPath}/assets/images/LoginPage_RollingImage/cfms_rolling_4.jpg">
    </div>
    
    <div class="loain-area">
        <img src="${contextPath}/assets/images/icon/CFMS_colosseum_logo.svg" class="login-logo">
        <div class="login-info">
        	<p style="margin-bottom:5px">필요한 만큼의 풀필먼트, 콜로세움입니다.</p>
            <p>쉽고 편한 풀필먼트 관리 솔루션 COLO로</p>
            <p>전화·이메일 없는 물류 업무를 시작하세요.</p>
            </div>
        <form id="loginForm" method="post" onsubmit="return false;">
            <div class="login-form-wrapper">
                <div class="login-form">
                    <label for="loginEmail" class="login-label">계정(이메일주소)</label>
                    <input type="email" name="loginEmail" id="loginEmail" >
                </div>
                <div class="login-form">
                    <label for="loginPassword" class="login-label">비밀번호</label>
                    <input type="password" name="loginPassword" id="loginPassword" >
                </div>
            </div>
            <input type="submit" id="loginBtn" value="로그인" class="login-btn" style="border-radius: 3px; background: #2C4EAA; ">
        </form>
        <div class="login-bottomOption">
            <input type="checkbox" name="idRemember" id="idRemember" value="기억하기"><label for="idRemember">기억하기</label>
            <a role="button" id="findPassword">비밀번호 찾기</a>
        </div>
        <div class="signupBtn-wrapper">
            <a href="${contextPath}/signup/seller-signup" role="button" class="seller-signup-btn"><span>셀러 회원가입</span></a>
            <a href="${contextPath}/signup/warehouse-signup" role="button" class=""><span>창고주 회원가입</span></a>
        </div>
        <div class="login-footer-wrapper item-flexbox-bs">
        <div style="width: 100%;">
        <h2>COLO</h2>
        <p>Colosseum Fulfillment <br>
                   Operating Solution ver. 1.0</p>
                <p style="margin-top: 20px;">ⓒ 2021 Colosseum Corporation, Inc. all rights reserved.</p>
        </div>
        <div style="width: 100%;">
        	<div style="width: 100%;">
                <p><span>회사명</span>주식회사 콜로세움코퍼레이션</p>
                <p><span>사업자등록번호</span>507-86-01649</p>
                <p><span>대표이사</span>박진수</p>
            </div>
            <div style="width: 105%; margin-top: 20px;">
                <p><span>고객센터</span>support@colosseum.kr / 1566-9527</p>
                <p><span>주소</span>[06247] 서울특별시 강남구 역삼로 169,3층(명우빌딩)</p>
                <p><span>개인정보관리자</span>김승호 support@colosseum.kr</p>
            </div>
        </div>
        </div>
    </div>

</div>

<!-- MODAL -->
<div class="itemPopup itemPopup-2" id="findPasswordModal" style="height:auto;">
	<div class="itemPopup-wrapper">
		<div class="itemPopup-title item-flexbox-bs">
			<h2>비밀번호 찾기</h2>
			<a role="button" class="close-Btn"></a>
		</div>
		<div class="item-wrapper">
			<div class="itemTab-popup-wrapper">
				<form id="findPassForm" onsubmit="return false;">
					<div>
						<div class="item-borderBottom">
							<div class="item-form">
								<label for="It-packing" class="item-label">아이디</label>
								<input type="text" name="mid" id="mid" class="item-input">
							</div>
							<div class="item-form">
								<label for="It-packing" class="item-label">이름</label>
								<input type="text" name="name" id="name" class="item-input">
							</div>
							<div class="item-form">
								<label for="It-packing" class="item-label">전화번호</label>
								<input type="text" name="mobile" id="mobile" class="item-input">
							</div>
						</div>
						<div class="itemBtn-wrapper">
							<button class="blue-Btn" style="height:auto;" id="sendTmpPassBtn">임시 비밀번호 발송</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- javascript -->
<script>

	$(document).ready(function () {
		
		/* 쿠키를 이용해 ID를 저장 */
		var idKey = getCookie('idKey');
		$('#loginEmail').val(idKey);
		
		if($('#loginEmail').val() != '') {
			$('#idRemember').attr('checked', true);
		}
		
		$('#idRemember').change(function() {
			if ($('#idRemember').is(':checked')) {
				setCookie('key', $('#loginEmail').val(), 7);
			} else {
				deleteCookie("idKey");
			}
		});
		
		$('#idRemember').on('click', function() {
			if ($('#idRemember').is(':checked')) {
				setCookie('key', $('#loginEmail').val(), 7);
			} else {
				deleteCookie("idKey");
			}
		});
		
		$('#loginEmail').keyup(function() {
			if ($('#idRemember').is(':checked')) {
				setCookie('key', $('#loginEmail').val(), 7);
			}
		});
		
		/* 로그인 */
		$('#loginBtn').on('click', function() {
			localStorage.removeItem('selectedMenuName');
			login();
		});
		
		/* 비밀번호찾기 */
		$('#findPassword').on('click', function() {
			findPassword();
		});
		
		$('#sendTmpPassBtn').on('click', function() {
			sendTmpPass();
		});
	});
	
	/* 쿠키 관련 저장 삭제 SET */
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value) + ((exdays == null) ? '' : '; expires=' + exdate.toGMTString());
		document.cookie = cookieName + '=' + cookieValue;
	};
	
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + '=' + '; expires=' + expireDate.toGMTString();
	};
	
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1) {
				end = cookieData.length;
			}
			cookieValue = cookieData.substring(start, end);
		}
		
		return unescape(cookieValue);
	};
	
	/* 로그인 */
	
	function login() {
		var mid = $('#loginEmail').val();
		
		$.ajax({
			url : '${contextPath}/ajax/' + ajaxName.user + '/login',
            type : 'POST',
            data : $('#loginForm').serializeJSONString(),
            dataType : 'json',
            contentType : 'application/json;charset=UTF-8',
            success : function (data) {
                if (data.response) {
                    location.href = '${contextPath}/dashboard/main';
                } else {
                    alert("해당 비밀번호를 사용한지 90일이 경과되었습니다. \n보안을 위해 비밀번호를 변경해주세요.")
                }
            },
            error:function(request,status,error){
                alert(request.responseJSON.message);
            }
		});
	};
	
	/* FormData 생성 */
	function setLoginFormData() {
		var formData = new FormData();
		
		formData.append("loginEmail", $('#loginEmail').val());
		formData.append("loginPassword", $('#loginPassword').val());
		
		return formData;
	};

	/* 비밀번호 찾기 Modal */
	function findPassword() {
		$('#findPasswordModal').show();
	};
	
	function sendTmpPass() {
		validationFindPass();

		var inputData = {
			mid : $('#mid').val(),
			name : $('#name').val(),
			mobile : $('#mobile').val()
		};
		
		$.ajax({
			url : '${contextPath}/ajax/' + ajaxName.user + '/send-temp-password',
			type : 'POST',
			data : JSON.stringify(inputData),
			dataType : 'json',
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
				alert(data.message);
				$('#findPasswordModal').hide();
			},
			error:function(request,status,error){
                alert(request.responseJSON.message);
            }
		});
	};
	
	function validationFindPass() {
		var mid = $('#mid').val();
		
		if (_.isNilOrBlank(mid)) {
			alert("아이디를 입력해 주시기 바랍니다.");
			$('#mid').focus();
			return false;
		}
		
		if (!_.isEmail(mid)) {
			alert('올바른 이메일 형식이 아닙니다.');
			$('#mid').focus();
			return false;
		}
		
		var name = $('#name').val();
		
		if (_.isNilOrBlank(name)) {
			alert("이름을 입력해 주시기 바랍니다.");
			$('#name').focus();
			return false;
		}
		
		var mobile = $('#mobile').val();
		
		if (_.isNilOrBlank(mobile)) {
			alert('휴대폰 번호를 입력하세요');
			$('#mobile').focus();
			return false;
		}
		
		if (!_.isNumber(mobile)) {
			alert('휴대폰 번호는 숫자만 입력해 주시기 바랍니다.');
			$('#mobile').focus();
			return false;
		}
	};

</script>
