
function addComma(str) {
    if (_.isNilOrBlank(str)) {
        return '0'
    }
    return str.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function isBlank(obj) {
    return obj === '';
}

function isNilOrBlank(obj) {
    return _.isNil(obj) || _.isBlank(obj);
}

function isEmail(obj) {
    var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return regex.test(obj);
}

function isNumber(obj) {
    var regex = /^[0-9]*$/;
    return regex.test(obj);
}

function isBusinessNo(obj) {
    if ((obj = (obj + '').match(/\d{1}/g)).length !== 10) {
        return false;
    }
    var sum = 0, key = [1, 3, 7, 1, 3, 7, 1, 3, 5];
    for (var i = 0; i < 9; i++) {
        sum += (key[i] * Number(obj[i]));
    }
    return ((10 - ((sum + Math.floor(key[8] * Number(obj[8]) / 10)) % 10)) % 10) === Number(obj[9]);
}

function isValidLength(obj, length) {
    return obj.length >= length;
}

function createUUID() {
    var dt = new Date().getTime();
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = (dt + Math.random() * 16) % 16 | 0;
        dt = Math.floor(dt / 16);
        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
}

function isPassPattern(pass){
    var pattern1 = /[0-9]/;
    var pattern2 = /[a-zA-Z]/;
    if(!pattern1.test(pass) || !pattern2.test(pass) || pass.length < 10){
        return false;
    } else{
        return true;
    }
}

_.mixin(
    {
        'addComma': addComma,
        'isBlank': isBlank,
        'isNilOrBlank': isNilOrBlank,
        'isEmail': isEmail,
        'isNumber': isNumber,
        'isBusinessNo': isBusinessNo,
        'isValidLength': isValidLength,
        'createUUID': createUUID,
        'isPassPattern': isPassPattern
    }
);


/* form 데이터 json으로 변환 */
jQuery.fn.extend({
    serializeJSON: function () {
        var arrayData, objectData;
        arrayData = this.serializeArray();
        objectData = {};
        $.each(arrayData, function () {
            var value;
            if (this.value != null) {
                value = this.value;
            } else {
                value = '';
            }

            if (objectData[this.name] != null) {
                if (!objectData[this.name].push) {
                    objectData[this.name] = [objectData[this.name]];
                }
                objectData[this.name].push(value);
            } else {
                objectData[this.name] = value;
            }
        });
        return objectData;
    },
    serializeJSONString: function () {
        return JSON.stringify(this.serializeJSON());
    }
});