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

<script src="/resources/assets/js/main/popup_main.js"></script>  
<style> 
#window .single-item04 img{max-height: 100%; display: inline-block;}
#window .single-item04 .slick-dots{bottom:10px;}
#window .single-item04 .slick-dots{text-align:center;padding-left:0;background: rgba(0,0,0,0.5);padding:0.1% 2%;border-radius: 20px;margin:auto;position:absolute;left:50%;transform: translateX(-50%);bottom:10px;}
#window .single-item04 .slick-dots li {display:inline-block;    vertical-align: middle;    margin: 0 3px;line-height: 26px;height:26px;}
#window .single-item04 .slick-dots li a{font-size:1.5em;    text-decoration: none;    color: #fff;    line-height: 23px;    cursor: pointer;}
#window .single-item04 .slick-dots li.slick-active a{font-size:3em;}
#window .single-item04 .slick-dots li a:hover{border-bottom:0; }
#ori {visibility: hidden;}
.btn_blk{margin-top:0px;}
</style>
<script>
$(document).ready(function(){ 
     //$('#popbg').empty(); 
     /*레이어팝업 슬라이드*/
     $('.single-item04').slick({
	      swipe : true,
	      autoplay:false,
	      autoplaySpeed:500,
	      /*fade:true,*/
	      cssEase:"ease",
	      easing:"ease",
	      centerMode: true,
	      centerPadding: '0',
	      dots: true,
	      arrows:false,
	      autoplay : true,			// 자동 스크롤 사용 여부
	      autoplaySpeed : 3000,
	      customPaging : function(slider, i) {  
	      var thumb = $(slider.$slides[i]).data();
	      // return '<a>'+(i+1)+'</a>';
	      return '<a>&bull;</a>';
	    },
    }); 
 });
</script>
<span id="popbg"> <div id="mask_popup"></div> </span> 

<!----S: 팝업 리스트---->
<div class="window" id="window"> 
     
    <div class="slider single-item04">  
    <c:set var="pcnt" value="0"/>
    <c:forEach var="banner" items="${banner}" varStatus="status">
    <c:if test="${banner.bnnr_type eq '60'}">
	  <div class="list_slider">${banner.pop_cntnt }</div> 
	  <c:set var="pcnt" value="${pcnt + 1}"/>
    </c:if>
    </c:forEach>
    </div>  
    <c:if test="${pcnt > 0 }"> 
     <!-- 오늘그만보기, 닫기 -->
     <div class="btn_wrap btn_blk">
        <ul class="popup_btn_ul ori">
            <li id="todayPopChk" class="web_order" onClick="javascript:todaycloseWin();" style="background:#9f1818;">오늘 하루 보지 않기</li>
            <li id="closePopChk" class="main_pop_close close" onClick="javascript:closeWin();" style="background:#9f1818;">닫기</li>
        </ul>
     </div>
     <!-- 오늘그만보기, 닫기 -->
     </c:if>
    
</div>  
<!----E: 팝업 리스트----> 