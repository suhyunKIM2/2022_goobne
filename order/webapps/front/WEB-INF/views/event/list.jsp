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
	String staticUrl = SystemConstant.getStaticUrl();
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
   <script>
    $(document).ready(function () {
    	srchBrdList(1);
    	
    	// tab 버튼 구현 
         //$('.event__tab button').click(function () {
           // indexNo = $(this).index();
            //$(this).addClass('is-active').siblings().removeClass('is-active');

          //  $('.event__list-wrap .event__list').addClass('l-hidden');
          //  $('.event__list-wrap .event__list').eq(indexNo).removeClass('l-hidden');
       // })
    });
    
    function toggleClass(date){
        if(date == 'end'){
			$("#endEvent").addClass("is-active");
			$("#nowEvent").removeClass("is-active");
		} else if(date == 'now'){
			$("#nowEvent").addClass("is-active");
			$("#endEvent").removeClass("is-active");
		}
        srchBrdList(1);
    }
    
    //조회
	function srchBrdList(pageNum) {

		var obj = new Object();
		var eventGb = "";
		
		if($("#nowEvent").hasClass("is-active")){
            obj.eventGb = 'now_date';
            eventGb = obj.eventGb;
        }
		if($("#endEvent").hasClass("is-active")){
            obj.eventGb = 'end_date';
            eventGb = obj.eventGb;
        }

  		obj.use_yn = 'Y';
  		
		if (pageNum == '' || pageNum == "undefined") {
  			obj.pageNum = "1";
  		} else {
  			obj.pageNum = pageNum;
  		}
		
		obj.listCnt = 9;
  		
		var url = '/brd/event/srch_list'
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
					var j = 0;
					if(brdList.length>0){
						total_cnt = brdList[0].total_cnt;
						for (var i in brdList) {
							brdHtml += '<div class="list">';
							
							if(eventGb == 'end_date'){
								brdHtml += '<div class="end_mask"><span class="end_text">종료 된 이벤트</span></div>';
							}
							
                        	brdHtml += '<a href="javascript:brdView(\'' + brdList[i].seq + '\')">';
                        	brdHtml += '<figure>';
                        	
                        	if(brdList[i].file01 != null){
                        		brdHtml += "<img src='<%=staticUrl %>"+ brdList[i].file01 +"' alt='이벤트이미지'>";
                        	} else {
                        		brdHtml += '<img src="/resources/assets/images/contents/event-list-01.png" alt="이벤트이미지">';
                        	}
                        	brdHtml += '</figure>';
                        	brdHtml += '<figcaption>';
                        	
                        	if(i % 6 == 0){
                        		j = 0; //초기화
                        		//break;
                        	}
                        	
                        	if(i % 6 < 6){
                        		j += 1;
                        		brdHtml += '<dl class="desc color-';
                            	brdHtml += j;
                            	brdHtml += '">';
                        	}
                        	
                        	brdHtml += '<dd class="sub">';
                        	brdHtml += brdList[i].sub_title;
                        	brdHtml += '</dd>';
                        	brdHtml += '<dt class="main">';
                        	brdHtml += brdList[i].title;
                        	brdHtml += '</dt>';
                        	brdHtml += '<dd class="data">';
                        	brdHtml += brdList[i].s_time + " - " + brdList[i].e_time;
                        	brdHtml += '</dd>';
                        	
                        	if(brdList[i].comment_yn == 'Y'){
                        		brdHtml += '<dd class="chat_event"><img src="/resources/assets/images/icon/chat-dots.svg" class="my_icon_svg icon_box" id="my_icon_svg"><span class="number_chat">';
	                        	brdHtml += brdList[i].total_cmt_cnt;
	                        	brdHtml += '</span></dd>';
                        	}
                        	
                        	brdHtml += '</dl>';
                        	brdHtml += '</figcaption>';
                        	brdHtml += '</a>';
                        	brdHtml += '</div>';
						}
					}else{
						brdHtml += '<dd class="data_null">조회된 이벤트가 존재하지 않습니다.</dd>'
					}
					$('.event__list').empty();
					console.log(brdHtml);
					$('.event__list').html(brdHtml);
					var pagingHTML = createPagingHTML(obj.result.pageNum, total_cnt ,obj.result.listCnt, 'srchBrdList', obj.listCnt);
					$(".l-paging-num").html(pagingHTML);
				},error : function(obj) {
					alert("error");
				}
			});
	}
	
	function brdView(seq){
    	$('#seq').val(seq);
    	document.brdForm.action='/brd/event/view'; 
	    document.brdForm.submit();
    }
    </script>
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
            <article class="l-layout event">
                <div class="l-inner">
                    <div class="l-title">이벤트</div>
                    <div class="event__tab">
                    	<a href="javascript:toggleClass('now');">
                    		<button type="button" id="nowEvent" class="is-active">진행중 이벤트</button>
                    	</a>
                    	<a href="javascript:toggleClass('end');">
                        	<button type="button" id="endEvent">종료된 이벤트</button>
                        </a>
                    </div>
                    <div class="event__list-wrap">
                        <!-- 진행중 이벤트 -->
                        <div class="event__list">
                        </div>
                    </div>
                    
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