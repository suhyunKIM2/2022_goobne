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
$(document).ready(function () {
	
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

    // tab 버튼 구현 
    $('.login__tab-tit button').click(function () {
        indexNo = $(this).index();
        $(this).addClass('is-active').siblings().removeClass('is-active');

        $('.login__form-wrap .form').addClass('l-hidden');
        $('.login__form-wrap .form').eq(indexNo).removeClass('l-hidden');
    })

   	// 팝업 닫기 버튼 구현
    function closePopupFunc () {
        document.querySelector(".dimmed-bg").classList.add("l-hidden");
        document.querySelector(".find_id_popup").classList.add("l-hidden");
    }
    
    const closeBtnElem = document.querySelectorAll(".closeBtn");
    closeBtnElem.forEach(e => e.addEventListener('click', closePopupFunc))

});

	// 아이디 찾기
	function findId(gubun){
		
		var user_name = "";
       	var email = "";
   		var domain = "";
   		var tel = "";
   		
     	var chkStyle = /[0-9]/ ;
    	
		var obj = new Object();
   		
		if(gubun == 'phone'){
			obj.user_name = $("#user-name2").val().trim();
	   		tel = $("#tel1").val().replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g, "");
	   		obj.tel1 = tel; //연락처
	   		
		} else if (gubun == 'email') {
			obj.user_name = $("#user-name1").val().trim();
	   		email = $("#user-email").val().trim();
	   		
	   		if($("#domain_cd").val() != ''){
	   		  	domain = $("#domain_cd option:checked").text();
	   		}
	   		if($("#domain_cd").val() == ''){
	   			domain = $('#domain').val();
	   		}
	   		
	   		obj.email = email + "@" + domain;
		}
		
    	// 전화번호 확인
    	/* if(!chkStyle.test(tel)){
    		alert("전화번호는 숫자만 입력 가능합니다.");
    		return;
    	}
    	if (tel.length == 0) {
    			alert("연락처를 입력해주세요.");
    			$("#tel1").focus();
    			return;
    	}
    	if (!checkPhoneNumber(tel) || tel.length < 11) {
    		alert("휴대폰 번호를 정확하게 입력해주세요.");
    		$("#tel1").focus();
    		return;
    	} */
    	
   		//폼체크
   		/* if($("#user-name").val() == ""){
   			alert("이름을 입력해 주세요.");
   			$("#user-name").focus();
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
		}*/
		
		console.log(obj);
   		
   		var data = JSON.stringify(obj);
   		var url = '/join/idSearch';
   	
		ajaxCall(url, data, findIdCallBack, errorCallBack, "[아이디찾기]");
	}
		
	function findIdCallBack(obj){
		$(".find_id_popup").removeClass('l-hidden');
		$(".dimmed-bg").removeClass('l-hidden');
  		   	
		var findIdList = obj.body.view;
		var findIdHtml = "";
		
		findIdHtml += findIdList.user_name;
		findIdHtml += ' 회원님 아이디는';
		findIdHtml += '<br>';
		findIdHtml += '<span>' + findIdList.user_id + '</span> 입니다.';
		
		console.log(findIdHtml);
		$("#idPopup").empty();
		$("#idPopup").html(findIdHtml);
		
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
            <article class="l-layout login find-id">

                <!-- 아이디찾기 영역 -->
                <section class="login__inner">

                    <div class="l-title">아이디찾기</div>
                    <div class="login__tab-tit">
                        <button type="button" class="is-active">이메일</button>
                        <button type="button" class="">휴대폰번호</button>
                    </div>

                    <div class="login__form-wrap">
                        <!-- 이메일 -->
                        <div class="form members">
                            <form action="POST" class="members__form">
                                <div class="login__input">
                                    <div class="line">
                                        <label for="user-name">이름</label>
                                        <div class="icon-input">
                                            <input type="text" placeholder="이름을 입력해주세요" id="user-name1" name="user-name">
                                        </div>
                                    </div>
                                    
                                    <div class="line">
                                        <label for="user-pw">가입메일주소</label>
                                        <div class="email-box">
											<ul class="inline_li email_inline">
												<li><input id="user-email" type="text" placeholder="이메일을 입력해주세요" class="l-input short-input" style="width:100%;height:42px;line-height: 42px;"></li>
												<li><span style="margin:auto;">@</span></li>
												<li><input type="text" name="domain" id="domain" class="l-input short-input" style="width:100%;height:42px;line-height: 42px;"></li>
												<li><select class="selectpicker" id="domain_cd" name="domain_cd"></select></li>
											</ul>
                                        </div>
                                    </div>
                                </div>
                                <button class="l-btn" type="button" onClick="findId('email')">아이디 찾기</button>
                            </form>
                        </div>
                        <!-- // 이메일 -->

                        <!-- 휴대전화 -->
                        <div class="form no-members l-hidden">
                            <form action="POST" class="non-members__form">
                                <div class="login__input">
                                    <div class="line">
                                        <label for="user-name">이름</label>
                                        <div class="icon-input">
                                            <input type="text" placeholder="이름을 입력해주세요" id="user-name2" name="user-name">
                                        </div>
                                    </div>
                                    <div class="line l-mb25">
                                        <label for="user-num">가입 휴대폰번호</label>
                                        <div class="icon-input">
                                            <input type="number" placeholder="가입 휴대폰번호를 입력해주세요" id="tel1" name="tel1">
                                        </div>
                                    </div>
                                </div>
                                <button class="l-btn" type="button" onClick="findId('phone')">아이디 찾기</button>
                            </form>
                        </div>
                        <!-- // 휴대전화  -->
                    </div>

                    <div class="login__link">
                        <a href="/account/login">로그인</a>
                        <span class="l-bar"></span>
                        <a href="/join/findPwd">비밀번호찾기</a>
                        <span class="l-bar"></span>
                        <a href="#none">비회원 주문조회</a>
                    </div>

                    <div class="login__join">
                        <p class="msg">아직 회원이 아니신가요?</p>
                        <button class="l-btn line" type="button" onClick="/join/joinForm">회원가입</button>
                    </div>
                    <div class="login__sns">
                        <p class="tit">SNS 간편 로그인</p>
                        <div class="btn-area">
                            <button type="button"><img src="/resources/assets/images/icon/l-kakao.png" alt="카카오아이콘"></button>
                            <button type="button"><img src="/resources/assets/images/icon/l-naver.png" alt="네이버아이콘"></button>
                        </div>
                    </div>
                </section>
                <!-- // 아이디찾기 영역 -->
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
        
        <!-- 아이디 알림 팝업 영역  -->
        <article class="modal-cnt-wrapper find_id_popup l-hidden">
            <div class="dimmed-bg l-hidden"></div>
            <div class="modal-cnt-area find-cnt-area">
                <button type="button" class="close closeBtn">
                <img src="/resources/assets/images/icon/m-close.svg" alt="닫기버튼"></button>
                <div class="title-area" id="idPopup">
                </div>
                <button type="button" class="l-btn closeBtn" onClick="/account/login">로그인하기</button>
            </div>
        </article>
        <!-- // 팝업 영역  -->
        
    </div>
</body>

</html>