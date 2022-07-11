/* ===============================================================
 * 자바스크립트 공통 라이브러리
 * ===============================================================
 */

var common = (function () {
	// 비공개 클래스 멤버 변수
	var _name_ = "corealism common javascript library";
	var _version_ = "1.0";
	return this;
}());


common._context_path = '/office';
common._trans_success_code = '2000';
common._do_not_login_code = '5011';
common._globalCurDate = '';
common._datesplit = "-";
common._left_menu_idx = '';		 

//페이징  
common.fnPaging = function ($obj, option) {
	var _defaultOption = {
		item: 'a',
		format: '{0}',
		next: '<span>다음</span>',
		prev: '<span>이전</span>',
		first: '<span>처음</span>',
		last: '<span>마지막</span>',
		nextClass: 'btnNext',
		prevClass: 'btnPrev',
		firstClass: 'btnFirst',
		lastClass: 'btnLast',
		itemCurrent: 'on'
	};

	$obj.paging(
		$.extend(_defaultOption, option)
	);
}

// 달력
common.fnCalendar = function ($obj, option) {
	var _defaultOption = {
		minDate: 1,
		maxDate: 30,
		monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '.',
		dateFormat: "yy.mm.dd"
	};

	$obj.datepicker(
		$.extend(_defaultOption, option)
	);
}

//form validate
common.fnValidate = function ($obj, option) {
	var _defaultOption = {
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		onsubmit: false,
		showErrors: function (errorMap, errorList) {
			if (!$.isEmptyObject(errorList)) {
				var error = errorList[0];
				alert(error.message);
				try {
					error.element.focus();
				} catch (e) {
				}
				;
			}
		}
	};

	if (option) {
		$obj.validate(
			$.extend(_defaultOption, option)
		);
	} else {
		$obj.validate(
			_defaultOption
		);
	}
}
 

//로딩 공통 
common.fnLoadingStyle = function () {
	var winH = $(window).height();
	var winW = $(window).width();
	var $loading = $("#loading");
	$loading.css({
			"width": winW,
			"height": winH
		}
	);
}

/*
 * checkHangul 문자열에 한글 포함여부 확인
 * @param {String} str
 * @return {Boolean} 포함여부
 */
function checkHangul(str) {
	// 영문, 숫자, _ 이외엔 없는지
	var res1 = (/^[0-9a-z_.-]*$/i).test(str);
	var res2 = false;

	if (str.length > 1) {
		res2 = true;
	}

	if (res1 && res2) {
		return false;
	}
	return true;
};

/*
 * byte 단위로 입력된 값의 길이 조사(한글등 포함)
 * 한글 - 2바이트
 * @param {String} byte단위 입력된 값
 * @return {Integer} byte length
 */
function byteLen(byte_src) {
	var len = byte_src.length;
	var asc;

	for (var i = 0; i < byte_src.length; i++) {
		asc = byte_src.substr(i, 1).charCodeAt(0);
		if (asc > 127) len++;
	}

	return len;
};

/*
 * 숫자여부 판별 (정규식 이용)
 * @param {String}
 * @return {Void}
 */
function checkNumber(str) {
	return regexp = /(^\d+$)|(^\d+\.\d+$)/.test(str);
};

/*
 * 숫자키 입력 확인(이벤트 체크)
 * @param {KeyEvent}
 * @return {Void}
 */
function checkOnlyNumberKeyInput(event) {
	event = event || window.event;

	/* 입력 키가 숫자가 아니면, 무시 */
	if ((event.keyCode < 48) || (event.keyCode > 57)) {
		//event.returnValue = false;

		if ((event.keyCode == 8)) { // backspace 예외사항
			//event.returnValue = true;
			return;
		}
		if ((event.keyCode == 9)) { // tab 예외사항
			//event.returnValue = true;
			return;
		}
		// IE NUM_KEY_PAD
		if (event.keyCode > 95 && event.keyCode < 106) {
			//event.returnValue = true;
			return;
		}

		event.preventDefault();
		return;
	}
};

/*
 * 반복문자 체크
 * @param  
 * @return  
 */
function fn_pwdChk(value) {
	return /(\w)\1\1/.test(value);
}

/*
 * 연속숫자 체크
 * @param  
 * @return  
 */
function checkRepeatNumber(value) {
	var patt_cont = /(012)|(123)|(234)|(345)|(456)|(567)|(678)|(789)|(890)|(901)/; // 반복된 숫자 정규식

	if (patt_cont.test(value)) {
		return true;
	}

	return false;
}
/*
 * 연속문자  체크
 * @param  
 * @return  
 */
function checkRepeatChar(value) {
	var patt_eng = /(abc)|(bcd)|(cde)|(def)|(efg)|(fgh)|(ghi)|(hij)|(ijk)|(jkl)|(klm)|(lmn)|(mno)|(nop)|(opq)|(pqr)|(qrs)|(rst)|(stu)|(tuv)|(uvw)|(vwx)|(wxy)|(xyz)|(yxa)|(ABC)|(BCD)|(CDE)|(DEF)|(EFG)|(FGH)|(GHI)|(HIJ)|(IJK)|(JKL)|(KLM)|(LMN)|(MNO)|(NOP)|(OPQ)|(PQR)|(QRS)|(RST)|(STU)|(TUV)|(UVW)|(VWX)|(WXY)|(XYZ)|(YZA)/;

	if (patt_eng.test(value)) {
		return true;
	}

	return false;
}

/*
 * 은행 계좌 입력 확인(이벤트 체크)
 * @param {KeyEvent}
 * @return {Void}
 */
function checkOnlyBankAccountKeyInput(event) {
	event = event || window.event;

	/* 입력 키가 숫자가 아니면, 무시 */
	if ((event.keyCode < 48) || (event.keyCode > 57)) {
		//event.returnValue = false;
		if ((event.keyCode == 8)) { // backspace 예외사항
			//event.returnValue = true;
			return;
		}
		if ((event.keyCode == 9)) { // tab 예외사항
			//event.returnValue = true;
			return;
		}
		if ((event.keyCode == 189)) { // '-' 예외사항
			//event.returnValue = true;
			return;
		}

		event.preventDefault();
		return;
	}
};

/*
 * 입력된 문자열이 양의 정수형 확인
 * @param {String}
 * @return {Boolean}
 */
function checkPositiveInteger(str) {
	return /^\+?(0|[1-9]\d*)$/.test(str);
};

/*
 * 특수문자체크 ".*[$\@\\#%\^\!\&\*\;'\`\\<\>\|\/"].*";
 * @param {String}  str
 * @return {Boolean}
 */
function checkSpecialString(str) {
	var tmp;
	var regexp = /.*[$\\@\\\#%\^\!\&\*\;\'\`\\\<\>\|\/\"].*/;
	tmp = str.replace(/(\n)/g, "");

	return regexp.test(tmp);
};

/*
 * 파일 확장자 확인
 * 입력 예) checkFileExtension('hello.jpg','jpg,bmp,zip')
 * @param {String} fileName 파일이름(test.jpg)
 * @param {Array} extArrStr '확장자,확장자2,확장자3' => 콤마로 구분된 문자열
 * @return {Boolean}
 */
function checkFileExtension(fileName, extArrStr) {
	var ext;
	var extArr = [];

	if (fileName == '' || extArrStr == '') {
		return false;
	}

	extArr = extArrStr.split(',');

	Array.prototype.contains = function (needle) {
		for (i in this) {
			if (this[i] == needle) {
				return true;
			}
		}
		return false;
	};

	ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length).toLowerCase();

	return extArr.contains(ext);
};

/*
 * 바이트 단위 스트링 길이 제한
 * - 한글이 중간에 깨지지 않음
 * @param {String} 문자열(바이트)
 * @param {Integer} limit 문자열 최대 바이트 단위 길이(한글 => 2byte)
 * @return {String} 해당 길이 문자열
 */
function byteCutString(str, limit) {

	var len = 0;

	for (var i = 0; i < str.length; i++) {
		len += (str.charCodeAt(i) > 128) ? 2 : 1;
		if (len > limit) return str.substring(0, i);
	}

	return str;
};

/*
 * 소수점 이하 원하는 자릿수 자르기
 * - input : 3.141592
 * - output : 3.14 (2자리 자르기)
 * @param {String} decimal type string
 * @param {String} limit 소수점 이하 자리수
 * @return {String} decimal type string
 */
function numberFormatDecimal(dec_str, limit_crop) {
	if (!isNaN(dec_str)) {
		return dec_str.toString().substring(0, (dec_str.indexOf('.') + 1) + limit_crop);
	} else {
		alert('error : decimalCropBy :: invalid input!');
		return;
	}
};

/*
 * 3자리마다 commn 추가
 * @param {Integer} num 숫자
 * @return {String}
 */
function numberFormatComma(num) {
	if (num == null || num == 'null') return '';

	if (typeof num != "string") {
		num = String(num);
	}

	if (num == '') return '';

	var decimal = "";
	var decimalYn = num.indexOf(".") > -1 ? true : false;

	if (decimalYn) {
		decimal = num.split(".")[1];
		num = num.split(".")[0];
	}

	var length = num.length;
	var commaNum = "";

	for (var i = 1; i <= length; i++) {
		commaNum = num.charAt(length - i) + commaNum;
		if (i % 3 == 0 && length - i != 0) {
			commaNum = "," + commaNum;
		}
	}

	if (decimalYn) {
		//소수점 두자리까지 이용 가능
		if (decimal.length > 1) {
			decimal = decimal.substring(0, 2);
		}
		commaNum = commaNum + "." + decimal;
	}

	commaNum = commaNum.replace('-,', '-');

	return commaNum;
};

/**
 * 현재 날자 구하는 함수
 * dateFormat(new Date(), "-") => 2013-07-09
 * - getCurrentDate(      ) 하면 20060101
 * - getCurrentDate( ”-” ) 하면 2006-01-01
 * - getCurrentDate( ”/” ) 하면 2006/01/01
 * - getCurrentDate( ”.” ) 하면 2006.01.01
 * @param {String} dt 날짜 ex) now -> new Date()
 * @param {String} sep 구분자
 * @return {String}
 */
function dateFormat(dt, sep) {
	var separator = sep || "";
	var arrDate = new Array();

	var date = dt.getDate();
	var month = dt.getMonth() + 1;

	arrDate[0] = dt.getFullYear();
	arrDate[1] = month.toString().length < 2 ? month = "0" + month : month;
	arrDate[2] = date.toString().length < 2 ? date = "0" + date : date;

	return arrDate.join(separator);
};

/**
 * 모든 전화번호 검증 정규식 자바스크립트
 * - http://www.technote.co.kr/php/technote1/board.php?board=apple&command=body&no=1197
 * - 01로 시작하는 핸드폰 및 지역번호와 050, 070 검증
 * - 원래 050은 0505 평생번호인가 그런데 보편적으로 050-5xxx-xxxx 로 인식함
 * - 0505-xxx-xxxx 라는 식으로 넣으면 통과할 수 없음. 그래서 경고창 띄울때 예시 넣는것이 좋음.
 * - -(하이픈)은 넣어도 되고 생략해도 되나 넣을 때에는 정확한 위치에 넣어야 함.
 *
 */
function checkPhoneNumber(phone_number) {
	var number = phone_number || "";
	var regexp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

	return regexp.test(number);
};

/**
 * 입력한 전화번호를 3자리(지역번호(통신사번호), 국번, 번호)로 분리한다.
 * @author yy choi
 * @param pNum 전화번호
 * @return
 **/
function splitPhoneNumber(pNum) {
	var pt = /^(01\d{1}|02|0505|0506|0502|0\d{1,2})-?(\d{3,4})-?(\d{4})$/g;

	var splitTel = pt.exec(pNum);
	var result = new Array(3);
	if (splitTel != null) {
		result[0] = splitTel[1];
		result[1] = splitTel[2];
		result[2] = splitTel[3];
	}

	return result;
}


/**
 *  이메일을 체크하기 위한 함수
 *  [정규 표현식]
 *  /^([0-9a-zA-Z_\.-])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
 *   @param {String} email
 *   @return {Boolean}
 */
function checkEmail(email_str) {
	var regexp = /^([0-9a-zA-Z_\.-])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return regexp.test(email_str);
};

/**
 * Map Class
 * 사용 예 : var map = new Map();
 *
 * @returns
 */
common.Map = function Map() {
	this._array = new Array();
	this.pointer = 0;

	this._getIndexByKey = function (key) {
		for (var i = 0; i < this._array.length; i++) {
			if (key == this._array[i][0]) {
				return i;
			}
		}

		return -1;
	};

	this.put = function (key, value) {
		var index = this._getIndexByKey(key);

		if (index == -1) {
			var newArray = new Array();
			newArray[0] = key;
			newArray[1] = value;
			this._array[this._array.length] = newArray;
		} else {
			this._array[index][1] = value;
		}

	};

	this.get = function (key) {
		for (var i = 0; i < this._array.length; i++) {
			if (this._array[i][0] == key)
				return this._array[i][1];
		}

		return null;
	};

	this.pointReset = function () {
		this.pointer = 0;
	};

	this.isNext = function () {
		var result;
		if (this._array.length > this.pointer) {
			result = true;
		} else {
			result = false;
		}

		this.pointer++;

		return result;
	};

	this.size = function () {
		return this._array.length;
	};

	this.nowKey = function () {
		return this._array[this.pointer - 1][0];
	};

	this.nowValue = function () {
		return this._array[this.pointer - 1][1];
	};

	this.MaxData = function () {
		var nowData = 0;
		var maxData = 0;

		for (var i = 0; i < this.size(); i++) {

			if (this._array.length > i) {
				nowData = this._array[i][1];
				if (nowData > maxData) {
					maxData = nowData;
				}
			}

		}

		return maxData;
	};
};

/**
 * 사업자 번호 체크
 * - 사업자번호 10자리를 입력한다.
 * input : common.isBusinessNo('1234567890');
 */
common.isBusinessNo = function (bizNo) {
	var sum = 0;
	var chkValue = new Array(10);
	var multipliers = [1, 3, 7, 1, 3, 7, 1, 3];
	var businessNo = bizNo + '';

	for (var i = 0; i < 10; i++) {
		chkValue[i] = parseInt(businessNo.charAt(i));
	}
	for (i = 0; i < 8; i++) {
		sum += (chkValue[i] *= parseInt(multipliers[i]));
	}
	var chkTemp = chkValue[8] * 5 + '0';
	chkValue[8] = parseInt(chkTemp.charAt(0)) + parseInt(chkTemp.charAt(1));
	var chkLastid = (10 - (((sum % 10) + chkValue[8]) % 10)) % 10;

	if (chkValue[9] != chkLastid) {
		return false;
	}

	return true;
};

Date.prototype.format = function (f) {
	if (!this.valueOf()) return " ";

	var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	var d = this;

	return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function ($1) {
		switch ($1) {
			case "yyyy":
				return d.getFullYear();
			case "yy":
				return (d.getFullYear() % 1000).zf(2);
			case "MM":
				return (d.getMonth() + 1).zf(2);
			case "dd":
				return d.getDate().zf(2);
			case "E":
				return weekName[d.getDay()];
			case "HH":
				return d.getHours().zf(2);
			case "hh":
				return ((h = d.getHours() % 12) ? h : 12).zf(2);
			case "mm":
				return d.getMinutes().zf(2);
			case "ss":
				return d.getSeconds().zf(2);
			case "a/p":
				return d.getHours() < 12 ? "오전" : "오후";
			default:
				return $1;
		}
	});
};

String.prototype.string = function (len) {
	var s = '', i = 0;
	while (i++ < len) {
		s += this;
	}
	return s;
};
String.prototype.zf = function (len) {
	return "0".string(len - this.length) + this;
};
Number.prototype.zf = function (len) {
	return this.toString().zf(len);
}; 

/**
 * jquery 달력 생성 function
 * jqObj, option
 */
common.datePicker = function datePicker(jqObj, option) {
	var dataOption = {
		// 달력 아이콘
		//showOn: "button",
		//buttonImage: "/admin/images/icn_calendar.gif",
		//buttonImageOnly: true,
		// 달력 하단의 종료와 오늘 버튼 Show
		showButtonPanel: false,
		// date 포멧
		dateFormat: "yy-mm-dd",
		// 달력 에니메이션 ( show(default),slideDown,fadeIn,blind,bounce,clip,drop,fold,slide,"")
		showAnim: "",
		// 다른 달의 일 보이기, 클릭 가능
		showOtherMonths: true,
		selectOtherMonths: true,
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		// 년도, 달 변경
		changeMonth: true,
		changeYear: true,
		// 여러달 보이기
		numberOfMonths: 1,
		showButtonPanel: false,
		// 달력 선택 제한 주기(min: 현재부터 -20일,max:현재부터 +1달+10일)
		//minDate: +1,
		//maxDate: "+1M +10D",
		// 주차 보여주기
		showWeek: false,
		firstDay: 1
	};

	if (option != null && option != "") {
		if (option.dateFormat != null && option.dateFormat != "") {
			dataOption.dateFormat = option.dateFormat;
		}
		if (option.minDate != null && option.minDate != "") {
			dataOption.minDate = option.minDate;
		}
		if (option.maxDate != null && option.maxDate != "") {
			dataOption.maxDate = option.maxDate;
		}
	}

	jqObj.datepicker(dataOption);

	jqObj.focus();
};

/**
 * String 에 replaceAll 추가
 * @param search
 * @param replace
 * @returns
 */
String.prototype.replaceAll = function (search, replace) {
	if (replace == null) {
		return this;
	}
	return this.replace(new RegExp('[' + search + ']', 'g'), replace);
}; 

/**
 * String 에 null 변환
 * @param value
 * @param replace
 * @returns
 */
common.replaceNull = function replaceNull(value, replace) {
	if (value == "null" || value == null || value == '' || typeof value == "undefined") {
		return replace;
	}
	return value;
};

/**
 * input[text]의 알림 글자
 * @param _id
 * @param defaultVal
 */
common.setDefaultInputString = function setDefaultInputString(_id, defaultVal) {
	var $obj = $('#' + _id.replace("#", ''));
	$obj.val(defaultVal);
	$obj.focus(function () {
		if ($obj.val() == defaultVal) {
			$obj.css("color", "");
			$obj.val('');
		}
	}).blur(function () {
		if ($.trim($obj.val()) == '') {
			$obj.css("color", "#a7a9ac");
			$obj.val(defaultVal);
		}
	});
	$obj.css("color", "#a7a9ac");
};
 
/***************************************************************
 * 입력값 Max Langth Check
 *
 * @param jqObj, maxLength
 * @return void
 ****************************************************************/
function checkMaxLength(jqObj, maxLength) {
 
	jqObj.keyup(function () {
		var value = $(this).val();

		if (value.length > maxLength) {

			$('body').focus();
			value = value.substr(0, maxLength);
			$(this).focus();
			$(this).selectRange(value.length, value.length);
			$(this).val(value);
		}
		$(this).parent().find("span").text(numberFormatComma(String(value.length)) + "자/" + numberFormatComma(String(maxLength)) + "자");
	});
}

/**
 * 글자수 체크
 * @param intMax
 * @param objMsg
 * @param span
 */
function chkMsgLength(intMax, objMsg, span) {
	var value = '';
	var length = objMsg.value.length;
	if (length >= intMax) {
		$('body').focus();
		value = objMsg.value.substring(0, intMax);
		$(objMsg).focus();
		$(objMsg).selectRange(value.length, value.length);
		objMsg.value = value;
		length = intMax;
	}
	span.html(length + '자');
}

//글자수 체크후 텍스트박스 마지막에 커서 위치
$.fn.selectRange = function (start, end) {
	return this.each(function () {
		if (this.setSelectionRange) {
			this.focus();
			this.setSelectionRange(start, end);
		} else if (this.createTextRange) {
			var range = this.createTextRange();
			range.collapse(true);
			range.moveEnd('character', end);
			range.moveStart('character', start);
			range.select();
		}
	});
};

// 제외 하고 검색
$.fn.ignore = function(sel){
	return this.clone().find(sel||">*").remove().end();
};

/**
 * 좌측에 원하는 문자를 채운다
 * @param num
 * @param leng
 * @param character
 * @returns
 */
function lpad(num, leng, character) {
	var zero = leng - ("" + num).length;
	if (zero > 0) {
		var tmp = "";
		for (var i = 0; i < zero; i++) tmp += character;
		return tmp + num;
	} else return num;
}

/**
 * 우측에 원하는 문자를 채운다
 * @param num
 * @param leng
 * @param character
 * @returns
 */
function rpad(num, leng, character) {
	var zero = leng - ("" + num).length;
	if (zero > 0) {
		var tmp = "";
		for (var i = 0; i < zero; i++) tmp += character;
		return num + tmp;
	} else return num;
}

/**
 * Enter key 사용안함
 * @param jqObj
 */
function enterkeyEventReject(jqObj) {
	jqObj.keypress(function (e) {
		if (e.keyCode == 13) {
			return false;
		}
	});
}

//파일 다운로드
function fileDownLoad(filePath, fileName, dnName) {
	if (filePath == null || filePath == "" || fileName == null || fileName == "") {
		return;
	}
	sendPage(_WEB_STORAGE_PATH + "/" + filePath + "/" + fileName);
}

/**
 * monthPicker
 * @param jqObj
 * @param option
 */
common.monthPicker = function monthPicker(jqObj) {
	jqObj.monthpicker();// jquery의 monthPicker
	jqObj.focus();
};

/**
 * 날짜 계산
 * setDate('year', 0, 'yyyy')
 * setDate('month', 0, 'MM')
 * setDate('date', 0, 'dd')
 *
 * @param dateType
 * @param addDt
 * @param format
 * @returns
 */
function setDate(dateType, addDt, format) {
	var now = new Date();

	if (dateType == "year") {
		now.setFullYear(now.getFullYear() + (Number(addDt)));
		return now.format(format);
	} else if (dateType == "month") {
		now.setMonth(now.getMonth() + (Number(addDt)));
		return now.format(format);
	} else if (dateType == "date") {
		now.setDate(now.getDate() + (Number(addDt)));
		return now.format(format);
	}
}

/**
 * 쿠키 설정하기
 * @param name, value, expiredays
 */
function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	var cvalue = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	document.cookie = cvalue;
}

/**
 * 쿠키 가져오기
 * @param name
 */
function getCookie(name) {
	var nameOfCookie = name + "=";
	var x = 0;
	while (x <= document.cookie.length) {
		var y = (x + nameOfCookie.length);
		if (document.cookie.substring(x, y) == nameOfCookie) {
			if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
				endOfCookie = document.cookie.length;
			return unescape(document.cookie.substring(y, endOfCookie));
		}
		x = document.cookie.indexOf(" ", x) + 1;
		if (x == 0) break;

	}
	return "";
}

/**
 * 입력필드에 대한 최대 글자수를 제한하고 입력한 글자수를 표시한다.
 * obj, targetId, maxLen
 */
function chkMaxLenDisp(obj, targetId, maxLen) {
	$(obj).attr('maxlength', maxLen);
	var len = $(obj).val().length;

	if (len > maxLen) {
		len = maxLen;

		$('body').focus();
		obj.value = obj.value.substr(0, maxLen);
		$("#" + obj.id).focus();
		$("#" + obj.id).selectRange(len, len);

		return false;
	}

	$('#' + targetId).html(len);
}

/**
 * 입력필드에 대한 최대 글자수를 제한하고 입력한 글자수를 표시한다.
 * obj, targetId, maxLen
 */
function limitMaxLen(obj, maxLen) {
	$(obj).attr('maxlength', maxLen);
	var len = $(obj).val().length;

	if (len > maxLen) {
		len = maxLen;

		$('body').focus();
		obj.value = obj.value.substr(0, maxLen);
		$("#" + obj.id).focus();
		$("#" + obj.id).selectRange(len, len);
		return false;
	}
}

function getCurDate() {
	var curDt = new Date();

	$.ajax({
		url: _CONTEXT_PATH + "/accounts/settlement/getDate.do",
		async: false,
		type: "POST",
		cache: false,
		dataType: "json",
		timeout: 30000,
		error: function (xhr, textStatus, errorThrown) {

		},
		success: function (json, textStatus) {
			var year = json.date.substring(0, 4);
			var month = json.date.substring(5, 7);
			var day = json.date.substring(8, 10);
			var hours = json.date.substring(11, 13);
			var minutes = json.date.substring(14, 16);
			var seconds = json.date.substring(17, 19);

			curDt = new Date(year, (parseInt(month) - 1), day, hours, minutes, seconds);
		}
	});

	return curDt;
}


//url 입력창에 http://로 시작하지 않으면 자동 생성
//ex) urlSet( $("#mypadLinkSort2Web") , 1000);
function urlSet(jqObj, maxLen) {
	jqObj.attr('maxlength', maxLen);

	jqObj.focusout(function () {
		var url = $(this).val();
		if (url != "") {
			if (url.substr(0, 7) != "http://") {
				$(this).val("http://" + url);
			}
		}
	});

	jqObj.keyup(function () {
		var defaultLeng = "http://".length;
		var len = $(this).val().length;
		if ((len + defaultLeng) > maxLen) {
			var url = $(this).val();
			if (url.substring(0, 7) == "http://") {
				$(this).val(url.substring(0, maxLen));
			} else {
				$(this).val(url.substring(0, maxLen - defaultLeng));
			}
		}
	});
}

//	레이어 팝업 알림창
function popupAlertMsg(titleMsg, msgInfo) {
	layPopup({
		title: titleMsg,
		message: msgInfo,
		width: '300',
		height: '200'
	});
	return false;
}

//	ajax call function
function ajaxCall(url, data, callBack, errorMsg) {
	console.log('ajaxCall Start');
	console.log('ajaxCall Start showLoading');
	var _data;
	if (typeof data === 'string') {
		_data = data;
	} else if (typeof data === 'object') {
		_data = JSON.stringify(data);
	} else {
		_data = "";
	}

	$.ajax({
		type: "POST",
		url: url,
		data: _data,
		contentType: "application/json",
		dataType: "JSON",
		success: function (obj) {
			console.log('success');
			console.log('success hide Loading');
			if (obj.errCode != null) {
				alertPopup(obj.errMsg);
			} else if (obj.result == null || 'undefined' == obj.result) {
				// 프로세스를 끝까지 수행하지 못하고 중간에  EvdMoGenericException 이 발생한 경우
				alertPopup(obj.errMsg);
			} else {

				if (obj.result == common._trans_success_code) {
					callBack(obj);
				} else if (obj.result == common._do_not_login_code) {
					alertPopup(obj.msg, goToLogin);
				} else {
					//alertPopup(obj.errDesc);
					alertPopup(obj.errMsg);
				}
			}

		}, error: function (obj) {
			//oGNMO.hideLoading();
			//alertPopup(errorMsg + "에러가 발생하였습니다");
			//oGNMO.oScroll.refresh();
			return;
		}
	});
}

//ajax call function
function ajaxCall(url, data, callBack, errorCall, errorMsg) {
	var _data;
	if (typeof data === 'string') {
		_data = data;
	} else if (typeof data === 'object') {
		_data = JSON.stringify(data);
	} else {
		_data = "";
	}
	$.ajax({
		type: "POST",
		url: url,
		data: _data,
		contentType: "application/json",
		dataType: "JSON",
		success: function (obj) { 
			if (obj.errCode != null) {
				errorCall(obj);
			} else if (obj.result == null || 'undefined' == obj.result) {
				// 프로세스를 끝까지 수행하지 못하고 중간에  EvdMoGenericException 이 발생한 경우
				errorCall(obj);
			} else {
				//console.log('obj 3');
				if (obj.result == common._trans_success_code) {
					//console.log('obj 4');
					callBack(obj);
				} else if (obj.result == common._do_not_login_code) {
					//console.log('obj 5');
					errorCall(obj);
					goToLogin();
				} else {
					//console.log('obj 6');
					errorCall(obj);
				}
			}
		}, error: function (obj) {
			return;
		}
	});
}

function ajaxCallLoading(url, data, callBack, errorCall, errorMsg) {
	var _data;
	if (typeof data === 'string') {
		_data = data;
	} else if (typeof data === 'object') {
		_data = JSON.stringify(data);
	} else {
		_data = "";
	}
	$.ajax({
		type: "POST",
		url: url,
		data: _data,
		contentType: "application/json",
		dataType: "JSON",
		success: function (obj) {
			if (obj.errCode != null) {
				errorCall(obj);
			} else if (obj.result == null || 'undefined' == obj.result) {
				errorCall(obj);
			} else {
				//console.log('obj 3');
				if (obj.result == common._trans_success_code) {
					//console.log('obj 4');
					callBack(obj);
				} else if (obj.result == common._do_not_login_code) {
					//console.log('obj 5');
					errorCall(obj);
					goToLogin();
				} else {
					//console.log('obj 6');
					errorCall(obj);
				}
				//console.log('obj 7');
			} 
		}, error: function (obj) { 
			return;
		}, beforeSend: function () {
			console.log("beforeSend");
			$("#loading").removeClass();
			$("#loading").addClass("show")
		}, complete: function () {
			console.log("complete");
			$("#loading").removeClass();
			$("#loading").addClass("hide")
		}
	});
}
 
function setFormatYYYYMMDD(obj) {
	obj.val(formatYYYYMMDD(obj.val(), common._datesplit));
}

function setPureYYYYMMDD(obj) {
	obj.val(getPureYYYYMMDD(obj.val(), common._datesplit));
}

/**
 * yyyy-MM-dd 와 같이 특수문자로 년월일을 구분하여 문자 데이터 10바이트를 리턴
 */
function formatYYYYMMDD(obj, split) {
	// yyyyMMdd 타입을 yyyy-MM-dd 와 같이 특수문자로 년월일을 구분하여 문자 데이터 10바이트를 리턴한다.
	var rtrnDate = '';
	var strDate = obj;
	strDate = strDate.replaceAll(split, "");
	if (strDate.length != 8) return rtrnDate;

	rtrnDate = strDate.substring(0, 4) + split + strDate.substring(4, 6) + split + strDate.substring(6, 8);

	return rtrnDate;
}

function formatYYYYMMDDHanGul(obj) {
	// yyyyMMdd 타입을 yyyy-MM-dd 와 같이 특수문자로 년월일을 구분하여 문자 데이터 10바이트를 리턴한다.
	var rtrnDate = '';
	var strDate = obj;
	if (strDate.length != 8) return rtrnDate;

	rtrnDate = strDate.substring(0, 4) + "년 " + strDate.substring(4, 6) + "월 " + strDate.substring(6, 8) + "일";

	return rtrnDate;
}

/**
 * yyyy-MM-dd HH24:mi:ss 와 같이 특수문자로 년월일시분초 14바이트 일시를 구분하여 문자 데이터 19바이트를 리턴
 */
function formatYYYYMMDDHH24MISS(obj, split) {
	//  yyyy-MM-dd HH24:mi:ss 와 같이 특수문자로 년월일시분초 14바이트 일시를 구분하여 문자 데이터 19바이트를 리턴
	var rtrnDate = '';
	var strDate = obj;
	strDate = strDate.replaceAll(split, "");
	if (strDate.length != 14) return rtrnDate;

	rtrnDate = strDate.substring(0, 4) + split + strDate.substring(4, 6) + split + strDate.substring(6, 8) + " " + strDate.substring(8, 10) + ":" + strDate.substring(10, 12) + ":" + strDate.substring(12, 14);

	return rtrnDate;
}

/**
 * yyyy-MM-dd HH24:mi 와 같이 특수문자로 년월일시분 12바이트 일시를 구분하여 문자 데이터 17바이트를 리턴
 */
function formatYYYYMMDDHH24MI(obj, split) {
	//  yyyy-MM-dd HH24:mi 와 같이 특수문자로 년월일시분 12바이트 일시를 구분하여 문자 데이터 17바이트를 리턴
	var rtrnDate = '';
	var strDate = obj;
	strDate = strDate.replaceAll(split, "");
	if (strDate.length != 12) return rtrnDate;

	rtrnDate = strDate.substring(0, 4) + split + strDate.substring(4, 6) + split + strDate.substring(6, 8) + " " + strDate.substring(8, 10) + ":" + strDate.substring(10, 12);

	return rtrnDate;
}


function getPureYYYYMMDD(obj, split) {
	var rtrnDate = '';
	var strDate = obj;

	rtrnDate = strDate.replaceAll(split, "");

	return rtrnDate;
}

/**
 * 숫자만 입력
 * @returns {Boolean}
 */
function onlyNumberKey() {
	if (event.keyCode >= 48 && event.keyCode <= 57) { //숫자키만 입력
		return true;
	} else if ((event.keyCode == 8)) { // backspace 예외사항
		//event.returnValue = true;
		return true;
	} else {
		event.returnValue = false;
	}
}
 
/**
 * 커스텀 팝업
 * @param txtData
 */
function alertPopup(txtData, okEvent) {
	alert(txtData);
	okEvent; 
}

function alertPopup(txtData) {
	alert(txtData);
}


/**
 * 커스텀 컨펌팝업
 * ex) confirmPopup('txtData', 'ok', 'cancel')
 * ok btn callBackFuncion : confirmPopupOk();
 * cancel btn callBackFuncion : confirmPopupCancel();
 * @param txtData
 * @param okBtnTitle
 * @param okBtnFn
 * @param cancelTitle
 * @param cancelFn
 */
function confirmPopup(txtData, okBtnTitle, cancelTitle) {
	var layerID = "#alertPopup";
	var $lypopWrap = $('#msgPopWrap');
	var $lypop = $(layerID);
	var $dimm = $lypopWrap.children('.lyDimm');
	screenH = $(window).height();
	$('#alert-cancel').off();
	$('#alert-confirm').off();

	$('#alert-confirm').text("확인");
	$('#alert-cancel').text("취소");

	if (undefined != okBtnTitle && okBtnTitle != "") {
		$('#alert-confirm').text(okBtnTitle);
	}
	if (undefined != cancelTitle && cancelTitle != "") {
		$('#alert-cancel').text(cancelTitle);
	}

	$('#alert-msg').text(txtData);
	$('#alert-cancel').show();

	$('#alert-confirm').on('click', function () {
		confirmOk();
		$lypopWrap.fadeOut();
		$lypop.fadeOut();
	});
	$('#alert-cancel').on('click', function () {
		confirmCancel();
		$lypopWrap.fadeOut();
		$lypop.fadeOut();
	});

	$lypopWrap.fadeIn();
	$lypop.show();

	// 화면의 중앙에 레이어를 띄운다.
	layerPosition($lypop);

	$lypop.find('a.lyClose').click(function (e) {
		$lypopWrap.fadeOut();
		$lypop.fadeOut();
		e.preventDefault();
	});
}

/**
 * 커스텀 컨펌팝업
 * ex) confirmPopup('txtData', 'ok', okFn ,'cancel', cancleFn)
 * ok btn callBackFuncion : okFn();
 * cancel btn callBackFuncion : cancleFn();
 * @param txtData
 * @param okBtnTitle
 * @param okBtnFn
 * @param cancelTitle
 * @param cancelFn
 */
function confirmCustomPopup(txtData, okBtnTitle, okFn, cancelTitle, cancelFn) {
	var layerID = "#alertPopup";
	var $lypopWrap = $('#msgPopWrap');
	var $lypop = $(layerID);
	var $dimm = $lypopWrap.children('.lyDimm');
	screenH = $(window).height();
	$('#alert-cancel').off();
	$('#alert-confirm').off();

	$('#alert-confirm').text("확인");
	$('#alert-cancel').text("취소");

	if (undefined != okBtnTitle && okBtnTitle != "") {
		$('#alert-confirm').text(okBtnTitle);
	}
	if (undefined != cancelTitle && cancelTitle != "") {
		$('#alert-cancel').text(cancelTitle);
	}

	$('#alert-msg').text(txtData);
	$('#alert-cancel').show();

	$('#alert-confirm').on('click', function () {
		okFn();
		$lypopWrap.fadeOut();
		$lypop.fadeOut();
	});
	$('#alert-cancel').on('click', function () {
		cancelFn();
		$lypopWrap.fadeOut();
		$lypop.fadeOut();
	});

	$lypopWrap.fadeIn();
	$lypop.show();

	// 화면의 중앙에 레이어를 띄운다.
	layerPosition($lypop);

	$lypop.find('a.lyClose').click(function (e) {
		$lypopWrap.fadeOut();
		$lypop.fadeOut();
		e.preventDefault();
	});
}

function confirmCancel() {
	return;
} 

/*
 * url 파라미터
 */
function gup(name, url) {
	if (!url) url = location.href;
	name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
	var regexS = "[\\?&]" + name + "=([^&#]*)";
	var regex = new RegExp(regexS);
	var results = regex.exec(url);
	return results == null ? null : results[1];
}

/*
 * 2중팝업 1번째 팝업 닫기
 * TODO : 삭제처리
 */
function closePopup2() {
	oScrollPopup2.detachAll();
	$('._layerFullPopup2').remove();
}

/*
 * 2중팝업 1번째 팝업 닫기
 * TODO : 삭제처리
 */
function closePopup() {
	//oGNMO.oScrollPopup.detachAll();
	$('._layerFullPopup').remove();
}

/*
 * 날짜 차이 계산
 */
function getDateDiff(fromDate, toDate) {
	fromDate = fromDate.replaceAll(common._datesplit, "");
	toDate = toDate.replaceAll(common._datesplit, "");

	var startDate = new Date(fromDate.substring(0, 4), eval(fromDate.substring(4, 6)) - 1, fromDate.substring(6, 8));
	var endDate = new Date(toDate.substring(0, 4), eval(toDate.substring(4, 6)) - 1, toDate.substring(6, 8));
	var getDiffTime = endDate.getTime() - startDate.getTime();
	return Math.floor(getDiffTime / (1000 * 60 * 60 * 24));
}

/*
 * 날짜 더하기
 */
function getAddDate(sDate, nDays) {
	sDate = sDate + '';
	var yy = parseInt(sDate.substr(0, 4), 10);
	var mm = parseInt(sDate.substr(4, 2), 10);
	var dd = parseInt(sDate.substr(6, 2), 10);

	console.log('yy :', yy);
	console.log('mm :', mm);
	console.log('dd', dd);
	d = new Date(yy, mm - 1, dd + nDays);

	yy = d.getFullYear();
	mm = d.getMonth() + 1;
	mm = (mm < 10) ? '0' + mm : mm;
	dd = d.getDate();
	dd = (dd < 10) ? '0' + dd : dd;

	return '' + yy + mm + dd;
}

/*
 * 통화 콤마 처리
 */
function setComma(num) {
	if (num == 0) return 0;
	var reg = /(^[+-]?\d+)(\d{3})/;
	var n = (num + '');
	while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	return n;
}

/*
 * 통화 콤마 처리
 */
function removeComma(str) {
	if (str != "" && typeof str === "string") {
		str = str.replace(/,/g, "");
		str = str.replace(/\./g, "");
		str = eval(str);
	}
	return str;
}

/*
 * 리사이즈 팝업
 */
function resize_popup(w, h, scroll, center) {
	var docEl = document.documentElement,
		width,
		height;

	function resize() {
		// 창 내부 너비와 높이
		width = docEl.clientWidth;
		height = docEl.clientHeight;
		// 창 내부 너비와 높이가 입력 받은 너비/높이와 다를 경우 그 차이만큼 리사이즈
		if (width !== w || height !== h) {
			window.resizeBy(w - width, h - height);
		}
	}

	scroll = scroll === false ? false : true; // 스크롤 여부: 기본은 스크롤 활성
	if (!scroll) {
		// 스크롤 비활성
		docEl.style.overflowY = 'hidden';
		docEl.style.overflowX = 'hidden';
	} else {
		// 스크롤 활성
		docEl.style.overflowY = 'auto';
		docEl.style.overflowX = 'hidden';
	}

	resize();
	// 창을 화면 중앙으로 이동
	if (center) {
		// 크롬 영역(창 테두리, 주소표시줄 등)까지 고려해야하지만 큰 효과 없으므로 무시
		window.moveTo((screen.availWidth / 2) - (w / 2), (screen.availHeight / 2) - (h / 2));
	}
} 
 
function commonSystemPopup(url, popupId, width, height) {
	window.open(url, popupId, 'status=no,menubar=no,scrollbars=yes,resizable=no,width=' + width + ',height=' + height);
}
 
function goToLogin() {
	location.href = "/view/account/login";
}

function getThumbnailImage(src, size) {
	if (!src) {
		return src;
	}

	var image_path = src;
	var dotPos = image_path.lastIndexOf(".");
	var underlinePos = image_path.lastIndexOf("_");
	var pos = 0;
	if (dotPos - underlinePos < 7) {
		pos = dotPos - underlinePos;
	}

	return src.substring(0, dotPos - pos) + src.substring(dotPos);

	return src.substring(0, dotPos - pos) + "_" + size + src.substring(dotPos);
}

function moveToScroll(jObj) {
	var moveTop = $(jObj).offset().top - 65;

	$('body,html').animate({scrollTop: moveTop}, 1);
}

//요일
function dayOfTheWeek(val) {
	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	var today = new Date(val).getDay();
	var dayOfWeek = week[today];

	return dayOfWeek;
}
 
function getResizeFileName(orgFileName, resize) {
	if (orgFileName == null || resize == null || orgFileName.lastIndexOf(".") < 0) {
		return orgFileName;
	}

	var extDotPos = orgFileName.lastIndexOf(".");

	return orgFileName.substring(0, extDotPos) + resize + orgFileName.substring(extDotPos);
}
 
function toCamel(o) {
	var newO, origKey, newKey, value;
	if (o instanceof Array) {
		newO = [];
		for (origKey in o) {
			value = o[origKey];
			if (typeof value === "object") {
				value = toCamel(value);
			}
			newO.push(value);
		}
	} else {
		newO = {}
		for (origKey in o) {
			if (o.hasOwnProperty(origKey)) {
				newKey = (origKey.charAt(0).toLowerCase() + origKey.slice(1) || origKey).toString();
				value = o[origKey];
				if (value !== null && value.constructor === Object) {
					value = toCamel(value);
				}
				newO[newKey] = value;
			}
		}
	}
	return newO;
} 
//errorCallBack alert 메세지 
function errorCallBack(obj) {
	console.log(obj);
	if (obj.errMsg == null || obj.errMsg == 'undefined') {
		setTimeout(function () {
			alertPopup(obj.msg);
		}, 500);
	} else {
		setTimeout(function () {
			alertPopup(obj.errMsg);
		}, 500);
	}
}

// errorCallBack 이후 이벤트 호출
function errorCallBack(obj, eventFn) {
	console.log(obj);
	if (obj.errMsg == null || obj.errMsg == 'undefined') {
		setTimeout(function () {
			alertPopup(obj.msg, eventFn);
		}, 500);
	} else {
		setTimeout(function () {
			alertPopup(obj.errMsg, eventFn);
		}, 500);
	}
}

function errorDescCallBack(obj) {
	console.log(obj);
	if (obj.errDesc == null || obj.errDesc == 'undefined') {
		setTimeout(function () {
			alertPopup(obj.desc);
		}, 500);
	} else {
		setTimeout(function () {
			alertPopup(obj.errDesc);
		}, 500);
	}
}

function errorDescCallBack(obj, eventFn) {
	console.log(obj);
	if (obj.errDesc == null || obj.errDesc == 'undefined') {
		setTimeout(function () {
			alertPopup(obj.desc, eventFn);
		}, 500);
	} else {
		setTimeout(function () {
			alertPopup(obj.errDesc, eventFn);
		}, 500);
	}
}

//div msg
function errorMsgView(msg, id) {
	const element = id;
	element.innerHTML = "<div class='error_msg'>"+msg+"</div>"; 
} 

//errorCallBack alert 메세지 
function errorCallBackMsgView(obj) {
	console.log(obj);  
	const element = error_msg;
	if (obj.errMsg == null || obj.errMsg == 'undefined') {
		element.innerHTML = "<div class='error_msg'>"+obj.msg+"</div>"; 
	} else {
		element.innerHTML = "<div class='error_msg'>"+obj.errMsg+"</div>"; 
	} 
}

/*마스킹*/
function maskingEmail(str){
	var preMaskingData = str;
    var MaskingData = "";
    var len = "";
    var emailMatchValue = preMaskingData.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);
	len = emailMatchValue.toString().split('@').length;
    MaskingData = preMaskingData.toString().replace(new RegExp('.(?=.{0,' + len + '}@)', 'gi'), '*');
    return MaskingData
} 
function maskingEmail(str){
    var MaskingData = "";
    var len = "";
    var emailMatchValue = str.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);
	len = emailMatchValue.toString().split('@').length;
    MaskingData = str.toString().replace(new RegExp('.(?=.{0,' + len + '}@)', 'gi'), '*');
    return MaskingData
} 

function maskingTel(str){
    var MaskingData = "";
    var len = "";
	 var phoneMatchValue = str.match(/\d{2,3}-\d{3,4}-\d{4}/gi);
  
    if(/-[0-9]{3}-/.test(phoneMatchValue))
    {
		// 00-000-0000 형태인 경우
        MaskingData= str.toString().replace(phoneMatchValue, phoneMatchValue.toString().replace(/-[0-9]{3}-/g, "-***-"));
    }else if(/-[0-9]{4}-/.test(phoneMatchValue))
    {
		// 00-0000-0000 형태인 경우
        MaskingData= str.toString().replace(phoneMatchValue, phoneMatchValue.toString().replace(/-[0-9]{4}-/g, "-****-"));
    }
    return MaskingData;
}
/*
function maskingId(str){
	var maskingStr; 
	var strLength = str.length; 
	if(strLength < 3){ 
		maskingStr = str.replace(/(?<=.{1})./gi, "*"); 
	}else { 
		maskingStr = str.replace(/(?<=.{2})./gi, "*"); 
	} 
	return maskingStr;

}*/

/*function maskingAddr(str){
	var maskingStr ;
	if(str ==undefined || str =='' || str == null){
		return '';
	}else{
		maskingStr =str.replace(/(?<=.{10})./gi, "*"); 
		return maskingStr;
	}
}*/

/**
 * Android : 1
 * iPhone  : 2
 * iPad    : 3
 * else    : 4
 */
function getDevice() {
	var UserAgent = navigator.userAgent;
	var filter = "win16|win32|win64|mac|macintel";
	var res = 0;
	if (UserAgent.match(/Android/i) != null && filter.indexOf(navigator.platform.toLowerCase()) < 0) {
		res = 1;
	} else if ((UserAgent.match(/iPhone/i) != null)) {
		res = 2;
	} else if ((UserAgent.match(/iPad/i) != null)) {
		res = 3;
	} else { // PC
		res = 4;
	}
	return res;
}