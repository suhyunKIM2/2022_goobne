<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
	<!-- Start bootstrap header script  -->
    <jsp:include page="/WEB-INF/views/include/header_script.jsp"></jsp:include>
    <!-- End bootstrap header script  -->
</head>
<body style="min-width: 100%;"> 

<div class="container container_login">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5 login_card">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            
                            <div class="col-lg-6">
                                <div class="p-5">            
                                    <div class="text-center">
                                        <ul class="nav nav-tabs login_tab">
                                          <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#" onclick="javascript:loginType('');">그룹관리자</a>
                                          </li>
                                          <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#" onclick="javascript:loginType('04');">매장관리자</a>
                                          </li>                                         
                                        </ul>
                                    </div>                       
                                    <div class="text-center">
                                        <div class="logo_box">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1327.89 325.96" style="height: 1.9rem;"><defs><style>.cls-1{fill:#fff;}.cls-2{fill:#abcd03;fill-rule:evenodd;}</style></defs><g id="레이어_2" data-name="레이어 2"><g id="레이어_1-2" data-name="레이어 1"><path class="cls-1" d="M258.51,215.64c0-14.47,1.38-27.22,4.22-38.13a109,109,0,0,1,11.06-28.28,79,79,0,0,1,15.95-19.9,101.54,101.54,0,0,1,18.22-13c14.5-7.79,31.15-12,49.88-12.57,18.46.53,35,4.78,49.49,12.57a103,103,0,0,1,18.23,13,78.84,78.84,0,0,1,15.91,19.9,118.2,118.2,0,0,1,11.35,28.28c2.94,10.91,4.35,23.66,4.35,38.13s-1.41,27.3-4.35,38.18a114.32,114.32,0,0,1-11.35,28.11,77.55,77.55,0,0,1-15.91,19.48,107.8,107.8,0,0,1-18.23,12.79c-14.53,7.52-31,11.48-49.49,11.76-18.73-.28-35.38-4.24-49.88-11.76a106.17,106.17,0,0,1-18.22-12.79,77.67,77.67,0,0,1-15.95-19.48,105.61,105.61,0,0,1-11.06-28.11C259.89,242.94,258.51,230.22,258.51,215.64Zm99.33-62.42q-15.51,0-24.94,6.28a43.2,43.2,0,0,0-14.45,15.69,64.33,64.33,0,0,0-6.72,20.38,137.17,137.17,0,0,0-1.67,20.07,138.24,138.24,0,0,0,1.67,20.17,63.64,63.64,0,0,0,6.72,20.33,43.1,43.1,0,0,0,14.45,15.74c6.29,4.16,14.6,6.28,24.94,6.28s18.68-2.12,24.93-6.28a43,43,0,0,0,14.48-15.74A62.89,62.89,0,0,0,404,235.81a121.32,121.32,0,0,0,0-40.24,63.57,63.57,0,0,0-6.71-20.38,43.11,43.11,0,0,0-14.48-15.69C376.52,155.32,368.18,153.22,357.84,153.22Z"/><path class="cls-1" d="M468.7,215.64c0-14.47,1.39-27.22,4.19-38.13A110,110,0,0,1,484,149.23a78.37,78.37,0,0,1,15.9-19.9,102.48,102.48,0,0,1,18.26-13c14.52-7.79,31.17-12,49.89-12.57,18.4.53,34.92,4.78,49.43,12.57a101.88,101.88,0,0,1,18.28,13,78.62,78.62,0,0,1,15.91,19.9A117.38,117.38,0,0,1,663,177.51c2.94,10.91,4.42,23.66,4.42,38.13s-1.48,27.3-4.42,38.18a113.55,113.55,0,0,1-11.32,28.11,77.34,77.34,0,0,1-15.91,19.48,106.54,106.54,0,0,1-18.28,12.79C603,321.72,586.44,325.68,568,326c-18.72-.28-35.37-4.24-49.89-11.76a107.2,107.2,0,0,1-18.26-12.79A77.1,77.1,0,0,1,484,281.93a106.64,106.64,0,0,1-11.1-28.11Q468.69,237.5,468.7,215.64ZM568,153.22q-15.49,0-24.94,6.28a43,43,0,0,0-14.47,15.69,63.35,63.35,0,0,0-6.72,20.38,122.76,122.76,0,0,0,0,40.24,62.67,62.67,0,0,0,6.72,20.33,42.9,42.9,0,0,0,14.47,15.74c6.28,4.16,14.61,6.28,24.94,6.28S586.68,276,593,271.88a43,43,0,0,0,14.46-15.74,63.13,63.13,0,0,0,6.71-20.33,122.76,122.76,0,0,0,0-40.24,63.82,63.82,0,0,0-6.71-20.38A43.06,43.06,0,0,0,593,159.5C586.68,155.32,578.34,153.22,568,153.22Z"/><path class="cls-1" d="M729.17,134.69c.18-.28.39-.55.58-.81a56.06,56.06,0,0,1,8.79-9.82,76.83,76.83,0,0,1,46.52-20.31c17.33.53,32.73,4.78,46.11,12.57a85.27,85.27,0,0,1,17,13,81.83,81.83,0,0,1,14.68,19.9,117.9,117.9,0,0,1,10.49,28.28c2.64,10.91,4,23.66,4,38.13s-1.49,27.3-4.42,38.18a112,112,0,0,1-11.36,28.11,76.91,76.91,0,0,1-15.91,19.48,104.51,104.51,0,0,1-18.26,12.79c-14.51,7.52-31,11.48-49.46,11.76-18.45-.28-34.78-4.24-49-11.76a98.42,98.42,0,0,1-18-12.79,78.42,78.42,0,0,1-15.69-19.68A112.9,112.9,0,0,1,684,253.37c-2.74-10.84-4.13-23.59-4.13-38.12V38.76h49.87v95.75S725.93,139.37,729.17,134.69Zm48.76,143.47c10.35,0,18.67-2.12,25-6.28a43.62,43.62,0,0,0,14.48-15.74,64.32,64.32,0,0,0,6.68-20.33,122.76,122.76,0,0,0,0-40.24,65,65,0,0,0-6.68-20.38,43.72,43.72,0,0,0-14.48-15.69q-9.46-6.27-25-6.28t-25,6.28a45.2,45.2,0,0,0-14.61,15.69,60.49,60.49,0,0,0-6.94,20.38,122.76,122.76,0,0,0,0,40.24,59.85,59.85,0,0,0,6.94,20.33A45.09,45.09,0,0,0,753,271.88C759.3,276,767.62,278.16,777.93,278.16Z"/><path class="cls-1" d="M1016.29,103.75c.8,0,3.81.15,9,.43a78.22,78.22,0,0,1,18.24,3.56,108.45,108.45,0,0,1,22.19,9.85,77.2,77.2,0,0,1,21.81,19.27c6.71,8.41,12.23,18.93,16.53,31.66s6.52,28.42,6.52,47.12V321.72h-51.13V215.64a107.56,107.56,0,0,0-1.69-18.83,52.45,52.45,0,0,0-6.32-17.62,38.16,38.16,0,0,0-13-13.2q-8.41-5.25-22.2-5.25T994,166a38.37,38.37,0,0,0-13,13.2,52.59,52.59,0,0,0-6.27,17.62,107.56,107.56,0,0,0-1.69,18.83V321.72H921.92V215.64q0-28,6.55-47.12c4.26-12.73,9.81-23.25,16.51-31.66s13.95-14.8,21.79-19.27A107.26,107.26,0,0,1,989,107.74a76.88,76.88,0,0,1,18-3.56C1012,103.9,1015.12,103.75,1016.29,103.75Z"/><path class="cls-1" d="M1325.79,188.42c.57,4.18,1,8.52,1.42,13s.68,9.26.68,14.25v7.6H1181.12c.58,4.73,1.3,9.56,2.13,14.44a66.76,66.76,0,0,0,4.19,14.48,52.12,52.12,0,0,0,14.25,19.24q9.66,8.42,26.81,8.42t26.83-8.42a52.49,52.49,0,0,0,14.3-19.24h54.5a97.14,97.14,0,0,1-22.86,44.41,75.85,75.85,0,0,1-15.76,13.23,117.43,117.43,0,0,1-16.33,8.58A111.1,111.1,0,0,1,1228.5,326c-18.73-.28-35.37-4.24-49.86-11.76a103.71,103.71,0,0,1-18.25-12.79,76.28,76.28,0,0,1-15.91-19.48,107.33,107.33,0,0,1-11.13-28.11q-4.18-16.32-4.2-38.18c0-14.47,1.41-27.22,4.2-38.13a110.78,110.78,0,0,1,11.13-28.28,77.54,77.54,0,0,1,15.91-19.9,99.29,99.29,0,0,1,18.25-13c14.49-7.79,31.13-12,49.86-12.57a116.84,116.84,0,0,1,43.21,9.63,102.32,102.32,0,0,1,17,9.86,81.38,81.38,0,0,1,15.94,15.08,101.61,101.61,0,0,1,13,21.37A108,108,0,0,1,1325.79,188.42Zm-52.85,0a101.22,101.22,0,0,0-5.26-13.4,41.49,41.49,0,0,0-8.58-12.17,39.09,39.09,0,0,0-13-8.56,50.47,50.47,0,0,0-35.21,0,38.55,38.55,0,0,0-13,8.56A45.35,45.35,0,0,0,1189.1,175a64.46,64.46,0,0,0-5,13.4Z"/><path class="cls-1" d="M242.63,176.68H129.39v47h64.47c0,21.92-11.67,52.77-60.52,52.77s-83-14.77-83-96.2c0-82.27,34.8-96.7,85-96.7,35.22,0,50.73,22.17,55.37,44.4h50.7c-4.2-36.82-25.42-93.46-112-93.46C20.4,34.47,0,101.81,0,179.79,0,231.86,9.84,326,129.39,326S242.63,222,242.63,222Z"/><path class="cls-2" d="M988.12,0C939.4,3.67,866,36.51,890.79,98c19.76-7.1,35.57-19.05,48-31.33l10.3-11.35c13.15-15.56,20.46-29.63,22.7-32,4.16-5.07-26.75,72.75-74.44,87.5,1.55,9.86,53.17,15.51,73.49-26.83S988.12,0,988.12,0Z"/><path class="cls-2" d="M870,69.43A92.9,92.9,0,0,0,831.7,50c-4.53,24,1.92,64.18,34.83,60.09-.79-10.51-4.68-19.74-9-27.4L853.41,76c-6-8.28-11.81-13.63-12.74-15-1.76-2.87,32.06,22.47,32.89,47.49C878.64,109.18,888.12,84.77,870,69.43Z"/></g></g></svg>
                                        </div>
                                        <h1 class="h4 text-gray-900 mb-4 mb_text"><b> </b></h1>
                                    </div> 
                                    <form name="loginForm" class="user"> 
                                        <input type="hidden" id="utp">                                    
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="userid" aria-describedby="emailHelp"
                                                placeholder="ID" name="login_id" maxlength="30" value="admin">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="passwd" placeholder="Password" name="login_pwd" maxlength="30"  value="gnfood9494!">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">기억하기</label>
                                            </div>
                                        </div>
                                        <a href="javascript:loginFn()" class="btn btn-danger btn-user btn-block btn_main_color">
                                           로그인
                                        </a>                                        
                                    </form>
                                    <hr>
                                    <div id="error_msg"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>     
<script type="text/javascript">
$(document).ready(function(){
	errorMsgView('', error_msg);
	$('input[type=password]').on("keyup", function(e){
	    if (e.which == 13) {
	        e.preventDefault();
	        loginFn();
	    }
	});
}); 
function loginType(g){
	$('#utp').val(g);
	if( g == '04' ) {
	   $('#userid').val('1000107');
	   $('#passwd').val('6101928530'); 
	} else {
	   $('#userid').val('admin');
	   $('#passwd').val('gnfood9494!');	
	}
}
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
	var id  = $('#userid').val().trim();
	var pwd = $('#passwd').val().trim(); 
	var utp = $('#utp').val().trim(); 
	if ( id == null || id == "" ) {
		errorMsgView('아이디를 입력하세요.', error_msg);
		$('#userid').focus();
		return;
	}
	if ( pwd == null || pwd == "" ) {
		errorMsgView('비밀번호를 입력하세요.', error_msg);
		$('#passwd').focus();
		return;
	}
	var url = "<%=SystemConstant.LOGIN_URI%>";
	var obj = new Object();
	obj.user_id = id;
	obj.pwd = pwd;
	obj.user_type = utp;  
	var jsonData = JSON.stringify(obj);	
	//ajaxCall(url, jsonData, goLoginChkCallBack, errorCallBack, '관리자 로그인');	//alert
	ajaxCall(url, jsonData, goLoginChkCallBack, errorCallBackMsgView, '관리자 로그인');  //div
}
/*
 * 로그인 성공 콜백(로그인 성공시, 메인 화면으로 이동 처리)
 */
function goLoginChkCallBack(obj) {
	// 로그인 성공인 경우에 메인화면으로 포워딩 처리
	if ( obj.result == common._trans_success_code ) { 
		goToMain();
	}
} 
</script> 

    <!-- Bootstrap core JavaScript-->
    <script src="<%=SystemConstant.SITE_PATH%>/resources/vendor/jquery/jquery.min.js"></script>
    <script src="<%=SystemConstant.SITE_PATH%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=SystemConstant.SITE_PATH%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=SystemConstant.SITE_PATH%>/resources/js/sb-admin-2.min.js"></script>
 
</body>
</html>
