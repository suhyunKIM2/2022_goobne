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

    <style>
		.notice__detail .notice__detail-desc img{width:100% !important;    height: auto !important;}
	</style>
    
    <title>공지사항</title>
</head>

<body>
    <!-- start of :: wrap -->
    <div id="wrap">
        <!-- start of :: header -->
        <div id="header">
            <jsp:include page="/WEB-INF/views/include/top.jsp"></jsp:include>            
        </div>
        <!-- end of :: header -->
        <aside class="aside">
           <jsp:include page="/WEB-INF/views/include/nav_right.jsp"></jsp:include>
        </aside>
         <!-- start of :: contents -->
        <div id="content">
        <form id="brdForm" name="brdForm" method="get">
			<input type="hidden" name="bo_seq" id="bo_seq"/>
			<input type="hidden" name="seq" id="seq"/>
		</form>
		
            <article class="l-layout notice">
                <div class="l-inner">
                    <div class="l-title">공지사항</div>
                    <!-- 공지사항 상세영역 영역  -->
                    <section class="notice__detail">
                        <dl class="notice__detail-tit">
                            <dt>${view.title }</dt>
                            <dd>${view.name }</dd>
                            <dd class="l-num">${view.i_time }</dd>
                        </dl>
                        
                        <c:choose>
                      	  <c:when test="${fn:length(fileList) ne 0}">
		                        <ul class="file_list_line">
									<li><b>첨부파일</b></li>
                       		<c:forEach items="${fileList }" var="fileList" varStatus="status">
		                        	<li><a href="/rest/file/download?file_nm=${fileList.file_name }&org_file_nm=${fileList.r_file_name}">${fileList.r_file_name}<img src="/resources/assets/images/icon/save.svg" style="width:15px;margin-left:0.5rem;"></a></li>
			            	</c:forEach>
					            </ul>
					      </c:when>
					    </c:choose>
					    
                        <div class="notice__detail-desc" id="contentTxt">
                        </div>
                        
                        <div class="notice__detail-link">
                            <a href="javascript:brdView('${view.next_no }')" class="link-box prev">
                                <button type="button" class="arrow"></button>
                                <dl>
                                    <dt>다음글</dt>
                                    <dd>${view.next_title }</dd>
                                </dl>
                            </a>
                            <a href="javascript:brdView('${view.pre_no }')" class="link-box next">
                                <button type="button" class="arrow next"></button>
                                <dl>
                                    <dt>이전글</dt>
                                    <dd>${view.pre_title }</dd>
                                </dl>
                            </a>
                        </div>
                <!-----S: 댓글창------>
               		<div id="chat">
                        <div class="chat_form_control">
                            <div class="chat_header"><img src="/resources/assets/images/icon/chat-dots.svg" class="my_icon_svg icon_box chat_box" id="my_icon_svg">댓글</div>
                            <div class="chat_text_box member_table">
                                <textarea class="textarea_style" id="comment_cont" name="comment_cont"></textarea>
                                	<div class="l-btn chat_btn" onclick="brdCommentSave('${view.seq }', 'insert')">등록하기</div>
                            </div>
                            <div class="s_text_G text_size_m">총 <b class="text_color_B" id="total_cnt"></b>건의 댓글이 있습니다.</div>
                        </div>
                        <!------S: 댓글 리스트------->
                        <div class="chat_form_list">
                            <ul class="chat_form_list_ul_box">
                            </ul>
                        </div>
                        </div>
                        
                        <!-- 페이징 영역  -->
	                     <section class="l-paging-num">
	                     </section>
	                     <!-- //페이징 영역  -->
                        <!------E: 댓글 리스트------->
                <!-----E: 댓글창------>
                    </section>
                    <!-- // 공지사항 상세영역 영역  -->
                    <button type="button" class="l-btn notice-list-btn" onclick="location.href='/brd/notice/list';">목록으로</button>
                </div>
            </article>
        </div>
        <!-- end of :: contents -->
       <!-- start of :: footer -->
        <div id="footer" class="sub-footer">
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </div>
            <!-- 참고: 스크립트로 load 됩니다. include 폴더 footer.html  -->
        <!-- end of :: footer -->
        <div id="mobile-nav">
      	  <jsp:include page="/WEB-INF/views/include/tab_bar.jsp"></jsp:include>
            <!-- 참고: 스크립트로 load 됩니다. include 폴더 mobile-nav.html  -->
        </div>
    </div>
    <!-- end of :: wrap -->
    
    <script type="text/javascript">
        $(document).ready(function () {
        	$("#contentTxt").html(toHtml('${view.content}'));
        	//댓글 조회
        	srchCommentList(1);
        	
        	//댓글창 토글
        	if( '${view.comment_yn}' == 'N'){
        		$("#chat").hide();
        	} else if( '${view.comment_yn}' == 'Y'){
        		$("#chat").show();
        	}
        	
        });
   
        
    
         
   	//댓글 조회
   	function srchCommentList(pageNum) {
   		
   		var obj = new Object();
   		obj.seq = "${view.seq}";
   		
   		if (pageNum == '' || pageNum == "undefined") {
     			obj.pageNum = "1";
     		} else {
     			obj.pageNum = pageNum;
     		}
   		
   		obj.listCnt = 10;
     		
   		var url = '/brd/notice/srch_comment_list'
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
   							brdHtml += '<li>';
   							brdHtml += '<dl>';
   							brdHtml += '<dt>';
   							brdHtml += brdList[i].name; //작성자
   							brdHtml += ' <span class="date_text">';
   							brdHtml += brdList[i].i_time; //작성일
   							brdHtml += '</span></dt>';
   							
   							if( "<%=user.getUser_id()%>" == brdList[i].name ){
   	                        	brdHtml += '<dd class="btn_box_dd">';
   	                        	brdHtml += '<ul class="list_info_line">';
   	                        	brdHtml += '<li class="delete_btn" onClick="javascript:brdCommentDelete(\'' + brdList[i].seq + "','" + brdList[i].bo_seq + '\', \'delete\')">';
   	                        	brdHtml += '삭제</li>';
   	                        	brdHtml += '<li class="correction_btn" onClick="javascript:brdCommentUpdate(this,\'' +  brdList[i].seq + '\',\'' + brdList[i].bo_seq  + '\',\'' +  brdList[i].content + '\', \'update\')">';
   	                        	brdHtml += '수정</li>';
   	                        	brdHtml += '</ul></dd>';
   							}
                           	
   							brdHtml += '<dd class="text_box_view">';
   							brdHtml += brdList[i].content; //내용
   							brdHtml += '</dd></dl></li>'
   						}
   					}else{
   					}
   					$('.chat_form_list_ul_box').empty();
   					console.log(brdHtml);
   					$('.chat_form_list_ul_box').html(brdHtml);
   					$('#total_cnt').html(brdList.length);
   					var pagingHTML = createPagingHTML(obj.result.pageNum,total_cnt ,obj.result.listCnt, 'srchCommentList');
   					$(".pagination").html(pagingHTML);
   					
   				},error : function(obj) {
   					alert("error");
   				}
   			});
   	}
    	
	//댓글 등록
	function brdCommentSave(seq, status){
	
		var user_id = "<%=user.getUser_id()%>";
		
		//회원 처리
		if(user_id == "null"){
			alert("회원일 경우 등록 가능합니다.");
			return;
		}
		
		//my_total_cnt 조회
		var cntObj = new Object();
		cntObj.upd_id = user_id;
		cntObj.seq = "${view.seq}";
		
   		var url = '/brd/notice/comment_total_List'
   		var data = JSON.stringify(cntObj);	
   		var my_total_cnt = 0;
   		$.ajax({
   				type : "POST",
   				url : url,
   				data : data,
   				contentType: "application/json",
   				dataType:"JSON",
   			 	async: false,
   				success : function(obj){
   					var brdTotalList = obj.result.brdTotalList;
   					if(brdTotalList.length > 0){
   						my_total_cnt = brdTotalList[0].my_total_cnt;
   					}
   					console.log(my_total_cnt);
   				},error : function(obj) {
   					alert("error");
   				}
   			});
   		
   		//댓글 갯수 체크
		if(my_total_cnt >= 3 ){
			alert("댓글은 게시글당 3개만 입력 가능합니다.");
			return;
		}
		
		//폼체크
		if($("#comment_cont").val() == ""){
			alert("내용을 입력해 주세요.");
			$("#comment_cont").focus();
			return;
		}
		
		var obj = new Object();
		
		obj.seq = "${view.seq}";
		obj.content = $("#comment_cont").val().replace(/(<([^>]+)>)/gi, "");
		obj.status = status;
		
		var data = JSON.stringify(obj);
		var url = '/brd/notice/comment_save';
		
		if(status == 'insert'){
			if (confirm("등록 하시겠습니까?") ) {
				ajaxCall(url, data, brdCommentInsertCallBack, errorCallBack, "[댓글 등록]");
			}
		}
	}
		
    //댓글 수정
	function brdCommentUpdateSave(obj, seq, bo_seq, status){

		var content = $(obj).parent().children().first().val();
	  	
		var obj = new Object();
		var form = $('brdForm')[0];
		var formData = new FormData(form);
		
		obj.seq = seq;
		obj.bo_seq = bo_seq;
		obj.content = content.replace(/(<([^>]+)>)/gi, "");
		obj.status = status;
		
		console.log(obj);
		
		var data = JSON.stringify(obj);
		var url = '/brd/notice/comment_save';
		
		if(status == 'update'){
			if( confirm("수정 하시겠습니까?") ){
				ajaxCall(url, data, brdCommentUpdateCallBack, errorCallBack, "[댓글 수정]");
			}
		}
	}
	
	// 댓글 삭제
	function brdCommentDelete(seq, bo_seq, status){
		
		var obj = new Object();
		var form = $('brdForm')[0];
		var formData = new FormData(form);
		
		obj.seq = seq;
		obj.bo_seq = bo_seq;
		obj.status = status;
		
		console.log(obj);
		
		var data = JSON.stringify(obj);
		var url = '/brd/notice/comment_save';
		
		 if(status == 'delete'){
			if( confirm("삭제 하시겠습니까?") ){
				ajaxCall(url, data, brdCommentDeleteCallBack, errorCallBack, "[댓글 삭제]");
			}
		}
	}
	
	function brdCommentInsertCallBack(obj){
		alert("등록 완료하였습니다.");
		window.location.reload();
		//window.location.href = "/brd/notice/list";
	}
	
	function brdCommentUpdateCallBack(obj){
		alert("수정 완료하였습니다.");
		window.location.reload();
	}
	
	function brdCommentDeleteCallBack(obj){
		alert("삭제 완료하였습니다.");
		window.location.reload();
	}
	 
	//수정버튼클릭
	function brdCommentUpdate(obj, seq, bo_seq, content, status){
		$(obj).text('수정취소').removeClass('correction_btn').addClass('correction_delete');
       	$(obj).parent().parent().siblings('.text_box_view').html('<textarea class="textarea_style" id="comment_cont" name="comment_cont">' + content + '</textarea><div class="l-btn chat_btn" onclick="brdCommentUpdateSave(this, \'' + seq + '\',\'' + bo_seq + '\',\'' + status +'\')">수정하기</div>');
	}
  
	function brdView(seq){
		if(replaceNull(seq,'') !=''){
	    	$('#seq').val(seq);
	    	document.brdForm.action='/brd/notice/view'; 
		    document.brdForm.submit();
		}
    }
</script>
</body>
</html>
        