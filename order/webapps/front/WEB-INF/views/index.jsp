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
	<script src="/resources/assets/js/main/popup_main.js"></script>
    <script>
	    new WOW().init();
	</script>
	<%-- 메인배너 배경처리 --%>
	<style>
      <c:forEach var="banner" items="${banner}" varStatus="status">
        <c:if test="${banner.bnnr_type eq '10' && banner.ord1 > 1 }">
		.main-box .goobne-img_office_bg_${banner.bnnr_id }{background: url("<%=SystemConstant.getStaticUrl()%>${banner.pc_img_bg }");background-size: cover;}
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
 $( window ).ready( function() {
$('.no-js').addClass('visible');
});
 $(window).load(function(){
	 $('.goobne-tv-wrap').slick('refresh');
 });
</script>
<style>
.main-box{height:calc(100% - 85px);}/*2차 오픈시 빼기*/
#window .single-item04 img{max-height: 100%;    display: inline-block;}
#window .single-item04 .slick-dots{bottom:0;}
#window .single-item04 .slick-dots{text-align:center;padding-left:0;background: rgba(0,0,0,0.5);padding:0.1% 2%;border-radius: 20px;margin:auto;position:absolute;left:50%;transform: translateX(-50%);bottom:0;}
#window .single-item04 .slick-dots li {display:inline-block;    vertical-align: middle;    margin: 0 3px;line-height: 26px;height:26px;}
#window .single-item04 .slick-dots li a{font-size:1.5em;    text-decoration: none;    color: #fff;    line-height: 23px;    cursor: pointer;}
#window .single-item04 .slick-dots li.slick-active a{font-size:3em;}
#window .single-item04 .slick-dots li a:hover{border-bottom:0; }
#ori,#new{visibility: hidden;}
</style>
<script>
$(document).ready(function(){

 // 이벤트종료시점 기록
  var countDownDate = new Date("07/29/2022 23:59:59").getTime();//팝업 노출 시간 설정

  var x = setInterval(function() {

    var now = new Date().getTime();
    var distance = countDownDate - now;

    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    if ( hours < 10 ){hours = "0" + hours; }
    else if ( hours > 9 ){ hours = hours; }

    if ( minutes < 10 ){minutes = "0" + minutes; }
    else if ( minutes > 9 ){ minutes = minutes; }

    if ( seconds < 10 ){seconds = "0" + seconds; }
    else if ( seconds > 9 ){ seconds = seconds; }




// 타임이벤트 진행 타이머
    document.getElementById("newcountdown").innerHTML = days + " : " + hours + " : "
    + minutes + " : " + seconds;
    document.getElementById("ori").style.display="block";
    document.getElementById("ori").style.visibility="visible";
    document.getElementById("new").style.display="none";
    document.getElementById("new").style.visibility="hidden";
    //document.getElementById("new").className =" display_none";
// 이벤트 마감시 보여질 문구
    if (distance < 0) {
      clearInterval(x);
      //document.getElementById("timesale").innerHTML = "<div class='endtxt'>이벤트가 마감되었습니다.</div>";
      document.getElementById("ori").style.display="none";
      document.getElementById("ori").style.visibility="hidden";
    document.getElementById("new").style.display="block";// 임시 반대처리
    document.getElementById("new").style.visibility="visible";// 임시 반대처리
	document.getElementById("mask_popup").style.display="block";// 임시 반대처리
    document.getElementById("mask_popup").style.visibility="visible";// 임시 반대처리
    }
  }, 0);


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

</head>

<body class="no-js">
	<!---S: 메인팝업--->

<div id="mask_popup"></div>
<span id="newcountdown" style="font-size:0;display:none;"></span>
<!----S: 설정 시간 이전 바뀐 팝업 리스트---->
<div class="window" id="window">
<div id="ori">
     <div class="slider single-item04">
    <div class="list_slider">
            <a href="https://www.goobne.co.kr/brd/event/view?seq=30092"><img src="/resources/assets/images/popup/220713_collabo_everland.jpg" style="image-rendering:auto;"></a>
    </div>
    <div class="list_slider">
            <a href="https://www.goobne.co.kr/menu/menu_view?class_id=&item_id=32010"><img src="/resources/assets/images/popup/220726_popup_ricotta.jpg" style="image-rendering:auto;"></a>
    </div>
    <div class="list_slider">
            <a href="https://www.goobne.co.kr/menu/menu_view?class_id=&item_id=32018"><img src="/resources/assets/images/popup/220726_popup_pepperbss.jpg" style="image-rendering:auto;"></a>
    </div>
    <div class="list_slider">
            <a href="http://www.goobne.co.kr/brd/event/get_view?seq=30065"><img src="/resources/assets/images/popup/220722_popup_popupstore.jpg" style="image-rendering:auto;"></a>
    </div>
    </div>
    <div class="btn_wrap btn_blk">
        <ul class="popup_btn_ul ori">
            <li id="todayPopChk" class="web_order" onClick="javascript:todaycloseWin();" style="background:#323232;">오늘 하루 보지 않기</li>
            <li id="closePopChk" class="main_pop_close close" onClick="javascript:closeWin();" style="background:#323232;">닫기</li>
        </ul>
    </div>

</div>
<!----E: 설정 시간 이전 바뀐 팝업 리스트---->

<!----S: 설정 시간 이후 바뀐 팝업 리스트---->
<div id="new">
<div class="slider single-item04">
    <div class="list_slider">
            <a href="https://www.goobne.co.kr/menu/menu_view?class_id=&item_id=32010"><img src="/resources/assets/images/popup/220726_popup_ricotta.jpg" style="image-rendering:auto;"></a>
    </div>
    <div class="list_slider">
            <a href="https://www.goobne.co.kr/menu/menu_view?class_id=&item_id=32018"><img src="/resources/assets/images/popup/220726_popup_pepperbss.jpg" style="image-rendering:auto;"></a>
    </div>
    <div class="list_slider">
            <a href="http://www.goobne.co.kr/brd/event/get_view?seq=30065"><img src="/resources/assets/images/popup/220722_popup_popupstore.jpg" style="image-rendering:auto;"></a>
    </div>
    </div>
    <div class="btn_wrap btn_blk">
        <ul class="popup_btn_ul ori">
            <li id="todayPopChk" class="web_order" onClick="javascript:todaycloseWin();" style="background:#9f1818;">오늘 하루 보지 않기</li>
            <li id="closePopChk" class="main_pop_close close" onClick="javascript:closeWin();" style="background:#9f1818;">닫기</li>
        </ul>
    </div>

</div>
</div>
<!----E: 설정 시간 이후 바뀐 팝업 리스트---->
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
							<button class="universe_go" onClick="window.open('http://www.xn--9i1b89owjy5lfa431as3k.com/')">
                                <span>입장하기</span>
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
                        <p class="l-main-title wow fadeInUp">Oven Menu</p>
                        <div class="menu-list-wrap wow fadeInUp">
                            <%-- Oven Ment 롤링  s --%>
							<c:set var="bnr" value="0"/>
                            <c:forEach var="banner" items="${banner}" varStatus="status">
	                          <c:if test="${banner.bnnr_type eq '20' }">
							   <c:set var="bnr" value="${bnr+1}"/>
	                            <a href="${banner.pc_lnk_url }" class="menu-list <c:if test="${bnr%2>0}"> top</c:if>" target="${banner.pc_win_gb }">
	                                <div class="menu-img">
	                                    <img src="<%=SystemConstant.getStaticUrl()%>${banner.pc_img_pth }" alt="${banner.bnnr_nm }">
	                                </div>
	                                <p class="menu-name">${banner.bnnr_nm }</p>
	                            </a>
                              </c:if>
                            </c:forEach>
                            <%-- 카테고리 4개, 8개가 되어야 롤링이 정상적으로 적용되어서 for 두번  --%>
                            <c:forEach var="banner" items="${banner}" varStatus="status">
	                          <c:if test="${banner.bnnr_type eq '20' }">
							   <c:set var="bnr" value="${bnr+1}"/>
	                            <a href="${banner.pc_lnk_url }" class="menu-list <c:if test="${bnr%2>0}"> top</c:if>" target="${banner.pc_win_gb }">
	                                <div class="menu-img">
	                                    <img src="<%=SystemConstant.getStaticUrl()%>${banner.pc_img_pth }" alt="${banner.bnnr_nm }">
	                                </div>
	                                <p class="menu-name">${banner.bnnr_nm }</p>
	                            </a>
                              </c:if>
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
						 <c:set var="bnr" value="0"/>
                          <c:forEach var="banner" items="${banner}" varStatus="status">
	                          <c:if test="${banner.bnnr_type eq '50' }"><c:set var="bnr" value="${bnr+1}"/>
									<div class="event-list <c:if test="${bnr == 1}">on</c:if> wow fadeInUp">
 									    <a href="${banner.pc_lnk_url }" target="${banner.pc_win_gb }">
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
										</a>
	                                 </div>
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
	                            <div class="img">
                                    <a href="${banner.pc_lnk_url }" class="menu-list" target="${banner.pc_win_gb }">
                                        <img src="<%=SystemConstant.getStaticUrl()%>${banner.pc_img_pth }" alt="${banner.bnnr_nm }">
                                    </a>
                                 </div>
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
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                                <li class="goobne-text">💥 NO FRY MORE CRISPY</li>
                            </ul>
                        </div>
                    </div>
                    <div class="goobne-tv-box wow fadeInUp">
                        <div class="goobne-tv-wrap">
                            <%-- Goobtube 롤링 s 3개 이상 업로드 --%>
                            <c:forEach var="banner" items="${banner}" varStatus="status">
                              <c:if test="${banner.bnnr_type eq '40' }">
                              <div class="img-box">
                                  <a href="${banner.pc_lnk_url }" class="menu-list" target="${banner.pc_win_gb }">
                                      <img src="<%=SystemConstant.getStaticUrl()%>${banner.pc_img_pth }" alt="${banner.bnnr_nm }">
                                  </a>
                              </div>
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

     <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-44521541-5', 'anijs.github.io');
      ga('send', 'pageview');

    </script>
</body>
</html>
