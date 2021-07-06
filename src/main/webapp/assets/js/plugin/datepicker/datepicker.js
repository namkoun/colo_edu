(function(global, $) {





    $(document).ready(function() {

        $.datetimepicker.setLocale('kr');
        var today = new Date();

        var weekLater, monthLater;
        var day = getDayType();
        var week = getWeekType();
        var month = getMonthType();
        var daytime = getDayTimeType();

        dateInitSetting();
        dateInitSetting2();

        console.log('datepicker loaded');
        // date만 
        $('#Ip-date').datetimepicker({
            format: 'Y-m-d',
            scrollMonth : false,
            timepicker: false
        });
        
        // 20.10.27 명현, 화주 - 출고신청 화면 데이트피커.
        $('.Out-date').datetimepicker({
            format: 'Y-m-d',
            scrollMonth : false,
            timepicker: false
        });
        
        $('.Exp-date').datetimepicker({
            format: 'Y-m-d',
            scrollMonth : false,
            timepicker: false
        });
        
        //시간 포함
        $('.Ip-date-time').datetimepicker({
            format: 'Y-m-d H:i',
            scrollMonth : false,
            timepicker: true
        });
        
        $('.date_timepicker_expdt').datetimepicker({
            format: 'Y-m-d',
            scrollMonth : false,
            timepicker: false
        });


        // date범위
        $('.date_timepicker_start').datetimepicker({
            format: 'Y-m-d',
            scrollMonth : false,
            onShow: function(ct) {
                this.setOptions({
                    maxDate: $('.date_timepicker_end').val() ? $('.date_timepicker_end').val() : false
                })
            },

            timepicker: false
        });
        $('.date_timepicker_end').datetimepicker({
            format: 'Y-m-d',
            scrollMonth : false,
            onShow: function(ct) {
                this.setOptions({
                    minDate: $('.date_timepicker_start').val() ? $('.date_timepicker_start').val() : false
                })
            },
            timepicker: false
        });
        $('.date_timepicker_start_1').datetimepicker({
            format: 'Y-m-d',
            scrollMonth : false,
            onShow: function(ct) {
                this.setOptions({
                    maxDate: $('.date_timepicker_end_1').val() ? $('.date_timepicker_end_1').val() : false
                })
            },

            timepicker: false
        });
        $('.date_timepicker_end_1').datetimepicker({
            format: 'Y-m-d',
            scrollMonth : false,
            onShow: function(ct) {
                this.setOptions({
                    minDate: $('.date_timepicker_start_1').val() ? $('.date_timepicker_start_1').val() : false
                })
            },
            timepicker: false
        });
        $('.date_timepicker_start_2').datetimepicker({
            format: 'Y-m-d',
            scrollMonth : false,
            onShow: function(ct) {
                this.setOptions({
                    maxDate: $('.date_timepicker_end_2').val() ? $('.date_timepicker_end_2').val() : false
                })
            },

            timepicker: false
        });
        $('.date_timepicker_end_2').datetimepicker({
            format: 'Y-m-d',
            scrollMonth : false,
            onShow: function(ct) {
                this.setOptions({
                    minDate: $('.date_timepicker_start_2').val() ? $('.date_timepicker_start_2').val() : false
                })
            },
            timepicker: false
        });

        // date 범위 버튼 , 금일/금주/금월
        $('.dateToday-btn').on('click', function() {
            $('.date_timepicker_start').val(day);
            $('.date_timepicker_end').val(day);
        });

        $('.dateWeek-btn').on('click', function() {
            $('.date_timepicker_start').val(week.startDay);
            $('.date_timepicker_end').val(week.endDay);
        });

        $('.dateMonth-btn').on('click', function() {
            $('.date_timepicker_start').val(month.startDay);
            $('.date_timepicker_end').val(month.endDay);
        });
        
        $('.dateToday-btn_1').on('click', function() {
            $('.date_timepicker_start_1').val(day);
            $('.date_timepicker_end_1').val(day);
        });

        $('.dateWeek-btn_1').on('click', function() {
            $('.date_timepicker_start_1').val(week.startDay);
            $('.date_timepicker_end_1').val(week.endDay);
        });

        $('.dateMonth-btn_1').on('click', function() {
            $('.date_timepicker_start_1').val(month.startDay);
            $('.date_timepicker_end_1').val(month.endDay);
        });

        // [정산] 지난 월 / 최근 3개월 / 최근 6개월
        $('.last-month-btn').on('click', function () {
            $('#from_date').val(moment().subtract(1, 'months').format('YYYY-MM'));
            $('#to_date').val(moment().subtract(1, 'months').format('YYYY-MM'));


            $('select.mtz-monthpicker-year option').attr('selected', false);
            $('select.mtz-monthpicker-year option[value="' + moment().subtract(1, 'months').format('YYYY') + '"]').attr('selected', true);

            $('td.mtz-monthpicker-month').removeClass('ui-state-active');
            $($('td.mtz-monthpicker-month[data-month="' + moment().subtract(1, 'months').format('M') + '"]')[0]).addClass('ui-state-active');

        });
        $('.last-3month-btn').on('click', function () {
            $('#from_date').val(moment().subtract(3, 'months').format('YYYY-MM'));
            $('#to_date').val(moment().subtract(1, 'months').format('YYYY-MM'));


            $('select.mtz-monthpicker-year option').attr('selected', false);
            $('select.mtz-monthpicker-year option[value="' + moment().subtract(3, 'months').format('YYYY') + '"]').attr('selected', true);

            $('td.mtz-monthpicker-month').removeClass('ui-state-active');
            $($('td.mtz-monthpicker-month[data-month="' + moment().subtract(3, 'months').format('M') + '"]')[0]).addClass('ui-state-active');

        })
        $('.last-6month-btn').on('click', function () {
            $('#from_date').val(moment().subtract(6, 'months').format('YYYY-MM'));
            $('#to_date').val(moment().subtract(1, 'months').format('YYYY-MM'));


            $('select.mtz-monthpicker-year option').attr('selected', false);
            $('select.mtz-monthpicker-year option[value="' + moment().subtract(6, 'months').format('YYYY') + '"]').attr('selected', true);

            $('td.mtz-monthpicker-month').removeClass('ui-state-active');
            $($('td.mtz-monthpicker-month[data-month="' + moment().subtract(6, 'months').format('M') + '"]')[0]).addClass('ui-state-active');

        })


        $('.It-dateBtn').on('click', function() {

            $(this).siblings().removeClass('It-dateBtn-g').addClass('It-dateBtn');
            $(this).removeClass('It-dateBtn').addClass('It-dateBtn-g');

        });

        // 21-06-29, 정명현
        // date 범위 버튼 , 금일/금주/금월
        $('.dateToday-btn-2').on('click', function() {
            console.log('11111')
            const e_date = moment().add('days', 5).format('YYYY-MM-DD');
            $('.date_timepicker_start_2').val(day);
            $('.date_timepicker_end_2').val(e_date);
        });

        $('.dateWeek-btn-2').on('click', function() {
            console.log('22222')
            const e_date = moment().add('days', 5).format('YYYY-MM-DD');
            $('.date_timepicker_start_2').val(week.startDay);
            $('.date_timepicker_end_2').val(e_date);
        });

        $('.dateMonth-btn-2').on('click', function() {
            console.log('33333')
            const e_date = moment().add('days', 5).format('YYYY-MM-DD');
            $('.date_timepicker_start_2').val(month.startDay);
            $('.date_timepicker_end_2').val(e_date);
        });







        function getDayType() {

            return today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
        }
        
        function getDayTimeType() {

            return today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2)+' '+today.getHours()+':00';
        }

        function getWeekType() {

            weekLater = new Date(today.valueOf() - 7 * 1000 * 3600 * 24);

            return {
                startDay: weekLater.getFullYear() + '-' + ('0' + (weekLater.getMonth() + 1)).slice(-2) + '-' + ('0' + weekLater.getDate()).slice(-2),
                endDay: today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2)
            };
        }

        function getMonthType() {
            monthLater = new Date(today.valueOf() - 30 * 1000 * 3600 * 24);

            return {
                startDay: monthLater.getFullYear() + '-' + ('0' + (monthLater.getMonth() + 1)).slice(-2) + '-' + ('0' + monthLater.getDate()).slice(-2),
                endDay: today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2)
                
            };
        }

        function dateInitSetting() {
            $('.date_timepicker_start').val(day);
            $('.date_timepicker_end').val(day);
            $('.date_timepicker_expdt').val(day);
            $('.date_timepicker_start_1').val(day);
            $('.date_timepicker_end_1').val(day);
            $('.Ip-date-time').val(daytime);
            $('.Ip-date').val(day);
            $('.dateToday-btn').addClass('It-dateBtn-g');
            $('.last-month-btn').addClass('It-dateBtn-g');
        }

        function dateInitSetting2() {
            const e_date = moment().add('days', 5).format('YYYY-MM-DD');
            $('.date_timepicker_start_2').val(day);
            $('.date_timepicker_end_2').val(e_date);
            $('.dateToday-btn').addClass('It-dateBtn-g');
        }
        
        
        







        


    });




}(this, this.jQuery));