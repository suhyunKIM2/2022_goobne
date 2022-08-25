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
                        <h1 class="h3 mb-0 text-gray-900">공지사항</h1>
                    </div>
                    <div class="col-xl-4 col-lg-5">
		                
	                <div class="tab-content">
	                  <div class="tab-pane fade show active">
						<form id="brdForm" name="brdForm"  method="post">
			                <input type="hidden" id="seq" name="seq"/>
			                <input type="hidden" id="checkArr" name="checkArr"/>
		                </form>   
	                      <ul class="list_inline" style="text-align: right;">
                            <li style="float:left;">
                            <a href="javascript:brdWrite();" class="btn btn-info btn-icon-split">
                                    <span class="icon text-white-50">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                          <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                          <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                        </svg>
                                    </span>
		                            <span class="text">등록</span>
                                </a>
                            </li>
                            <li>
                             	<select class="selectpicker" id="srch_use_yn" name="use_yn">
                                    <option value="">노출여부</option>
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                              	</select>
                            </li>
                            <li>
	                           	 <select class="selectpicker" id="search_gb" name="search_gb">
	                                <option value="title">제목</option>
	                                <option value="name">작성자</option>
	                                <option value="content">내용</option>
	                             </select>
                             <input type="text" class="search_input" id="search_txt" name="search_txt">
                            </li>
                            <li>
                                <a href="javascript:srchBrdList(1);" class="btn btn-primary btn-icon-split" style="height:42px;line-height: 1.6;">
                                    <span class="text">검색</span>
                                </a>
                            </li>
                          </ul>
	                      
	                          <table class="table table-bordered table_main board_table_list" id="dataTable" width="100%" cellspacing="0">
	                            <colgroup>
	                                <col width="5%">
	                                <col width="10%">
	                                <col width="*">
	                                <col width="10%">
	                                <col width="10%">
	                                <col width="10%">
	                                <col width="10%">
	                            </colgroup>
	                            <thead>
	                                <tr>
	                                	<th class="bg-gray-200"><input type="checkbox" name="chk_all" id="All"><label for="All" ></label></th>
	                                    <th class="bg-gray-200">번호</th>
	                                    <th class="bg-gray-200">제목</th>
	                                    <th class="bg-gray-200">작성자</th>
	                                    <th class="bg-gray-200">작성일</th>
	                                    <th class="bg-gray-200">노출여부</th>
	                                    <th class="bg-gray-200">조회수</th>
	                                 </tr>
	                            </thead>
	                            <!--- 등급별 class "member_card + 1.슈퍼관리자 : member_01 / 2.운영관리자 : member_02 / 3.매장관리자 : member_03 / 4.임직원 : member_04 / 5.일반회원 : member_05" ----> 
	                            <tbody></tbody>
	                        </table>
	                        <% if( "01".equals(user.getUser_type())) { %>
		                      	<ul class="list_inline" style="text-align: right;">
		                          <li style="float:right;">
		                              <a href="javascript:brdDrop('${seq }');" class="btn btn-primary btn-icon-split" style="height:42px;line-height: 1.6;">
		                                  <span class="text">삭제</span>
		                              </a>
		                          </li>
		                        </ul>
	                        <% } %>
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
		srchBrdList(1);
		
		//검색 엔터키 적용
		$("#search_txt").keydown(function(key) {                
    		if (key.keyCode == 13) { 
    			srchBrdList();                   
    		}            
    	});
	});
	
	//조회
	function srchBrdList(pageNum) {
		var search_gb = $("#search_gb").val(); //검색어구분
		var search_txt = $("#search_txt").val().trim(); //검색어
		var use_yn = $('#srch_use_yn').val().trim();
		
		var obj = new Object();
		obj.search_gb = search_gb;
  		obj.search_txt = search_txt;
  		obj.use_yn = use_yn;
  		
		if (pageNum == '' || pageNum == "undefined") {
  			obj.pageNum = "1";
  		} else {
  			obj.pageNum = pageNum;
  		}
		
		obj.listCnt = 10;
  		
		var url = '<%=SystemConstant.SITE_PATH%>/brd/notice/srch_list'
		var data = JSON.stringify(obj);
		
		$.ajax({
				type : "POST",
				url : url,
				data : data,
				contentType: "application/json",
				dataType:"JSON",
				success : function(obj){
					var brdList = obj.result.brdList;
					var brdHtml ="";
					var total_cnt = 0;
					if(brdList.length>0){
						total_cnt = brdList[0].total_cnt;
						for (var i in brdList) {
							brdHtml += '<tr>';
							brdHtml += '<td><input type="checkbox" name="chk" value="' + brdList[i].seq +'" id="ch_1"><label for="ch_1"></label></td>';
  							var rownum=total_cnt -(obj.result.pageNum-1) * obj.result.listCnt - i;
  							brdHtml += '<td>'+ rownum +'</td>'; //번호
							brdHtml += '<td onClick="javascript:brdView(\'' + brdList[i].seq + '\')">';
							brdHtml += brdList[i].title; //제목
							
							if(brdList[i].file01 != null){
								brdHtml += '<span class="ima_icon_svg">';
								brdHtml += '<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">';
								brdHtml += '<path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>';
								brdHtml += '<path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z"/>';
								brdHtml += '</svg>';
								brdHtml += '</span>';
							}
							
							brdHtml += "</td>";
							brdHtml += "<td>";
							brdHtml += brdList[i].name; //작성자
							brdHtml += "</td>";
							brdHtml += "<td>";
							brdHtml += brdList[i].i_time; //작성일
							brdHtml += "</td>";
							brdHtml += "<td>";
							brdHtml += brdList[i].use_yn; //노출여부
							brdHtml += "</td>";
							brdHtml += "<td>";
							brdHtml += numberFormatComma(brdList[i].read_num); //조회수
							brdHtml += "</td>";
							brdHtml += "</tr>";
						}
					}else{
						brdHtml += '<tr><td colspan="9">조회된 공지사항이 존재하지 않습니다.</td></tr>'
					}
					$('#dataTable > tbody').empty();
					console.log(brdHtml);
					$('#dataTable > tbody').html(brdHtml);
					var pagingHTML = createPagingHTML(obj.result.pageNum,total_cnt ,obj.result.listCnt, 'srchBrdList');
					$(".pagination").html(pagingHTML);
					
				},error : function(obj) {
					alert("error");
				}
			});
	}
	
	function brdView(seq){
    	$('#seq').val(seq);
    	document.brdForm.action='<%=SystemConstant.SITE_PATH%>/brd/notice/view'; 
	    document.brdForm.submit();
    }
	
	function brdWrite(){
		$('#seq').val('');
    	document.brdForm.action='<%=SystemConstant.SITE_PATH%>/brd/notice/write'; 
	    document.brdForm.submit();
	}
	
	function brdDrop(seq){
		
		var obj = new Object();
		obj.seq = seq;
		
		var checkArr = [];     // 배열 초기화
		$("input[name='chk']:checked").each(function(i) {
	       if($(this).val()!='on'){  // 전체선택버튼 제외 
	       checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	       }
		});
		 
		obj.checkArr = checkArr;
		console.log(checkArr);
		 
		if(checkArr.length == null ||  checkArr.length == 0) {
			alert("삭제할 공지사항을 선택해주세요.");
			return;
		}
		 
		var data = JSON.stringify(obj);
	  	var url = "<%=SystemConstant.SITE_PATH%>/brd/notice/drop";
	  	  
	  	if(confirm("공지사항을 삭제 하시겠습니까?")) {
	  		ajaxCall(url, data, brdDropCallBack, errorCallBack, "[공지사항 삭제]");
	  	}
	}

	function brdDropCallBack(){
		alert("삭제 완료하였습니다.");
		location.reload();
	}

</script>
</body> 
</html> 
