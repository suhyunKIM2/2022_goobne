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
    GnLocation loc = sessFtr.getGnLocation();
%>
<!DOCTYPE html>
<html lang="kor" dir="ltr"> 
<head>
    <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <script>
	    new WOW().init();
	</script>   
</head>

<body>
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
                        <div class="main-box main-box_hight">
                            <div class="main-txt-area wow fadeInUp">
                                <div class="goobne-text">
                                    <p>Welcome</p>
                                    <p class="mid">to the</p>
                                    <p class="last">oven <span class="mid">universe</span></p>
                                </div>
                                <div class="goobne-text line">
                                    <p>Welcome</p>
                                    <p class="mid">to the</p>
                                    <p class="last">oven <span class="mid">universe</span></p>
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
                        <div class="main-box">
                            <div class="goobne-bg goobne-bg02 wow fadeInUp goobne-img_office_bg"><!---해상도 768일때 모바일 배경,이미지 변경---->
                                <div class="goobne-img goobne-img_office">
                                    <a href="http://www.xn--9i1b89owjy5lfa431as3k.com/" target="_blank">
                                    <img src="/resources/assets/images/main/220527_micro_ovbss_4.svg" alt="" class="main_banner_PC">
                                    <img src="/resources/assets/images/main/220527_micro_ovbss_4_MO_2.svg" alt="" class="main_banner_MO"> 
                                    </a>
                                </div>
                                <!--<div class="goobne-img goobne-img_office_bg"></div>-->
                             </div>
                        </div>
                        
                    </div>
                    <div class="main-box">
                    <div class="goobne-btn-box wow fadeInUp">
                            <button class="order">
                                <span>Order</span>
                            </button>
                            <button class="coupon">
                                <span>E-coupon</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="mo-login-cnt">
                    <div class="aside__lnb-login mo-login">
                        <a href="#none" class="arrow-link"><span>구울레옹</span>님 환영합니다.</a>
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
                            <span>구울레옹</span>님의 등급은 <span class="eng">SILVER</span>입니다.
                        </div>
                    </div>
                </div>

                <div class="con-box menu-box">
                    <div class="inner">
                        <p class="l-main-title wow fadeInUp">Oven menu</p>
                        <div class="menu-list-wrap wow fadeInUp">
                            <a href="/menu/menu_list?class_id=10" class="menu-list">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_chicken.jpg" alt="CHICKEN">
                                </div>
                                <p class="menu-name">CHICKEN</p>
                            </a>
                            <a href="/menu/menu_list?class_id=11" class="menu-list top">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_pizza.jpg" alt="PIZZA">
                                </div>
                                <p class="menu-name">PIZZA</p>
                            </a>
                            <a href="/menu/menu_list?class_id=12" class="menu-list">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_dessert.jpg" alt="Dessert">
                                </div>
                                <p class="menu-name">DESSERT</p>
                            </a>
                            <a href="/menu/menu_list?class_id=12" class="menu-list top">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_chipd.jpg" alt="Dessert">
                                </div>
                                <p class="menu-name">DESSERT</p>
                            </a>
                            <a href="/menu/menu_list?class_id=10" class="menu-list">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_chicken.jpg" alt="CHICKEN">
                                </div>
                                <p class="menu-name">CHICKEN</p>
                            </a>
                            <a href="/menu/menu_list?class_id=11" class="menu-list top">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_pizza.jpg" alt="PIZZA">
                                </div>
                                <p class="menu-name">PIZZA</p>
                            </a>
                            <a href="/menu/menu_list?class_id=12" class="menu-list">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_dessert.jpg" alt="Dessert">
                                </div>
                                <p class="menu-name">DESSERT</p>
                            </a>
                            <a href="/menu/menu_list?class_id=12" class="menu-list top">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_chipd.jpg" alt="Dessert">
                                </div>
                                <p class="menu-name">DESSERT</p>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="con-box">
                    <div class="con_wrap">
                        <p class="l-main-title wow fadeInUp">Goobne News</p>
                        <div class="event-list-wrap">
                            <a href="http://www.xn--9i1b89owjy5lfa431as3k.com/" target="_blank">
                                <div class="event-list on wow fadeInUp">
                                    <div class="mo-thum">
                                        <img src="/resources/assets/images/main/event_bss-univ_mo.jpg" alt="썸네일이미지">
                                    </div>
                                    <div class="status half">
                                        <p class="sub">[바사삭 유니버스]</p>
                                    </div>
                                    <div class="event-title half">
                                        <p class="main-text">구울레옹의 오븐구이 대서사시</p>
                                    </div>
                                    <div class="event-img">
                                        <img src="/resources/assets/images/main/event_bss-univ_pc.jpg" alt="">
                                    </div>
                                </a>
                            </div>
                            <div class="event-list wow fadeInUp">
                                <a href="" target="_top">
                                    <div class="mo-thum">
                                        <img src="/resources/assets/images/main/event_friday_mo.jpg" alt="썸네일이미지">
                                    </div>
                                    <div class="status half">
                                        <p class="sub">[불금치킨 이벤트]</p>
                                    </div>
                                    <div class="event-title half">
                                        <p class="main-text">불금엔 불금치킨! 불금 파격 할인</p>
                                    </div>
                                    <div class="event-img">
                                        <img src="/resources/assets/images/main/event_friday_pc.jpg" alt="">
                                    </div>
                                </a>
                            </div>
                            <div class="event-list wow fadeInUp">
                                <a href="" target="_top">
                                    <div class="mo-thum">
                                        <img src="/resources/assets/images/main/event_bss-univ-popup_mo.jpg" alt="썸네일이미지">
                                    </div>
                                    <div class="status half">
                                        <p class="sub">[팝업 스토어]</p>
                                    </div>
                                    <div class="event-title half">
                                        <p class="main-text">바사삭 유니버스, 팝업스토어 오픈!</p>
                                    </div>
                                    <div class="event-img">
                                        <img src="/resources/assets/images/main/event_bss-univ-popup_pc.jpg" alt="">
                                    </div>
                                </a>
                            </div>
                            <%-- [저널]굽네오븐썰 220707 오픈 굽뉴스  s --%>
                            <div class="event-list wow fadeInUp">
                                <a href="/journal" target="_top">
                                    <div class="mo-thum">
                                        <img src="/resources/assets/images/main/event_goob-tech-rab_mo.jpg" alt="썸네일이미지">
                                    </div>
                                    <div class="status half">
                                        <p class="sub">[굽네 오븐썰]</p>
                                    </div>
                                    <div class="event-title half">
                                        <p class="main-text">굽네만의 오븐 레시피가 탄생하는 '굽테크 랩'</p>
                                    </div>
                                    <div class="event-img">
                                        <img src="/resources/assets/images/main/event_goob-tech-rab_pc.jpg" alt="">
                                    </div>
                                </a>
                            </div>
                            <%-- [저널]굽네오븐썰 220707 오픈 굽뉴스 e --%>
                        </div>
                    </div>
     

                <div class="con-box">
                    <div class="l-main-bg">
                        <p class="title wow fadeInUp">
                            <span class="instar">The Goobster</span>
                        </p>
                        <div class="goobster-box-wrap wow fadeInUp">
                            <div class="goobster-box">
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img1.png" alt="">
                                    </a>
                                </div>
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img2.png" alt="">
                                    </a>
                                </div>
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img3.png" alt="">
                                    </a>
                                </div>
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img4.png" alt="">
                                    </a>
                                </div>
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img5.png" alt="">
                                    </a>
                                </div>
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img6.png" alt="">
                                    </a>
                                </div>
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img7.png" alt="">
                                    </a>
                                </div>
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img8.png" alt="">
                                    </a>
                                </div>
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img9.png" alt="">
                                    </a>
                                </div>
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img10.png" alt="">
                                    </a>
                                </div>
                                <div class="img">
                                    <a href="https://www.instagram.com/the___goobster/" target="_blank">
                                        <img src="/resources/assets/images/main/goobster/img11.png" alt="">
                                    </a>
                                </div>
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
                            <div class="img-box">
                                <a href="https://www.youtube.com/watch?v=c99aYibEys4" target="_blank">
                                    <img src="/resources/assets/images/main/goobtube_01.jpg" alt="">
                                </a>
                            </div>
                            <div class="img-box center">
                                <a href="https://www.youtube.com/watch?v=JnkTJmI9xsM" target="_blank">
                                    <img src="/resources/assets/images/main/goobtube_02.jpg" alt="">
                                </a>
                            </div>
                            <div class="img-box">
                                <a href="https://www.youtube.com/watch?v=UtvDMHJ1tKs" target="_blank">
                                    <img src="/resources/assets/images/main/goobtube_03.jpg" alt="">
                                </a>
                            </div>
                            <div class="img-box">
                                <a href="https://www.youtube.com/watch?v=c99aYibEys4" target="_blank">
                                    <img src="/resources/assets/images/main/goobtube_01.jpg" alt="">
                                </a>
                            </div>
                            <div class="img-box center">
                                <a href="https://www.youtube.com/watch?v=JnkTJmI9xsM" target="_blank">
                                    <img src="/resources/assets/images/main/goobtube_02.jpg" alt="">
                                </a>
                            </div>
                            <div class="img-box">
                                <a href="https://www.youtube.com/watch?v=UtvDMHJ1tKs" target="_blank">
                                    <img src="/resources/assets/images/main/goobtube_03.jpg" alt="">
                                </a>
                            </div>
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