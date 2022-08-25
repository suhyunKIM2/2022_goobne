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
                        <h1 class="h3 mb-0 text-gray-900">배너관리</h1>
                    </div> 
                    <div class="col-xl-4 col-lg-5"> 
                    <div class="tab-content">
                      <div class="tab-pane fade show active">
                          <form name="myform" id="myform" action="">
                          <table class="table table-bordered table_S_box banner_table" id="dataTable" width="100%" cellspacing="0">
                                <tr>
                                   <th class="bg-gray-200">배너등록</th>
                                   <td>
                                      <!-- 공통코드 -->
                                    <select class="selectpicker" id="bnnr_type" name="bnnr_type" class="selectpicker" onchange="bannertp()">
                                    </select>
                                   </td> 
                                   <th class="bg-gray-200">순서</th>
                                   <td>
                                      <select id="sort_seq" class="selectpicker">
                                            <c:forEach var="seq" begin="1" end="10" step="1">
                                               <option value="${seq}">${seq}</option>
                                            </c:forEach> 
                                       </select>  
                                    </td>
                                 </tr> 
                                 
                                 <tr>
                                    <th class="bg-gray-200">배너명</th>
                                    <td >
                                      <input type="text" id="bnnr_nm" maxlength="100" style="width:50%;">
                                    </td>
                                    <th class="bg-gray-200">서브 배너명</th>
                                    <td>
                                      <input type="text" id="sub_bnnr_nm" maxlength="50" style="width:50%;">
                                    </td>
                                 </tr>
                                 
                                <tr>
                                    <th class="bg-gray-200" rowspan="2">PC 배너</th>
                                    <td style="padding: 1rem 0.75rem;">
                                        <div style="color: #999;" class="size_info_back_pc">img Size : <span> 0px X 0px</span></div>
                                        <div class="preview_img_div preview_img_div_table preview_img_div_banner" >
                                            <!--  이미지 첨부 시 div 내용 추가, id="imgbox0", label id="img0" 순번 증가 -->
                                            <div class="filebox bs3-primary preview-image" id="imgbox0">
	                                            <span class="img" id="img_view"></span>
	                                            <input class="upload-name" id="file_vnm" value="파일선택" disabled="disabled" style="width: 200px;">
												<label id="img0" exts="png,gif,jpg,jpeg">업로드</label>
												<!-- <label for="input_file">업로드</label> -->
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
										    <!--  이미지 첨부 시 div 내용 추가, id="imgbox0", label id="img0" --> 
										    
                                        </div>
                                     </td>
                                     <td colspan="2" style="padding: 1rem 0.75rem;">
                                        <div class="div_bg">
                                        <div style="color: #999;" class="size_info_back_pc_center">Background Size : <span> 0px X 0px</span></div>
                                        <div class="preview_img_div preview_img_div_table preview_img_div_banner" > 
                                            <!--  이미지 첨부 시 div 내용 추가, id="imgbox0", label id="img0" 순번 증가 -->
                                            <div class="filebox bs3-primary preview-image" id="imgbox2">
	                                            <span class="img" id="img_view"></span>
	                                            <input class="upload-name" id="file_vnm" value="파일선택" disabled="disabled" style="width: 200px;">
												<label id="img2" exts="png,gif,jpg,jpeg">업로드</label>
												<!-- <label for="input_file">업로드</label> -->
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
										    <!--  이미지 첨부 시 div 내용 추가, id="imgbox0", label id="img0" -->
                                          </div>
                                          </div> 
                                     </td> 
                                 </tr>
                                 
                                 <tr>
                                    <td colspan="3">
                                        <input type="text" id="pc_lnk_url" style="width:84.6%;" maxlength="200" placeholder=" url주소를 입력 해 주세요.">
                                        <select id="pc_win_gb" class="selectpicker" >
                                            <option value="self">현재창열기</option>
                                            <option value="_new">새창열기</option>
                                        </select>   
                                     </td>
                                 </tr>
                                 <tr>
                                    <th class="bg-gray-200" rowspan="2">mobile 배너</th>
                                    
                                    <td style="padding: 1rem 0.75rem;">
                                      <div style="color: #999;" class="size_info_back_mo">img Size : <span> 0px X 0px</span></div>
                                        <div class="preview_img_div preview_img_div_table preview_img_div_banner" > 
                                            <div class="filebox bs3-primary preview-image" id="imgbox1">
	                                            <span class="img" id="img_view"></span>
	                                            <input class="upload-name" id="file_vnm" value="파일선택" disabled="disabled" style="width: 200px;">
												<label id="img1" exts="png,gif,jpg,jpeg">업로드</label>
												<!-- <label for="input_file">업로드</label> -->
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
                                        </div>
                                     </td>
                                     <td colspan="2" style="padding: 1rem 0.75rem;">
                                        <div class="div_bg">
                                        <div style="color: #999;"  class="size_info_back_mo_center">Background Size : <span> 0px X 0px</span></div>
                                        <div class="preview_img_div preview_img_div_table preview_img_div_banner" >
                                          
                                            <div class="filebox bs3-primary preview-image" id="imgbox3">
	                                            <span class="img" id="img_view"></span>
	                                            <input class="upload-name" id="file_vnm" value="파일선택" disabled="disabled" style="width: 200px;">
												<label id="img3" exts="png,gif,jpg,jpeg">업로드</label>
												<!-- <label for="input_file">업로드</label> -->
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
                                          </div>
                                          </div>
                                     </td> 
                                 </tr>
                                 <%-- 파일첨부 테스트
                                 <tr>
                                    <th class="bg-gray-200" rowspan="2">file 업로드 테스트</th>
                                    <td colspan="5" style="padding: 0 0.75rem;">
                                        <div class="preview_img_div preview_img_div_table" >
                                            <!-- <div class="filebox bs3-primary preview-image"> 
                                              <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">

                                              <label for="input_file_02">업로드</label> 
                                              <input type="file" id="input_file_02" class="upload-hidden"> 
                                            </div> -->   
                                            
                                            <div class="filebox bs3-primary preview-image" id="filebox0"> 
	                                            <input class="upload-name" id="file_vnm" value="파일선택" disabled="disabled" style="width: 200px;">
												<label id="file0" exts="png,gif,jpg,jpeg">업로드</label>
												<!-- <label for="input_file">업로드</label> -->
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
										                 
                                        </div>
                                     </td>
                                 </tr>
                                  --%>
                                 
                                 <tr>
                                    <td colspan="3">
                                        <input type="text" id="mobile_lnk_url" maxlength="200" style="width:84.6%;" placeholder=" url주소를 입력 해 주세요.">
                                        <select id="mobile_win_gb" class="selectpicker" >
                                            <option value="self">현재창열기</option>
                                            <option value="_new">새창열기</option>
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
                                     <th class="bg-gray-200">노출</th>
                                    <td>
                                       <select id="show_yn" class="selectpicker">
                                            <option value="Y">Y</option><!---노출--->   
                                            <option value="N">N</option><!---비노출--->
                                        </select> 
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
                            <h3>배너 리스트 현황</h3> 
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
                                        <div class="banner_s_01">
                                          <!-- 공통코드 -->
	                                    <select class="selectpicker" id="bnnr_type_s" name="bnnr_type_s" class="selectpicker" >
	                                    </select> 
                                        </div>
                                       <div class="banner_s_02">
                                           <input type="text" placeholder="배너명" id="bnnr_nm_s" maxlength="30" style="vertical-align: middle;padding-left: 2%;">                                           
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
                                                    <a href="#" class="btn btn-primary btn-icon-split" style="height:42px;line-height: 1.6;" onclick="javascript:searchBanner();">
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
                                    <col width="20%">
                                    <col width="10%">
                                    <col width="10%">
                                    <col width="5%">
                                    <col width="">
                                    <col width="" style="min-width:90px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th class="bg-gray-200">번호</th>                                        
                                        <th class="bg-gray-200">순서</th>
                                        <th class="bg-gray-200">등록위치</th>
                                        <th class="bg-gray-200">배너이름</th>
                                        <th class="bg-gray-200">PC</th>
                                        <th class="bg-gray-200">MOBILE</th>
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
<jsp:include page="/WEB-INF/views/include/footer_script.jsp"></jsp:include>
<!-- End bootstrap footer script  -->
   
<script type="text/javascript"> 
  $(document).ready(function () {
	  var date = new Date();  	
	  var edate = new Date(date.setMonth(date.getMonth()+1));
	  var sdate = new Date(date.setMonth(date.getMonth()-2));
	  $("#datepicker").datepicker( "setDate", sdate);
	  $("#datepicker2").datepicker( "setDate", edate);
      $("#datepicker3").datepicker( "setDate", sdate);
      $("#datepicker4").datepicker( "setDate", edate);
      
	   var param = new Object();
	   param.define_id = 'BNNR_TYPE'; // 배너유형(검색select)
	   param.use_yn ='Y';
	   getCodeListSelBox($("#bnnr_type"), param, "배너유형을 선택해주세요", "");
	   
	   param = new Object();
	   param.define_id = 'BNNR_TYPE'; // 배너유형(검색select)
	   param.use_yn ='Y';
	   getCodeListSelBox($("#bnnr_type_s"), param, "배너유형을 선택해주세요", "");
	  
	   var url = "<%=SystemConstant.IMG_UPLOAD%>"; 
	   imgUpload('img0', '0', url);	  //이미지 업로드 call
	   imgUpload('img1', '1', url);	  //이미지 업로드 call
	   imgUpload('img2', '2', url);	  //이미지 업로드 call
	   imgUpload('img3', '3', url);	  //이미지 업로드 call
	  
	  //파일 업로드 테스트
	  //url = "<%=SystemConstant.FILE_UPLOAD%>";
	  //fileUpload('file0', '0', url);   //file 업로드 call
	  bannerList(1);
	   
	  $('[data-value="메인배너"]').click(function(){
      
      }); 
      
      $('[data-value="20"]').click(function(){
      $(".size_info_back_pc").html("Background Size : <span> 0px X 0px</span>").css('color','#999');
      $(".size_info_back_mo").html("Background Size : <span> 0px X 0px</span>").css('color','#999');
      $(".size_info_back_pc_center").html("img Size : <span> 1200px X 500px</span>").css('color','#c31113');
      $(".size_info_back_mo_center").html("img Size : <span> 0px X 0px</span>").css('color','#999');
      }); 
      
      $('[data-value="30"]').click(function(){
      $(".size_info_back_pc").html("Background Size : <span> 0px X 0px</span>").css('color','#999');
      $(".size_info_back_mo").html("Background Size : <span> 0px X 0px</span>").css('color','#999');
      $(".size_info_back_pc_center").html("img Size : <span> 1000px X 166px</span>").css('color','#c31113');
      $(".size_info_back_mo_center").html("img Size : <span> 0px X 0px</span>").css('color','#999');
      });
      
      $('[data-value="30"]').click(function(){
      $(".size_info_back_pc").html("Background Size : <span> 0px X 0px</span>").css('color','#999');
      $(".size_info_back_mo").html("Background Size : <span> 0px X 0px</span>").css('color','#999');
      $(".size_info_back_pc_center").html("img Size : <span> 1080px X 1080px</span>").css('color','#c31113');
      $(".size_info_back_mo_center").html("img Size : <span> 0px X 0px</span>").css('color','#999');
      });
      
  });  
  
/*
 * 등록 처리
 */
function regBanner(){
	var bnnrObj = new Object();	
	var bnnr_id = $('#bnnr_id').val().trim();
	var bnnr_type = $('#bnnr_type').val().trim();
	var bnnr_nm = $('#bnnr_nm').val().trim();
	var pc_lnk_url = $('#pc_lnk_url').val().trim();
	var mobile_lnk_url = $('#mobile_lnk_url').val().trim();
	
	var sta_dt = $('#datepicker').val().trim();
	var end_dt = $('#datepicker2').val().trim();
	var sta_t = $('#sta_t').val().trim();
	var end_t = $('#end_t').val().trim();
	var sta_m = $('#sta_m').val().trim();
	var end_m = $('#end_m').val().trim();	 
	var sub_bnnr_nm = $('#sub_bnnr_nm').val().trim();
	if( bnnr_type == "" ) {
		alert("배너유형이 정의되지 않았습니다. 배너유형을 선택해 주세요");
	    return;
    }
	if( bnnr_nm == "" ) {
		alert("배너명을 입력해 주세요");
	    return;
    }
	if( $('#bnnr_type').val() == '50' ) {  //굽뉴스는 서브배너명이 필요함
		if( sub_bnnr_nm == "" ) {
			alert("서브 배너명을 입력해 주세요");
		    return;
	    }
	}
	if( pc_lnk_url == "" ) {
		alert("PC배너 이동 URL을 입력해 주세요");
	    return;
    }
	if( $('#bnnr_type').val() == '10' ) {
		if( mobile_lnk_url == "" ) {
			alert("mobile 배너 이동 URL을 입력해 주세요");
		    return;
	    }
	}
	
	// 이미지 배열 처리 : 이미지 여러개 첨부하는 경우
	var imgObj = $('.tab-content .filebox');    
	var imgCnt = imgObj.length;
	
	var imgList = new Array();
	if (imgCnt != null && imgCnt > 0) {
		for (var i = 0; i < imgCnt; i++) {
			
			// 이미지 배열 처리 : 이미지 여러개 첨부하는 경우
			var optImgObj = new Object();
			var file_tp = imgObj.eq(i).find("input[id='file_tp']").val().trim();			
			var db_file_path = imgObj.eq(i).find("input[id='db_file_path']").val().trim();
			var ext = imgObj.eq(i).find("input[id='ext']").val().trim();
			var file_mv_yn = imgObj.eq(i).find("input[id='file_mv_yn']").val().trim();
			var file_nm = imgObj.eq(i).find("input[id='file_nm']").val().trim();
			var file_size = imgObj.eq(i).find("input[id='file_size']").val().trim();
			var mv_sccss = imgObj.eq(i).find("input[id='mv_sccss']").val().trim();
			var org_file_nm = imgObj.eq(i).find("input[id='org_file_nm']").val().trim();
			var tmp_file_url = imgObj.eq(i).find("input[id='tmp_file_url']").val().trim();
			var tmp_file_pth = imgObj.eq(i).find("input[id='tmp_file_pth']").val().trim();
			var real_file_url = imgObj.eq(i).find("input[id='real_file_url']").val().trim();
			var real_file_pth = imgObj.eq(i).find("input[id='real_file_pth']").val().trim();

			optImgObj.file_tp = file_tp;
			optImgObj.db_file_path = db_file_path;
			optImgObj.ext = ext;
			optImgObj.file_mv_yn = file_mv_yn;
			optImgObj.file_nm = file_nm;
			optImgObj.file_size = file_size;
			optImgObj.mv_sccss = mv_sccss;
			optImgObj.org_file_nm = org_file_nm;
			optImgObj.tmp_file_url = tmp_file_url;
			optImgObj.tmp_file_pth = tmp_file_pth;
			optImgObj.real_file_url = real_file_url;
			optImgObj.real_file_pth = real_file_pth;
			imgList.push(optImgObj); 
			//등록일때만 이미지 필수체크			 
			//pc, mobile 배너명 set
			if( i == 0 ) { 
				if( file_nm == "" && bnnr_id == "" ) {
					alert("PC배너 이미지를 첨부해주세요.");
				    return;
			    } 
				bnnrObj.pc_img_pth = file_nm;
				bnnrObj.pc_tmp_pth = tmp_file_pth;
			} 
			//if( $('#bnnr_type').val() == '10' || $('#bnnr_type').val() == '50' ) {  //메인배너, 굽뉴스는 모바일 이미지 추가 필요
				if( i == 2 ) { 			
					if( file_nm == "" && bnnr_id == "" ) {
						alert("mobile배너 이미지를 첨부해주세요.");
					    return;
				    }
					bnnrObj.mobile_img_pth = file_nm;
					bnnrObj.mobile_tmp_pth = tmp_file_pth;
				}   
			//}	
			if( $('#bnnr_type').val() == '10' ) {
				//배너 bgimg PC
				if( i == 1 ) {
					if( file_nm == "" && bnnr_id == "" ) {
						alert("PC배너 배경 이미지를 첨부해주세요.");
					    return;
				    }
					bnnrObj.pc_img_bg = file_nm;
					bnnrObj.pc_tmp_bg = tmp_file_pth;
				}
				//배너 bgimg 모바일
				if( i == 3 ) {
					if( file_nm == "" && bnnr_id == "" ) {
						alert("mobile배너 배경 이미지를 첨부해주세요.");
					    return;
				    }
					bnnrObj.mobile_img_bg = file_nm;
					bnnrObj.mobile_tmp_bg = tmp_file_pth;
				}
			}		
	   }
    } 
	bnnrObj.bnnr_type = bnnr_type;
	bnnrObj.bnnr_nm = bnnr_nm;
	//bnnrObj.pc_img_pth = pc_img_pth;
	bnnrObj.pc_win_gb = $("#pc_win_gb option:selected").val();
	bnnrObj.pc_lnk_url = pc_lnk_url;
	//bnnrObj.mobile_img_pth = mobile_img_pth;
	bnnrObj.mobile_win_gb = $("#mobile_win_gb option:selected").val();
	bnnrObj.mobile_lnk_url = mobile_lnk_url;
	bnnrObj.s_dtm = sta_dt.replace(/\-/g,'')+sta_t+sta_m;
	bnnrObj.e_dtm = end_dt.replace(/\-/g,'')+end_t+end_m;
	bnnrObj.view_yn = $('#show_yn').val().trim();
	bnnrObj.ord1 = $('#sort_seq').val().trim();
	bnnrObj.bnnr_id = bnnr_id; 
	bnnrObj.sub_bnnr_nm = sub_bnnr_nm;
	
	if( bnnr_type == '10' && $('#sort_seq').val().trim() == '1' ) {
		alert('메인배너 순서 1번은 태그로  등록되는 배너입니다. \n순서 2번부터 이미지로 등록 가능합니다.');
		return;
	}
	
	// 이미지 여러개 첨부하는 경우
	var bnnrData = new Object();
	bnnrData.bnnrObj = bnnrObj;
	bnnrData.bnnrImg = imgList; 
	 	
	var url = '<%=SystemConstant.SITE_PATH%>/bnnr/bnrReg';
	var data = JSON.stringify(bnnrData);
	if(confirm("배너 내용을 저장합니다.")) ajaxCall(url, data, regOkCallBack, errorCallBack, '배너저장');	
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
			location.href="<%=SystemConstant.SITE_PATH%>/bnnr/banner";
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
	
	obj.bnnr_type = $('#bnnr_type_s').val().trim();
	obj.bnnr_nm = $('#bnnr_nm_s').val().trim();
	if( sta_dt.length > 9 ) obj.s_dtm = sta_dt.replace(/\-/g,'')+sta_t+sta_m;
	if( end_dt.length > 9 ) obj.e_dtm = end_dt.replace(/\-/g,'')+end_t+end_m;
	
	var url = "<%=SystemConstant.SITE_PATH%>/bnnr/list";
	var data = JSON.stringify(obj); 
	ajaxCall(url, data, bnrListCallBack, errorCallBack, '배너리스트호출');
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
	var url = "<%=SystemConstant.SITE_PATH%>/bnnr/list";
	var data = JSON.stringify(obj); 
	ajaxCall(url, data, bnrListCallBack, errorCallBack, '배너리스트호출');
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
				bnrHtml += "	<td><a href='"+bnrObj.pc_lnk_url+"' target='"+bnrObj.pc_win_gb+"'><img src='"+CONTEXT_PATH+bnrObj.pc_img_pth+"' width='200'></a></td>\n";
				bnrHtml += "	<td><a href='"+bnrObj.mobile_lnk_url+"' target='"+bnrObj.mobile_win_gb+"'><img src='"+CONTEXT_PATH+bnrObj.mobile_img_pth+"' width='200'></a></td>\n";
				bnrHtml += "	<td>"+bnrObj.view_yn+"</td>\n";
				bnrHtml += "	<td>" + formatYYYYMMDDHH24MI(bnrObj.s_dtm, '<%=SystemConstant.DATE_SPLIT%>') + " ~ " + formatYYYYMMDDHH24MI(bnrObj.e_dtm, '<%=SystemConstant.DATE_SPLIT%>')+ "</td>\n";
				bnrHtml += "	<td> <a href=\"javascript:bnrDel('"+bnrObj.bnnr_id+"');\" class='d-sm-inline-block btn btn-sm btn-secondary shadow-sm mb_g' style='margin-right:5px;'>삭제</a><a href=\"javascript:bnrView('"+bnrObj.bnnr_id+"');\" class='d-sm-inline-block btn btn-sm btn-primary shadow-sm mb_g'>수정</a></td>\n";
    			bnrHtml += "</tr>\n";
			}
		} else {
			bnrHtml += "<tr>\n";
			bnrHtml += "	<td colspan='10'>등록된 배너가 없습니다.</td>\n";
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
	if(confirm("배너를 삭제합니다.")) ajaxCall(url, data, bnrDelCallBack, errorCallBack, '배너리스트호출');
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
	ajaxCall(url, data, bnrViewCallBack, errorCallBack, '배너상세');
}
function bnrViewCallBack(obj) {
	if (obj.result == common._trans_success_code) {
		var bnrView = obj.body.bnrView;
		if( bnrView != '' && bnrView != null ){
			$("#bnnr_type").val(bnrView.bnnr_type).prop("selected", true);
			selbox(0, bnrView.bnnr_type);			 			
			$("#bnnr_nm").val(bnrView.bnnr_nm);
			$("#sub_bnnr_nm").val(bnrView.sub_bnnr_nm);	
			$("#pc_win_gb").val(bnrView.pc_win_gb);
			$("#pc_win_gb").val(bnrView.pc_win_gb).prop("selected", true);
			selbox(2, bnrView.pc_win_gb);
			$("#pc_img_pth").val(bnrView.pc_img_pth);	
			$("#pc_lnk_url").val(bnrView.pc_lnk_url);
			if( bnrView.bnnr_type == '10' ) $("#pc_img_bg").val(bnrView.pc_img_bg);  //메인배너만 bg 등록
			$("#mobile_win_gb").val(bnrView.mobile_win_gb).prop("selected", true);
			selbox(3, bnrView.mobile_win_gb); 
			$("#mobile_lnk_url").val(bnrView.mobile_lnk_url);
			$("#mobile_img_pth").val(bnrView.mobile_img_pth);
			if( bnrView.bnnr_type == '10' ) $("#mobile_img_bg").val(bnrView.mobile_img_bg); //메인배너만 bg 등록
			$("#sort_seq").val(bnrView.ord1).prop("selected", true);
			selbox(1, bnrView.ord1);			
			$("#view_yn").val(bnrView.view_yn).prop("selected", true);
			selbox(8, bnrView.view_yn);			
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
			selbox(4, stime);
			selbox(5, smin);
			selbox(6, etime);
			selbox(7, emin);  
			var divTag = "<div class='upload-display'><div class='upload-thumb-wrap'><img src='"+CONTEXT_PATH+bnrView.pc_img_pth+"' class='upload-thumb'></div></div>";
			$("#imgbox0 span[id='img_view'").html(divTag);
			divTag = "<div class='upload-display'><div class='upload-thumb-wrap'><img src='"+CONTEXT_PATH+bnrView.mobile_img_pth+"' class='upload-thumb'></div></div>";
			$("#imgbox1 span[id='img_view'").html(divTag);
			if( bnrView.bnnr_type == '10' ) {  
				divTag = "<div class='upload-display'><div class='upload-thumb-wrap'><img src='"+CONTEXT_PATH+bnrView.pc_img_bg+"' class='upload-thumb'></div></div>";
				$("#imgbox2 span[id='img_view'").html(divTag);
				divTag = "<div class='upload-display'><div class='upload-thumb-wrap'><img src='"+CONTEXT_PATH+bnrView.mobile_img_bg+"' class='upload-thumb'></div></div>";
				$("#imgbox3 span[id='img_view'").html(divTag);
		    }	
			bannertp();
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
		 $("#bnnr_type_s").val("").prop("selected", true);
		 selbox(9, '');
		 $("#sta_t_s").val("00").prop("selected", true);
		 selbox(10, '00');		
		 $("#sta_m_s").val("00").prop("selected", true);
		 selbox(11, '00');
		 $("#end_t_s").val("00").prop("selected", true);
		 selbox(12, '00');
		 $("#end_m_s").val("00").prop("selected", true);
		 selbox(13, '00');
	 } else {
		 $('#myform')[0].reset();
		 $("#imgbox0 span[id='img_view'").html("");
		 $("#imgbox1 span[id='img_view'").html(""); 
		 $("#imgbox2 span[id='img_view'").html("");
		 $("#imgbox3 span[id='img_view'").html(""); 
		 $("#btn_reg").css("display","");
		 $("#btn_upt").css("display","none");
		 $("#bnnr_type").val("").prop("selected", true);
		 selbox(0, '');
	 }
} 

function bannertp(){ 
	if( $('#bnnr_type').val() == '10' ) {   //메인배너 이미지 사이즈
		$(".div_bg").show(); 
		$(".size_info_back_pc").html("img Size : <span> 1200px X 750px</span>").css('color','#c31113');
	    $(".size_info_back_mo").html("img Size : <span> 509px X 956px</span>").css('color','#c31113');
	    $(".size_info_back_pc_center").html("Background Size : <span> 1920px X 940px</span>").css('color','#c31113');
	    $(".size_info_back_mo_center").html("Background Size : <span> 642px X 876px</span>").css('color','#c31113');
	} else if( $('#bnnr_type').val() == '20' ) {  //오븐메뉴 이미지 사이즈
		$(".div_bg").hide(); 
		$(".size_info_back_pc").html("img Size : 1200px X 500px</span>").css('color','#c31113');
	    $(".size_info_back_mo").html("img Size : 1200px X 500px</span>").css('color','#c31113');   
	    $(".size_info_back_pc_center").html("");
	    $(".size_info_back_mo_center").html("");
	} else if( $('#bnnr_type').val() == '30' ) {  //굽스터 이미지 사이즈
		$(".div_bg").hide(); 
		$(".size_info_back_pc").html("img Size : 1080px X 1080px</span>").css('color','#c31113');
	    $(".size_info_back_mo").html("img Size : 1080px X 1080px</span>").css('color','#c31113');   
	    $(".size_info_back_pc_center").html("");
	    $(".size_info_back_mo_center").html("");
	} else if( $('#bnnr_type').val() == '40' ) {  //굽튜브 이미지 사이즈
		$(".div_bg").hide(); 
		$(".size_info_back_pc").html("img Size : 490px X 276px</span>").css('color','#c31113');
	    $(".size_info_back_mo").html("img Size : 490px X 276px</span>").css('color','#c31113');   
	    $(".size_info_back_pc_center").html("");
	    $(".size_info_back_mo_center").html("");
	} else if( $('#bnnr_type').val() == '50' ) {  //굽뉴스 이미지 사이즈
		$(".div_bg").hide(); 
		$(".size_info_back_pc").html("img Size : 400px X 400px</span>").css('color','#c31113');
	    $(".size_info_back_mo").html("img Size : 400px X 400px</span>").css('color','#c31113');   
	    $(".size_info_back_pc_center").html("");
	    $(".size_info_back_mo_center").html("");	
	} else {
		$(".div_bg").hide(); 
	}  
}  

</script>
</body> 
</html>