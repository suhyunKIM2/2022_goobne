<%@ page contentType="text/html; charset=utf-8" %>
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
    GnLocation loc = sessFtr.getGnLocation();
%>
<!DOCTYPE html>
<html lang="kor" dir="ltr"> 
<head>
    <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <script>
	    new WOW().init();
	</script>  
	<%-- 메인배너 배경처리 --%>
<style>       
      <c:forEach var="banner" items="${banner}" varStatus="status"> 
        <c:if test="${banner.bnnr_type eq '10' && banner.ord1 > 1 }">
		.main-box .goobne-img_office_bg_${banner.bnnr_id }{background: url("<%=SystemConstant.getStaticUrl()%>${banner.pc_img_bg }");}
	    </c:if>
      </c:forEach> 
      @media (max-width: 768px){
	  <c:forEach var="banner" items="${banner}" varStatus="status"> 
	     <c:if test="${banner.bnnr_type eq '10' && banner.ord1 > 1 }"> 
		 .main-box .goobne-img_office_bg_${banner.bnnr_id }{background: url(<%=SystemConstant.getStaticUrl()%>${banner.mobile_img_bg })no-repeat;background-size:cover;}
	     </c:if>
      </c:forEach>
	  }
	</style>
	<%-- 메인배너 배경처리 --%>
<meta charset="utf-8">
<script>
 $( document ).ready( function() {
$('.no-js').addClass('visible');
});
</script>
<style>
.no-js{visibility: hidden;opacity: 0;}
.visible{visibility: visible;opacity: 1;}
.main-box{height:calc(100% - 85px);}/*2차 오픈시 빼기*/
</style>
</head>

<body class="no-js">
    <!-- start of :: wrap -->
    <div id="wrap">
        <!-- start of :: header -->
        <div id="header">
            <jsp:include page="/WEB-INF/views/include/main_top.jsp"></jsp:include>            
        </div>
        <!-- end of :: header -->
        
        <aside class="aside">
           <jsp:include page="/WEB-INF/views/include/nav_right.jsp"></jsp:include>
        </aside>
        
         <!-- start of :: contents -->
        <div id="content">
            <div class="inner">
                <div class="main-slick-wrap">
                    <div class="main-vi-wrap">
                    
                        <%-- 메인배너 롤링 1번 영역 s--%>
                        <div class="main-box main-box_hight">
                            <div class="main-txt-area wow fadeInUp">
                                <div class="goobne-text">
                                    <p>Welcome</p>
                                    <p class="mid">to the</p>
                                    <p class="last">oven <span class="mid">Universe</span></p>
                                </div>
                                <div class="goobne-text line">
                                    <p>Welcome</p>
                                    <p class="mid">to the</p>
                                    <p class="last">oven <span class="mid">Universe</span></p>
                                </div>
                            </div>
                            <div class="goobne-bg wow fadeInUp">
                                <div class="goobne-img">
                                    <img src="/resources/assets/images/main/goobne_bg_2.png" alt="">
                                </div>
                                <button class="goobne-btn btn1">
                                    <div class="img">
                                        <img src="/resources/assets/images/common/main_bg_icon_01.png" alt="">
                                    </div>
                                    <span>✨최강의<br>바사삭 등장!</span>
                                </button>
                                <button class="goobne-btn btn2">
                                    <div class="img">
                                        <img src="/resources/assets/images/common/main_bg_icon_05.svg" alt="">
                                    </div>
                                </button>
        
                                <button class="goobne-menu-btn btn1">
                                    Oven
                                </button>
                                <button class="goobne-menu-btn btn2">
                                    Basasak
                                </button>
                            </div> 
                        </div>
                        <%-- 메인배너 롤링 1번 영역 e--%>
                         
                        <%-- 메인배너 롤링 2번부터 s --%>
<c:forEach var="banner" items="${banner}" varStatus="status"> 
	                        <c:if test="${banner.bnnr_type eq '10' && banner.ord1 > 1 }">            
		                        <div class="main-box">
		                            <div class="goobne-bg goobne-bg02 wow fadeInUp goobne-img_office_bg goobne-img_office_bg_${banner.bnnr_id }"><!---해상도 768일때 모바일 배경,이미지 변경---->
		                                <div class="goobne-img goobne-img_office">
		                                    <a href="${banner.pc_lnk_url }" target="${banner.pc_win_gb }">
		                                    <img src="<%=SystemConstant.getStaticUrl()%>${banner.pc_img_pth }" alt="" class="main_banner_PC">
		                                    <img src="<%=SystemConstant.getStaticUrl()%>${banner.mobile_img_pth }" alt="" class="main_banner_MO"> 
		                                    </a>
		                                </div>
		                             </div>
		                        </div>
	                        </c:if>
                        </c:forEach> 
                        <%-- 메인배너 롤링 2번부터  e --%>
                        
                    </div>
                    <div class="main-box">
                    <%-- 메인 플로팅 배너 order, e-coupon s --%>
                    <div class="goobne-btn-box wow fadeInUp">
                            <button class="order">                            
                                <a href="<%=SystemConstant.ORDER%>"><span>Order</span></a>
                            </button>
                            <%--<button class="coupon">
                                <span>E-coupon</span>
                            </button> --%>
                        </div>
                    </div>
                    <%-- 메인 플로팅 배너 order, e-coupon e --%>
                </div>
                
                <%-- 로그인시 보여지는 영역 --%>
<%-- 1차에서는 숨긴다.  
                <% if( sessFtr.isLogin() ) { %>
                <div class="mo-login-cnt">
                    <div class="aside__lnb-login mo-login">
                        <a href="#none" class="arrow-link"><span><%=user.getUser_name()%></span>님 환영합니다.</a>
                    </div>
                    <div class="l-info-area mo-info-area">
                        <div class="info-num">
                            <dl>
                                <dt>현재 경험치</dt>
                                <dd>9494</dd>
                            </dl>
                            <dl>
                                <dt>다음등급까지</dt>
                                <dd>70</dd>
                            </dl>
                            <dl>
                                <dt>쿠폰</dt>
                                <dd>2</dd>
                            </dl>
                        </div>
                        <div class="info-grade">
                            <span><%=user.getUser_name()%></span>님의 등급은 <span class="eng">SILVER</span>입니다.
                        </div>
                    </div>
                </div>
               <% } %>
               <%-- 로그인시 보여지는 영역 --%>
                 

                <div class="con-box menu-box">
                    <div class="inner">
                        <p class="l-main-title wow fadeInUp">Oven menu</p>
                        <div class="menu-list-wrap wow fadeInUp">
                            <%-- Oven Ment 롤링  s --%>
<c:forEach var="banner" items="${banner}" varStatus="status">
<c:if test="${banner.bnnr_type eq '20' }"> <a href="${banner.pc_lnk_url }" class="menu-list <c:if test="${status.index%2>0}"> top</c:if>" target="${banner.pc_win_gb }">
<div class="menu-img"> <img src="<%=SystemConstant.getStaticUrl()%>${banner.pc_img_pth }" alt="${banner.bnnr_nm }"> </div>
<p class="menu-name">${banner.bnnr_nm }</p>
</a> </c:if>
</c:forEach>
<%-- 카테고리 4개, 8개가 되어야 롤링이 정상적으로 적용되어서 for 두번  --%>
<c:forEach var="banner" items="${banner}" varStatus="status">
<c:if test="${banner.bnnr_type eq '20' }"> <a href="${banner.pc_lnk_url }" class="menu-list <c:if test="${status.index%2==0}"> top</c:if>" target="${banner.pc_win_gb }">
<div class="menu-img"> <img src="<%=SystemConstant.getStaticUrl()%>${banner.pc_img_pth }" alt="${banner.bnnr_nm }"> </div>
<p class="menu-name">${banner.bnnr_nm }</p>
</a> </c:if>
</c:forEach>
<%-- 카테고리 4개, 8개가 되어야 롤링이 정상적으로 적용되어서 for 두번  --%>
<%-- Oven Ment 롤링  e--%>                             
                        </div>
                    </div>
                </div>
                
                <div class="con-box">
                   <div class="con_wrap">
                       <p class="l-main-title wow fadeInUp">Goobne News</p>
                         <div class="event-list-wrap"> 
                          <c:forEach var="banner" items="${banner}" varStatus="status"> 
	                          <c:if test="${banner.bnnr_type eq '50' }"> 
		                            <a href="${banner.pc_lnk_url }" target="${banner.pc_win_gb }">
	                                <div class="event-list on wow fadeInUp">
	                                    <div class="mo-thum">
	                                        <img src="<%=SystemConstant.getStaticUrl()%>${banner.mobile_img_pth }" alt="">
	                                    </div>
	                                    <div class="status half">
	                                        <p class="sub">[${banner.sub_bnnr_nm }]</p>
	                                    </div>
	                                    <div class="event-title half">
	                                        <p class="main-text">${banner.bnnr_nm }</p>
	                                    </div>
	                                    <div class="event-img">
	                                        <img src="<%=SystemConstant.getStaticUrl()%>${banner.pc_img_pth }" alt="">
	                                    </div>
	                                 </div>    
	                                </a>
	                            </c:if>
                            </c:forEach>
                           </div> 
                       </div>
                   </div>
     

                <div class="con-box">
                    <div class="l-main-bg">
                        <p class="title wow fadeInUp">
                            <span class="instar">The Goobster</span>
                        </p>
                        <div class="goobster-box-wrap wow fadeInUp">
                            <div class="goobster-box">
                                <%-- Goobster 롤링 s--%>
<c:forEach var="banner" items="${banner}" varStatus="status">
<c:if test="${banner.bnnr_type eq '30' }">
<div class="img"> <a href="${banner.pc_lnk_url }" class="menu-list" target="${banner.pc_win_gb }"> <img src="<%=SystemConstant.getStaticUrl()%>${banner.pc_img_pth }" alt="${banner.bnnr_nm }"> </a> </div>
</c:if>
</c:forEach>
<%-- Goobster 롤링  e--%>  
                            </div>
                        </div>
                    </div>

                </div>

                <div class="con-box">
                    <p class="title wow fadeInUp">Goobtube</p>
                    <div id="infinite" class="goobne-slider wow fadeInUp">
                        <div class="container goobne-wrapper">
                            <ul class="goobne-line">
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                                <li class="goobne-text">💥 GOOBNE IS ALWAYS HOT</li>
                            </ul>
                        </div>
                    </div>
                    <div class="goobne-tv-box wow fadeInUp">
                        <div class="goobne-tv-wrap">
                            <%-- Goobtube 롤링 s 3개 이상 업로드 --%>
<c:forEach var="banner" items="${banner}" varStatus="status">
<c:if test="${banner.bnnr_type eq '40' }">
<div class="img-box"> <a href="${banner.pc_lnk_url }" class="menu-list" target="${banner.pc_win_gb }"> <img src="<%=SystemConstant.getStaticUrl()%>${banner.pc_img_pth }" alt="${banner.bnnr_nm }"> </a> </div>
</c:if>
</c:forEach>
<%-- Goobtube 롤링 e--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of :: contents -->
        
        <!-- start of :: footer -->
        <div id="footer" class="wow fadeInUp">
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </div>
        <!-- end of :: footer -->
        
        <div id="mobile-nav">
            <jsp:include page="/WEB-INF/views/include/tab_bar.jsp"></jsp:include>
        </div>
        
    </div>
    <!-- end of :: wrap --> 
</body> 
</html>