﻿<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.gncns.goobne.config.SystemConstant
             , com.gncns.goobne.common.session.SessionFactory
             , com.gncns.goobne.common.session.AdminUser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	SessionFactory sessFtr = new SessionFactory(request);
    AdminUser user = sessFtr.getAdminUser();
%> 
<!DOCTYPE html>
<html lang="ko">
 <head>
    <!-- Start bootstrap header script  -->
    <jsp:include page="/WEB-INF/views/include/header_script.jsp"></jsp:include>
    <!-- End bootstrap header script  -->
 </head>
<body id="page-top" style="min-width:1500px; ">
    <!-- Page Wrapper -->
    <div id="wrapper">
    
    <div id="container"></div>
                
        <!-- Start Sidebar left menu --> 
        <jsp:include page="/WEB-INF/views/include/nav_left.jsp"></jsp:include> 
        <!-- End Sidebar left menu --> 
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column"> 
        
            <!-- Main Content -->
            <div id="content">

                <!-- Start Topbar 공통 top-->
                <div class="ham"></div><jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
                <!-- End Topbar 공통 top--> 

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 container_auto">
                        <h1 class="h3 mb-0 text-gray-900">팝업관리</h1>
                    </div> 
                    <div class="col-xl-4 col-lg-5"> 
                    <div class="tab-content">
                      <div class="tab-pane fade show active">
                          <form name="myform" id="myform" action="">
                          <table class="table table-bordered table_S_box banner_table" id="dataTable" width="100%" cellspacing="0">
                                 <tr>
                                    <th class="bg-gray-200">팝업명</th>
                                    <td >
                                      <input type="text" id="bnnr_nm" maxlength="100" style="width:50%;">
                                    </td>
                                 </tr>
                                 <tr>
                                    <th class="bg-gray-200">노출여부</th>
                                    <td>
                                       <select id="show_yn" class="selectpicker">
                                            <option value="0">노출여부</option><!---노출--->   
                                            <option value="Y">Y</option><!---노출--->   
                                            <option value="N">N</option><!---비노출--->
                                        </select> 
                                     </td>
                                 </tr>
                                 <tr>
                                   <th class="bg-gray-200">팝업순서</th>
                                   <td>
                                      <select id="sort_seq" class="selectpicker">
                                            <option value="0">팝업순서</option><!---노출--->   
                                            <c:forEach var="seq" begin="1" end="5" step="1">
                                               <option value="${seq}">${seq}</option>
                                            </c:forEach> 
                                       </select>  
                                    </td>
                                 </tr>
                                <tr>
                                    <th class="bg-gray-200">기간설정</th>
                                    <td>
                                        <ul class="list_inline" style="margin-bottom:0;">
                                            <li>
                                                <div class="px-3 bg-gradient-info text-white" style="float:left;height:30px;line-height: 30px;">시작</div> 
                                                <div class="day_box" style="float:left;width:auto;margin:0;">
                                                    <input type="text" name="sta_dt" id="datepicker" placeholder="0000-00-00" style="height:30px;line-height: 30px;border-color:#e8e8e8;">
                                                </div>
                                                <div class="left_line">
                                                    <ul class="list_inline">
                                                        <li>
                                                            <select id="sta_t" class="selectpicker">
                                                                <c:forEach var="time" begin="0" end="23" step="1">
                                                                   <c:choose>
                                                                    <c:when test="${time < 10 }">
                                                                      <option value="0${time}">0${time}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                      <option value="${time}">${time}</option> 
                                                                    </c:otherwise> 
                                                                   </c:choose>
                                                                </c:forEach> 
                                                            </select>
                                                        </li>
                                                        <li><spna>:</span></li>
                                                        <li>
                                                            <select id="sta_m" class="selectpicker">
                                                                <c:forEach var="time" begin="0" end="50" step="10">
                                                                   <c:choose>
                                                                    <c:when test="${time < 10 }">
                                                                      <option value="0${time}">0${time}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                      <option value="${time}">${time}</option> 
                                                                    </c:otherwise> 
                                                                   </c:choose>
                                                                </c:forEach> 
                                                                <option value="59">59</option>
                                                            </select>
                                                        </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li style="margin-top: 1%;display: block;">
                                                    <div class="px-3 bg-gradient-danger text-white" style="float:left;height:30px;line-height: 30px;">종료</div> 
                                                    <div class="day_box" style="float:left;width:auto;margin:0;">
                                                        <input type="text" id="datepicker2" name="end_dt" placeholder="0000-00-00" style="height:30px;line-height: 30px;border-color:#e8e8e8;">
                                                    </div>
                                                    <div class="left_line">
                                                        <ul class="list_inline">
                                                        <li>
                                                            <select id="end_t" class="selectpicker">
                                                                <c:forEach var="time" begin="0" end="23" step="1">
                                                                   <c:choose>
                                                                    <c:when test="${time < 10 }">
                                                                      <option value="0${time}">0${time}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                      <option value="${time}">${time}</option> 
                                                                    </c:otherwise> 
                                                                   </c:choose>
                                                                </c:forEach> 
                                                            </select>
                                                        </li>
                                                        <li><spna>:</span></li>
                                                        <li>
                                                            <select id="end_m" class="selectpicker">
                                                                <c:forEach var="time" begin="0" end="50" step="10">
                                                                   <c:choose>
                                                                    <c:when test="${time < 10 }">
                                                                      <option value="0${time}">0${time}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                      <option value="${time}">${time}</option> 
                                                                    </c:otherwise> 
                                                                   </c:choose>
                                                                </c:forEach> 
                                                                <option value="59">59</option>
                                                            </select>
                                                        </li>
                                                        </ul>
                                                    </div>                                                 
                                                </li>
                                            </li>
                                        </ul>
                                     </td>
                                 </tr>
                                 <tr>
                                    <th class="bg-gray-200">내용</th>
                                    <td>
                                        <textarea name="pop_cont" id="summernote"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div class="col-xl-4 col-lg-5" style="text-align: center;margin-top: 2%;">
                                <ul class="list_inline">
                                    <li>
                                        <span id='btn_reg'><a href="#" class="btn btn-primary btn-icon-split btn-S" onclick="javascript:regBanner();">
                                           <span class="text">등록</span>
                                        </a></span>
                                        <span id='btn_upt' style="display:none">
	                                        <a href="#" class="btn btn-secondary btn-icon-split" style="height:42px;line-height: 1.6;" onclick="javascript:reset('i');">
	                                                <span class="text">초기화</span>
	                                        </a>
	                                        <a href="#" class="btn btn-primary btn-icon-split btn-S" onclick="javascript:regBanner();">
	                                           <span class="text">수정</span>                                           
	                                        </a><input type="hidden" id="bnnr_id">                                        
                                        </span>                                       
                                    </li>
                                </ul>
                            </div>
                            </form>
                            
                            <!-- 목록 -->
                            <h3>팝업 리스트 현황</h3> 
                            <!-- 검색 테이블 추가 -->
                            <form name="scform" id="scform" action="">
                            
                            <table class="table table-bordered table_main table_main_banner" id="dataTable" width="100%" cellspacing="0">
                             <colgroup>
                                 <col style="width:15%;">
                                 <col style="width:85%;">
                             </colgroup>
                                <tbody><tr>
                                    <th class="bg-gray-200" rowspan="2">검색조회</th>
                                </tr>
                                <tr>
                                    <td style="text-align: left;"> 
                                       <div class="banner_s_02">
                                           <input type="text" placeholder="팝업명" id="bnnr_nm_s" maxlength="30" style="vertical-align: middle;padding-left: 2%;">                                           
                                       </div>
                                       <div class="banner_s_03">
                                           <ul class="list_inline" style="margin-bottom:0;">
                                            <li>
                                                <div class="day_box" style="float:left;width:auto;margin:0;">
						                         <input type="text" name="sta_dt_s" id="datepicker3" placeholder="0000-00-00" style="height:40px;line-height: 40px;border-color:#e8e8e8;">
                                                </div>
                                                <div class="left_line">
                                                    <ul class="list_inline">
                                                        <li>
                                                            <select id="sta_t_s" class="selectpicker">
                                                                <c:forEach var="time" begin="0" end="23" step="1">
                                                                   <c:choose>
                                                                    <c:when test="${time < 10 }">
                                                                      <option value="0${time}">0${time}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                      <option value="${time}">${time}</option> 
                                                                    </c:otherwise> 
                                                                   </c:choose>
                                                                </c:forEach> 
                                                            </select>
                                                        </li>
                                                        <li><spna>:</spna></li>
                                                        <li>
                                                            <select id="sta_m_s" class="selectpicker">
                                                                <c:forEach var="time" begin="0" end="50" step="10">
                                                                   <c:choose>
                                                                    <c:when test="${time < 10 }">
                                                                      <option value="0${time}">0${time}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                      <option value="${time}">${time}</option> 
                                                                    </c:otherwise> 
                                                                   </c:choose>
                                                                </c:forEach> 
                                                            </select>
                                                        </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li> ~ </li>
                                                <li>
                                                   <div class="day_box" style="float:left;width:auto;margin:0;">
							                           <input type="text" id="datepicker4" name="end_dt_s" placeholder="0000-00-00" style="height:40px;line-height: 40px;border-color:#e8e8e8;">
                                                    </div>
                                                    <div class="left_line">
                                                        <ul class="list_inline">
                                                        <li>
                                                             <select id="end_t_s" name="end_t_s" class="selectpicker">
                                                                <c:forEach var="time" begin="0" end="23" step="1">
                                                                   <c:choose>
                                                                    <c:when test="${time < 10 }">
                                                                      <option value="0${time}">0${time}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                      <option value="${time}">${time}</option> 
                                                                    </c:otherwise> 
                                                                   </c:choose>
                                                                </c:forEach> 
                                                            </select>
                                                        </li>
                                                        <li><spna>:</spna></li>
                                                        <li>
                                                            <select id="end_m_s" class="selectpicker">
                                                                <c:forEach var="time" begin="0" end="50" step="10">
                                                                   <c:choose>
                                                                    <c:when test="${time < 10 }">
                                                                      <option value="0${time}">0${time}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                      <option value="${time}">${time}</option> 
                                                                    </c:otherwise> 
                                                                   </c:choose>
                                                                </c:forEach> 
                                                            </select>
                                                        </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li>
                                                    <a href="#" class="btn btn-primary btn-icon-split" style="height:42px;line-height: 1.6;" onclick="javascript:searchBanner('1');">
                                                        <span class="text">조회</span>
                                                    </a>
                                                    <a href="#" class="btn btn-secondary btn-icon-split" style="height:42px;line-height: 1.6;" onclick="javascript:reset('s');">
                                                        <span class="text">초기화</span>
                                                    </a>
                                                </li>
                                                 
                                        </ul>
                                       </div>
                                    </td>
                                </tr>
                            </tbody>
                            </table>  
                            </form> 
                            <table class="table table-bordered table_main table_main_banner" id="bannerTable" width="100%" cellspacing="0">
                                 <colgroup>
                                    <col width="5%">
                                    <col width="5%">
                                    <col width="10%">
                                    <col width="30%">
                                    <col width="5%">
                                    <col width="">
                                    <col width="" style="min-width:100px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th class="bg-gray-200">번호</th>                                        
                                        <th class="bg-gray-200">순서</th>
                                        <th class="bg-gray-200">등록위치</th>
                                        <th class="bg-gray-200">팝업이름</th>
                                        <th class="bg-gray-200">노출</th>
                                        <th class="bg-gray-200">게시기간</th>
                                        <th class="bg-gray-200">관리</th>
                                     </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                         
                     </div>
                     
                 </div> 
                 
                </div>
                <!-- /.container-fluid -->
 
            </div>
            <!-- End of Main Content -->
            <div class="container_page">
                 <div class="row row_page">
                     <div class="col">
                         <ul class="pagination">
                         </ul>
                     </div>
                 </div>
             </div>
               
            <!-- Start Footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
            <!-- End Footer -->

        </div>
        <!-- End of Content Wrapper -->
        
    </div>
    <!-- End of Page Wrapper -->
    
<!-- Start bootstrap footer script  -->
<jsp:include page="/WEB-INF/views/include/footer_script2.jsp"></jsp:include>
<!-- End bootstrap footer script  -->
<style>
.note-editor .note-editing-area .note-editable{height:450px !important;background: #fff;}
.contants_text{height:450px;}
.note-editor.codeview,.note-editing-area,.note-codable{white-space: pre-line;}
</style>   
<script type="text/javascript"> 
  $(document).ready(function () { 
	  var date = new Date();  	
	  var edate = new Date(date.setMonth(date.getMonth()+1));
	  var sdate = new Date(date.setMonth(date.getMonth()-2));
	  $("#datepicker").datepicker( "setDate", sdate);
	  $("#datepicker2").datepicker( "setDate", edate);
      $("#datepicker3").datepicker( "setDate", sdate);
      $("#datepicker4").datepicker( "setDate", edate); 
	   
	   bannerList(1); 
	   
	   $('#summernote').summernote({ 
			height: 300,				// set editor height
			dialogsInBody: true,
			minHeight: null,			// set minimum height of editor
			maxHeight: null,			// set maximum height of editor
			focus: false,				// set focus to editable area after initializing summernote
			onImageUpload: function (files, editor, welEditable) {
				sendFile(files[0], editor, welEditable);
			}
		});
	   
	    $('input[id=bnnr_nm_s]').on("keyup", function(e){
		    if (e.which == 13) {
		        e.preventDefault();				 
		        searchBanner(1);
		    }
		});
      
     });  
  
    //에디터 이미지 업로드
	var fileArr = new Array();
	function sendFile(file, editor, welEditable) { 
		data = new FormData();
		data.append("FILE", file);
		url = "<%=SystemConstant.SITE_PATH%>/rest/file/uploadEdtrBrdImgFile";
		$.ajax({
			data: data,
			type: "POST",
			url: url,
			cache: false,
			contentType: false,
			processData: false,
			success: function (obj) {
				// console.log(obj);
				var file_url = obj.body.imgFile.tmp_file_url;
                fileArr.push(obj.body.imgFile);
				//editor.insertImage(welEditable, file_url); 
				$('#summernote').summernote('editor.insertImage', file_url);
			}
		});
		// console.log(fileArr);
	} 
  
/*
 * 등록 처리
 */
function regBanner(){
	var bnnrObj = new Object();	
	var bnnr_id = $('#bnnr_id').val().trim();
	var bnnr_type = "60";                      //팝업 고정
	var bnnr_nm = $('#bnnr_nm').val().trim();
	
	var show_yn = $('#show_yn').val().trim();
	var sort_seq = $('#sort_seq').val().trim();
	
	var sta_dt = $('#datepicker').val().trim();
	var end_dt = $('#datepicker2').val().trim();
	var sta_t = $('#sta_t').val().trim();
	var end_t = $('#end_t').val().trim();
	var sta_m = $('#sta_m').val().trim();
	var end_m = $('#end_m').val().trim();	 
	if( bnnr_nm == "" ) {
		alert("팝업명을 입력해 주세요");
	    return;
    }
	if( show_yn == "0" ) {
		alert("노출여부를 선택해 주세요");
	    return;
    }
	if( sort_seq == "0" ) {
		alert("팝업순서를 선택해 주세요");
	    return;
    }
	bnnrObj.bnnr_type = bnnr_type;
	bnnrObj.bnnr_nm = bnnr_nm;
	bnnrObj.s_dtm = sta_dt.replace(/\-/g,'')+sta_t+sta_m;
	bnnrObj.e_dtm = end_dt.replace(/\-/g,'')+end_t+end_m;
	bnnrObj.view_yn = $('#show_yn').val().trim();
	bnnrObj.ord1 = $('#sort_seq').val().trim();
	bnnrObj.bnnr_id = bnnr_id; 
	bnnrObj.pop_cntnt = $("#summernote").code();
	 
	var bnnrData = new Object();
	bnnrData.bnnrObj = bnnrObj; 
	 	
	var url = '<%=SystemConstant.SITE_PATH%>/bnnr/popReg';
	var data = JSON.stringify(bnnrData);
	if(confirm("팝업 내용을 저장합니다.")) ajaxCall(url, data, regOkCallBack, errorCallBack, '팝업저장');	
} 
/*
 * 등록 콜백
 */
function regOkCallBack(obj) {
	if (obj.result == common._trans_success_code) {		
		if ( obj.body.okbnr > 0) {
			alert("저장 완료되었습니다.");
			//reset('i');
			//bannerList(1);
			location.href="<%=SystemConstant.SITE_PATH%>/bnnr/popup";
		}
	}
}

/*
 * banner list call
 */ 
function searchBanner(pageNum) {
	var obj = new Object();  
	if (pageNum == '' || pageNum == "undefined") {
		obj.pageNum = "1";
	} else {
		obj.pageNum = pageNum;
	} 
	var sta_dt = $('#datepicker3').val().trim();
	var end_dt = $('#datepicker4').val().trim();
	var sta_t = $('#sta_t_s').val().trim();
	var end_t = $('#end_t_s').val().trim();
	var sta_m = $('#sta_m_s').val().trim();
	var end_m = $('#end_m_s').val().trim();	
	
	obj.bnnr_type = "60";
	obj.bnnr_nm = $('#bnnr_nm_s').val().trim(); 
	if( sta_dt.length > 9 ) obj.s_dtm = sta_dt.replace(/\-/g,'')+sta_t+sta_m;
	if( end_dt.length > 9 ) obj.e_dtm = end_dt.replace(/\-/g,'')+end_t+end_m;
	
	var url = "<%=SystemConstant.SITE_PATH%>/bnnr/popList";
	var data = JSON.stringify(obj); 
	ajaxCall(url, data, bnrListCallBack, errorCallBack, '팝업리스트호출');
} 

/*
 * banner list call
 */ 
function bannerList(pageNum) {
	var obj = new Object();  
	if (pageNum == '' || pageNum == "undefined") {
		obj.pageNum = "1";
	} else {
		obj.pageNum = pageNum;
	}   
	obj.s_dtm = "";
	obj.e_dtm = "";
	obj.bnnr_type = "60";
	var url = "<%=SystemConstant.SITE_PATH%>/bnnr/popList";
	var data = JSON.stringify(obj); 
	ajaxCall(url, data, bnrListCallBack, errorCallBack, '팝업리스트호출');
} 
function bnrListCallBack(obj) {
	if (obj.result == common._trans_success_code) {
		var bnrList = obj.body.bnrlist.bannerlist; 
		var total_cnt = 0;
		var bnrHtml = "";
		if(bnrList.length>0){
			total_cnt = bnrList[0].total_cnt;
			for (var i = 0; i < bnrList.length; i++) {	
				var bnrObj = bnrList[i];				
				bnrHtml += "<tr>\n";
				bnrHtml += "	<td>"+(total_cnt -(obj.body.bnrlist.pageNum-1) * obj.body.bnrlist.listCnt - i)+"</td>\n";
				bnrHtml += "	<td>"+bnrObj.ord1+"</td>\n";
				bnrHtml += "	<td>" + bnrObj.bnnr_type_nm + "</td>\n";
				if( bnrObj.bnnr_type == '50' ) bnrHtml += "	<td align='left'>["+ bnrObj.sub_bnnr_nm +"]"+ bnrObj.bnnr_nm + "</td>\n";
				else bnrHtml += "	<td align='left'>" + bnrObj.bnnr_nm + "</td>\n";
				bnrHtml += "	<td>"+bnrObj.view_yn+"</td>\n";
				bnrHtml += "	<td>" + formatYYYYMMDDHH24MI(bnrObj.s_dtm, '<%=SystemConstant.DATE_SPLIT%>') + " ~ " + formatYYYYMMDDHH24MI(bnrObj.e_dtm, '<%=SystemConstant.DATE_SPLIT%>')+ "</td>\n";
				bnrHtml += "	<td> <a href=\"javascript:bnrDel('"+bnrObj.bnnr_id+"');\" class='d-sm-inline-block btn btn-sm btn-secondary shadow-sm mb_g' style='margin-right:5px;'>삭제</a><a href=\"javascript:bnrView('"+bnrObj.bnnr_id+"');\" class='d-sm-inline-block btn btn-sm btn-primary shadow-sm mb_g'>수정</a></td>\n";
    			bnrHtml += "</tr>\n";
			}
		} else {
			bnrHtml += "<tr>\n";
			bnrHtml += "	<td colspan='10'>등록된 팝업이 없습니다.</td>\n";
			bnrHtml += "</tr>\n";
		}
		$('#bannerTable > tbody').empty();
		$('#bannerTable > tbody').html(bnrHtml);
		var pagingHTML = createPagingHTML(obj.body.bnrlist.pageNum, total_cnt, obj.body.bnrlist.listCnt, 'bannerList');
		$(".pagination").html(pagingHTML);  
	}
}
 
function bnrDel(id) { 
	var obj = new Object();
	obj.bnnr_id = id;
	var url = "<%=SystemConstant.SITE_PATH%>/bnnr/bnrDel";
	var data = JSON.stringify(obj);
	if(confirm("팝업을 삭제합니다.")) ajaxCall(url, data, bnrDelCallBack, errorCallBack, '리스트호출');
}
function bnrDelCallBack(obj) {
	if (obj.result == common._trans_success_code) {
		if( obj.body.okbnr > 0 ) {
			alert("삭제 완료되었습니다.");
			reset('i');
			bannerList(1);
		} 
	}
}

function bnrView(id) {
	$("#btn_reg").css("display","none");
	$("#btn_upt").css("display","");
	$("#bnnr_id").val(id);	
	var obj = new Object();
	obj.bnnr_id = id;
	var url = "<%=SystemConstant.SITE_PATH%>/bnnr/view";
	var data = JSON.stringify(obj);
	ajaxCall(url, data, bnrViewCallBack, errorCallBack, '팝업상세');
}
function bnrViewCallBack(obj) {
	if (obj.result == common._trans_success_code) {
		var bnrView = obj.body.bnrView;
		if( bnrView != '' && bnrView != null ){
			$("#bnnr_nm").val(bnrView.bnnr_nm);
			$("#show_yn").val(bnrView.view_yn).prop("selected", true);
			selbox(0, bnrView.view_yn);
			$("#sort_seq").val(bnrView.ord1).prop("selected", true);
			selbox(1, bnrView.ord1);
			 
			$("#datepicker").val( bnrView.s_dtm.substring(0, 4)+'-'+bnrView.s_dtm.substring(4, 6)+'-'+bnrView.s_dtm.substring(6, 8));
			$("#datepicker2").val( bnrView.e_dtm.substring(0, 4)+'-'+bnrView.e_dtm.substring(4, 6)+'-'+bnrView.e_dtm.substring(6, 8));
			
			var stime = bnrView.s_dtm.substring(8, 10); 
			var smin = bnrView.s_dtm.substring(10, 12);
			var etime = bnrView.e_dtm.substring(8, 10);
			var emin = bnrView.e_dtm.substring(10, 12);		
			$("#sta_t").val(stime).prop("selected", true);
			$("#sta_m").val(smin).prop("selected", true);
			$("#eta_t").val(etime).prop("selected", true);
			$("#eta_m").val(emin).prop("selected", true);			
			selbox(2, stime);
			selbox(3, smin);
			selbox(4, etime);
			selbox(5, emin);   
			$("#summernote").code(bnrView.pop_cntnt);  
			//$("#summernote").summernote("code", bnrView.pop_cntnt);			
			window.scrollTo(0,0);
		}	
	}
}
function selbox(num, nm){  
	$(".nice-select .list").eq(num).children().each( function(){
		$(this).removeClass('option selected');
		if( $(this).data("value") == nm ) {			
			$(this).addClass('option selected');
			$("span.current").eq(num).text($(this).text())
        } else {
        	$(this).addClass('option');
        }
	});
}
function reset(num){
	 if( num == 's' ) {
		 $('#scform')[0].reset(); 
		 $("#sta_t_s").val("00").prop("selected", true);
		 selbox(6, '00');		
		 $("#sta_m_s").val("00").prop("selected", true);
		 selbox(7, '00');
		 $("#end_t_s").val("00").prop("selected", true);
		 selbox(8, '00');
		 $("#end_m_s").val("00").prop("selected", true);
		 selbox(9, '00');
	 } else { 
		 $('#myform')[0].reset(); 
		 $("#btn_reg").css("display","");
		 $("#btn_upt").css("display","none"); 
		 $("#summernote").code("");	
		 
		 $("#view_yn").val("").prop("selected", true);
		 selbox(0, '');
		 $("#sort_seq").val("").prop("selected", true);
		 selbox(1, '');
		 $("#sta_t").val("00").prop("selected", true);
		 selbox(2, '00');
		 $("#sta_m").val("00").prop("selected", true);
		 selbox(3, '00');
		 $("#eta_t").val("00").prop("selected", true);
		 selbox(4, '00');
		 $("#eta_m").val("00").prop("selected", true);
		 selbox(5, '00'); 
		 $("#bnnr_id").val("");	
		 
	 }
} 
 

</script>
</body> 
</html>