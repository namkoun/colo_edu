(function(global, $) {
    'use strict';


    var width = $(window).width();
    var height = $(window).height();




    $(document).ready(function() {

        window._main = {
            accordion_toggle: true, // true - basic, false - shrinked
        }

    	
    	if(window.innerHeight < 600) {
    		$('.mainContent').css('min-height', '900px');
    	}else{
    		if ( (window.innerHeight-63) < 1050) {
    			$('.mainContent').css('min-height', '1050px');
    		} else {
    			$('.mainContent').css('min-height', window.innerHeight-63);
    		}
    	}
    	
//    	if($(".logoWrapper2").length >0){
//    		$(".logoWrapper2")[0].style['margin-top']  = '0px';
//        	
//        	$(".logoWrapper2")[0].style['margin-top'] = ($('.mainContent').height()-$(".side1").height())+'px';
//    	}
    	
    	
        // login, signup main Image rolling and zoom in
        var mainImageWrapper = $('.background-image-wrapper img');
        var im_count = 0;
        var today = new Date();
        var day = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
        // document.write("<script src='../../js/datepicker.js'></script>");
        
        
        //nayea 20.07.08
      
        $(window).resize(function() {

        	 var documentWidth = document.body.clientWidth;
        	 var documentHeight = document.body.clientHeight;
           
             if(width > documentWidth){
            	 $('.signup-container').css({'width': width, 'height': height});
             }
             else{
            	 $('.signup-container').css({'width': documentWidth, 'height': documentHeight});

             }
             
             if($(".signup-area").height() > height){
            	 $('.signup-container').css({'overflow-y': 'scroll'});
             }
             else{
            	 $('.signup-container').css({'overflow-y': 'hidden'});
             }

        });

        mainImageWrapper.each(function() {
            im_count++;
            $(this).addClass('backImageMove-' + [im_count]);
        });

        var mainImage_01 = $('.backImageMove-1');
        var mainImage_02 = $('.backImageMove-2');
        var mainImage_03 = $('.backImageMove-3');
        var mainImage_04 = $('.backImageMove-4');

        $('.backImageMove-2, .backImageMove-3, .backImageMove-4').css("opacity", 0);


        function firstImage() {
            setTimeout(function() {
                mainImage_01.animate({ 'opacity': 1 }, 1500, 'easeOutExpo');
                mainImage_04.animate({ 'opacity': 0 }, 1500, 'easeOutExpo');

                mainImage_01.animate({ 'width': '110%', 'height': '110%' }, 7000, 'easeOutExpo');
                mainImage_04.animate({ 'width': '100%', 'height': '100%' }, 1500, 'easeOutExpo');
            }, 0);
        }

        function secondImage() {
            setTimeout(function() {
                mainImage_01.animate({ 'opacity': 0 }, 1500, 'easeOutExpo');
                mainImage_02.animate({ 'opacity': 1 }, 1500, 'easeOutExpo');

                mainImage_02.animate({ 'width': '110%', 'height': '110%' }, 7000, 'easeOutExpo');
                mainImage_01.animate({ 'width': '100%', 'height': '100%' }, 1500, 'easeOutExpo');
            }, 7000);
        }

        function thirdImage() {
            setTimeout(function() {
                mainImage_02.animate({ 'opacity': 0 }, 1500, 'easeOutExpo');
                mainImage_03.animate({ 'opacity': 1 }, 1500, 'easeOutExpo');

                mainImage_03.animate({ 'width': '110%', 'height': '110%' }, 7000, 'easeOutExpo');
                mainImage_02.animate({ 'width': '100%', 'height': '100%' }, 1500, 'easeOutExpo');
            }, 14000);
        }

        function fourthImage() {
            setTimeout(function() {
                mainImage_03.animate({ 'opacity': 0 }, 1500, 'easeOutExpo');
                mainImage_04.animate({ 'opacity': 1 }, 1500, 'easeOutExpo');

                mainImage_04.animate({ 'width': '110%', 'height': '110%' }, 7000, 'easeOutExpo');
                mainImage_03.animate({ 'width': '100%', 'height': '100%' }, 1500, 'easeOutExpo');
            }, 21000);
        }

        function imageCollection() {
            firstImage();
            secondImage();
            thirdImage();
            fourthImage();
        }

        setInterval(imageCollection, 28000);

        imageCollection();


        // signup popup

        var terms_btn = $('.termsPopup .termsPopup-btn');
        var terms_openBtn = $('.terms-openBtn');
        var terms_closeBtn = $('.terms-closeBtn');

        terms_openBtn.each(function(index) {
            $(this).on("click", function() {
                $('.signup-area').addClass('background-fix');
                $('.termsPopup-' + [index]).css('display', 'block');
                $('.termsPopup').scrollTop(0);


            });
        });

        terms_closeBtn.on("click", function() {
            $('.signup-area').removeClass('background-fix');
            $('.termsPopup').css('display', 'none');

        });

        // signup - warhouse 창고 정보 추가
        var appendWh = `<div class="signup-warhouseInfo-wrapper">
                        <div class="signup-form">
                            <label for="wh-companyName" class="wh-signup-label">회사명</label>
                            <input type="text" name="wh-companyName"  placeholder="사업자등록증에 기입된 회사명을 정확히 입력해주세요." class="wh-signup-input">
                        </div>
                        <div class="signup-form">
                            <label for="wh-companyAddress" class="wh-signup-label">회사 주소</label>
                            <textarea name="wh-companyAddress"  placeholder="주소검색 기능을 사용해주세요." class="wh-signup-input wh-signup-address"></textarea>
                            <a class="signup-checkBtn" role="buttom"><span>주소검색</span></a>
                        </div>
                        <div class="signup-form">
                            <label for="wh-companyAddressDetail" class="wh-signup-label"></label>
                            <input type="text" name="wh-companyAddressDetail" i placeholder="상세 주소를 입력해주세요." class="wh-signup-input">
                        </div>
                        <div class="signup-form">
                            <label for="wh-temp" class="wh-signup-label">상온</label>
                            <input type="text" name="wh-temp" placeholder="면적 (㎡)" class="signup-input-half">
                            <input type="text" name="wh-temp" placeholder="최대 팔레트 수" class="signup-input-half">
                        </div>
                        <div class="signup-form">
                            <label for="wh-cold" class="wh-signup-label">냉장</label>
                            <input type="text" name="wh-cold" placeholder="면적 (㎡)" class="signup-input-half">
                            <input type="text" name="wh-cold" placeholder="최대 팔레트 수" class="signup-input-half">
                        </div>
                        <div class="signup-form">
                            <label for="wh-frozen" class="wh-signup-label">냉동</label>
                            <input type="text" name="wh-frozen" placeholder="면적 (㎡)" class="signup-input-half">
                            <input type="text" name="wh-frozen" placeholder="최대 팔레트 수" class="signup-input-half">
                        </div>
                    </div>`;

        function appendWarhouse() {
            $('#wh-infomation').append(appendWh);
        }



        $('.wh-plusBtn').on("click", function() {
            appendWarhouse();

        });



        $(document).on("click", '.wh-deleteBtn', function() {

            var signup_warhouseInfo = $('.signup-warhouseInfo-wrapper');
            var signup_warhouseInfoCount = signup_warhouseInfo.length - 1;

            if (signup_warhouseInfoCount > 0) {
                signup_warhouseInfo[signup_warhouseInfoCount].remove();
            }




        });





        // menu

        // 아코디언

        var ac_count = 0;
        var mac_count = 0;
        var btn_accordian = $('.btn-accordian');
        var sideMenu_basic = $('.sideMenu-basic');
        var sideMenu_shrinked = $('.sideMenu-shrinked');

        // desktop
        if (width >= 1280) {

            btn_accordian.on("click", function() {

                ac_count++;

                // if (ac_count % 2 == 1) {
                if ( _main.accordion_toggle ) {

                    sideMenu_shrinked.css('display', 'block');
                    // sideMenu_shrinked.animate({ 'display': 'block'}, 1000,
					// 'easeOutExpo');
                    sideMenu_basic.css('display', 'none');
                    _main.accordion_toggle = false;


                } else {

                    sideMenu_shrinked.css('display', 'none');
                    // sideMenu_basic.animate({ 'display': 'block'}, 1000,
					// 'easeOutExpo');
                    sideMenu_basic.css('display', 'block');

                    _main.accordion_toggle = true;

                }


            });


        } else {

            // mobile
            btn_accordian.on("click", function() {

                console.log('accordian - 2');

            	sideMenu_shrinked.css('position', 'absolute');
                sideMenu_shrinked.animate({ 'left': '-66px' }, 1000, 'easeOutExpo');
                $('.btn-accordian').css('display', 'none');
                $('.btn-accordian-m-wrapper').css('display', 'block');
                

            });

            $('.btn-accordian-m').on("click", function() {

                console.log('accordian - 3');

            	sideMenu_shrinked.css('position', 'relative');
                sideMenu_shrinked.animate({ 'left': 0 }, 1000, 'easeOutExpo');
                $('.btn-accordian-m-wrapper').css('display', 'none');
                $('.btn-accordian').css('display', 'block');
            });

        }
        
//        var filter = "win16|win32|win64|mac|macintel"; 
//       
//        if ( navigator.platform ) {
//        	if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) { 
//        		//mobile 
//        		alert('mobile 접속'); } 
//        	else { //pc 
//        		alert('pc 접속'); 
//        	}
//        }

// alert('mobile
				// 접속');
				// }
				// else
				// {
				// //pc
				// alert('pc
				// 접속');
				// } }



        // basic 메뉴에 hover 추가

        $('.sideMenu-basic .menu-options').hover(
            function() {
                $(this).addClass('menu-hover');
            },
            function() {
                $(this).removeClass('menu-hover');

            });

        // shrinked 메뉴에 hover 추가
        // hover시에 이미지 변화

        $(".menu-wrapper").hover(
            function(e) { // handlerIn
                $(this).children('ul').show();
                $(this).css('background', '#2C4EAA');
            },
            function() { // handlerOut
                $(this).children('ul').hide();
                $(this).css('background', 'transparent');
            }
        );
        $(".sideMenu-shrinked .menu-options").hover(
            function() {
                $(this).addClass('b-white');
            },
            function() {
                $(this).removeClass('b-white');
            }
        );


        // shrinked 메뉴에 로그아웃 hover 추가
        $(".sideMenu-shrinked .login-info").hover(
            function() {

                $('.sideMenu-shrinked .login-time').css('display', 'none');
                $('.sideMenu-shrinked .btn-logout').css('display', 'block');
            },
            function() {
                $('.sideMenu-shrinked .login-time').css('display', 'inline-block');
                $('.sideMenu-shrinked .btn-logout').css('display', 'none');
            });
        	
       
        // 전체 페이지의 height값이 작아졌을때 scroll 추가
        
        resizeHeight();
        
        $(window).resize(function() {

        	resizeHeight();
        	resizeFooter();

        });
        
        function resizeHeight(){
        	 var w_height = $(window).height();

             if (w_height <= 860) {
                 $('.sideMenu-basic .logo').css('position', 'absolute');
                 $('.sideMenu-shrinked .logo').css('position', 'absolute');
             } else {
                 $('.sideMenu-basic .logo').css('position', 'absolute');
                 $('.sideMenu-shrinked .logo').css('position', 'absolute');
             }
        }
        
        function resizeFooter() {
        	let isMobile = false;
    		(function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) isMobile = true;})(navigator.userAgent||navigator.vendor||window.opera);
    		
        	if ( $(window).width() < 1280 ) {
        		
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
        	
        	if(window.innerHeight < 600) {
        		$('.mainContent').css('min-height', '900px');
        	}else{
        		if ( (window.innerHeight-63) < 1050) {
        			$('.mainContent').css('min-height', '1050px');
        		} else {
        			$('.mainContent').css('min-height', window.innerHeight-63);
        		}
        	}
        	
//        	if($(".logoWrapper2").length >0){
//        		$(".logoWrapper2")[0].style['margin-top']  = '0px';
//            	
//            	$(".logoWrapper2")[0].style['margin-top'] = ($('.mainContent').height()-$(".side1").height())+'px';
//        	}
        	
        	
//        	if( $('body').width() > 1920 ) {
//    			$('.mainContent').css('min-height', '1440px');
//    		} else {
//    			$('.mainContent').css('min-height', '1050px');
//    		}
        	
        }
        

        // tab

        $(".tab-content").hide();
        
        $(".tab-content:first").show();
        
//        if($(".logoWrapper2").length >0){
//    		$(".logoWrapper2")[0].style['margin-top']  = '0px';
//        	
//        	$(".logoWrapper2")[0].style['margin-top'] = ($('.mainContent').height()-$(".side1").height())+'px';
//    	}

        $("ul.tabs li").click(function() {
            $("ul.tabs li").removeClass("active-tab");
            $(this).addClass("active-tab");
            $(".tab-content").hide();
            var activeTab = $(this).attr("rel");
            $("#" + activeTab).fadeIn();

//            if($(".logoWrapper2").length >0){
//        		$(".logoWrapper2")[0].style['margin-top']  = '0px';
//            	
//            	$(".logoWrapper2")[0].style['margin-top'] = ($('.mainContent').height()-$(".side1").height())+'px';
//        	}


            //  date 버튼 초기화
            $('.date_timepicker_start').val(day);
            $('.date_timepicker_end').val(day);
            $('.dateToday-btn').addClass('It-dateBtn-g');
            $('.dateWeek-btn').removeClass('It-dateBtn-g').addClass('It-dateBtn');
            $('.dateMonth-btn').removeClass('It-dateBtn-g').addClass('It-dateBtn');

            // 출고관리 테이블 이벤트 초기화

            outputListSelectEvent();


        });
        
       // tab - 유형 선택 : 콜로세운 차량 입고, 고객사 차량 입고, 택 입

        $(".tab-type-content").hide();
        $(".tab-type-content:first").show();

        $("ul.type-tabs li").click(function() {
            $("ul.type-tabs li").find("button").removeClass("active-type-tab");
            $(this).find("button").addClass("active-type-tab");
            $(".tab-type-content").hide();
            var activeTypeTab = $(this).attr("rel");
            $("#" + activeTypeTab).fadeIn();



        });




        // check box : 사용여부, 한개만 체크
        $('.ch-useBtn').on('click', function() {
            if ($(this).is(':checked')) {
                $('.ch-useBtn').prop('checked', false);
                $(this).prop('checked', true);
            } else {
                $(this).prop('checked', false);
            }
        });



        // 품목관리 - 품목 정보조회 품목명 팝업


        var itemName_openBtn = $('.itemName-openBtn');
        var itemName_closeBtn = $('.close-Btn');
        var itemName_mapCloseBtn = $('.map-close-Btn');
        var itemName_mapSearchCloseBtn = $('.map-search-close-Btn');
      
        
        
        itemName_mapSearchCloseBtn.on("click", function() {
            $('.item-container').removeClass('background-fix');
            $('.itemMapPopup-3').css('display', 'none');

        });
        
        itemName_mapCloseBtn.on("click", function() {
            $('.item-container').removeClass('background-fix');
            $('.itemPopup').css('display', 'none');

        });
        
        itemName_openBtn.each(function(index) {
            $(this).on("click", function() {
                $('.item-container').addClass('background-fix');
                $('.item-container').scrollTop(0);
                $('.itemPopup-0').css('display', 'block');
                $('.itemPopup').scrollTop(0);

            });
        });

        itemName_closeBtn.on("click", function() {
            $('.item-container').removeClass('background-fix');
            $('.itemPopup').css('display', 'none');

        });

        $('.confirm-Btn').on("click", function() {
            $('.item-container').removeClass('background-fix');
            $('.itemPopup').css('display', 'none');

        });

        $('.mapconfirm-Btn').on("click", function() {
            $('.item-container').removeClass('background-fix');
            $('.itemPopup-3').css('display', 'none');

        });
       
        $('.mapconfirm-Btn').on("click", function() {
            $('.item-container').removeClass('background-fix');
            $('.itemMapPopup-3').css('display', 'none');

        });
        
        
        // 품목관리 - 품목 정보조회 folded

        $('.It-searchBtn').on("click", function() {
            $('.item-searchAgain').slideUp('fast');
            $('.It-searchAgainBtn').css('display', 'block');
            $('#bottom-style-js').attr('style', 'border-bottom: 0');
 
        });

        $('.It-searchAgainBtn').on("click", function() {
            $('.item-searchAgain').slideDown('fast');
            $('.It-searchAgainBtn').css('display', 'none');
            $('#bottom-style-js').attr('style', 'border-bottom: 1px solid #cccccc');

        });

        // 품목관리-품목 정보 조회

        $('.It-detail-searchBtn').on("click", function() {
            $('.item-container').addClass('background-fix');
            $('.item-container').scrollTop(0);
            $('.itemPopup-1').css('display', 'block');
            $('.itemPopup').scrollTop(0);

        });

        $('.Ot-detail-searchBtn').on("click", function() {

            $('.item-container').addClass('background-fix');
            $('.item-container').scrollTop(0);
            $('.itemPopup-7').css('display', 'block');
            $('.itemPopup').scrollTop(0);

        });

        // 입고관리 - 입고신청


        $(document).on("click", '.It-detail-searchBtn-right-1', function() {
            $('.item-container').addClass('background-fix');
            $('.item-container').scrollTop(0);
            $('.itemPopup-1').css('display', 'block');
            $('.itemPopup').scrollTop(0);

        });

        $('.It-detail-searchBtn-right-2').on("click", function() {
            $('.item-container').addClass('background-fix');
            $('.item-container').scrollTop(0);
            $('.itemPopup-2').css('display', 'block');
            $('.itemPopup').scrollTop(0);

        });



        $('.It-detail-searchBtn-right-3').on("click", function() {
            $('.item-container').addClass('background-fix');
            $('.item-container').scrollTop(0);
            $('.itemPopup-3').css('display', 'block');
            $('.itemPopup-1').css('display', 'none');
            $('.itemPopup').scrollTop(0);

        });


        $('.Ip-packageBtn').on("click", function() {
            $('.item-container').addClass('background-fix');
            $('.item-container').scrollTop(0);
            $('.itemPopup-4').css('display', 'block');
            $('.itemPopup').scrollTop(0);
        });

        // 출고관리 - 출고신청
        $('.Ot-detail-searchBtn').on("click", function() {
            $('.item-container').addClass('background-fix');
            $('.item-container').scrollTop(0);
            $('.itemPopup-1').css('display', 'block');
            $('.itemPopup').scrollTop(0);

        });

        // 출고관리 - 출고신청 - inputfile

        var fileChange = 0;
        var fileBtn = `<span class="output-fileUpload Ot-fileName-upload"></span> `

        $('#Ot-fileUpload').on('change', function() {


            if (fileChange == 0) {
                $(".Ot-fileName").remove();
                $(".output-fileInputBtn-wrapper").append(fileBtn);
                $(".Ot-fileName-upload").html(fileUploadName());

            } else {
                $(".Ot-fileName-upload").remove();
                $(".output-fileInputBtn-wrapper").append(fileBtn);
                $(".Ot-fileName-upload").html(fileUploadName());
            }

            fileChange++;

        });

        function fileUploadName() {
            var files = $('#Ot-fileUpload').get(0).files;
            var file;
            var fileArray = [];

            for (var i = 0; i < files.length; i++) {

                file = files[i].name + `<br>`;
                fileArray.push(file);

            }
            return fileArray
        }

        // 출고관리 - 출고 신청


        $('.Ot-checkbox-click-0').on("click", function() {
            $('.output-step-wrapper-0').slideUp('fast');
            $('.Ot-searchAgainBtn-0').css('display', 'block');
        });

        $('.Ot-searchAgainBtn-0').on("click", function() {
            $('.output-step-wrapper-0').slideDown('fast');
            $('.Ot-searchAgainBtn-0').css('display', 'none');
        });

        /*
        $('.Ot-checkbox-click-1').on("click", function() {
            $('.output-step-wrapper-1').slideUp('fast');
            $('.Ot-searchAgainBtn-1').css('display', 'block');
        });
        */

        $('.Ot-searchAgainBtn-1').on("click", function() {
            $('.output-step-wrapper-1').slideDown('fast');
            $('.Ot-searchAgainBtn-1').css('display', 'none');
        });

        /*
        $('.Ot-checkbox-click-2').on("click", function() {
            $('.output-step-wrapper-2').slideUp('fast');
            $('.Ot-step3').css('display', 'block');
        });
        */

        $('.Ot-searchAgainBtn-2').on("click", function() {
            $('.Ot-step3-jqgrid-wrapper').slideDown('fast');
            $('.Ot-step3').css('display', 'none');
        });


        $('.Ot-searchMapAgainBtn-2').on("click", function() {
            $('.itemMapPopup-2').slideDown('fast');
            $('.itemMapPopup-2').css('display', 'none');
        });




        // 출고관리 - 출고 신청 check box : 사용여부, 한개만 체크
        $('.Ot-checkbox-click-0').on('click', function() {
            if ($(this).is(':checked')) {
                $('.Ot-checkbox-click-0').prop('checked', false);
                $(this).prop('checked', true);
            } else {
                $(this).prop('checked', false);
            }
        });


        // 출고관리 - 출고 신청 - 택배 배송출고 , step2 - 연동쇼핑몰
        $('.Op-blue-btn-1').on("click", function() {
            $('.item-container').addClass('background-fix');
// $('.item-container').scrollTop(0);
            $('.itemPopup-5').css('display', 'block');
// $('.itemPopup').scrollTop(0);
        });

        $('.Op-blue-btn-2').on("click", function() {
            $('.item-container').addClass('background-fix');
// $('.item-container').scrollTop(0);
            $('.itemPopup-6').css('display', 'block');
// $('.itemPopup').scrollTop(0);
        });

        // 출고관리 - 출고 신청 - popup-6 id, name 연결


        var shoppingMallPopup_checkbox = $('.output-searchPopup-wrapper').find('li input');
        var shoppingMallPopup_label = $('.output-searchPopup-wrapper').find('li label');


        shoppingMallPopup_checkbox.each(function(index) {

            $(this).attr('id', 'Op-shoppingMallBill-' + index);

        });

        shoppingMallPopup_label.each(function(index) {


            $(this).attr('for', 'Op-shoppingMallBill-' + index);
        });

        $('#output-allSelect-checkbox').on('click', function() {
            if ($(this).is(':checked')) {
                shoppingMallPopup_checkbox.prop('checked', true);

            } else {
                shoppingMallPopup_checkbox.prop('checked', false);

            }
        });

        /*shoppingMallPopup_label.each(function(index) {

            $(this).hover(
                function(index) {

                    $(this).siblings('.Op-bill-close-Btn').css('display', 'inline-block')



                },
                function() {
                    $(this).siblings('.Op-bill-close-Btn').css('display', 'none')

                });
        });*/

        $('.Op-bill-close-Btn').on('click', function() {
            $(this).parent().remove();
        })

        // 출고관리 - 출고 신청 - step3에 항목별로 고유 id 부여(checkbox 스타일 유지를 위해)
        var num = 0;
        var newStep3 = [];
        var newStep3_last = [];
        $('.Ot-step3-apply-wrapper').each(function(index) {

            $(this).attr('id', 'Ot-step3-apply-wrapper-' + index);

            num = index + 1;
            newStep3.push('Ot-step3-apply-wrapper-' + index);

        });


        for (var i = 0; i < newStep3.length; i++) {
            $('#' + newStep3[i]).find('input').each(function(index) {


                $(this).attr('id', 'Ot-step3-checkbox-' + i + '-' + index);

            });
        }

        for (var i = 0; i < newStep3.length; i++) {
            $('#' + newStep3[i]).find('label').each(function(index) {
                $(this).attr('for', 'Ot-step3-checkbox-' + i + '-' + index);

            });
        }





        // 출고관리 - 출고 신청 - step3에 button event
        $('.Ot-step3-nullBtn').on('click', function() {
            if ($(this).siblings('.Ot-step3-nullBtn-content').css('display') == 'none') {
                $(this).siblings('.Ot-step3-nullBtn-content').slideDown('fast');
            } else {
                $(this).siblings('.Ot-step3-nullBtn-content').slideUp('fast');
                $(this).siblings('.Ot-step3-nullBtn-content').find('input').prop('checked', false);
                $(this).siblings('.Ot-step3-nullBtn-content').find('.Ot-step3-detailContent').slideUp('fast');
                $(this).siblings('.Ot-step3-nullBtn-content').find('.Ot-step3-set').slideUp('fast');
            }

        });



        $('.Ot-step3-checkbox-detailBtn').on('click', function() {
            if ($(this).siblings('.Ot-step3-detailContent').css('display') == 'none') {
                $(this).siblings('.Ot-step3-detailContent').slideDown('fast');
            } else {
                $(this).siblings('.Ot-step3-detailContent').slideUp('fast');
            }


        });



        $('.Ot-step3-checkbox-setBtn').on('click', function() {
            if ($(this).siblings('.Ot-step3-set').css('display') == 'none') {

                $(this).siblings('.Ot-step3-set').slideDown('fast');
            } else {
                $(this).siblings('.Ot-step3-set').slideUp('fast');
            }


        });

        // 출고관리 - 출고조회 - 차량/퀵 출고조회


        var selectTr_count = 0;
        var selectTr_index = 1;




        $('.output-detail-table').find('tbody tr').each(function(index) {



            $(this).attr('id', 'output-table-event-' + index);
            $('#output-table-event-' + index).on("click", function() {
                $(this).css('background', 'rgba(63, 169, 245, .2)');
                $(this).siblings().css('background', '#ffffff');
                $('.input-list-wrapper-2').css('display', 'block');
                $('.input-list-wrapper-1').css('display', 'none');

                // console.log(selectTr_count);
                // if (selectTr_index == index) {
                // selectTr_count++;
                // console.log(selectTr_count);
                // if (selectTr_count % 2 == 1) {
                // $(this).css('background', '#ffffff');
                // $(this).siblings().css('background', '#ffffff');
                // $('.input-list-wrapper-2').css('display', 'none');
                // $('.input-list-wrapper-1').css('display', 'block');
                // }

                // } else {

                // $(this).css('background', 'rgba(63, 169, 245, .2)');
                // $(this).siblings().css('background', '#ffffff');
                // $('.input-list-wrapper-2').css('display', 'block');
                // $('.input-list-wrapper-1').css('display', 'none');
                // // selectTr_count = true;
                // }

                // selectTr_index = index;


            });
        });

        function outputListSelectEvent() {
            $('.output-detail-table').find('tbody tr').each(function(index) {

                $(this).css('background', '#ffffff');
                $(this).siblings().css('background', '#ffffff');
                $('.input-list-wrapper-2').css('display', 'none');
                $('.input-list-wrapper-1').css('display', 'block');

            });

        }






        // 재고관리-재고조회-재고현황표조회-상세, 간단히보기

        $('.stock-detailBtn').on('click', function() {

            $('.stock-table-wrapper-2').css('display', 'block');
            $('.stock-table-wrapper-1').css('display', 'none');
            
//            if($(".logoWrapper2").length >0){
//        		$(".logoWrapper2")[0].style['margin-top']  = '0px';
//            	
//            	$(".logoWrapper2")[0].style['margin-top'] = ($('.mainContent').height()-$(".side1").height())+'px';
//        	}


        });

        $('.stock-simpleBtn').on('click', function() {

            $('.stock-table-wrapper-1').css('display', 'block');
            $('.stock-table-wrapper-2').css('display', 'none');
            
//            if($(".logoWrapper2").length >0){
//        		$(".logoWrapper2")[0].style['margin-top']  = '0px';
//            	
//            	$(".logoWrapper2")[0].style['margin-top'] = ($('.mainContent').height()-$(".side1").height())+'px';
//        	}


        });

        // 품목관리 - 품목등록 - 연동 서비스 사용 코드 추가, 삭제 버튼
// var appendIt_code = `<div class="item-form">
// <label for="It-serviceCode" class="item-label"></label>
// <select class="item-select-half">
// <option value="Ecount ERP">Ecount ERP</option>
// <option value="사방넷">사방넷</option>
// <option value="경리나라">경리나라</option>
// <option value="직접입력">직접입력</option>
// </select>
// <input type="text" name="It-serviceCode" class="item-input-half"
// placeholder="사용 코드 입력">
// <button class="It-deleteBtn" id="It-code-deleteBtn">삭제</button>
// </div>`;
//
//
// $('.It-code-plusBtn').on("click", function() {
// $('#item-code-wrapper').append(appendIt_code);
// });
//
//
// $(document).on("click", '#It-code-deleteBtn', function() {
// $('#It-code-deleteBtn').parent().remove();
//
// });
//
// // 품목관리 - 품목등록 - 기타 필요정보 추가, 삭제 버튼
// var appendIt_etc = ` <div class="item-form">
// <label for="It-etc" class="item-label"></label>
// <select id="It-etc" class="item-select-half">
// <option value=""></option>
// </select>
// <input type="text" name="It-serviceCode" class="item-input-half"
// placeholder="관련 정보 입력">
// <button class="It-deleteBtn" id="It-etc-deleteBtn">삭제</button>
// </div>`;
//
//
// $('.It-etc-plusBtn').on("click", function() {
// $('#item-etc-wrapper').append(appendIt_etc);
// });
//
//
// $(document).on("click", '#It-etc-deleteBtn', function() {
// $('#It-etc-deleteBtn').parent().remove();
//
// });

        // 입고관리 - 입고신청 - 입고유형 추가, 삭제 버튼
// var appendIp_type = ` <div class="item-form item-flexbox-bs
// input-margin-bottom">
// <div>
// <input type="text" name="IP-type" class="item-type-input" placeholder="도착지 주소
// 입력">
// <input type="text" name="IP-type" class="item-type-input" placeholder="담당자
// 연락처">
// </div>
// <button class="It-deleteBtn" id="Ip-code-deleteBtn">삭제</button>
// </div>`;
//
//
// $('.Ip-code-plusBtn').on("click", function() {
// $('#input-code-wrapper').append(appendIp_type);
// });
//
//
// $(document).on("click", '#Ip-code-deleteBtn', function() {
// $('#Ip-code-deleteBtn').parent().remove();
//
// });
//
// // 입고관리 - 입고신청 - 입고품목 추가, 삭제 버튼
// var appendIp_item = ` <tr>
// <td></td>
// <td><button class="It-detail-searchBtn-right
// It-detail-searchBtn-right-1"></button></td>
// <td></td>
// <td>
// <select id="Ip-inputCheckType" class="item-input-select">
// <option value="1000">1000</option>
// </select>
// </td>
// <td>
// <button class="It-deleteBtn" id="Ip-item-deleteBtn">삭제</button>
// </td>
// </tr>`;
//
//
//
// $('.Ip-item-plusBtn').on("click", function() {
// $('#input-item-wrapper').append(appendIp_item);
//
// });
//
//
// $(document).on("click", '#Ip-item-deleteBtn', function() {
// $('#Ip-item-deleteBtn').parent().parent().remove();
//
//
// });

        // 출고관리 - 출고신청 품목 검색 및 추가 - 삭제 버튼

//        var appendOp_itemSearchAndPlus =  `  
//        <tr>
//			<td></td>
//            <td><button class="It-detail-searchBtn-right It-detail-searchBtn-right-1"onclick="opensearchmodal();"></button></td>
//            <td>
//            <input type="text" name="Ip-Iprice" id="Ip-Iprice" class="item-input-table">
//            </td>
//                 <td>
//                    <select id="Ip-inputCheckType" class="item-input-select">
//						<c:forEach items="${inOrdCheckType}" var="inOrdCheckType" varStatus="status">
//							<option value="${inOrdCheckType.codeId}">${inOrdCheckType.codeName}</option>
//						</c:forEach>                                     
//					</select>
//                 </td>
//                    <td>
//                        <button class="It-deleteBtn" onclick="ipItemDelete(this)">삭제</button>
//                    </td>
//       </tr>
//       `;	   
//
//
//
//
//
//        $(document).on("click", '.Ot-plusBtn', function() {
//            $('#ouput-item-wrapper').append(appendOp_itemSearchAndPlus);
//
//        });
//
//
//        $(document).on("click", '.Ot-deleteBtn', function() {
//
//            $(this).parent().parent().remove();
//
//
//        });

        // 출고관리 - 출고신청 택배 B2B출고
        var packageTable_html = $('.output-tab3Table-wrapper').html();
        var packagePlusBtn_count = 0;

        $(document).on("click", '.Ot-package-plusBtn', function() {

            $('.output-tab3Table-wrapper').append(packageTable_html);
            packagePlusBtnCount();


        });

        function packagePlusBtnCount() {
            $('.output-printFile-wrapper').each(function(index) {

                $(this).find('input').attr('id', 'Op-printFile-' + index);
                $(this).find('label').attr('for', 'Op-printFile-' + index);

            });

            $('.output-statement-wrapper').each(function(index) {

                $(this).find('input').attr('id', 'Op-statement-' + index);
                $(this).find('label').attr('for', 'Op-statement-' + index);

            });
        }
        packagePlusBtnCount();

        // popup - 입고 창고 , itemPopup-3

        $('.item-searchPopup-wrapper').each(function(index) {

            $(this).find('input').attr('id', 'Op-warhouse-' + index);
            $(this).find('label').attr('for', 'Op-warhouse-' + index);

        });

        var packagePlus = ` <tr>
                             <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><button class="Ot-packageBtn">주소검색</button></td>
                            <td><button class="It-detail-searchBtn-right It-detail-searchBtn-right-1"></button></td>
                            <td></td>
                            <td><button class="Ot-packageBtn Ot-package-deleteBtn">삭제</button></td>
                            </tr>`

        $(document).on("click", '.Ip-package-plusBtn', function() {

            $(this).parent().parent().parent().siblings('.output-package-table-tr').append(packagePlus);

        });

        $(document).on("click", '.Ot-package-deleteBtn', function() {

            $(this).parent().parent().remove();

        });




        // 정산관리 - 아코디언
        $('.pay-toggle').click(function(e) {
            e.preventDefault();

            var $this = $(this);

            if ($this.next().hasClass('show')) {
                $this.next().removeClass('show');
                $this.next().slideUp(350);
            } else {
                // $this.parent().parent().find('li
				// .inner').removeClass('show');
                // $this.parent().parent().find('li .inner').slideUp(350);
                $this.next().toggleClass('show');
                $this.next().slideToggle(350);
            }
        });



        // pagination
        $('.table-pagination-1').datatable({
            pageSize: 7,
            pagingDivSelector: ".paging-1",
            onChange: function(old_page, new_page) {
                paginationDeleteOption();
                tableCheckBox();
            }
        });

        $('.table-pagination-2').datatable({
            pageSize: 7,
            pagingDivSelector: ".paging-2",
            onChange: function(old_page, new_page) {
                paginationDeleteOption();
                tableCheckBox();
            }
        });

        $('.table-pagination-long-1').datatable({
            pageSize: 10,
            pagingDivSelector: ".paging-long-1",
            onChange: function(old_page, new_page) {
                paginationDeleteOption();
                tableCheckBox();
            }
        });

        $('.table-pagination-long-2').datatable({
            pageSize: 10,
            pagingDivSelector: ".paging-long-2",
            onChange: function(old_page, new_page) {
                paginationDeleteOption();
                tableCheckBox();
            }
        });

        function paginationDeleteOption() {
            $('.pagination li a').each(function() {
                if ($(this).attr("data-page") == 'prev' || $(this).attr("data-page") == 'next') {
                    $(this).css('display', 'none');
                }

            });
        }

        paginationDeleteOption();


        // table checkbox 스타일
        var tableCount = 0;

        function tableCheckBox() {
            $('.input-listCheckbox').each(function() {
                tableCount++;
                $(this).attr('id', 'table-CheckBox' + [tableCount]);
                $(this).next().attr('for', 'table-CheckBox' + [tableCount]);
            });
        }

        tableCheckBox();


        // 설정하기- 회원정보관리 , 회원 이미지



        $('.user-image-wrapper').hover(
            function() {
                $('.user-image-upload').css('display', 'block');
            },
            function() {
                $('.user-image-upload').css('display', 'none');

            });
        
        
       
 
        $('body').on('click', 'nav ul.menu li.menu-options', function() {
        	$('nav ul.menu li.menu-options').removeClass('active-menu');
        	localStorage.setItem('selectedMenuName', $(this).text().trim());
        })
        
        /* CTA 버튼 관련 공용 스크립트 */
        window._isVisibleScrollbar = function () {
    		if ( $('body').prop('scrollHeight') > $(window).height() ) {
				return true;
			} else {
				return false;
			}
        }
        window._flexibleCTA = function (standardParam) {
    		
    		const standard = standardParam ? standardParam : 0.8;
    		
    		// 스크롤이 화면의 80% 이상 내려갔을 때, footer에 overlap 되지않도록 적용
    		if ( $(window).scrollTop() / ($('body').prop('scrollHeight') - $(window).height()) > standard ) {
    			$('#cta-container').css('position', 'absolute');
    			$('#cta-container').css('margin-left', '0');
    			$('#cta-container').css('width', 'calc(100% - 24px)');
    		} else {
    			$('#cta-container').css('position', 'fixed');
    			$('#cta-container').css('margin-left', '201px');
    			$('#cta-container').css('width', 'calc(100% - 201px)');
    		}	
    	}
        /* CTA 버튼 관련 공용 스크립트 */
        

    });




}(this, this.jQuery));

// check box : 입고조회 - 입고 신청정보

$.fn.tableCheckBox = function() {

    if ($(this).is(':checked')) {

        $('.input-listCheckbox').prop('checked', false);
        $(this).prop('checked', true);
        $('.input-list-wrapper-2').css('display', 'block');
        $('.input-list-wrapper-1').css('display', 'none');
        // tr_color = $(this).parents('tr').css('background-color');
        // $(this).parents('tr').css('background-color', '#d4eafd');
    } else {

        $(this).prop('checked', false);
        $('.input-list-wrapper-2').css('display', 'none');
        $('.input-list-wrapper-1').css('display', 'block');
        // $(this).parents('tr').css('background-color', tr_color );
        // console.log(tr_color);
    }

};


$.fn.itemProcessCheckboxOpen = function() {


    $('.input-process-wrapper-2').css('display', 'block');
    $('.input-process-wrapper-1').css('display', 'none');
    $('.item-container').scrollTop(0);


};


$.fn.itemProcessCheckboxClose = function() {
    $('.input-process-wrapper-2').css('display', 'none');
    $('.input-process-wrapper-1').css('display', 'block');

    $('.input-listCheckbox').prop('checked', false);
    $('.item-container').scrollTop(0);
};

function getCodeMap(groupIdList) {

    let resultData;

    $.ajax({
        url : $contextPath + '/ajax/code/code-map',
        type : 'POST',
        data : JSON.stringify(groupIdList),
        dataType : 'json',
        async : false,
        contentType : 'application/json;charset=UTF-8',
        success : function (data) {
            resultData = data;
        },
        error:function(request,status,error){
            console.log(request,status,error);
        }
    });

    return resultData;
}
