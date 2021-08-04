<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/tagLibs.jsp" %>

<script type="text/javascript" src="${contextPath}/assets/js/common/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${contextPath}/assets/js/common/main.js?ver=1.11"></script>

<!-- datepicker -->
<link rel="stylesheet" href="${contextPath}/assets/css/lib/jquery.datetimepicker.min.css" />
<script type="text/javascript" src="${contextPath}/assets/js/plugin/datepicker/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript" src="${contextPath}/assets/js/plugin/datepicker/datepicker.js?ver=1.1"></script>

<%-- DataTables --%>
<script type="text/javascript" src="${contextPath}/assets/js/plugin/DataTables-1.10.24/datatables.min.js?v=1.0"></script>
<script type="text/javascript" src="${contextPath}/assets/js/plugin/DataTables-1.10.24/dataTables.checkboxes.min.js?v=1.0"></script>


<input id="memberTypeCode" type="hidden" value="${sessionScope.userInfo.memberTypeCode}" />

<script type="text/javascript">

    var checkUnload = false;

    $(window).on("beforeunload", function () {

        if (checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";

    });


    function changeCheckStatus(tf){
        checkUnload = tf;
    }


    /**
     * 공용 alert modal 호출 함수
     * callCommonAlertModal({
     *     header: '제목',       // 모달 제목
     *     body: '내용',         // 모달 내용
     *     isConfirm: false,    // true - 네/아니요, false - 확인
     *     rel: ''       // alert 구분자 (이벤트 분기용)
     * });
     */
    function callCommonAlertModal(paramObj) {
        if ( paramObj && paramObj.header ) {
            $("#common-alert-modal-header").html(paramObj.header);
        }
        if ( paramObj && paramObj.body ) {
            $("#common-alert-modal-body").html(paramObj.body);
        }
        if ( paramObj && paramObj.isConfirm ) {
            $("#common-alert-modal-bottom-btn-wrapper").hide();
            $("#common-alert-modal-bottom-confirm-btn-wrapper").show();
        } else {
            $("#common-alert-modal-bottom-btn-wrapper").show();
            $("#common-alert-modal-bottom-confirm-btn-wrapper").hide();
        }
        if ( paramObj && paramObj.rel ) {
            $("#common-alert-modal-header-close-btn").attr('rel', paramObj.rel);
            $('#common-alert-modal-btn-normal').attr('rel', paramObj.rel);
            $('#common-alert-modal-btn-confirm').attr('rel', paramObj.rel);
            $('#common-alert-modal-btn-cancel').attr('rel', paramObj.rel);
        }

        $("#common-alert-modal").show();
        $("#common-alert-modal-bg").show();

        $('.set-common-modal-height').css('top', ( window.innerHeight / 2 ) + $(window).scrollTop());
        $('body').css('overflow-y', 'hidden');

    }
    function getUUID() { // UUID v4 generator in JavaScript (RFC4122 compliant)
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            let r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 3 | 8);
            return v.toString(16);
        });
    }
    $(document).ready(function () {

        /*   공용모달 이벤트 START   */

        // X 아이콘 클릭
        $("#common-alert-modal-header-close-btn").on('click', function () {
            $("#common-alert-modal").hide();
            $("#common-alert-modal-bg").hide();
            $('body').css('overflow-y', 'auto');
        });
        // 확인 클릭
        $('#common-alert-modal-btn-normal').on('click', function () {
            $("#common-alert-modal").hide();
            $("#common-alert-modal-bg").hide();
            $('body').css('overflow-y', 'auto');
        });
        // 네 클릭
        $('#common-alert-modal-btn-confirm').on('click', function () {
            $("#common-alert-modal").hide();
            $("#common-alert-modal-bg").hide();
            $('body').css('overflow-y', 'auto');
        });
        // 아니요 클릭
        $('#common-alert-modal-btn-cancel').on('click', function () {
            $("#common-alert-modal").hide();
            $("#common-alert-modal-bg").hide();
            $('body').css('overflow-y', 'auto');
        });

        /**
         *  한 페이지에서 여러 개의 common alert modal을 호출할 때,
         *  모달별로 확인/네/아니오 버튼 기능을 각각 정의하고 싶은 경우 페이지에 넣어주세요!
         *
         *  페이지에 .ready가 정의되어 있으면, 콜백함수에 재정의해야 합니다!
         *  $().ready(function(){  !!! 여기 !!! });
         *
         *  각 버튼의 셀렉터들은
         *    확인:  $('#common-alert-modal-btn-normal')
         *    네:    $('#common-alert-modal-btn-confirm')
         *    아니요: $('#common-alert-modal-btn-cancel')
         *  입니다!
         */
        // $('#common-alert-modal-btn-confirm').on('click', function () {
        //
        //     if ( $(this).attr('rel') === 'alert-1' ) { // ex. rel: alert-1
        //         // alert-1 모달의 버튼 로직
        //     } else if ( $(this).attr('rel') === 'alert-2' ) { // ex. rel: alert-2
        //         // alert-2 모달의 버튼 로직
        //     }
        //
        // });

        /*   공용모달 이벤트 END   */

        /* 관리자계정으로 로그인한 경우, 페이지 상단영역에 "VOC관리" 버튼추가 */
        if ( $('#memberTypeCode').val() === 'AD' ) {
            $('.item-container .item-title').append("<div><a id='voc-manage-btn' href='/admin/admin_manage_voc' target='_blank'>VOC 관리</a></div>");
            $('.colo-page-header').append("<div><a id='voc-manage-btn' href='/admin/admin_manage_voc' target='_blank'>VOC 관리</a></div>");
        }

    });

</script>