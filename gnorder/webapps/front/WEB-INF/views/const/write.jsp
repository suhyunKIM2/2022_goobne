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
    <script>
	    new WOW().init();
	</script>   
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="/resources/assets/css/common_layout.css" type="text/css" />
    <link rel="stylesheet" href="/resources/assets/css/layout.css" type="text/css" />
    <link rel="stylesheet" href="/resources/assets/css/common_v1.css" type="text/css" /><!---- cns제작추가---->
    <title>온라인 창업상담</title>
	<script type="text/javascript">
$(document).ready(function(){
	
	var param = new Object();
	param.define_id = 'SIDO'; //지역(검색select)
	param.use_yn ='Y';
	getCodeListSelBox($("#sido"), param, "선택", ""); 
	   
	var param = new Object();
	param.define_id = 'TEL1'; //지역(검색select)
	param.use_yn ='Y';
	getCodeListSelBox($("#tel1"), param, "선택", ""); 
	
	$("#domain").hide();
	
	$('#selectEmail').change(function(){
			if($(this).val() == '1'){ //직접입력일 경우
				 $("#domain").show();
				 $("#domain").val('');//값 초기화
				 $("#domain").attr("disabled", false); //활성화
			}else{ //직접입력이 아닐경우
				 $("#domain").hide();
				 $("#domain").val($(this).text());//선택값 입력
				 $("#domain").attr("disabled", true); //비활성화
			}
	});
	
	if(getDevice() == 4){
		$("#phone").hide();
	}
	
	/* $('.founded__page-tab a').click(function () {
        indexNo = $(this).index();
        $(this).addClass('is-active').siblings().removeClass('is-active');
	} */
});
	
	//온라인 창업상담 등록
	function brdSave(){
		
		//개인정보 동의
		var agree_btn = $("input:checkbox[id='chk-001']:checked").val();
		
		//휴대폰 번호
		var tel1 = $("#tel1").val().trim();
		var tel2 = $("#tel2").val().trim();
		var tel3 = $("#tel3").val().trim();
		
		//폼체크
		if($("#user-tit").val() == ""){
			alert("제목을 입력해 주세요.");
			$("#user-tit").focus();
			return;
		}
		if($("#user-name").val() == ""){
			alert("이름를 입력해 주세요.");
			$("#user-name").focus();
			return;
		}
		if (tel1.length == 0 || tel2.length == 0 || tel3.length == 0) {
			alert("휴대폰 번호를 입력해주세요.");
			$("#tel1").focus();
			return false;
		}
		if (!checkPhoneNumber(tel1 + tel2 + tel3) || tel3.length < 4) {
			alert("휴대폰 번호를 정확하게 입력해주세요.");
			$("#tel1").focus();
			return false;
		}
		if($("#sido").val() == ""){
			alert("가맹지역을 선택해 주세요.");
			$("#sido").focus();
			return;
		}
		if($("#user-email").val() == ""){
			alert("이메일을 입력해 주세요.");
			$("#user-email").focus();
			return;
		}
		if($("#selectEmail").val() != '1'){
			if($("#user-email").val() == ""){
				alert("이메일을 입력해 주세요.");
				$("#user-email").focus();
				return;
			}
		}
		if($("#selectEmail").val() == '1'){
			if(!checkEmail($('#user-email').val() + "@" + $('#domain').val())) {
				alert("이메일형식이 다릅니다.");
				return;
			}
		} 
		if($("#const_cont").val().replace(/(<([^>]+)>)/gi, "").length < 10){
			alert("내용은 10자리 이상 입력해주세요.");
			$("#const_cont").focus();
			return;
		}
		if(agree_btn != "on" ){
			alert("개인정보 활용 동의에 체크해주세요.");
			return;
		}
		
		var obj = new Object();
		var email = $("#user-email").val().trim(); //이메일아이디
		var domain = ""; //도메인
				
		if($("#selectEmail").val() != '1'){
		  	domain = $("#selectEmail option:checked").text();
		}
		
		if($("#selectEmail").val() == '1'){
			domain = $('#domain').val();
		}
		
  		obj.use_yn = 'Y';
		obj.title = $("#user-tit").val().trim();
		obj.name = $("#user-name").val().trim();
		obj.cont01 = tel1 + tel2 + tel3; //연락처
		obj.cont02 = email + "@" + domain //이메일
		obj.cont03 = $("#sido").val(); //가맹지역
		obj.content = $("#const_cont").val().replace(/(<([^>]+)>)/gi, "");
	
		var data = JSON.stringify(obj);
		var url = '/brd/const/save';
		
		if ( confirm("등록 하시겠습니까?") ){
			ajaxCall(url, data, brdInsertCallBack, errorCallBack, "[온라인 창업상담 등록]");
		}
	}
	
	function brdInsertCallBack(obj){
		alert("등록 완료하였습니다.");
		window.location.reload();
	}
</script>
</head>

<body>
    <!-- start of :: wrap -->
    <div id="wrap">
        <!-- start of :: header -->
        <div id="header">
        	 <jsp:include page="/WEB-INF/views/include/top.jsp"></jsp:include>
            <!-- 참고: 스크립트로 load 됩니다. include 폴더 header.html  -->
        </div>
        <!-- end of :: header -->
        <aside class="aside">
        	<jsp:include page="/WEB-INF/views/include/nav_right.jsp"></jsp:include>
            <!-- 참고: 스크립트로 load 됩니다. include 폴더 aside.html  -->
        </aside>
        <!-- start of :: contents -->
        <div id="content">
        <form id="brdForm" name="brdForm" method="post">
		
            <article class="l-layout founded join payment">
                <div class="l-inner const_div">
                    <div class="l-title">창업안내</div>

                    <div class="founded__page-tab">
                        <a href="/brd/const/franchise">프랜차이즈 굽네</a>
                        <a href="/brd/const/process">프로세스 및 비용</a>
                        <a href="/brd/const/write" class="is-active">온라인 창업상담</a>
                    </div>

                    <div class="founded__page-tab-tit">기본정보</div>

                    <!-- 기본정보 -->
                    <section class="join__input pb0">
                        <div class="input-area">
                            <!-- 제목  -->
                             <div class="sec-line">
                                <label for="user-tit" class="title">제목</label>
                                <input id="user-tit" type="text" placeholder="제목을 입력해주세요."
                                    class="l-input long-input">
                            </div>
                            <!-- 이름  -->
                            <div class="sec-line">
                                <label for="user-name" class="title">이름</label>
                                <input id="user-name" type="text" placeholder="이름을 입력해주세요"
                                    class="l-input long-input">
                            </div>

                            <!-- 휴대폰번호 -->
                            <div class="sec-line">
                                <label for="user-phone" class="title">휴대폰번호</label>
								<ul class="inline_li">
                                	<li><select class="selectpicker" id="tel1" name="tel1"></select></li>
									<li><input type="tel" name="tel2" id="tel2" class="l-input long-input" title="휴대번호 둘째자리" maxlength="4" onkeydown="checkOnlyNumberKeyInput();"/></li>
									<li><input type="tel" name="tel3" id="tel3" class="l-input long-input" title="휴대번호 셋째자리" maxlength="4" onkeydown="checkOnlyNumberKeyInput();"/></li>
								</ul>
                            </div>

                            <!-- 가맹지역  -->
                            <div class="sec-line">
                                <label for="user-area" class="title">가맹지역</label>
                                <div class="right">
                                    <div class="email-box area-box">
                                    <select class="selectpicker" id="sido" name="sido">
                                    </select>
                                    </div>
                                </div>
                            </div>

                            <!-- 이메일  -->
                            <div class="sec-line">
                                <label for="user-email" class="title">이메일</label>
                                <div class="right">
                                    <div class="email-box">
										<ul class="inline_li email_inline">
											<li><input id="user-email" type="text" placeholder="이메일을 입력해주세요" class="l-input short-input"></li>
											<li><span style="margin:auto;">@</span></li>
											<li><input type="text" name="domain" id="domain" class="l-input short-input"></li>
											<li><select class="selectpicker" name="selectEmail" id="selectEmail">
												<option value="1">직접입력</option>
												<option value="naver.com" selected>naver.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="nate.com">nate.com</option>
												<option value="yahoo.co.kr">yahoo.co.kr</option>
												<option value="empas.com">empas.com</option>
												<option value="dreamwiz.com">dreamwiz.com</option>
												<option value="freechal.com">freechal.com</option>
												<option value="lycos.co.kr">lycos.co.kr</option>
												<option value="korea.com">korea.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hanmir.com">hanmir.com</option>
												<option value="paran.com">paran.com</option>
											</select>
											</li>
										</ul>
                                    </div>
                                </div>
                            </div>

                            <!-- 문의사항 -->
                            <div class="sec-line">
                                <label for="user-phone" class="title">문의사항</label>
                                <div class="right">
                                    <div class="msg-select-box">
                                        <div class="textarea-area mt0">
                                            <textarea id="const_cont" name="const_cont" placeholder="매장 요청사항을 입력해주세요."></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- //기본정보 -->

                    <!-- 개인정보 동의 영역-->
                    <section class="agree">
                        <div class="l-chk">
                            <input type="checkbox" id="chk-001" class="all-chk">
                            <label for="chk-001">개인정보 활용에 동의합니다.</label>
                        </div>
                        <dl class="agree__desc">
                            <dt>개인정보 활용 동의 내용</dt>
                            <dd>•  정보취합 수신처 : 주) 지앤푸드</dd>
                            <dd>•  개인정보 취합 목적 : 고객 응대 및 당첨자 선정을 위한 목적 이외에는 사용되지 않으며 저장된 개인정보는 이벤트 종료 후 파기<br>
                                단, 회원일 경우 굽네치킨 개인정보 취급 방침에 따라 운영됩니다.<br>
                                굽네치킨 개인정보 취급방침 보러가기</dd>
                            <dd>•  수집항목 : 이름, 휴대폰번호</dd>
                            <dd>•  귀하는 개인정보 수집   이용에 동의하지 않을 권리가 있으며, 동의 거부시 해당 서비스를 이용하실 수 없습니다.</dd>
                        </dl>
                    </section>
                    <!-- // 개인정보 동의 영역-->

                    <!-- 버튼 영역  -->
                    <section class="founded__btn">
                        <button type="button" class="l-btn" onClick="brdSave();">등록</button>
                        <button type="reset" class="l-btn line">다시작성</button>
                        
                    </section>
					<div class="founded__btn call_btn">
						<a href="tel:16619494" id="phone">
                        <button type="button" class="l-btn line"><span class="phone"></span>전화상담</button></a>
					</div>
                     <!-- // 버튼 영역  -->
                </div>
            </article>
        </form>
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


</body> 
</html> 
