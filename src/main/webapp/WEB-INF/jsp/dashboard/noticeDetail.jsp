<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/tagLibs.jsp" %>

<div class="mainContent" style="padding: unset;">
	<div id="notice-category-container">
		<div id="notice-category-wrapper" class="notice-wrapper-width">
			<div id="notice-main-category">공지사항</div>
			<div id="notice-middle-category">시스템안내</div>
		</div>	
	</div>
	<div id="notice-container">
		<div id="notice-wrapper" class="notice-wrapper-width">
			<div id="notice-title-wrapper">
				<input type="hidden" value="${notice.id}" />
				
				<c:choose>
					<c:when test="${usertype eq 'AD'}">
						<div id="notice-title">
							제목 : 
							<input type="text"  id ="notice_title" class="item-input-table" style="width:800px">
							<div id="notice-title-hide" style="display:none">${notice.title}</div>
						</div>
					</c:when>
					<c:otherwise>
						<div id="notice-title">${notice.title}</div>
					</c:otherwise>
				</c:choose>
				<div id="notice-date">
					<c:choose>
						<c:when test="${empty(notice.modDate)}">
							${fn:replace(notice.regDateString, '-', '. ')}
						</c:when>
						<c:otherwise>
							${fn:replace(notice.modDateString, '-', '. ')}
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<c:choose>
				<c:when test="${usertype eq 'AD'}">
					<div id="notice-content-hide" style="display:none">
						${notice.contents}
					</div>
					<div class="notice-content">
		        		<textarea id="area_editor"></textarea>
		    		</div>
		    			<c:if test="${usertype == 'AD' && not empty notice.id}">
				    		<div style="text-align:right;padding-top: 10px;padding-bottom: 10px;">
								<button id="notice-button" onclick ="updateNotice();">수정</button>
								<button id="notice-button" onclick ="deleteNotice();">삭제</button>
							</div>
		    			</c:if>
		    			<c:if test="${usertype == 'AD' && empty notice.id}">
				    		<div style="text-align:right;padding-top: 10px;padding-bottom: 10px;">
								<button id="notice-button" onclick ="insertNotice();">등록</button>
							</div>
		    			</c:if>
				</c:when>
				<c:otherwise>
					<div id="notice-content">
						${notice.contents}
					</div>
				</c:otherwise>
			</c:choose>
			
			
			
			
			<!-- <div>첨부파일</div> -->
			<div id="notice-navigation-wrapper">
				<div id="notice-navigation-next" class="notice-navigation" style="display: none;">
					<img src="${contextPath}/assets/images/icon/COLO_article_UP.svg" width="18px;" />
					<span id="notice-navigation-next-title">다음 글</span>
				</div>
				<div id="notice-navigation-prev" class="notice-navigation" style="display: none;">
					<img src="${contextPath}/assets/images/icon/COLO_article_DOWN.svg" width="18px;" />
					<span id="notice-navigation-prev-title">이전 글</span>
				</div>
			</div>
			
			<div style="text-align: center;">
				<button id="notice-button" onclick ="location.href='/dashboard/main'">목록으로</button>
			</div>
		</div>
		<div class="loader-wrapper display-none" style="height: 100%;width: 100%;transform: translate(-10px, -10px);">
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
</div>

<style type="text/css">
.mainContent {
	font-size: 14px;
}
#notice-category-container {
	display: flex;
	justify-content: center;
	
	border-bottom: solid 1px #cccccc;
	padding: 14px 16px;
}
#notice-category-wrapper {}
#notice-container {
	display: flex;
	justify-content: center;
}
#notice-wrapper {}
#notice-title-wrapper {
	display: flex;
	justify-content: space-between;
	align-items: center;
	
	padding: 24px 0;
	border-bottom: solid 1px #cccccc;
}
.notice-wrapper-width {
	min-width: 1024px;
	width: 1024px;
}
#notice-navigation-wrapper {
	border-top: 1px solid #cccccc;
	margin-bottom: 52px;
}
#notice-navigation-next,
#notice-navigation-prev {
	display: flex;
	cursor: pointer;
}

#notice-navigation-next img,
#notice-navigation-prev img {
	padding: 0 30px;
}
.notice-navigation {
	padding: 12px 0;
	border-bottom: 1px solid #cccccc;
	color: #7b7b7b;
}
#notice-button {
	border: solid 1px #2c4eaa;
	color: #2c4eaa;
	border-radius: 4px;
	font-weight: 600;
	padding: 6px 32px;
	cursor: pointer;
}
#notice-button:hover {
	font-weight: 500;
	color: #fff;
	background-color: #2c4eaa;
}

/* Font Hierarchy */
#notice-main-category {
	font-size: 15px;
	color: #999;
}
#notice-middle-category {
	font-size: 19px;
	color: #999;
}
#notice-title {
	font-size: 24px;
}
#notice-date {
	font-size: 18px;
}
#notice-content {
	padding: 35px 0;
	line-height: 1.6;
}
.blue {
	color: #2c4eaa;
}
/* Font Hierarchy END */

</style>
<link rel="stylesheet" href="${contextPath}/assets/js/plugin/jodit/jodit.min.css"/>
<script src="${contextPath}/assets/js/plugin/jodit/jodit.min.js"></script>
<script type="text/javascript">

	
	<c:choose>
	<c:when test="${empty(notice.id)}">
		var currentNoticeId = 0;
	</c:when>
	<c:otherwise>
	var currentNoticeId = ${notice.id};
	</c:otherwise>
	</c:choose>

	$(document).ready(function() {
		
		
		
		
		
		let prevId;
		let nextId;
	
		// GET AJAX - 이전글, 다음글
		$.ajax({
			url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.get + '/preNextDoc',
			type : 'GET',
			dataType : 'json',
			data: { id: currentNoticeId },
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
			
				for(let i = 0; i < data.length; i++) {
					if (data[i].id) {
						if (data[i].id < currentNoticeId) {
							prevId = data[i].id; 
							$('#notice-navigation-prev').show();
							$('#notice-navigation-prev-title').text(data[i].title);
						} else {
							nextId = data[i].id;
							$('#notice-navigation-next').show();
							$('#notice-navigation-next-title').text(data[i].title);
						}
					}
				}
				
			}
		});
		
		$('#notice-navigation-prev').on('click', function () {
			location.href='/dashboard/notice-detail?id=' + prevId;
		});
		
		$('#notice-navigation-next').on('click', function () {
			location.href='/dashboard/notice-detail?id=' + nextId;
		});

		
		
	});
	
	

	<c:if test="${usertype == 'AD'}">
		var editor = new Jodit('#area_editor', {
		    textIcons: false,
		            toolbarButtonSize: 'small',
		    iframe: false,
		    iframeStyle: '*,.jodit-wysiwyg {color:red;}',
		    height: 700,
		    defaultMode: Jodit.MODE_WYSIWYG,
		    observer: {
		        timeout: 100
		    },
		    uploader: {
		        "insertImageAsBase64URI": true
		    },
		    commandToHotkeys: {
		        'openreplacedialog': 'ctrl+p'
		    }
		});
		
		var notice_val = $("#notice-content-hide")[0].innerHTML;
		

		$("#notice_title")[0].value = $("#notice-title-hide")[0].innerHTML;
		editor.setEditorValue(notice_val);
		
		function insertNotice() {
			var product={
					id : currentNoticeId
					,title : $("#notice_title")[0].value
					,contents : editor.value
			};
			
			$.ajax({
				url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.add + '/insertNotice',
				type : 'POST',
				data : JSON.stringify(product),
				dataType : 'json',
				contentType : 'application/json;charset=UTF-8',
				success : function(data) {

					alert(data.message);
					
					//화면 리로드
	            	$(location).attr('href', "/dashboard/main");


				},
				error : function(request, status, error) {
					alert(request.responseJSON.message);
				}, beforeSend: function() { 
	         	   
	           		$('.loader-wrapper').removeClass('display-none');

	               }, complete: function() { 
	            	   
	               	$('.loader-wrapper').addClass('display-none');
	               
	               }
			});
			
		};
		
		function updateNotice() {
			var product={
					id : currentNoticeId
					,title : $("#notice_title")[0].value
					,contents : editor.value
			};
			
			$.ajax({
				url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.add + '/updateNotice',
				type : 'POST',
				data : JSON.stringify(product),
				dataType : 'json',
				contentType : 'application/json;charset=UTF-8',
				success : function(data) {

					alert(data.message);
					
					//화면 리로드
	            	$(location).attr('href', "/dashboard/main");


				},
				error : function(request, status, error) {
					alert(request.responseJSON.message);
				}, beforeSend: function() { 
	         	   
	           		$('.loader-wrapper').removeClass('display-none');

	               }, complete: function() { 
	            	   
	               	$('.loader-wrapper').addClass('display-none');
	               
	               }
			});
			
		};
		
		function deleteNotice() {
			var product={
					id : currentNoticeId

			};
			
			$.ajax({
				url : '${contextPath}/ajax/' + ajaxName.dashboard + httpMethod.add + '/deleteNotice',
				type : 'POST',
				data : JSON.stringify(product),
				dataType : 'json',
				contentType : 'application/json;charset=UTF-8',
				success : function(data) {

					alert(data.message);
					
					//화면 리로드
	            	$(location).attr('href', "/dashboard/main");


				},
				error : function(request, status, error) {
					alert(request.responseJSON.message);
				}, beforeSend: function() { 
	         	   
	           		$('.loader-wrapper').removeClass('display-none');

	               }, complete: function() { 
	            	   
	               	$('.loader-wrapper').addClass('display-none');
	               
	               }
			});
			
		};
		
		
	
	</c:if>

	
	
	
	
	
</script>