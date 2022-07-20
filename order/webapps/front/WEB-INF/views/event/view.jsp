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


 
    <title>이벤트</title>
</head>
 <style>
		.Pop_up_Store_div{background:url('https://www.goobne.co.kr/resources/assets/images/event/202207_Pop_up_Store/img_02.png');padding: 4rem 0;}
		.Pop_up_Store_div_box{width:80%;margin:auto;background:#ffe8ac;padding:5%;border-radius: 20px;}
		.Pop_up_Store_div_box input{background: #fff;width: 80%;height: 40px;padding: 1rem;border-radius: 10px;font-size: 2rem;}
		.Pop_up_Store_div_box_input{margin:1rem 0;}
		.Pop_up_Store_div_box_btn{width:80%;margin: auto;max-width: 270px;}
		@media (max-width: 500px){
		.Pop_up_Store_div_box input{height:30px;font-size: 1.5rem;}
		.Pop_up_Store_div{padding:2rem 0;}
		}
	</style>
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
			<input type="hidden" name="bo_seq" id="bo_seq"/>
			<input type="hidden" name="seq" id="seq"/>
		</form>
		
            <article class="l-layout event">
                <div class="l-inner">
                    <div class="l-title">이벤트</div>
                    <section class="event__detail">
                        <dl class="title">
                            <dt>${view.title }</dt>
                            <dd class="data">${view.s_time} - ${view.e_time}</dd>
                        </dl>
                        <div class="event__detail-img">
                        	
                            <%-- <img src="${view.file01 }" alt="이벤트상세이미지"> --%>
                        </div>
                        <button class="list-btn l-btn" type="button" onclick="location.href='/brd/event/list';">목록가기</button>
                    </section>
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
    <script>
	    var Now = new Date(); // 현재 날짜 및 시간
		var nowMonth = Now.getMonth() + 1; // 월
		var nowDay = Now.getDate(); // 일
		var nowHour = Now.getHours(); // 시
		var nowMins = Now.getMinutes(); // 분
	
		nowMonth = pluszero(nowMonth); //만들었던 함수 적용
		nowDay = pluszero(nowDay);
		nowHour = pluszero(nowHour);
		nowMins = pluszero(nowMins);
	
		var nowtime = nowMonth + nowDay + nowHour + nowMins; // 월+일+시+분
		// 이벤트용
		function pluszero(time){
		    var time = time.toString(); // 시간을 숫자에서 문자로 바꿈
		    if(time.length < 2){ //2자리 보다 작다면
		        time = '0' + time; //숫자앞 0을 붙여줌
		        return time; //값을 내보냄
			}else{
			    return time; //2자리라면 값을 내보냄
			}
		}
		//사전예약
		function sendSms(){
			var tel =$("#tel").val().replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g, "");
			var name = $("#name").val();
			var chkStyle = /[0-9]/ ; 
			if(!chkStyle.test(tel)){
				alert("전화번호는 숫자만 입력 가능합니다.");
				return;
			}
			var obj = Object();
			if(tel.length ==11){
				obj.mble1= tel.substring(0,3);
				obj.mble2= tel.substring(3,7);
				obj.mble3= tel.substring(7,11);
				
			}else if(tel.length ==10){
				obj.mble1= tel.substring(0,3);
				obj.mble2= tel.substring(3,6);
				obj.mble3= tel.substring(6,10);
			}else{
				alert("전화번호를 확인해주세요");
				$("#tel").focus();
				return;
			}
			obj.dest_name= name;
			var data = JSON.stringify(obj);
			var url = '/sms/send_sms';
			
			if ( confirm("사전등록 하시겠습니까?") ){
				ajaxCall(url, data, sendSmsCallBack, errorCallBack, "이벤트 사전등록");
			}
		}
		
		function sendSmsCallBack(){
			alert("문자를 확인해주세요");
			$("#tel").val('');
			$("#name").val('');
		}
        $(document).ready(function () {
        	$(".event__detail-img").html(toHtml('${view.content}'));
        	//댓글 조회
        	srchCommentList(1);
        	
        	//댓글창 토글
        	if( '${view.comment_yn}' == 'N'){
        		$("#chat").hide();
        		$(".l-paging-num").hide();
        	} else if( '${view.comment_yn}' == 'Y'){
        		$("#chat").show();
        		$(".l-paging-num").show();
        	}
        	
        	if('${view.seq}' =='30092'){
        		if('07011100' <= nowtime && '07020000'> nowtime){
        			<%if(sessFtr.isLogin()){%>
        				$("#onImg_mem").css("display","inline-block");
        				$("#offImg_mem").css("display","none");
        			 <% } else { %>
        				$("#onImg_mem").css("display","none");
        				$("#offImg_mem").css("display","inline-block");
        			<% } %>
        			$("#onImg").css("display","inline-block");
        			$("#offImg").css("display","none");
        			$("#commingImg").css("display","none");

        		}else if('07081100' <= nowtime && '07090000'> nowtime){
        			<%if(sessFtr.isLogin()){%>
        				$("#onImg_mem").css("display","inline-block");
        				$("#offImg_mem").css("display","none");
        			<% } else { %>
        				$("#onImg_mem").css("display","none");
        				$("#offImg_mem").css("display","inline-block");
        			<% } %>
        			$("#onImg").css("display","inline-block");
        			$("#offImg").css("display","none");
        			$("#commingImg").css("display","none");

        		}else if('07151100' <= nowtime && '07160000'> nowtime){
        			<%if(sessFtr.isLogin()){%>
        				$("#onImg_mem").css("display","inline-block");
        				$("#offImg_mem").css("display","none");
        			<% } else { %>
        				$("#onImg_mem").css("display","none");
        				$("#offImg_mem").css("display","inline-block");
        			<% } %>
        			$("#onImg").css("display","inline-block");
        			$("#offImg").css("display","none");
        			$("#commingImg").css("display","none");

        		}else if('06291356' <= nowtime && '06291357'> nowtime){
        			<%if(sessFtr.isLogin()){%>
        				$("#onImg_mem").css("display","inline-block");
        				$("#offImg_mem").css("display","none");
        			<% } else { %>
        				$("#onImg_mem").css("display","none");
        				$("#offImg_mem").css("display","inline-block");
        			<% } %>
        			$("#onImg").css("display","inline-block");
        			$("#offImg").css("display","none");
        			$("#commingImg").css("display","none");

        		}else{
        			$("#onImg_mem").css("display","none");
        			$("#offImg_mem").css("display","none");
        			$("#onImg").css("display","none");
        			$("#offImg").css("display","none");
        			$("#commingImg").css("display","inline-block"); 
        		} 
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
         		
       		var url = '/brd/event/srch_comment_list'
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
       					$(".l-paging-num").html(pagingHTML);
       					
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
    			//location.href.replace('/account/login');
    			window.location.href = "/account/login";
    			return;
    		}
    		
    		//my_total_cnt 조회
    		var cntObj = new Object();
    		cntObj.upd_id = user_id;
    		cntObj.seq = "${view.seq}";
    		
       		var url = '/brd/event/comment_total_List'
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
    		var url = '/brd/event/comment_save';
    		
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
    		var url = '/brd/event/comment_save';
    		
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
    		var url = '/brd/event/comment_save';
    		
    		 if(status == 'delete'){
    			if( confirm("삭제 하시겠습니까?") ){
    				ajaxCall(url, data, brdCommentDeleteCallBack, errorCallBack, "[댓글 삭제]");
    			}
    		}
    	}
    	
    	function brdCommentInsertCallBack(obj){
    		//srchCommentList(1);
    		var seq = "${view.seq}";
    		alert("등록 완료하였습니다.");
    		window.location.href = "/brd/event/get_view?seq="+seq;
    		//window.location.reload();
    	}
    	
    	function brdCommentUpdateCallBack(obj){
    		var seq = "${view.seq}";
    		alert("수정 완료하였습니다.");
    		window.location.href = "/brd/event/get_view?seq="+seq;
    		//window.location.reload();
    	}
    	
    	function brdCommentDeleteCallBack(obj){
    		var seq = "${view.seq}";
    		alert("삭제 완료하였습니다.");
    		window.location.href = "/brd/event/get_view?seq="+seq;
    		//window.location.reload();
    	}
    	 
    	//수정버튼클릭
    	function brdCommentUpdate(obj, seq, bo_seq, content, status){
    		$(obj).text('수정취소').removeClass('correction_btn').addClass('correction_delete');
           	$(obj).parent().parent().siblings('.text_box_view').html('<textarea class="textarea_style" id="comment_cont" name="comment_cont">' + content + '</textarea><div class="l-btn chat_btn" onclick="brdCommentUpdateSave(this, \'' + seq + '\',\'' + bo_seq + '\',\'' + status +'\')">수정하기</div>');
    	}
    </script>
</body>

</html>