(function(global, $) {





    $(document).ready(function() {

        $.datetimepicker.setLocale('kr');
        var today = new Date();

        var weekLater, monthLater;
        var day = getDayType();
        var week = getWeekType();
        var month = getMonthType();

        dateInitSetting();


        //date만 
        $('#Ip-date').datetimepicker({
            format: 'Y-m-d',
            timepicker: false
        });
        
        $('.date_timepicker_expdt').datetimepicker({
            format: 'Y-m-d',
            timepicker: false
        });

        // date범위
        $('.date_timepicker_start').datetimepicker({
            format: 'Y-m-d',
            onShow: function(ct) {
                this.setOptions({
                    maxDate: $('.date_timepicker_end').val() ? $('.date_timepicker_end').val() : false
                })
            },

            timepicker: false
        });
        $('.date_timepicker_end').datetimepicker({
            format: 'Y-m-d',
            onShow: function(ct) {
                this.setOptions({
                    minDate: $('.date_timepicker_start').val() ? $('.date_timepicker_start').val() : false
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


        $('.It-dateBtn').on('click', function() {
            $(this).siblings().removeClass('It-dateBtn-g').addClass('It-dateBtn');
            $(this).removeClass('It-dateBtn').addClass('It-dateBtn-g');


        });







        function getDayType() {

            return today.getFullYear() + '.' + ('0' + (today.getMonth() + 1)).slice(-2) + '.' + ('0' + today.getDate()).slice(-2);
        }

        function getWeekType() {

            weekLater = new Date(today.valueOf() - 7 * 1000 * 3600 * 24);

            return {
                startDay: weekLater.getFullYear() + '.' + ('0' + (weekLater.getMonth() + 1)).slice(-2) + '.' + ('0' + weekLater.getDate()).slice(-2),
                endDay: today.getFullYear() + '.' + ('0' + (today.getMonth() + 1)).slice(-2) + '.' + ('0' + today.getDate()).slice(-2)
            };
        }

        function getMonthType() {
            monthLater = new Date(today.valueOf() - 30 * 1000 * 3600 * 24);

            return {
                startDay: monthLater.getFullYear() + '.' + ('0' + (monthLater.getMonth() + 1)).slice(-2) + '.' + ('0' + monthLater.getDate()).slice(-2),
                endDay: today.getFullYear() + '.' + ('0' + (today.getMonth() + 1)).slice(-2) + '.' + ('0' + today.getDate()).slice(-2)
                
            };
        }

        function dateInitSetting() {
            $('.date_timepicker_start').val(day);
            $('.date_timepicker_end').val(day);
            $('.dateToday-btn').addClass('It-dateBtn-g');
        }





    });




}(this, this.jQuery));