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
<title><%=SystemConstant.SITE_TITLE%></title> 
<link rel="stylesheet" href="/resources/assets/css/common/slick.css" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/swiper-bundle.min.css" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/base.css" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/header.css" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/footer.css" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/animate.css" type="text/css" />
<!-- main  -->
<link rel="stylesheet" href="/resources/assets/css/main/main.css" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/modal.css" type="text/css" />
<!-- sub  -->
<link rel="stylesheet" href="/resources/assets/css/common_layout.css" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/layout.css" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common/nice-select.css" type="text/css" />
<link rel="stylesheet" href="/resources/assets/css/common_v1.css" type="text/css" />
 
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
<link rel="stylesheet" href="/resources/css/style.css" type="text/css" />
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
<!-- // 프로모션 팝업 영역  --> 5

<!-- 공통 커스텀 js -->
<script type="text/javascript">
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
