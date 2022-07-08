<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title><%=SystemConstant.SITE_TITLE%></title>
<!-- Custom fonts for this template-->
<link href="<%=SystemConstant.SITE_PATH%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
 
            
<!-- Custom styles for this template-->
<link href="<%=SystemConstant.SITE_PATH%>/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="<%=SystemConstant.SITE_PATH%>/resources/css/common.css" rel="stylesheet">

<!-- Select박스 for this template-->  
<link href="<%=SystemConstant.SITE_PATH%>/resources/css/nice-select.css" rel="stylesheet">
<script src="<%=SystemConstant.SITE_PATH%>/resources/js/jquery-1.10.2.js"></script>
<script src="<%=SystemConstant.SITE_PATH%>/resources/js/jquery.form.js"></script>

<!-- 공통 커스텀 js -->
<script src="<%=SystemConstant.SITE_PATH%>/resources/js/common.js"></script>
<script src="<%=SystemConstant.SITE_PATH%>/resources/js/file_common.js"></script>

<!-- 공통 dev 커스텀 css -->
<script src="<%=SystemConstant.SITE_PATH%>/resources/css/style.css"></script>

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
		location.href = "<%=SystemConstant.JSP_VIEW_URI%>?path=/main/main";
	}
</script>