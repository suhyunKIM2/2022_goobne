<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kor" dir="ltr">
<head>
   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
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

            

            <article class="l-layout login">

                <!-- 로그인 영역 -->
                <section class="login__inner">

                    <div class="l-title">로그인</div>
                    <!--div class="login__tab-tit">
                        <button type="button" class="is-active">회원로그인</button>
                        <button type="button" class="">비회원주문</button>
                    </div-->

                    <div class="login__form-wrap">
                        <!-- 회원로그인 -->
                        <div class="form members">
                            <form action="#" class="members__form">
                                <div class="login__input">
                                    <div class="line">
                                        <label for="user-id">아이디</label>
                                        <div class="icon-input">
                                            <input type="text" placeholder="아이디를 입력하세요" id="login_id">
                                        </div>
                                    </div>
                                    <div class="line">
                                        <label for="user-pw">비밀번호</label>
                                        <div class="icon-input">
                                            <input type="password" placeholder="비밀번호 영문/특수문자/숫자 8~16자" id="login_pwd">
                                        </div>
                                    </div>
                                </div>
                                <div class="l-chk">
                                    <input type="checkbox" id="chk" class="chk-type">
                                    <label for="chk">아이디 저장</label>
                                </div>
                                <button class="l-btn" type="button" onclick="loginFn()">로그인</button>
                                <div id="error_msg"></div>
                            </form>
                            <div class="login__link">
                                <a href="https://order.goobne.co.kr:8481/login/find_id.aspx">아이디 찾기</a>
                                <span class="l-bar"></span>
                                <a href="https://order.goobne.co.kr:8481/login/find_id.aspx">비밀번호찾기</a>
                                <!--span class="l-bar"></span>
                                <a href="#none">비회원 주문조회</a-->
                            </div>
                        </div>
                        <!-- // 회원로그인 -->

                        <!-- 비회원로그인 -->
                        <div class="form no-members l-hidden">
                            <form action="#" class="non-members__form">
                                <div class="login__input">
                                    <div class="line">
                                        <label for="user-name">주문자명</label>
                                        <div class="icon-input">
                                            <input type="text" placeholder="주문자명 입력하세요" id="user-name">
                                        </div>
                                    </div>
                                    <div class="line">
                                        <label for="user-num">주문번호</label>
                                        <div class="icon-input">
                                            <input type="number" placeholder="주문번호 입력하세요" id="user-num">
                                        </div>
                                    </div>
                                </div>
                                <div class="noice">
                                    <img src="/resources/assets/images/icon/login-notice.png" alt="아이콘">
                                    주문자명, 주문번호를 잊으신 경우, 고객센터 문의 바랍니다.
                                </div>
                                <button class="l-btn l-mb35" type="button">비회원 주문하기</button>
                            </form>
                        </div>
                        <!-- // 비회원로그인 -->
                    </div>

                    <div class="login__join">
                        <p class="msg">아직 회원이 아니신가요?</p>
<a href="https://order.goobne.co.kr:8481/login/join1.aspx"><button class="l-btn line" type="button">회원가입</button></a>
                    </div><!--
                    <div class="login__sns">
                        <p class="tit">SNS 간편 로그인</p>
                        <div class="btn-area">
                            <button type="button"><img src="/resources/assets/images/icon/l-kakao.png" alt="카카오아이콘"></button>
                            <button type="button"><img src="/resources/assets/images/icon/l-naver.png" alt="네이버아이콘"></button>
                        </div>
                    </div>-->
                </section>
                <!-- // 로그인 영역 -->

                <!-- 로그인 배너 영역  -->
                <section class="login__banner">
                    <a href="#none">
                        <img src="/resources/assets/images/contents/login-banner_220705_dhuman.jpg" alt="로그인배너이미지">
                    </a>
                </section>
                <!-- //로그인 배너 영역  -->

            </article>

        </div>
        <!-- end of :: contents -->
         <!-- start of :: footer -->
        <div id="footer" class="sub-footer" style="margin-top: 20;">
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </div>
        <!-- end of :: footer -->
        <div id="mobile-nav">
            <jsp:include page="/WEB-INF/views/include/tab_bar.jsp"></jsp:include>
        </div>
    </div>
    <!-- end of :: wrap -->
     
    
    <script>
        $(document).ready(function () {
            new WOW().init();
        });
    </script>
<script type="text/javascript">
$(document).ready(function(){
	errorMsg('', error_msg);
	$('input[type=password]').on("keyup", function(e){
	    if (e.which == 13) {
	        e.preventDefault();
	        loginFn();
	    }
	});
	
	$('#login_id').on("keyup", function(e){
	    if (e.which == 13) {
	        $("#login_pwd").focus();
	    }
	});
});  
function goEventEnter(evt) {
	var keyCode = evt.which?evt.which:event.keyCode;
	if(keyCode == 13){
		loginFn();
	}
}
function goEventEnter(evt) {
	var keyCode = evt.which?evt.which:event.keyCode;
	if(keyCode == 13){
		loginFn();
	}
}
function loginFn() {
	var id  = $('#login_id').val().trim();
	var pwd = $('#login_pwd').val().trim();  
 	if ( id == null || id == "" ) {
        errorMsg('아이디를 입력하세요.', error_msg);
		$('#login_id').focus();
		return;
	}
	if ( pwd == null || pwd == "" ) {
		errorMsg('비밀번호를 입력하세요.', error_msg);
		$('#login_pwd').focus();
		return;
	}
	var url = "<%=SystemConstant.LOGIN_URI%>";
	var obj = new Object();
	obj.login_id = id;
	obj.login_pwd = pwd; 
	var jsonData = JSON.stringify(obj);	
	ajaxCall(url, jsonData, goLoginChkCallBack, errorCallBackMsgView, '로그인');	//alert  
}
/*
 * 로그인 성공 콜백(로그인 성공시, 메인 화면으로 이동 처리)
 */
function goLoginChkCallBack(obj) {
	errorMsg('', error_msg);
	// 로그인 성공인 경우에 메인화면으로 포워딩 처리
	if ( obj.result == common._trans_success_code ) {
		var returnUrl = "<%=(String)request.getHeader("REFERER")%>";
		
		if(returnUrl == null || returnUrl =='' || returnUrl =="null"){
			returnUrl ='/';
		}
		console.log(returnUrl);
		location.href = returnUrl;
	}
}  
//div msg
function errorMsg(msg, id) { 
	const element = id;
	element.innerHTML = "<div class='error_msg'>"+msg+"</div>"; 
} 
</script> 
</body>
</html>