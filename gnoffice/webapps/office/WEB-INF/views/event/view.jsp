<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant
             , com.gncns.goobne.common.session.SessionFactory
             , com.gncns.goobne.common.session.AdminUser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	SessionFactory sessFtr = new SessionFactory(request);
    AdminUser user = sessFtr.getAdminUser();
	String staticUrl = SystemConstant.getStaticUrl();
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
				<form id="frm" name="frm" method="post">
					<input type="hidden" name="seq" id="seq"/>
				</form>
                <!-- Start Topbar 공통 top-->
                <div class="ham"></div><jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
                <!-- End Topbar 공통 top-->
                
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 container_auto">
                        <h1 class="h3 mb-0 text-gray-900">이벤트</h1>
                    </div>
                    <div class="col-xl-4 col-lg-5">
                    
                    <div class="tab-content">
                      <div class="tab-pane fade show active">
                          <!--- 등급별 class "member_card + 1.슈퍼관리자 : member_01 / 2.운영관리자 : member_02 / 3.매장관리자 : member_03 / 4.임직원 : member_04 / 5.일반회원 : member_05" ---->
                          <table class="table table-bordered table_main board_table" id="dataTable" width="100%" cellspacing="0">
                           <colgroup>
                                <col width="20%">
                                <col width="80%">
                            </colgroup>
                            <tbody>
                            	<tr>
                                    <th class="bg-gray-200">노출여부</th>
                                    <td>
	                                     <c:if test="${view.use_yn eq 'Y' }">
	                                     <span>노출</span>
	                                     </c:if>
	                                     <c:if test="${view.use_yn eq 'N' }">
	                                     <span>비노출</span>
                                    	 </c:if>
                                 	 </td>
                                </tr>
                                <tr>
                                    <th class="bg-gray-200">댓글여부</th>
                                    <td>
	                                     <c:if test="${view.comment_yn eq 'Y' }">
	                                     <span>사용</span>
	                                     </c:if>
	                                     <c:if test="${view.comment_yn eq 'N' }">
	                                     <span>미사용</span>
                                    	 </c:if>
                                 	 </td>
                                </tr>
                            	<tr>
                            		<th class="bg-gray-200">이벤트기간</th>
                            		<td>
                            			 ${view.s_time } - ${view.e_time }
                            		</td>
                            	</tr>
                                <tr>
                                    <th class="bg-gray-200">서브제목</th>
                                    <td>
                                    	 ${view.sub_title }
                                    </td>
                                </tr>
                                <tr>
                                    <th class="bg-gray-200">제목</th>
                                    <td>
                                    	 ${view.title }
                                    </td>
                                </tr>
                                <tr>
                                    <th class="bg-gray-200">작성자</th>
                                    <td>
                                    <!-- <span class="padding_1rem member_card member_01">슈퍼</span> -->
                                   	 	${view.name }
                                    </td>
                                </tr>
                                <tr>
                                    <th class="bg-gray-200">조회수</th>
                                    <td>
                                    	 ${view.read_num }
                                  	 </td>
                                </tr>
                                <tr>
                                    <th class="bg-gray-200">등록일</th>
                                    <td>
                                    	 ${view.i_time }
                                    </td>
                                </tr>
                                <tr>
                                    <th class="bg-gray-200">리스트 썸네일<span class="small-font block_line">600X600 비율 이미지</span></th>
                                    <td>
                                       <div id="preview" class="view">
                                       		<img src="<%=staticUrl %>${view.file01}">
                                       </div>
                                    </td>
                                </tr>
                                <tr>
                                	<th class="bg-gray-200">첨부파일</th>
                                	<td>
                                		<c:forEach items="${fileList }" var="fileList">
                                		<p class="file_list_p">
                                		<a href="<%=SystemConstant.FILE_DOWNLOAD %>?file_nm=${fileList.file_name }&org_file_nm=${fileList.r_file_name}">
	                                		${fileList.r_file_name }
											<img src="../../resources/img/save.svg">
	                                	</a>
	                                	</p>
			                            </c:forEach>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="bg-gray-200">내용</th>
                                    <td id="contentHtml"></td>
                                </tr>
                                
                            </tbody>
                        </table>  
                          
                        </div>
                         
                     </div>
                 </div>
                  
                 <div class="col-xl-4 col-lg-5" style="text-align: center;margin: 2% auto 5%;">
                            <ul class="list_inline">
                                <li style="float:left;">
                                    <a href="<%=SystemConstant.SITE_PATH%>/brd/event/list" class="btn btn-secondary btn-icon-split btn-S">
                                        <span class="text">목록</span>
                                    </a>
                                </li>
                                <li id="deleteBtn">
                                    <a href="javascript:brdDrop()" class="btn btn-secondary btn-icon-split btn-S">
                                        <span class="text">삭제</span>
                                    </a>
                                </li>
                                <li id="updateBtn">
                                    <a href="javascript:brdWrite('${view.seq }');" class="btn btn-primary btn-icon-split btn-S">
                                       <span class="text">수정</span>
                                    </a>
                                </li>
                                <li style="float:right;"> 
                                    <a href="javascript:brdComment('${view.seq }')" class="btn btn-danger btn-icon-split">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat-square-dots-fill" viewBox="0 0 16 16" style="margin-top:9px;margin-left:11px;">
                                          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.5a1 1 0 0 0-.8.4l-1.9 2.533a1 1 0 0 1-1.6 0L5.3 12.4a1 1 0 0 0-.8-.4H2a2 2 0 0 1-2-2V2zm5 4a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                                        </svg>
                                        <span class="text">댓글보기</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                </div>
                <!-- /.container-fluid -->
                
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

<script type="text/javascript">
	$(document).ready(function(){
		$("#contentHtml").html(toHtml('${view.content}'));
		
		$("#deleteBtn").hide();
		$("#updateBtn").hide();
		
		var user_type = "<%=user.getUser_type()%>";
		var user_id = "<%=user.getUser_id()%>";
		
		//관리자
		if(user_type == "01"){
			$("#deleteBtn").show();
			$("#updateBtn").show();
		//일반
		} else if(user_id == "${view.i_user}"){
			$("#deleteBtn").show();
			$("#updateBtn").show();
		}
	});
	
	//댓글
	function brdComment(seq){
		$('#seq').val(seq);
		document.frm.action='<%=SystemConstant.SITE_PATH%>/brd/event/comment_list'; 
	    document.frm.submit();
	}
	
	//수정
	function brdWrite(seq){
		$('#seq').val(seq);
		document.frm.action='<%=SystemConstant.SITE_PATH%>/brd/event/write'; 
	    document.frm.submit();
	}

	//삭제
	function brdDrop(){
		var obj = new Object();
		obj.seq = "${view.seq}";
		
		var data = JSON.stringify(obj);
		var url = '<%=SystemConstant.SITE_PATH%>/brd/event/drop';
		 
		if( confirm("삭제 하시겠습니까?") ) {
			ajaxCall(url, data, brdDropCallBack, errorCallBack, "[이벤트 삭제]");
		} 
	}

	function brdDropCallBack(obj){
		alert("삭제 완료하였습니다.");
		window.location.href = "<%=SystemConstant.SITE_PATH%>/brd/event/list";
	}
		
</script>

    <!-- Start bootstrap footer script  -->
    <jsp:include page="/WEB-INF/views/include/footer_script.jsp"></jsp:include>
    <!-- End bootstrap footer script  -->

</body> 
</html> 
