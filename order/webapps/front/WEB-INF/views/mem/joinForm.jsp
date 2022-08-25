<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant
             , com.gncns.goobne.common.session.SessionFactoryFront
             , com.gncns.goobne.common.session.GnMember              
             , com.gncns.goobne.common.session.GnLocation" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %> 
<%
    SessionFactoryFront sessFtr = new SessionFactoryFront(request);
    GnMember user = sessFtr.getGnMember();   
%>
<!DOCTYPE html>
<html lang="kor" dir="ltr">
<head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
	    new WOW().init();
	</script>   
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <title>회원가입</title>
    <script type="text/javascript">
$(document).ready(function(){
        	
	// 엔터 자동 submit 방지
	document.addEventListener('keydown', function (event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
	}, true);
	
	// 이메일 도메인
	var param = new Object();
    param.define_id = 'DOMAIN';
    param.use_yn ='Y';
    getCodeListSelBox($("#domain_cd"), param, "직접입력", "");
    
	$('#domain_cd').change(function(){
		$("#domain_cd option:selected").each(function () {
			if($(this).val() == ''){ //직접입력일 경우
				 $("#domain").show();
				 $("#domain").val('');//값 초기화
				 $("#domain").attr("disabled", false); //활성화
			}else{ //직접입력이 아닐경우
				 $("#domain").val($(this).text());//선택값 입력
				 $("#domain").attr("disabled", true); //비활성화
			}
		});
	});
	
 	// 뷰타이머
/* 	var timerID; // 타이머를 핸들링하기 위한 전역 변수
	var time = 300; // 타이머 시작시의 시간
	function viewTimer(){
		$("#hpTimer").show();
		timerID = setInterval(decrementTime, 1000); // -- (1) 타이머 실행
	} */
	
	//뷰타이머
	var timer = null;
	var isRunning = false;
	var display = $('.code_time');
	var leftSec = 20; //타이머 시작시의 시간
	
	function startTimer(count, display) {

		var minutes, seconds;
			timer = setInterval(function () {
			minutes = parseInt(count / 60, 10);
			seconds = parseInt(count % 60, 10);
	
			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;
	
			display.html(minutes + ":" + seconds);
	
			// 타이머 끝
			if (--count < 0) {
				clearInterval(timer);
				//alert("시간초과");
				display.html("시간초과");
				$('.btn_chk_input').attr("disabled", true);
				isRunning = false;
			}
		}, 1000);
		isRunning = true;
	}

    // 체크박스 전체동의 
    $('.all-chk').click(function () {
        $('.all-chk-type').prop('checked', this.checked);
    });

    // 메일 동의
    $('#chk-01').click(function () {
        $('#chk-007').prop('checked', this.checked);
    });
 	// 메일 동의
    $('#chk-007').click(function () {
        $('#chk-01').prop('checked', this.checked);
    });
 	// SMS 동의
    $('#chk-02').click(function () {
        $('#chk-005').prop('checked', this.checked);
    });
    $('#chk-005').click(function () {
        $('#chk-02').prop('checked', this.checked);
    });
    
    //이벤트 전체동의
     $('#chk-004').click(function () {
    	$('input[name=sns]').prop('checked', this.checked);
    });
    
    // 이용약관 내용보기 버튼 
    $('.terms').click(function () {
        $(".dimmed-bg").removeClass("l-hidden");
        $(".terms-moadl").removeClass("l-hidden");
    });

    // 개인정보 관련 내용보기 버튼 
    $('.privacy').click(function () {
        $(".dimmed-bg").removeClass("l-hidden");
        $(".privacy-moadl").removeClass("l-hidden");
    });

    // 팝업 닫기 버튼 구현
    function closePopupFunc() {
        $(".dimmed-bg").addClass("l-hidden");
        $(".terms-moadl").addClass("l-hidden");
        $(".privacy-moadl").addClass("l-hidden");
    }
    
    const closeBtnElem = document.querySelectorAll(".closeBtn");
    closeBtnElem.forEach(e => e.addEventListener('click', closePopupFunc));
    
  //휴대번호 인증번호 발송
    $("#authKeyIssueBtn").on("click", function (event) {
     	event.preventDefault();
     		var tel = $("#tel1").val().replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g, "");
     		
    		var chkStyle = /[0-9]/ ;
    		
    		//전화번호 확인
    		if(!chkStyle.test(tel)){
    			alert("전화번호는 숫자만 입력 가능합니다.");
    			return;
    		}
    		if (tel.length == 0) {
       			alert("연락처를 입력해주세요.");
       			$("#tel").focus();
       			return;
       		}
       		if (!checkPhoneNumber(tel) || tel.length < 11) {
       			alert("휴대폰 번호를 정확하게 입력해주세요.");
       			$("#tel").focus();
       			return;
       		}
       		
    		var obj = Object(); 
    		if(tel.length == 11){
    			obj.mble1= tel.substring(0,3);
    			obj.mble2= tel.substring(3,7);
    			obj.mble3= tel.substring(7,11);
    		} else if(tel.length == 10){
    			obj.mble1= tel.substring(0,3);
    			obj.mble2= tel.substring(3,6);
    			obj.mble3= tel.substring(6,10);
    		} else {
    			alert("전화번호를 확인해주세요");
    			$("#tel1").focus();
    			return;
    		}
    		
    		var auth_key = $('#auth_key').val();
    	 	var data = {
    	 		"auth_key": auth_key,
    	 		"mble1": obj.mble1,
    			"mble2": obj.mble2,
    			"mble3": obj.mble3
    	 	};
    	 	
    	 	var data = JSON.stringify(obj);
    		var url = '/join/reqMbleAuthKey';
    		
    	 	ajaxCall(url, data, function(resp){
    			if(resp.result == common._trans_success_code){
    				$("form[name=joinForm] input[name=auth_key]").val(resp.body.auth_key);
    				// timer 보이기
    				//viewTimer();
    				alert("고객님의 휴대폰으로 인증번호가 발송되었습니다.\r\n확인 후 입력해주세요.");
    				
    				$('.btn_chk_input').attr("placeholder", "").attr("disabled", false);
    				
    				// 남은 시간
    				// 이미 타이머가 작동중이면 중지
    				if (isRunning){
    					clearInterval(timer);
    					display.html("");
    					startTimer(leftSec, display);
    				}else{
    				startTimer(leftSec, display);

    				}
    			}
    		},commonErrorCallBack,"휴대번호 인증 번호 요청 ");
    	});
  
	// 휴대번호 인증 확인
    $("#authKeyConfirmBtn").on("click", function (event) {
    	event.preventDefault();

     	var auth_key = $('#auth_key').val();
     	var auth_val = $('#auth_val').val();
     	
     	var tel = $("#tel1").val().replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g, "");
    	var chkStyle = /[0-9]/ ;
    	
    	// 전화번호 확인
    	if(!chkStyle.test(tel)){
    		alert("전화번호는 숫자만 입력 가능합니다.");
    		return;
    	}
    	if (tel.length == 0) {
    			alert("연락처를 입력해주세요.");
    			$("#tel").focus();
    			return;
    	}
    	if (!checkPhoneNumber(tel) || tel.length < 11) {
    		alert("휴대폰 번호를 정확하게 입력해주세요.");
    		$("#tel").focus();
    		return;
    	}

    	var obj = Object(); 
    	
    	if(tel.length == 11){
    		obj.mble1= tel.substring(0,3);
    		obj.mble2= tel.substring(3,7);
    		obj.mble3= tel.substring(7,11);
    	} else if(tel.length == 10){
    		obj.mble1= tel.substring(0,3);
    		obj.mble2= tel.substring(3,6);
    		obj.mble3= tel.substring(6,10);
    	} else {
    		alert("전화번호를 확인해주세요");
    		$("#tel1").focus();
    		return;
    	}
     	
    	if(!auth_val || $.trim(auth_val) == ""){
    		alert("인증번호를 입력해주세요");
    		$("#auth_val").focus();
    		return;
    	}
    	
    	var data = {
    			"auth_key": auth_key,
    			"auth_val": auth_val,
    			"mble1": obj.mble1,
    			"mble2": obj.mble2,
    			"mble3": obj.mble3
    	};

    	ajaxCall("/join/checkMbleAuthKey", data, function(resp){
    		if(resp.result == common._trans_success_code){
    			$("form[name=joinForm]  input[name=enc_mble]").val(resp.body.enc_mble);
    			alert("휴대번호인증이 완료되었습니다.");
    			
    			$('.btn_chk_input').attr("disabled", true);
    			clearInterval(timer);
				display.hide();
    			
    			/* clearInterval(timerID);
    			$("#hpTimer").hide(); */
    			
    		}
    	},commonErrorCallBack,"휴대번호 인증 번호 요청 ");
    });
	
 	// 아이디 중복 확인
	$("#checkDuplicateId").on("click",function(event){
		event.preventDefault();
		
		var lgn_id = $('#user-id').val();

		if(!lgn_id || $.trim(lgn_id) == ""){
			alert("아이디를 입력해주세요");
			$("#user-id").focus();
			return ;
		}
		
		if(lgn_id.length != $.trim(lgn_id).length){
			alert("아이디에 공백 문자를 확인해주세요");
			$("#user-id").focus();
			return ;
		}
		
		var login_id_test = /[^0-9A-Za-z]/g;
		
		lgn_id = $.trim(lgn_id);
		if(lgn_id.length < 4 || lgn_id.length > 20 || login_id_test.test(lgn_id) ){
			alert("4~20자의 영, 숫자 혼용하여 사용 가능합니다.");
			$("#user-id").focus();
			return ;
		}

		var data = {
				login_id : lgn_id
		};
		
		ajaxCall("/join/checkLoginId",data,function(resp){
			if(resp.result == common._trans_success_code){

				if(resp.body.checkLoginId == false){
					$("form[name=joinForm] input[name=duplicate_id]").val(resp.body.login_id);
					alert("사용가능한 아이디 입니다.");
				}else{
					alert("이미 사용중인 아이디 입니다.");
				}
				console.log(resp);
			}
		},commonErrorCallBack,"아이디 중복확인 요청");
	});
 	
	// 추천인 아이디 체크
	$("#recom-id-ck").on("click", function (event){
		event.preventDefault();

		var recom_id = $('#recom-id').val();

		if(!recom_id || $.trim(recom_id) == ""){
			alert("추천인 아이디를 입력해주세요");
			$("#recom-id").focus();
			return ;
		}
		
		if(recom_id.length != $.trim(recom_id).length){
			alert("아이디에 공백 문자를 확인해주세요");
			$("#recom-id").focus();
			return ;
		}
		
		var data = {
				login_id : recom_id
		};
		
		ajaxCall("/join/checkLoginId",data,function(resp){
			if (resp.result == common._trans_success_code) {
				if (resp.body.checkLoginId == false) {
					alert("추천인이 없습니다.");
				} else {
					alert("추천인 확인 되었습니다.");
					 $("#recom-id").attr("disabled", true); //비활성화
				}
				// console.log(resp);
			}
		}, commonErrorCallBack, "추천 아이디 요청");
	});

});
        
//select박스 외부영역 클릭시 닫기
/*  $(document).mouseup(function (e){
     var select_box = $(".type-list");
     if(select_box.has(e.target).length === 0){
         select_box.removeClass("is-show");
     }
 }); */
 
 	// 추천인 아이디
 	function fn_keyUpRecomm() {
		if (window.event.keyCode == 13) {
			$("#recom-id-ck").click();
			return;
       }
	}
 
 	// 휴대폰 인증번호 발송
 	function fn_keyUpAuthKey() {
		if (window.event.keyCode == 13) {
			$("#authKeyIssueBtn").click();
			return;
		}
	}
 
	// 휴대번호 인증번호 확인
	function fn_keyUpAuthKeyCon() {
		if (window.event.keyCode == 13) {
			$("#authKeyConfirmBtn").click();
			return;
		}
	}

    //카카오 우편번호
	function postcode() {
		new daum.Postcode({
        	oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수

               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   addr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if(data.userSelectedType === 'R'){
                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있고, 공동주택일 경우 추가한다.
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                   if(extraAddr !== ''){
                       extraAddr = ' (' + extraAddr + ')';
                   }
                   // 조합된 참고항목을 해당 필드에 넣는다.
                   document.getElementById("extraAddress").value = extraAddr;
               
               } else {
                   document.getElementById("extraAddress").value = '';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('post').value = data.zonecode;
               document.getElementById("address").value = addr + extraAddr;
               $("#post").attr("disabled", true);
               $("#address").attr("disabled", true);
               // 커서를 상세주소 필드로 이동한다.
               document.getElementById("detailAddress").focus();
           }
       }).open();
   }
        
    //회원가입
   	function join(){
     		
       	//이메일
       	var email = $("#user-email").val().trim(); //이메일 아이디
   		var domain = ""; //도메인
   				
   		if($("#domain_cd").val() != ''){
   		  	domain = $("#domain_cd option:checked").text();
   		}
   		if($("#domain_cd").val() == ''){
   			domain = $('#domain').val();
   		}
   		
   		//휴대폰 번호
   		var tel1 = $("#tel1").val().trim();
   		
   		//주소
   		var post = $("#post").val();
   		var address = $("#address").val();
   		var detailAddress = $("#detailAddress").val();

   		//생년월일
   		var year = $("#birth-year").val();
   		var month = $("#birth-month").val();
   		var day = $("#birth-day").val();
   		
   		//이용약관 동의
   		var agree_btn2 = $("input:checkbox[id='chk-002']:checked").val();
   		var agree_btn3 = $("input:checkbox[id='chk-003']:checked").val();
   		
   		// 이벤트 동의
   		var sms_yn = $("input:checkbox[id='chk-005']:checked").val();
   		var push_yn = $("input:checkbox[id='chk-006']:checked").val();
   		var email_yn = $("input:checkbox[id='chk-007']:checked").val();
   		
   		//폼체크
   		if($("#user-name").val() == ""){
   			alert("이름을 입력해 주세요.");
   			$("#user-name").focus();
   			return;
   		}
   		if($("#user-id").val() == ""){
   			alert("아이디를 입력해 주세요.");
   			$("#user-id").focus();
   			return;
   		}
   		if($("#user-pw").val() == ""){
   			alert("비밀번호를 입력해 주세요.");
   			$("#user-pw").focus();
   			return;
   		}
   		if($("#user-chk-pw").val() == ""){
			alert("비밀번호 확인을 입력해 주세요.");
			$("#user-chk-pw").focus();
			return;
		}
   		if($("#email").val() == ""){
			alert("이메일 아이디를 입력해 주세요.");
			$("#email").focus();
			return;
		}
   		if($("#domain").val() == ""){
			alert("이메일 도메인을 입력해 주세요.");
			$("#domain").focus();
			return;
		}
   		if (tel.length == 0) {
   			alert("연락처를 입력해주세요.");
   			$("#tel").focus();
   			return;
   		}
   		if (!checkPhoneNumber(tel) || tel.length < 11) {
   			alert("휴대폰 번호를 정확하게 입력해주세요.");
   			$("#tel").focus();
   			return false;
   		}
   		if( agree_btn2 != "on" ){
   			alert("(필수) 이용약관 활용 동의에 체크해주세요.");
   			return;
   		}
   		if( agree_btn3 != "on" ){
   			alert("(필수) 본인은 만 14세 이상 동의에 체크해주세요.");
   			return;
   		}
   		
   		var obj = new Object();
   		
   		obj.user_id = $("#user-id").val().trim();
   		obj.user_name = $("#user-name").val().trim();
   		obj.pwd = $("#user-pw").val().trim();
   		obj.birth = year + month + day;
   		obj.gender = $('input[name="gender"]:checked').val();
   		obj.post = post;
   		obj.address1 = address;
   		obj.address2 = detailAddress;
   		obj.tel1 = tel1; //연락처
   		obj.email = email + "@" + domain //이메일
   		
   		//이벤트 동의
   		if(sms_yn == 'on'){
   			obj.sms_yn = 'Y';
   		}
   		if(push_yn == 'on'){
   			obj.push_yn = 'Y';
   		}
   		if(email_yn == 'on'){
   			obj.email_yn = 'Y';
   		}
   		console.log(obj);
   		
   		var data = JSON.stringify(obj);
   		var url = '/join/memSave';
   		
		if (confirm("회원가입 하시겠습니까?") ){
			ajaxCall(url, data, InsertMemCallBack, errorCallBack, "[회원가입]");
		}
     }
        
	function InsertMemCallBack(obj){
 		alert("회원가입 완료하였습니다.");
		window.location.href = "/join/join_complete";
 	}
      	
   	// 아이디 입력시 중복체크 구분값 초기화
	function fn_keyUpId(){
		$("#duplicate_id").val('');
		if (window.event.keyCode == 13) {
			$("#checkDuplicateId").click();
			return;
		}
	}
     
    //비밀번호 
   	function lng_pwd_focus() {
   		var $form = $("form[name = joinForm]");
   		if ($("input[name=user-pw]", $form).val() == "") {
   			alert("비밀번호를 입력하세요.");
   			return false;
   		}
   		if (fn_pwdChk($("input[name=user-pw]", $form).val())) {
   			alert("반복된 문자,숫자는 사용못합니다.");
   			return false;
   		}
   		if (checkRepeatNumber($("input[name=user-pw]", $form).val()) || checkRepeatChar($("input[name=user-pw]", $form).val())) {
   			alert("연속된 문자,숫자는 사용못합니다.");
   			return false;
   		}

   		if ($("input[name=user-pw]", $form).val().length != $.trim($("input[name=user-pw]", $form).val()).length) {
   			alert("비밀번호에 공백문자를 확인하세요.");
   			return false;
   		}

   		if ($("input[name=user-pw]", $form).val().length < 6 || $("input[name=user-pw]", $form).val().length > 15 || !fn_pwdPathnChk($("input[name=user-pw]", $form).val())) {
   			alert("영문, 숫자, 특수문자 혼용하여 6~15자리 사용 가능합니다.");
   			return false;
   		}
   	}
      	
    //비밀번호 확인
   	function lgn_pwd_cnfm_focus() {
   		var $form = $("form[name=joinForm]");
   		if ($("input[name=user-pw]", $form).val() != $("input[name=user-chk-pw]", $form).val() && $("input[name=user-chk-pw]", $form).val() != '') {
   			alert("두 비밀번호가 일치하지 않습니다.");
   			return false;
   		}
   	}
    </script>
</head>

<body>
    <!-- start of :: wrap -->
    <div id="wrap">
        <!-- start of :: header -->
        <div id="header">
           <jsp:include page="/WEB-INF/views/include/top.jsp"></jsp:include>          
        </div>
        <!-- end of :: header -->
        <aside class="aside">
           <jsp:include page="/WEB-INF/views/include/nav_right.jsp"></jsp:include>
        </aside>
        <!-- start of :: contents -->
        <div id="content">
        
        <article class="l-layout join">
                <div class="l-inner joinForm_l-inner">
                    <div class="l-title">회원가입</div>

                    <form id="joinForm" name="joinForm" action="POST">
                        <!-- 기본정보 -->
                        <section class="join__input">

                            <!-- 타이틀 영역  -->
                            <div class="tit-area">
                                <p class="tit">기본정보</p>
                                <p class="msg"><i>*</i>표시는 반드시 입력하셔야 하는 항목입니다.</p>
                            </div>

                            <div class="input-area">
                                <!-- 이름  -->
                                <div class="sec-line">
                                    <label for="user-name" class="title">이름<i class="point">*</i></label>
                                    <input id="user-name" name="user-name" type="text" placeholder="이름을 입력해주세요" class="l-input short-input">
                                </div>

                                <!-- 아이디 -->
                                <div class="sec-line">
								<label for="user-id" class="title">아이디<i class="point">*</i></label>
									<div class="input-btn" style="width:100%;">
										<input type="hidden" id="duplicate_id" name="duplicate_id"/>
										<input type="text" id="user-id" name="user-id" type="text" placeholder="아이디을 입력해주세요" class="l-input short-input" onkeyup="fn_keyUpId();">
										<button type="button" class="l-btn" id="checkDuplicateId" onkeyup="fn_keyUpId();">중복확인</button>
									</div>
                                </div>

                                <!-- 비밀번호  -->
                                <div class="sec-line">
                                    <label for="user-pw" class="title">비밀번호<i class="point">*</i></label>
                                    <input type="password" id="user-pw" name="user-pw" placeholder="비밀번호을 입력해주세요" class="l-input short-input" onchange="lng_pwd_focus(); return false;">
                                </div>

                                <!-- 비밀번호 확인  -->
                                <div class="sec-line">
                                    <label for="user-chk-pw" class="title">비밀번호 확인<i class="point">*</i></label>
                                    <input type="password" id="user-chk-pw" name="user-chk-pw" placeholder="비밀번호을 입력해주세요" class="l-input short-input" onblur="lgn_pwd_cnfm_focus(); return false;">
                                </div>

								<!-- 이메일  -->
                                <div class="sec-line">
                                    <label for="user-email" class="title">이메일<i class="point">*</i></label>
                                    <div class="right">
                                        <div class="email-box">
                                        	<ul class="inline_li email_inline">
                                        	<li><input id="user-email" type="text" placeholder="이메일을 입력해주세요" class="l-input short-input">
                                        	<li><span style="margin:auto;">@</span>
	                                            <li><input type="text" name="domain" id="domain" class="l-input short-input">
												<li><select class="selectpicker" id="domain_cd" name="domain_cd">
                                    				</select>
												</li>
											</ul>
                                        </div>
                                        <div class="l-chk">
                                            <input type="checkbox" id="chk-01" class="all-chk-type">
                                            <label for="chk-01">정보/이벤트 메일 수신에 동의합니다.</label>
                                        </div>
                                    </div>
                                </div>
                                
                                 <!-- 휴대폰번호  -->
                                <div class="sec-line">
                                    <label for="user-phone" class="title">휴대폰번호</label>
                                    <div class="right">
                                        <div class="input-btn">
                                        	<input type="hidden" name="auth_key" id="auth_key"/>
											<input type="hidden" name="enc_mble" id="enc_mble"/>
                                            <input type="number" name="tel1" id="tel1" maxlength="11" placeholder="- 없이 입력하세요." class="l-input short-input" onkeyup="fn_keyUpAuthKey();">
                                            <button type="button" class="l-btn code_btn" id="authKeyIssueBtn">인증번호 발송</button>
                                        </div>
                                        <div class="l-chk sns">
                                            <input type="checkbox" id="chk-02" class="chk-type">
                                            <label for="chk-02">정보/이벤트 SMS 수신에 동의합니다.</label>
                                        </div>
                                        <div class="input-btn">
                                        	<div class="code_input_div">
												<div class="code_time"></div>
	                                            <input type="number" name="auth_val" id="auth_val" placeholder="인증번호를 입력해주세요." disabled class="l-input short-input btn_chk_input" onkeyup="fn_keyUpAuthKeyCon();">
                                            </div>
                                            <button type="button" class="l-btn" id="authKeyConfirmBtn">인증하기</button>
                                        </div>
                                        
                                     	<%-- <div>
											<input type="text" name="auth_val"  style="width:275px;" title="인증번호" /> <a href="#" class="btnB w95" id="authKeyConfirmBtn">확인</a>
											<span class="cmnt" id="hpTimer" style="display:none">인증 유효시간 : <span class="certTime" id="hpTimerStr"></span></span><!-- 2016-02-24 추가 -->									
										</div> --%>
								
                                    </div>
                                </div>

                                <!-- 주소  -->
                                <div class="sec-line address-line">
                                    <label for="user-phone" class="title">주소</label>
                                    <div class="right">
                                        <div class="input-btn">
                                            <input type="text" id="post" name="post" placeholder="우편번호" class="l-input short-input">
                                            <button type="button" class="l-btn line" onClick="postcode();">우편번호검색</button>
                                        </div>
                                        <div class="input-btn">
                                            <input type="text" id="address" name="address" placeholder="주소" class="l-input long-input">
                                        </div>
                                        <div class="input-btn">
                                            <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" class="l-input long-input">
                                            <input type="hidden" id="extraAddress" name="extraAddress" placeholder="추가주소">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- //기본정보 -->

                        <!-- 부가정보 -->
                        <section class="join__input">
                            <!-- 타이틀 영역  -->
                            <div class="tit-area">
                                <p class="tit">부가정보</p>
                            </div>
                            <div class="input-area">

                                <!-- 성별  -->
                                <div class="sec-line">
                                    <label for="user-gender" class="title">성별</label>
                                    <div class="right radio-area">
                                        <div class="l-radio">
                                            <input type="radio" id="radio-01" name="gender" value="01" checked>
                                            <label for="radio-01">남자</label>
                                        </div>
                                        <div class="l-radio">
                                            <input type="radio" id="radio-02" name="gender" value="02">
                                            <label for="radio-02">여자</label>
                                        </div>
                                    </div>
                                </div>

                                <!-- 생년월일 -->
                                <div class="sec-line">
                                    <label for="user-birthday" class="title">생년월일</label>
                                    <div class="right select-area birthday_select">
                                    <select class="selectpicker" id="birth-year" name="birth-year">
                                        <c:forEach begin="1940" end="2022" step="1" varStatus="status">
                                          <option value="${status.index }">${status.index }년</option>
                                        </c:forEach>
                                    </select>
                                    <select class="selectpicker" id="birth-month" name="birth-month">
                                        <c:forEach begin="1" end="12" step="1" varStatus="status">
                                          <c:if test="${status.index < 10}"><option value="${status.index}">${status.index}월</option></c:if>
                                          <c:if test="${status.index >= 10}"><option value="${status.index}">${status.index}월</option></c:if>
                                        </c:forEach>
                                    </select>
                                    <select class="selectpicker" id="birth-day" name="birth-day">
                                        <c:forEach begin="1" end="31" step="1" varStatus="status">
                                        	<c:if test="${status.index < 10}"><option value="${status.index}">${status.index}일</option></c:if>
                                          	<c:if test="${status.index >= 10}"><option value="${status.index}">${status.index}일</option></c:if>
                                        </c:forEach>
                                    </select>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- //부가정보 -->

                        <!-- 약관동의 -->
                        <section class="join__input">
                            <!-- 타이틀 영역  -->
                            <div class="tit-area">
                                <p class="tit">약관동의</p>
                            </div>
                            <div class="agree-cnt-wrapper">
                                <div class="l-chk">
                                    <input type="checkbox" id="chk-001" class="all-chk">
                                    <label for="chk-001">전체 약관에 동의합니다. (선택 항목도 포함합니다.)</label>
                                </div>
                                <div class="chk-line">
                                    <div class="l-chk">
                                        <input type="checkbox" id="chk-002" class="all-chk-type">
                                        <label for="chk-002">(필수) 이용약관에 모두 동의합니다.</label>
                                    </div>
                                    <ul class="list">
                                        <li>
                                            <span>굽네치킨 이용약관</span>
                                            <a href="#noen" class="view terms">내용보기</a>
                                        </li>
                                        <li>
                                            <span>개인정보 수집/이용</span>
                                            <a href="#noen" class="view privacy">내용보기</a>
                                        </li>
                                        <li>
                                            <span>개인정보취급 위탁안내</span>
                                            <a href="#noen" class="view privacy">내용보기</a>
                                        </li>
                                        <li>
                                            <span>개인정보 제 3자 제공안내</span>
                                            <a href="#noen" class="view privacy">내용보기</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="chk-line">
                                    <div class="l-chk l-pt">
                                        <input type="checkbox" id="chk-003" class="all-chk-type">
                                        <label for="chk-003">(필수) 본인은 만 14세 이상입니다.</label>
                                    </div>
                                </div>
                                <div class="chk-line my_correction_maket">
                                    <div class="l-chk">
                                        <input type="checkbox" id="chk-004" class="all-chk-type">
                                        <label for="chk-004">(선택) 정보 / 이벤트 메일 / SMS 수신에 동의합니다.</label>
                                    </div>
                                    <ul class="inline_block">
										<li>
                                        <div class="l-chk">
                                            <input type="checkbox" id="chk-005" name="sns" class="all-chk-type">
                                            <label for="chk-005">SMS알림톡</label>
                                        </div>
                                        </li>
                                        <li>
                                        <div class="l-chk">
                                            <input type="checkbox" id="chk-006" name="sns" class="all-chk-type">
                                            <label for="chk-006">APP푸시</label>
                                        </div>
                                        </li>
                                        <li>
                                        <div class="l-chk">
                                            <input type="checkbox" id="chk-007" name="sns" class="all-chk-type">
                                            <label for="chk-007">이메일</label>
                                        </div>
                                        </li>
                                        </ul>
                                    </div>
                                </div>
                        </section>
                        <!-- //약관동의 -->

                        <!-- 가입 추천인 아이디 (선택)  -->
                        <section class="join__input">
                            <!-- 타이틀 영역  -->
                            <div class="tit-area">
                                <p class="tit">가입 추천인 아이디 (선택)</p>
                            </div>
                            <div class="input-area">
                                <!-- 아이디  -->
                                <div class="sec-line">
                                    <label for="recom-id" class="title">아이디</label>
                                    <div class="right">
                                        <div class="input-btn">
                                            <input id="recom-id" name="recom-id" type="text" placeholder="아이디를 입력해주세요." class="l-input short-input" onkeyup="fn_keyUpRecomm();">
                                            <button type="button" class="l-btn" id="recom-id-ck" onkeyup="fn_keyUpRecomm();">확인</button>
                                        </div>
                                        <div class="msg-area">
                                            • 추천인 아이디를 입력하시면 신규 회원과 추천인 모두에게 2,000포인트를 드립니다.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- //가입 추천인 아이디 (선택)  -->

                        <div class="l-btn-area">
                            <button type="button" class="l-btn line">이전단계</button>
                            <button type="button" class="l-btn" onClick="join();">가입하기</button>
                        </div>
                    </form>
                </div>

            </article>

        </div>
        <!-- end of :: contents -->
        <!-- start of :: footer -->
        <div id="footer" class="sub-footer" style="margin-top: 20;">
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </div>
            <!-- 참고: 스크립트로 load 됩니다. include 폴더 footer.html  -->
        <!-- end of :: footer -->
        <div id="mobile-nav">
            <jsp:include page="/WEB-INF/views/include/tab_bar.jsp"></jsp:include>
        </div>
            <!-- 참고: 스크립트로 load 됩니다. include 폴더 mobile-nav.html  -->

        <!-- 이용약관 팝업 영역  -->
        <article class="modal-cnt-wrapper terms-moadl l-hidden">
            <div class="dimmed-bg l-hidden"></div>
            <div class="modal-cnt-area find-cnt-area terms-cnt-width">
                <button type="button" class="close closeBtn"><img src="/resources/assets/images/icon/m-close.svg"
                        alt="닫기버튼"></button>
                <div class="shopping-address-wrap terms-cnt-wrapper">
                    <div class="l-m-tit">이용약관</div>
                    <div class="textarea">
                        <textarea readonly class="l-scroll-style">
1. 개인정보의 수집 및 이용목적 

㈜지앤푸드 goobne.co.kr 회원 이용약관입니다.
먼저 아래의 이용약관을 반드시 읽어 보시고 회원가입해 주시기 바랍니다.

1. [제 1장 총칙] 

제 1 조 목적

1. 이 약관은 “주식회사지앤푸드(이하 “굽네치킨” 또는 “회사”라 한다.) 홈페이지가 제공하는 모든 정보 제공 서비스를 이용하는 조건 및 절차에 관한 사항을 규정함을 목적으로 하며, 이용자들은 서비스 제공업체인 굽네치킨에서 제공해 드리는 굽네치킨 홈페이지 회원 약관에 동의하였음을 협약합니다.

2. 굽네치킨의 개인정보 사용은 <개인정보 수집목적 및 이용목적>을 준수합니다. 

3. 이벤트 진행을 위한 필요한 고객정보는 별도의 특별약관으로 고객정보 이용의 목적과 범위 및 제한 사항을 공지하고 승인을 얻어 이용합니다. 

4. 굽네치킨은 굽네치킨의 웹사이트를 보호하고 어떠한 법규에도 어긋나지 않기 위하여 법률 기관으로부터 정당한 법률상의 요청이 있을 시 공공의 안전을 위하여 어떠한 정보이든 법 기관과 협조하여 공유할 권한이 있음을 알려드립니다. 

제 2조 효력과 변경 

1. 이 약관은 웹사이트(www.goobne.co.kr)에 그 내용을 이용자가 알 수 있도록 게시함으로써 효력을 발생하며 “굽네치킨”은 약관의 규제 등에 관한 법률, 전자거래 기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률, 소비자 보호법 등 관련법을 위배하지 않는 범위에서 개정할 수 있습니다. 

2. “굽네치킨” 는 약관을 개정할 경우, 적용일자 및 개정 사유를 지체 없이 사전에 공시합니다. 

3. 이 약관에 동의하는 것은 정기적으로 웹을 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다.

4. 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이후에도 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다. 

5. 새로운 서비스가 개설될 경우 별도의 명시된 설명이 없는 한, 이 약관에 따라 제공합니다. 
제 3조 약관 이외의 준칙 
이 약관에 명시되지 않은 사항이 관계 법령에 규정되어 있을 경우에는 그 규정에 따릅니다. 

2. [제 2 장 회원 가입과 서비스 이용] 

제 4조 동의

1. 굽네치킨에서 제공하는 굽네치킨 인터넷 서비스를 이용함에 있어, 가입조건 및 이용에 관한 제반 사항과 기타 필요한 사항을 구체적으로 규정하며, 이용자가 등록절차를 거쳐서 “동의” 단추를 누르면 이 약관에 동의하는 것으로 간주됩니다.

2. 개인정보의 수집에 대한 동의철회(회원탈퇴)를 하시려면 로그인 후 홈페이지 상단의 정보수정에서 회원탈퇴 절차를 거쳐 탈퇴하시면 하시면 됩니다. 회원탈퇴 시 귀하가 굽네치킨에 제공한 개인정보는 즉시 모두 삭제됩니다. 단, 개인정보처리법에 의거하여 거래내역은 5년 이후 삭제처리 됩니다. 

제 5조 회원가입의 성립 

1. 굽네치킨 홈페이지 회원은 만 14세 미만의 아동일 경우, '정보통신망 이용촉진 및 정보보호 등에 관한 법률' 등에 따라 법정 대리인의 동의가 있어야만 서비스를 이용할 수 있습니다. 

2. "본인회원"이란 이 규약을 승인하고 굽네치킨 홈페이지 서비스의 회원신청 양식에 의거, 본인의 신상 정보를 사실에 입각, 입력하여 ID와 Password를 발급 받으신 분을 의미합니다. (법인 혹은 단체회원으로 가입신청을 하실 수는 없습니다.) 

3. “굽네치킨”는 다음 각 호에 해당하는 회원 가입 신청에 대하여는 이를 승낙하지 아니 합니다. 
1) 다른 사람의 명의를 사용하여 신청하였을 때
2) 본인의 실명으로 신청하지 않았을 때
3) 회원 가입 신청 시 이용자 정보를 허위로 기재하였을 때
4) 사회의 안녕과 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때
5) 기타 회사가 정한 이용신청요건이 미비할 때
6) 본인인증(아이핀 이용)을 하지 않은 경우

4. "굽네치킨"은 서비스 이용신청이 다음 각 호에 해당하는 경우에는 그 신청에 대하여 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
1) 회사가 설비의 여유가 없는 경우
2) 회사의 기술상 지장이 있는 경우
3) 기타 회사의 귀책사유로 이용승낙이 곤란한 경우

제 6조 회원정보

1. 회원가입 시 입력한 신상정보는 회원관리용의 목적 및 특정 물품 (경품이벤트 당첨 등) 발송, 제품 배송(주문) 그리고, 굽네치킨 관련 소식 전달 외 다른 용도로 사용되지 않으며, 또한 외부로 유출되지 않습니다. 만약 이 사항에 대한 위반행위 시 굽네치킨에서 법적 책임을 질 것을 약속 드립니다.

2. 상기 6조 1항의 예외적용 만약 검찰/경찰 측의 사회안전을 위한 수사목적으로 참고자료 요청 시 굽네치킨은 부득이하게 회원정보를 넘겨줄 수 있으며, 이 경우 가급적 본인에게 사전 통보해 드리겠습니다. 

3. 회원의 비밀 보호를 위해 회원 자신이 설정한 문자, 숫자, 특수문자의 조합으로 구성 

제 7조 회원권리

1. 회원은 언제든지 개인정보를 열람하고 정정 또는 동의철회(회원탈퇴)를 요청할 수 있습니다. 

2. 굽네치킨 홈페이지 내 게재되어 있는 각종 정보서비스 이용에 관련된 불만사항이나 의견을 제안하여 시정을 요구할 수 있습니다. 

3. 회원으로 가입되어 있는 분들은 누구나 동등한 자격으로 서비스를 이용하실 수 있습니다. 

제 8조 회원정보 이용

1. 게시판에서의 다른 회원들의 e-mail 주소를 취득하였을 경우, 스팸메일을 발송하여 메일 수신자에게 피해를 주었을 경우, 이에 대한 법적책임은 메일발송자에게 있으며 굽네치킨과는 무관합니다.

제 9조 회원 계약 해지 및 이용 제한

1. 회원이 제 5조 3항에 해당하는 경우, "굽네치킨"은 회원자격을 제한 및 정지하거나 박탈시킬 수 있습니다.

2. "굽네치킨"은 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하여야 합니다.

3. 회원이 서비스 이용계약을 해지하고자 하는 때에는 회원 본인이 직접 인터넷의 해지서비스를 이용하여 서비스 해지 신청을 해야 하며 비밀번호를 입력하여 본인임을 확인한 후, 해지 확인을 선택하면 자동으로 가입 해지됩니다.

4. 가입 해지 여부는 기존의 ID, 비밀번호로 로그인이 되지 않으면 해지된 것입니다.

5. “굽네치킨”는 회원의 개인정보 보호를 위하여 서비스 미사용자(최종 로그인한 후 연속하여 12개월간 로그인 기록이 없는 회원)에 대해 정기적으로 회원자격 상실에 대한 안내문(전자우편)을 통지하고, 안내문에서 정한 기한(30일) 내에 로그인이 없을 경우 회원자격을 상실시킬 수 있습니다. 이 경우, 회원 아이디를 포함한 회원의 개인정보 및 서비스 이용정보는 파기, 삭제됩니다.

6. 굽네치킨 홈페이지 서비스 제공업자는 다음 사항에 해당하는 경우, 사전 통지 없이 이용 계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다. 
1) 회원가입 시 입력사항을 허위로 기재하였을 경우.
2) 타인의 명의를 빌리거나 도용하여 차명으로 신청하였을 경우
3) 같은 사용자가 다른 ID로 이중 등록을 한 경우
4) 명백한 형사처벌의 대상이 되는 행위 적발 시 (불법 상행위 포함)
5) 게시판에서의 욕설이나 저속한 문구를 사용하여, 타인에게 불쾌감을 준다고 판단되는 경우
6) 타인의 명예를 손상시키거나 불이익을 주는 경우
7) 혐오스럽거나 타인에게 불쾌감을 줄 수 있는 아이디로 회원가입을 하거나 음란물 등록 혹은 거래할 경우
8) 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행할 경우
9) 회사, 다른 회원 또는 제 3자의 지적재산권을 침해하거나 회사의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 이용하는 경우
11) 서비스에 위해를 가하는 등 건전한 이용을 저해하는 경우
12) 타 관련 법령이나 회사가 정한 이용조건에 위배되는 경우
13) 아이핀을 통한 실명인증을 아니한 경우 

제 10조 서비스 이용

1. 서비스는 “굽네치킨”의 업무상 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.

2. 제1항의 이용시간은 정기 점검 등의 필요로 인하여 “회사”가 정한 날과 시간에는 예외로 합니다. 단, 부득이한 경우로 서비스를 일시중지 할 경우에는 이를 사전, 후에 공지해야 합니다. 

3. 회원의 ID 및 비밀번호 등의 관리 및 이용은 전적으로 회원의 책임으로 하며 회원의 부주의로 인한 이용상의 과실 또는 제3자에 의한 부정사용 등에 대한 모든 책임은 회원에게 있습니다. 

3. [제 3 장 의무] 

제 11조 회원의무

1. ID와 Password는 회원본인이 직접 사용하여야 하며, 본인이 아닌 타인이 이용하게 하여서는 안됩니다. 

2. 본인 부주의로 ID와 비밀번호가 타인에게 유출되어 발생할 수 있는 각종 손실 및 손해에 대한 책임은 본인에게 귀속됩니다. 

3. 개인신상정보의 변경사항 발생 시 회원본인이 수정하지 않은 사항에 관련된 문제의 책임은 회원본인에게 귀속됩니다. 

제 12조 서비스제공업자의 의무

1. 특별한 사정이 없는 한 이용자가 신청한 서비스 제공 개시일에 서비스를 이용할 수 있도록 합니다. 

2. 굽네치킨은 이 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 의무가 있습니다. 

3. 굽네치킨은 회원의 개인신상정보를 본인의 승낙 없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 예외로 합니다.

4. 굽네치킨은 회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우에는 회원에게 그 사유와 처리일정을 통보 하여야 합니다. 

4. [제 4 장 기타] 

제 13조 저작권

1. 굽네치킨 홈페이지에서 제공하는 각종 서비스에 대한 정보를 사전 동의 없이 외부로 유출시켰을 경우, 저작권법에 의해 법적 효력이 미칠 수 있습니다.

2. 굽네치킨 홈페이지에 등록되어 있는 굽네치킨의 CI/BI 혹은 캐릭터 등 상표권법에 의해 보호 받고 있는 이미지 파일을 무단으로 사용하실 수 없으며, 위반사항 적발 시 법적효력이 미침을 밝혀둡니다. 

제 14조 기타사항 (명기되지 않은 사항)

1. 본 회원약관에 명기되지 않은 사항이나 약관의 해석에 관하여서는 관계법령 또는 상관례에 따릅니다.

2. 본 약관은 특별한 사유 발생 시 수정될 수 있으며, 이 경우 굽네치킨 홈페이지를 통해 사전 공지됩니다. 

제 15 조 약관위반 시 책임

1. 이 약관을 위반함으로써 발생하는 모든 책임은 위반한 자가 부담하며, 이로 인하여 상대방에게 손해를 입힌 경우에는 관계법령에 의거하여 법적책임을 져야 합니다. 

2. 약관에 따른 소송은 굽네치킨 본점의 소재지를 관할하는 법원으로 합니다. 

제 16조 면책조항

1. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.

2. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.

3. 회사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않습니다. 또한 회사는 서비스를 통하여 제공하는 자료의 정확성을 보장하지 아니하며 이로 인한 손해에 관하여 책임을 지지 않습니다.

4. 회사는 고의에 의한 경우를 제외하고 회사가 제공하는 자료, 사실 기타 모든 정보의 신뢰도, 정확성에 대하여 책임을 지지 않습니다.

(부칙) 이 약관은 2012년 8월 16일부터 시행합니다.

종전의 약관은 본 약관으로 대체합니다.	
					
                        </textarea>
                    </div>
                    <div class="l-com-area">
                        <button type="button" class="l-btn line closeBtn">취소</button>
                        <button type="submit" class="l-btn closeBtn">동의하기</button>
                    </div>
                </div>
            </div>
        </article>
        <!-- // 이용약관 팝업 영역  -->

        <!-- 개인정보 팝업 영역  -->
         <article class="modal-cnt-wrapper privacy-moadl l-hidden">
            <div class="dimmed-bg l-hidden"></div>
            <div class="modal-cnt-area find-cnt-area terms-cnt-width">
                <button type="button" class="close closeBtn"><img src="/resources/assets/images/icon/m-close.svg"
                        alt="닫기버튼"></button>
                <div class="shopping-address-wrap terms-cnt-wrapper">
                    <div class="l-m-tit">개인정보 수집 및 이용 동의</div>
                    <div class="textarea">
                        <textarea readonly class="l-scroll-style">
(주)GNFood(굽네치킨 goobne.co.kr이하 '회사' 라 함)는 이용자들의 개인정보를 매우 중요시하며, 
"정보통신망 이용촉진 및 정보보호 등에 관한 법율" 및 "개인정보보호법"등 개인정보보호 관련 법규를 준수하고 있습니다. 
회사는 개인정보처리방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 
개인정보 보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보 처리방침을 개정 또는 변경하는 경우 웹사이트 공지사항(또는 개별공지)를 통하여 공지할 것입니다. 
본방침은 2015년 8월 17일부터 시행됩니다.

01. 총칙

01. 수집하는 개인정보의 항목 및 수집방법

가. 수집하는 개인정보의 항목

1) 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.

ο 성명, 아이핀 번호, 생년월일, 성별, 아이디, 비밀번호, 연락처, 휴대폰 번호, 이메일, 가입인증정보, 만 14세 미만인 자의 경우 : 법정대리인 실명인증 정보, 법정대리인 이메일

2) 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.

ο 성명, 생년월일, 성별, 로그인ID, 비밀번호, 자택 전화번호, 자택 주소, 휴대전화번호, 이메일, 만 14세 미만인 자의 법정대리인정보, 접속로그, 쿠키
개인정보 수집방법: 홈페이지(회원가입), 경품행사 응모, 고객의 소리 및 생성정보 수집툴을 통한 수집

3) 회사 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 아래와 같은 정보들이 수집될 수 있습니다.

ο 개인정보 추가 수집에 대해 동의를 받는 경우

4) 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.

ο 신용카드 결제 시 : 카드사명, 카드번호, 카드 소유주명, 결제 시간, 이용 가맹점

나. 개인정보 수집방법

01.회사는 다음과 같은 방법으로 개인정보를 수집합니다.

ο 홈페이지, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
ο 생성정보 수집 툴을 통한 수집

02. 개인정보의 수집 및 이용목적

가. 회원관리

ο 컨텐츠 제공, 특정 맞춤 서비스 제공, 물품배송 또는 청구서 등 발송, 본인인증, 구매 및 요금 결제, 요금추심
ο 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
ο 보유기간을 회원에게 미리 고지하고 개별적으로 회원에게 사전에 동의를 받은 경우에는 약속한 보유기간 동안 보유

나. 회원관리

ο 회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 불량회원의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 고객의 소리 등 민원처리, 고지사항 전달

다. 신규 서비스 개발 및 마케팅, 광고에의 활용

신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계

03. 개인정보의 공유 및 제공

회사는 이용자들의 개인정보를 "2. 개인정보의 수집목적 및 이용목적"에서 고지한 범위내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
* 이용자들이 사전에 공개에 동의한 경우
* 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

04. 개인정보의 처리위탁

회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.
회사의 개인정보 위탁처리 기관 및 위탁업무

- 수탁업체 : ㈜씨엔티테크 / 위탁업무 : 시스템 서비스 운영, 콜센터 고객상담 지원 대행 / 개인정보의 보유 및 이용기간 : 회원탈퇴시 혹은 위탁계약의 종료시까지

- 수탁업체 : 나이스신용평가정보㈜ / 위탁업무 : 본인인증 / 개인정보의 보유 및 이용기간 :해당 업체에서 이미 보유하고 있는 개인정보이기 때문에 별도로 저장하지 않음

- 수탁업체 : 주)루나소프트 / 위탁업무 : 본인인증, 알림톡 발송 / 개인정보의 보유 및 이용기간 : 회원탈퇴시 혹은 위탁계약의 종료시까지

※ 일부 서비스는 외부 콘텐츠 제공사(CP)에서 결제 및 환불 등에 대한 고객상담을 할 수 있습니다.

05. 개인정보의 보유 및 이용기간

이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.

가. 회원관리

부정이용기록 - 보존 기간 : 1년 -보존 이유 : 부정 이용 방지

나. 관련법령에 의한 정보보유 사유

상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
* 계약 또는 청약철회 등에 관한 기록 -보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 - 보존 기간 : 5년
* 대금결제 및 재화 등의 공급에 관한 기록 -보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 - 보존 기간 : 5년
* 소비자의불만 또는 분쟁처리에 관한 기록 -보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 - 보존 기간 : 3년
* 본인확인에 의한 기록 -보존 이유: 정보통신망 이용촉진 및 정보보호 등에 관한 법률 - 보존 기간 : 6개월
* 웹사이트 방문기록 -보존 이유: 통신비밀 보호법 - 보존 기간 : 3개월

06. 개인정보 파기절차 및 방법

가. 파기절차

* 이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조)일정 기간 저장된 후 파기됩니다.
* 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.
나. 파기방법

* 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
* 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

07. 이용자 및 법정대리인의 권리와 그 행사방법

* 이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만인 자의 개인정보를 조회하거나 수정할 수 있으며, 회사의 개인정보의 처리에 동의하지 않는 경우 동의를 거부하거나 가입해지(회원탈퇴)를 요청하실 수 있습니다. 다만, 그러한 경우 서비스의 일부 또는 전부 이용이 어려울 수 있습니다.
* 이용자 혹은 만 14세 미만인 자의 개인정보 조회, 수정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을, 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.
* 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.
* 이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.
* 회사는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 "5. 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

08. 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항

가. 회사의 쿠키 사용 목적

* 이용자들이 방문한 회사의 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 보안접속 여부, 이용자 규모 등을 파악하여 이용자에게 광고를 포함한 최적화된 맞춤형 정보를 제공하기 위해 사용합니다.

나. 쿠키의 설치/운영 및 거부

* 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. * 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 회사 일부 서비스는 이용에 어려움이 있을 수 있습니다.
* 쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)은 다음과 같습니다.
① [도구] 메뉴에서 [인터넷 옵션]을 선택합니다.
② [개인정보 탭]을 클릭합니다.
③ [개인정보처리 수준]을 설정하시면 됩니다

09. 개인정보의 기술적/관리적 보호 대책

* 회사는 이용자들의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다.

가. 비밀번호 암호화

* 회사 회원 아이디(ID)의 비밀번호는 암호화되어 저장 및 관리되고 있어 본인만이 알고 있으며, 개인정보의 확인 및 변경도 비밀번호를 알고 있는 본인에 의해서만 가능합니다.

나. 해킹 등에 대비한 대책

* 개인정보 등 보안이 요구되는 정보의 경우 산업표준인 SSL(secure socket layer) 을 이용하여 암호화되어 전송되며 서비스 이용자가 사용하시는 스크린 하단 작업표시줄에 자물쇠 마크를 통해 확인할 수 있습니다. 이렇게 전송된 정보는 방화벽(Fire Wall) 및 VPN(Virtual Private Network)시스템 체계를 통하여 이중망으로 구성된 시스템에 안전하게 저장됩니다.
* 해킹과 내/외부의 침입 또는 공격에 대비하여 IDC(Internet Data Center)에서 24시간 관제 및 서버관리 운영을 함으로써 전산 시스템의 출입을 철저히 통제하고 있습니다.
* 회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다. 개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지하고 있으며, 암호화통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. 그리고 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 보안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.

다. 처리 직원의 최소화 및 교육

* 회사의 개인정보관련 처리 직원은 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 회사 개인정보 처리방침의 준수를 항상 강조하고 있습니다.

라. 개인정보보호전담기구의 운영

* 그리고 사내 개인정보보호전담기구 등을 통하여 회사 개인정보 처리방침의 이행사항 및 담당자의 준수여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다. 단, 이용자 본인의 부주의나 인터넷상의 문제로 ID, 비밀번호, 개인정보가 유출되어 발생한 문제에 대해 회사는 일체의 책임을 지지 않습니다.

10. 개인정보관리책임자 및 담당자의 연락처

* 귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.

개인정보 관리책임자

- 이름 : 안종섭 / 소속 : 운영본부 / 전화 : 02-2648-2005
메일 : support@gngrp.com / 직위 : 전무 / 직책 : 본부장

개인정보 관리담당자

- 이름 : 나동욱 / 소속 : 운영본부 / 전화 : 02-2648-2005
메일 : dndn72@gngrp.com / 직위 : 과장 / 직책 : 팀장

온라인 담당자

- 이름 : 어광일 / 소속 : 마케팅본부 / 전화 : 02-2648-2005
메일 : beto577@gngrp.com / 직위 : 대리

기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.

개인정보침해신고센터 (www.118.or.kr / 118)
개인정보보호 종합지원 포털http://www.privacy.go.kr / 02-2100-2817)
대검찰청 첨단범죄수사과 (www.spo.go.kr / 02-3480-2000)
경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330)

11. 기타

* 회사에 링크되어 있는 웹사이트들이 개인정보를 수집하는 행위에 대해서는 본 "회사 개인정보처리방침"이 적용되지 않음을 알려 드립니다.

12. 고지의 의무

* 현 개인정보 처리방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 '공지사항'을 통해 고지할 것입니다. 다만, 개인정보의 수집 및 활용, 제3자 제공 등과 같이 이용자 권리의 중요한 변경이 있을 경우에는 최소 30일 전에 고지합니다.

공고일자 : 2012년 08월 16일
시행일자 : 2012년 09월 01일
					
                        </textarea>
                    </div>
                    <div class="l-com-area">
                        <button type="button" class="l-btn line closeBtn">취소</button>
                        <button type="submit" class="l-btn closeBtn">동의하기</button>
                    </div>
                </div>
            </div>
        </article>
        <!-- // 개인정보 팝업 영역  -->
    </div>
    <!-- end of :: wrap -->

</body>
</html>