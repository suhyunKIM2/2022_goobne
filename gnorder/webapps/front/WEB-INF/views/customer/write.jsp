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
    <title>굽민의 소리</title>
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
				
            <article class="l-layout notice">
                <div class="l-inner">
                    <div class="l-title">굽민의 소리</div>
                    <!-- 고객의 소리 쓰기 영역  -->
                    <section class="notice__detail">
                        <h3 class="text_size_m text_center">고객의 소중한 의견에 감사드립니다.</h3>
                        <div class="text_center">언제나 고객의 소리에 귀 기울이는 굽네치킨이 되겠습니다.</div>
                        <table class="member_table cscenter_table">
                            <colgroup>
                                <col width="10%" class="th_col">
                                <col width="40%" class="td_col">
                                <col width="10%" class="th_col">
                                <col width="40%" class="td_col">
                            </colgroup>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" name="name" id="name" value="<%=user.getUser_name()%>" placeholder="이름" class="input_style input_css"></td>
                                <th>연락처</th>
                                <td><input type="tel" name="tel" id="tel" maxlength="11" placeholder="핸드폰번호입력" class="input_style input_css" onkeydown="checkOnlyNumberKeyInput();"></td>
                            </tr>
                            <tr>
                                <th>매장명</th>
                                <td><input type="text" name="cont03" id="cont03" placeholder="매장명" class="input_style input_css"></td>
                                <th>분류</th>
                                <td>
                                	<select class="selectpicker" id="bo_cust_type" name="bo_cust_type" >
	                                </select>
                                </td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td colspan="3"><input type="text" name="title" id="title" placeholder="제목" class="input_style input_cs"></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td colspan="3" class="summernote_style">
                                	<textarea id="summernote" name="customer_cont" placeholder="최대 400byte 입력"></textarea>
                                </td>
                             </tr>
                            <tr>
                                <th></th>
                                <td colspan="3">
                                   <div class="filebox bs3-primary preview-image" id="imgbox0">
                                      <input class="upload-name" id="file_vnm" value="" disabled="disabled" style="width: 200px;">
                                      <label id="img0"  exts="png,gif,jpg,jpeg">업로드</label> 
                                      <!-- <input type="file" id="input_file" class="upload-hidden"> -->
                                      <input type="file" id="input_file" class="upload-hidden"> 
			                          <input type="hidden" id="file_tp"/>
									  <input type="hidden" id="db_file_path"/>
									  <input type="hidden" id="ext"/>
									  <input type="hidden" id="file_mv_yn"/>
									  <input type="hidden" id="file_nm"/>
									  <input type="hidden" id="file_size"/>
									  <input type="hidden" id="mv_sccss"/>
									  <input type="hidden" id="org_file_nm"/>
									  <input type="hidden" id="tmp_file_url"/>
									  <input type="hidden" id="tmp_file_pth"/>
									  <input type="hidden" id="real_file_url"/>
									  <input type="hidden" id="real_file_pth"/> 
                                    </div>
                                </td>
                            </tr>
                        </table>
                      
                        <div class="div_box_border_top cscenter_inside padding_10">
                        <h3 class="text_size_m padding_bottom_1"><i class="icon_nu" style="opacity: 0;">-</i><span class="text_span">개인정보 활용 동의 내용</span></h3>
                            <ul class="inside_ul">
                                <li><i class="icon_nu">-</i><span class="text_span">정보취합 수신처 : 주) 지앤푸드</span></li>
                                <li><i class="icon_nu">-</i><span class="text_span">개인정보 취합 목적 : 고객 응대 및 당첨자 선정을 위한 목적 이외에는 사용되지 않으며 저장된 개인정보는 이벤트 종료 후 파기</span></li>
                                <li><i class="icon_nu">-</i><span class="text_span">단, 회원일 경우 굽네치킨 개인정보 취급 방침에 따라 운영 됩니다</span></li>
                                <li><i class="icon_nu">-</i><span class="text_span">수집항목 : 이름, 휴대폰번호, 첨부된 이미지</span></li>
                                <li><i class="icon_nu">-</i><span class="text_span">귀하는 개인정보 수집·이용에 동의하지 않을 권리가 있으며, 동의 거부시 해당 서비스를 이용하실 수 없습니다.</span></li>
                            </ul>
                            <div class="l-chk">
                                <input type="checkbox" id="chk" class="chk-type">
                                <label for="chk">개인정보 활용 동의</label>
                            </div>
                        </div>
                    </section>
                    <!-- // 고객의 소리 쓰기 영역  -->
                    <ul class="list_info_line list_info_line_btn">
                        <li><button type="reset" class="l-btn line" style="margin-top:0;">취소하기</button></li>
                        <li><button type="button" class="l-btn notice-list-btn" style="margin-top:0;" onClick="brdSave();">등록하기</button></li>
                    </ul>
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

    <!-- Start bootstrap footer script  -->
    <jsp:include page="/WEB-INF/views/include/footer_script.jsp"></jsp:include>
    <!-- End bootstrap footer script  -->
    
    <script>
    
        $(document).ready(function () {
         	
         	var param = new Object();
        	param.define_id = 'BO_CUST_TYPE'; //분류(검색select)
        	param.use_yn ='Y';
        	getCodeListSelBox($("#bo_cust_type"), param, "선택", "");  
        	
            var url = "<%=SystemConstant.IMG_UPLOAD%>"; 
            imgUpload('img0', '0', url);	  //이미지 업로드 call
        });

    	//고객의 소리 등록
    	function brdSave(){
    		
    		//개인정보 동의
    		var agree_btn = $("input:checkbox[id='chk']:checked").val();
    		
    		//휴대폰 번호
    		var tel = $("#tel").val().trim();
    		
    		//폼체크
    		if($("#name").val() == ""){
    			alert("이름을 입력해 주세요.");
    			$("#name").focus();
    			return;
    		}
    		if (tel.length == 0) {
    			alert("연락처를 입력해주세요.");
    			$("#tel").focus();
    			return false;
    		}
    		if (!checkPhoneNumber(tel) || tel.length < 11) {
    			alert("휴대폰 번호를 정확하게 입력해주세요.");
    			$("#tel").focus();
    			return false;
    		}
    		if($("#cont03").val() == ""){
    			alert("매장명을 입력해 주세요.");
    			$("#cont03").focus();
    			return;
    		}
    		if($("#bo_cust_type").val() == "" ) {
    			alert("분류를 선택해 주세요");
    		    return;
    	    }
    		if($("#title").val() == ""){
    			alert("제목을 입력해 주세요.");
    			$("#title").focus();
    			return;
    		}
    		if($("#summernote").val().replace(/(<([^>]+)>)/gi, "").length < 10){
    			alert("내용은 10자리 이상 입력해주세요.");
    			$("#summernote").focus();
    			return;
    		}
    		if( agree_btn != "on" ){
    			alert("개인정보 활용 동의에 체크해주세요.");
    			return;
    		}

    		var obj = new Object();
    		
    		obj.use_yn = "Y";
    		obj.name = $("#name").val().trim();
    		obj.title = $("#title").val().trim();
    		obj.cont01 = tel;//연락처
    		obj.cont03 = $("#cont03").val().trim();//매장명
    		obj.cont04 = $("#bo_cust_type").val();//분류
    		/* obj.content = $("#customer_cont").val().replace(/(<([^>]+)>)/gi, ""); */
    		obj.content = $("#summernote").val();
    		
    		//파일
    		if( file_nm != null && file_nm != "" ){
		  		obj.file_nm = $("#file_nm").val().trim();
				obj.tmp_file_pth = $("#tmp_file_pth").val().trim();
    		}
    		
    		var data = JSON.stringify(obj);
    		var url = '/brd/customer/save';
    		
   			if (confirm("등록 하시겠습니까?") ){
   				ajaxCall(url, data, brdInsertCallBack, errorCallBack, "[굽민의 소리 등록]");
   			}
    	}
    	
    	function brdInsertCallBack(obj){
    		alert("등록 완료하였습니다.");
    		window.location.reload();
    	}
</script>
</body>
</html> 
