<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<meta charset="utf-8"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta name="naver-site-verification" content="36879ab5552b670ad5532a43565c4f52b3cb7134" />
<!-- 네이버 봇 정보 -->
<meta name="description" content="오븐 요리 마스터 '굽네' 공식 홈페이지 - 치킨, 피자, 디저트 등 제품 소개, 매장 및 온라인 주문 안내" />
<link href="https://www.goobne.co.kr/" rel="canonical" />
<meta property="og:url" content="https://www.goobne.co.kr/" />
<meta property="og:site_name" content="굽네치킨" />
<meta property="og:title" content="굽네치킨" />
<meta property="og:description" content="오븐 요리 마스터 '굽네' 공식 홈페이지 - 치킨, 피자, 디저트 등 제품 소개, 매장 및 온라인 주문 안내" />
<meta property="og:type"  content="website" />
<meta property="og:image" content="https://www.goobne.co.kr/resources/images/red_bg_logo.png">
<!-- <meta property="og:image"  content="http://" /> -->
<!-- <meta property="og:image:width"  content="200" /> -->
<!-- <meta property="og:image:height"  content="200" /> -->
<!-- <meta property="og:image:type"  content="image/jpeg" /> -->
<!-- 네이버 봇 정보 끝 -->

<link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon"/>
<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="/resources/images/favicon.png" />
<script type="application/ld+json">
{
 "@context": "http://schema.org",
 "name": "굽네치킨",
 "url": "https://www.goobne.co.kr",
 "sameAs": [
   "https://www.instagram.com/the___goobster/",
   "https://www.youtube.com/channel/UCwx2AFi2Zg8_SYzjaJ7Hfmg",
   "https://www.facebook.com/goobne"
 ]
}
</script>


<title><%=SystemConstant.SITE_TITLE%></title>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate value="${today}" pattern="yyyyMMddhhmm" var="nowDate"/>
<link rel="stylesheet" href="/resources/assets/css/common/slick.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/swiper-bundle.min.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/base.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/header.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/footer.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/jquery-ui.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/animate.css?v=${nowDate }" type="text/css" />

<!-- main  -->
<link rel="stylesheet" href="/resources/assets/css/main/main.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/modal.css?v=${nowDate }" type="text/css" />
<!-- sub  -->
<link rel="stylesheet" href="/resources/assets/css/common_layout.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/layout.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/nice-select.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common_v1.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/login_out.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/main/popup_main.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/verification_code.css?v=${nowDate }" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/my_page.css?v=${nowDate }" type="text/css" />
 
<script src="/resources/assets/js/common/jquery-3.5.1.min.js"></script>
<script src="/resources/assets/js/common/swiper-bundle.min.js"></script>
<script src="/resources/assets/js/common/jquery.js"></script>
<script src="/resources/assets/js/common/jquery-ui.js"></script>
<script src="/resources/assets/js/common/slick.js"></script>
<script src="/resources/assets/js/common/wow.min.js"></script>
<script src="/resources/assets/js/main/main.js"></script>
<script src="/resources/assets/js/main/main_banner_header.js"></script>


<script src="/resources/assets/js/common/jquery.nice-select.js"></script>
 <jsp:include page="/WEB-INF/views/include/common_script.jsp"></jsp:include>
<!--  dev 커스텀 -->
<link rel="stylesheet" href="/resources/css/style.css?v=${nowDate }" type="text/css" />
<script src="/resources/js/common.js"></script>
<script src="/resources/js/file_common.js"></script>
<script src="/resources/assets/js/common/file_upload.js"></script>
<script src="/resources/js/jquery.form.js"></script>

<!-- 약관 영역  -->
<article class="modal-cnt-wrapper terms-moadl l-hidden">
   <jsp:include page="/WEB-INF/views/include/terms_pop.jsp"></jsp:include>
</article>
<article class="modal-cnt-wrapper privacy-moadl l-hidden">
   <jsp:include page="/WEB-INF/views/include/privacy_pop.jsp"></jsp:include>
</article>
<article class="modal-cnt-wrapper e_mail-moadl l-hidden">
   <jsp:include page="/WEB-INF/views/include/email_pop.jsp"></jsp:include>
</article>
<!-- // 약관 영역  -->

<!-- 프로모션 팝업 영역  -->
<article id="promo" class="modal-cnt-wrapper promo-moadl l-hidden"> 
    <jsp:include page="/WEB-INF/views/include/prom_map.jsp"></jsp:include>
</article>
<!-- // 프로모션 팝업 영역  --> 

<!-- 공통 커스텀 js -->
<script type="text/javascript">
	var CONTEXT_PATH = "<%=SystemConstant.getStaticUrl()%>";
	function logout() {
		if( confirm('로그아웃 하시겠습니까?') ){		
			var url = '<%=SystemConstant.LOGOUT_URI %>';
			var obj = new Object();
			var data = JSON.stringify(obj);
			ajaxCall(url, data, logoutCallBack, errorCallBack, '[관리자 로그아웃]');
		} 
	}  
	function logoutCallBack(obj) {
		if (obj.result == common._trans_success_code) {		
			location.href = "<%=SystemConstant.SITE_PATH %>";
		}
	} 
	
	/**
	 * 로그인페인지로 이동
	 */
	function goToLogin() {
		location.href = "<%=SystemConstant.SITE_PATH %>";
		return false;
	}
	 
	/**
	 * 메인페이지로 이동
	 * @returns {Boolean}
	 */
	function goToMain() { 
		location.href = "<%=SystemConstant.SITE_PATH%>";
	}
</script>

<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	ga('create', 'UA-91267323-1', 'auto');
	ga('send', 'pageview');
</script>