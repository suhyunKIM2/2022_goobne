<%@ page contentType="text/html; charset=utf8" %>
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
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
                
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
                        <h1 class="h3 mb-0 text-gray-900">공지사항 게시판</h1>
                    </div>
                    <div class="col-xl-4 col-lg-5">
		                
	                <div class="tab-content">
	                  <div class="tab-pane fade show active">
						<form id="notiForm" name="notiForm"  method="post">
		                <input type="hidden" id="seq" name="seq"/>
	                      <ul class="list_inline" style="text-align: right;">
                            <li style="float:left;">
                            <a href="javascript:notiWrite();" class="btn btn-info btn-icon-split">
                                    <span class="icon text-white-50">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                          <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                          <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                        </svg>
                                    </span>
		                            <span class="text">등록</span>
                                </a>
                            </li>
                           <!--   <li>
                             	<span class="text">노출여부</span>
                             	<select class="selectpicker" id="srch_use_yn" name="srch_use_yn">
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                              	</select>
                            </li> -->
                            <li>
	                           	 <select class="selectpicker" id="search_gb" name="search_gb">
	                                <option value="title">제목</option>
	                                <option value="name">작성자</option>
	                             </select>
                             <input type="text" class="search_input" id="search_txt" name="search_txt">
                            </li>
                            <li>
                                <a href="javascript:srchNotiList(1);" class="btn btn-primary btn-icon-split" style="height:42px;line-height: 1.6;">
                                    <span class="text">검색</span>
                                </a>
                            </li>
                          </ul>
	                      </form>   
	                          <table class="table table-bordered table_main board_table_list" id="listTable" width="100%" cellspacing="0">
	                            <%-- <colgroup>
	                                <col width="5%">
	                                <col width="10%">
	                                <col width="*">
	                                <col width="10%">
	                                <col width="10%">
	                                <col width="10%">
	                            </colgroup> --%>
	                            <thead>
	                                <tr>
	                                	<th class="bg-gray-200"><input type="checkbox" name="chk_all" id="All"><label for="All" ></label></th>
	                                    <th class="bg-gray-200">번호</th>
	                                    <th class="bg-gray-200">제목</th>
	                                    <th class="bg-gray-200">작성자</th>
	                                    <th class="bg-gray-200">작성일</th>
	                                    <th class="bg-gray-200">조회수</th>
	                                 </tr>
	                            </thead>
	                            <!--- 등급별 class "member_card + 1.슈퍼관리자 : member_01 / 2.운영관리자 : member_02 / 3.매장관리자 : member_03 / 4.임직원 : member_04 / 5.일반회원 : member_05" ----> 
	                            <tbody></tbody>
	                        </table>
	                      	  <ul class="list_inline" style="text-align: right;">
	                            <li style="float:right;">
	                                <a href="javascript:brdNotiDrp();" class="btn btn-primary btn-icon-split" style="height:42px;line-height: 1.6;">
	                                    <span class="text">삭제</span>
	                                </a>
	                            </li>
	                          </ul>
		                      <div class="container_page">
			                       <div class="row row_page">
			                           <div class="col">
			                               <ul class="pagination">
			                               </ul>
			                           </div>
			                       </div>
			                   </div>
	                       
	                     </div>
	                 </div>
	                </div>
                </div>
            </div>
            <!-- End of Main Content -->

            <!-- Start Footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
            <!-- End Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
  <!-- Start bootstrap footer script  -->
    <jsp:include page="/WEB-INF/views/include/footer_script.jsp"></jsp:include>
    <!-- End bootstrap footer script  -->
    
	<script type="text/javascript">
	$(document).ready(function(){
		srchNotiList(1);
	});
	
	//조회
	function srchNotiList(pageNum) {
		var obj = new Object();
		
		obj.title = $('#srch_title').val();
		obj.i_user = $('#srch_i_user').val();
		obj.use_yn = $('#srch_use_yn').val();
		
		if (pageNum == '' || pageNum == "undefined") {
  			obj.pageNum = "1";
  		} else {
  			obj.pageNum = pageNum;
  		}
		
		obj.listCnt = 10;
  		
		var url = '<%=SystemConstant.SITE_PATH%>/brd/srch_noti_list'
		var data = JSON.stringify(obj);	
		
		$.ajax({
				type : "POST",
				url : url,
				data : data,
				contentType: "application/json",
				dataType:"JSON",
				success : function(obj){
					var notiList = obj.result.noti_list;
					var notiHtml ="";
					var total_cnt = 0;
					if(notiList.length>0){
						total_cnt = notiList[0].total_cnt;
						for (var i in notiList) {
							notiHtml += '<tr onClick="javascript:notiView(\'' + notiList[i].seq + '\')">';
							notiHtml += '<td><input type="checkbox" name="chk" id="ch_1"><label for="ch_1"></label></td>';
  							var rownum=total_cnt -(obj.result.pageNum-1) * obj.result.listCnt - i;
  							notiHtml += '<td>'+ rownum +'</td>'; //번호
							notiHtml += "<td>";
							notiHtml += notiList[i].title; //제목
							notiHtml += "</td>";
							notiHtml += "<td>";
							notiHtml += notiList[i].name; //작성자
							notiHtml += "</td>";
							notiHtml += "<td>";
							notiHtml += formatYYYYMMDDHH24MISS(notiList[i].i_time , common._datesplit); //작성일
							notiHtml += "</td>";
							notiHtml += "<td>";
							notiHtml += notiList[i].read_num; //조회수
							notiHtml += "</td>";
							notiHtml += "</tr>";
						}
					}else{
						notiHtml += '<tr><td colspan="9">조회된 회원이 존재하지 않습니다.</td></tr>'
					}
					$('#listTable > tbody').empty();
					console.log(notiHtml);
					$('#listTable > tbody').html(notiHtml);
					var pagingHTML = createPagingHTML(obj.result.pageNum,total_cnt ,obj.result.listCnt, 'srchNotiList');
					$(".pagination").html(pagingHTML);
					
				},error : function(obj) {
					alert("error");
				}
			});
	}
	
	function notiView(seq){
    	$('#seq').val(seq);
    	document.notiForm.action='<%=SystemConstant.SITE_PATH%>/brd/noti_view'; 
	    document.notiForm.submit();
    }
	
	function notiWrite(){
		$('#seq').val('');
    	document.notiForm.action='<%=SystemConstant.SITE_PATH%>/brd/noti_write'; 
	    document.notiForm.submit();
	}
</script>
</body> 
</html> 
