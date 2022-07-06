<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String staticUrl = SystemConstant.getStaticUrl();

%>
<!DOCTYPE html>
<html lang="kor" dir="ltr">
<head>
   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
   <script>
    
        $(document).ready(function () {
            new WOW().init();
            // 배너 슬라이드 
            let bannerSwiper = new Swiper(".bannerSwiper", {
                autoplay: {
                    delay: 5000,
                    disableOnInteraction: false,
                },
                pagination: {
                    el: ".swiper-pagination",
                },
            });

            // 실시간 메뉴 롤링 
            let rollswiper = new Swiper(".rollSwiper", {
                loop: true,
                autoplay: {
                    delay: 1500,
                    disableOnInteraction: false,
                },
                direction: "vertical"
            });

            // 지금 인기있는 메뉴 btn
            $('.menu__popular .l-btn-list button').click(function () {
                $(this).addClass('is-active').siblings().removeClass('is-active');
            });

            let popularSwiper = new Swiper(".popularSwiper", {
                // slidesPerView: 3,
                // spaceBetween: 30,
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                breakpoints: {
                    320: {
                        slidesPerView: 1,
                        spaceBetween: 30,
                    },
                    500: {
                        slidesPerView: 2,
                        spaceBetween: 30,
                    },
                    761: {
                        slidesPerView: 3,
                        spaceBetween: 30,
                    },
                },
            });

            // 배송지 설정 버튼 구현 
            $('.setting-btn').click(function () {
                $('.modal-cnt-wrapper').removeClass('l-hidden');
                $('.dimmed-bg').removeClass('l-hidden');
            });

           
			
        });
        
        function menu_list(class_id){
        	$('#class_id').val(class_id);
    	    document.menuListForm.action='/menu/menu_list' 
    		document.menuListForm.submit();
        }
        
        function chgNowPop(class_id){
        	var obj = new Object();  
        	obj.class_id = class_id;
        	var url = "/menu/chgNowPop";
        	var data = JSON.stringify(obj); 
        	ajaxCall(url, data, nowPopCallBack, errorCallBack, '지금인기있는메뉴검색');
        }
        function nowPopCallBack(obj){
        	var htmlTxt ="";
        	var popList = obj.body.pop_list.menu_list;
    		if(popList.length>0){
    			for (var i in popList) {
    				htmlTxt +='<div class="swiper-slide">';
    	        	htmlTxt +='<div class="l-menu-item">';
    	        	htmlTxt +='<div class="img">';
    	        	var imgUrl = "<%=staticUrl %>"+popList[i].img_name;
    	        	htmlTxt +='<img src="'+imgUrl+'" alt="인기메뉴">';
    	        	htmlTxt +='</div>';
    	        	htmlTxt +='<dl class="desc">';
    	        	htmlTxt +='<dt class="title">'+popList[i].item_name+'</dt>';
    	        	htmlTxt +='<dd class="dis-price"><span class="l-num">'+numberFormatComma(popList[i].price1)+'</span>원</dd>';
    	        	htmlTxt +='</dl></div></div>';
    			}
    		}
    		$('#nowpopDiv').empty();
    		$('#nowpopDiv').html(htmlTxt);
        	
        }
        
        
        function selStoreCallBack(obj) {  
        	if ( obj.result == common._trans_success_code ) { 
        		var br_id = obj.body.br_id; 
        		console.log("매장선택 session 생성완료,선택매장 =>"+br_id);
        		
        		$('#promo_bg').addClass('l-hidden');
        		$('#promo').addClass('l-hidden'); 
        		menu_list('');
        	}
        } 
        function menu_view(item_id){
        	window.location.href = "/menu/menu_view?class_id=&item_id="+item_id;
        }
    </script>
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

            <article class="l-layout menu">

                <!-- 실시간 급상승 메뉴 -->
                <section class="menu__time">
                    <div class="l-inner">
                        <div class="l-title-area">
                            <div class="left">
                                <div class="l-sub-title">${menuPopular.title }</div>
                                <div class="bar"></div>
                                <div class="roll-cont">
                                    <div class="swiper rollSwiper">
                                        <div class="swiper-wrapper">
                                        	<c:forEach var="i" begin="1" end="10" >
                                        		<c:if test="${i<10 }">
                                        		<c:set var="pop" value="list0${i}" />
                                        		</c:if>
                                        		<c:if test="${i eq 10 }">
                                        			<c:set var="pop" value="list${i}" />
                                        		</c:if>
                                        		<c:if test="${ menuPopular[pop] ne '' and menuPopular[pop] ne null}">
		                                            <div class="swiper-slide">
		                                                <p class="word"><c:out value="${menuPopular[pop]}"/></p>  
		                                            </div>
	                                            </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="right">
                                <div class="l-map-icon red"></div>
                                <p class="text" id="myLocMenu" onclick="promoStore()">위치정보 없음</p>
                               <!--  <button type="button" class="setting-btn">배송지설정</button> -->
                            </div>
                        </div>
                        <div class="banner-slide">
                            <div class="swiper bannerSwiper">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="item"
                                            style="background-image: url(/resources/assets/images/contents/menu_special-recipe_01.jpg);">
                                            <!-- <img src="/resources/assets/images/contents/ex-menu-banner.svg" alt=""> -->
                                            <div class="text-area">
                                                <div class="main">
                                                    굽네의<br>
                                                    특별한 오븐레시피를<br>
                                                    소개합니다
                                                </div>
                                                <div class="sub" style="display: none;">
                                                    믿고 먹는 치킨은 물론 바삭한 딥디쉬 도우의 맛을 즐길 수 잇는<br>
                                                    굽네 피자 시리즈, 메인메뉴의 맛을 더욱 풍성하게 채워주는 디저트 메뉴까지.<br>
                                                    이모든 고품질 오븐 메뉴들을 굽네에서 한번에 즐겨보세요.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item"
                                            style="background-image: url(/resources/assets/images/contents/menu_special-recipe_02_3.jpg);">
                                            <div class="text-area">
                                                <div class="sub" style="display: none;">
                                                    믿고 먹는 치킨은 물론 바삭한 딥디쉬 도우의 맛을 즐길 수 잇는<br>
                                                    굽네 피자 시리즈, 메인메뉴의 맛을 더욱 풍성하게 채워주는 디저트 메뉴까지.<br>
                                                    이모든 고품질 오븐 메뉴들을 굽네에서 한번에 즐겨보세요.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item"
                                            style="background-image: url(/resources/assets/images/contents/menu_special-recipe_03-2.jpg);">
                                            <div class="text-area">
                                                <div class="sub" style="display: none;">
                                                    믿고 먹는 치킨은 물론 바삭한 딥디쉬 도우의 맛을 즐길 수 잇는<br>
                                                    굽네 피자 시리즈, 메인메뉴의 맛을 더욱 풍성하게 채워주는 디저트 메뉴까지.<br>
                                                    이모든 고품질 오븐 메뉴들을 굽네에서 한번에 즐겨보세요.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- //실시간 급상승 메뉴 -->

                <!-- 굽네의 오븐레시피 -->
                <section class="menu__recipe">
                	<form id="menuListForm" name="menuListForm" id="menuListForm" method="get">
                		<input type="hidden" id="class_id" name="class_id">
                	</form>
                    <div class="l-inner">
                        <div class="l-title-area">
                            <div class="left">
                                <div class="l-sub-title">Oven Menu</div>
                            </div>
                            <div class="right">
                                <a href="javascript:menu_list('');" class="more">더보기 + </a>
                            </div>
                        </div>
                        <div class="recipe-list">
                            <a href="javascript:menu_list('10');" class="list">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_chicken.jpg" alt="CHICKEN">
                                </div>
                                <p class="menu-name">치킨</p>
                            </a>
                            <a href="javascript:menu_list('11');" class="list">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_pizza.jpg" alt="PIZZA">
                                </div>
                                <p class="menu-name">피자</p>
                            </a>
                            <a href="javascript:menu_list('12');" class="list">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_dessert.jpg" alt="Dessert">
                                </div>
                                <p class="menu-name">디저트</p>
                            </a>
                            <a href="javascript:menu_list('13');" class="list">
                                <div class="menu-img">
                                    <img src="/resources/assets/images/contents/recipe_chipd.jpg" alt="Dessert">
                                </div>
                                <p class="menu-name">치PD</p>
                            </a>
                        </div>
                    </div>
                </section>
                <!-- // 굽네의 오븐레시피 -->


                <!-- 지금 인기있는 메뉴 -->
                <section class="menu__popular">
                    <div class="menu__popular-inner">
                        <div class="l-sub-title">지금 인기있는 메뉴</div>
                        <div class="l-btn-list">
                            <button type="button" class="<c:if test="${menuDTO.class_id eq null }">is-active</c:if>" onclick="chgNowPop('');">전체</button>
                            <c:forEach items="${menuNowPopClass }" var ="classList">
                            	<button type="button" class="<c:if test="${menuDTO.class_id eq classList.class_id }">is-active</c:if>" value="${classList.class_id }" onclick="chgNowPop('${classList.class_id}');">${classList.cate_name }</button>
                            </c:forEach>
                        </div>
                        <div class="menu__popular-slide">
                            <div class="swiper popularSwiper">
                                <div class="swiper-wrapper" id="nowpopDiv">
                                    <c:forEach items="${menuNowPopular }" var="nowPop">
                                    <div class="swiper-slide">
                                        <div class="l-menu-item" onclick="menu_view('${nowPop.item_id}');">
                                            <div class="img">
                                                <img src="<%=staticUrl %>${nowPop.img_name}" alt="인기메뉴">
                                            </div>
                                            <dl class="desc">
                                                <dt class="title">${nowPop.item_name }</dt>
                                                <dd class="dis-price"><span class="l-num"><fmt:formatNumber value="${nowPop.price1 }" pattern="#,###" /></span>원</dd>
                                            </dl>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- //지금 인기있는 메뉴 -->


            </article>
        </div>
        <!-- end of :: contents -->
        <!-- start of :: footer -->
        <div id="footer" class="sub-footer">
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