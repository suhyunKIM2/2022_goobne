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
<meta name="robots" content="noindex,nofollow">
    <script>
	    new WOW().init();
	</script>   
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<script type="text/javascript">
        $(document).ready(function () {
        	//$(".selectpicker").niceSelect();
        	srchBrdList(1);
        	
        	$("#search_txt").keydown(function(key) {                
        		if (key.keyCode == 13) { 
        			srchBrdList();                   
        		}            
        	});
        	
            // select box
           /*  $('.l-select .type').click(function (e) {
                $(this).siblings('.type-list').toggleClass('is-show');
            })
           // .l-select .type .type-list li
            $('.l-select .type-list li').click(function () {
                $(this).parent().removeClass('is-show');
                $(this).addClass('is-chk');
                $(this).siblings().removeClass('is-chk');
                var innerText =  $(this).html();
                $(this).parent().prev('.type').text(innerText);
            })
        	*/
        }); 
        
        /* $(document).mouseup(function (e){
            var select_box = $(".type-list");
            if(select_box.has(e.target).length === 0){
                select_box.removeClass("is-show");
            }
        }); */
       
    	//조회
    	function srchBrdList(pageNum) {
    		
    		var obj = new Object();
    		
    		var search_gb = $("#search_gb").val(); //검색어구분
    		var search_txt = $("#search_txt").val().trim(); //검색어
    		
    		obj.search_gb = search_gb;
      		obj.search_txt = search_txt;
      		obj.use_yn = 'Y';
      		
    		if (pageNum == '' || pageNum == "undefined") {
      			obj.pageNum = "1";
      		} else {
      			obj.pageNum = pageNum;
      		}
    		
    		obj.listCnt = 10;
      		
    		var url = '/brd/notice/srch_list'
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
      							var rownum=total_cnt -(obj.result.pageNum-1) * obj.result.listCnt - i;
      							brdHtml += '<td>'+ rownum +'</td>'; //번호
    							brdHtml += '<td>';
    							brdHtml += '<a href="javascript:brdView(\'' + brdList[i].seq + '\')">';
    							
    							//댓글이미지
    							if(brdList[i].comment_yn == 'Y'){
    								brdHtml += '<img src="/resources/assets/images/icon/chat-dots.svg" class="my_icon_svg icon_box" id="my_icon_svg">';
    							}
    							
    							//이미지
    							if(brdList[i].file01 != null){
    								brdHtml += '<img src="/resources/assets/images/icon/images.svg" class="my_icon_svg icon_box" id="my_icon_svg">';
    							}
    							brdHtml += '<span class="text_icon_right">';
    							brdHtml += brdList[i].title; //제목
    							brdHtml += '</span></a></td>';
    							brdHtml += "<td>";
    							brdHtml += brdList[i].i_time; //작성일
    							brdHtml += "</td>";
    							brdHtml += "<td>";
    							brdHtml += numberFormatComma(brdList[i].read_num); //조회수
    							brdHtml += "</td>";
    							brdHtml += "</tr>";
    						}
    					}else{
    						brdHtml += '<tr><td colspan="4">조회된 공지사항이 존재하지 않습니다.</td></tr>'
    					}
    					$('#dataTable > tbody').empty();
    					console.log(brdHtml);
    					$('#dataTable > tbody').html(brdHtml);
    					var pagingHTML = createPagingHTML(obj.result.pageNum, total_cnt ,obj.result.listCnt, 'srchBrdList');
    					$(".l-paging-num").html(pagingHTML);
    					
    				},error : function(obj) {
    					alert("error");
    				}
    			});
    	}
    	
    	function brdView(seq){
        	$('#seq').val(seq);
        	document.brdForm.action='/brd/notice/view'; 
    	    document.brdForm.submit();
        }
    </script>
    
    <title>공지사항</title>
	
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
        	<form id="brdForm" name="brdForm"  method="get">
            	<input type="hidden" id="seq" name="seq"/>
            </form> 
            <article class="l-layout notice">
                <div class="l-inner">
                    <div class="l-title">공지사항</div>
                    <!-- 공지사항 조회 영역  -->
                    <div class="notice__lookup">	
                    	<select class="selectpicker" id="search_gb" name="search_gb">
                            <option value="title">제목</option>
	                        <option value="content">내용</option>
                         </select>
                        <input type="text" class="search_input" id="search_txt" name="search_txt" placeholder="검색어를 입력해주세요.">
                        <button class="l-btn" type="button" onClick="srchBrdList(1);">검색</button>
                    </div>
                    <!-- //공지사항 조회 영역  -->

                    <!-- 공지사항 리스트 영역  -->
                    <section class="notice__table">
                        <table id="dataTable">
                            <colgroup>
                                <col style="width: 8%;">
                                <col style="width: 55%;">
                                <col style="width: 17%;">
                                <col style="width: 15%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </section>
                    <!-- // 공지사항 리스트 영역  -->

                     <!-- 페이징 영역  -->
                     <section class="l-paging-num">
                     </section>
                     <!-- //페이징 영역  -->

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

    
</body>
</html> 
