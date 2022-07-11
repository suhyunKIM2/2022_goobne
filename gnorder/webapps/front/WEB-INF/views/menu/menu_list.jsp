<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String staticUrl = SystemConstant.getStaticUrl();

%>
<!DOCTYPE html>
<html lang="kor" dir="ltr">
<head>
   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
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
        	<form id="menuListForm" name="menuListForm" method="get">
        		<input type="hidden" id="class_id" name="class_id">
        		<input type="hidden" id="item_id" name="item_id">
        	</form>
            <article class="l-layout menu-view">
                <div class="l-inner">
                    <div class="l-title">메뉴보기</div>
                    <div class="l-btn-list wt" id="cate_list">
                        <button type="button" class="<c:if test="${menuDto.class_id eq '' }">is-active</c:if>" onclick="menu_list('')">전체</button>
                        <c:forEach items="${class_list }" var="cate">
                        	<button type="button" class="<c:if test="${menuDto.class_id eq cate.class_id }">is-active</c:if>" onclick="menu_list('${cate.class_id }')">${cate.cate_name }</button>
                        </c:forEach>
                    </div>
					<c:set var="startIdx" value="0"/>
                    <!-- 메뉴리스트 - 메인 영역 -->
                    <c:if test="${fn:length(menu_list)>3 }">
                    <c:set var="startIdx" value="5"/>
                    <section class="menu-view__main">
                    	<div class="half main-menu-area">
                            <div class="item-list" >
                                <div class="l-menu-item big" onclick="menu_view('${menu_list[0].item_id}')">
                                    <div class="img" style="background-image: url(<%=staticUrl %>${menu_list[0].img_name});"></div>
                                    <div class="l-badge-wrap">
                                        <!-- <button class="l-bomb" type="button"><img src="../assets/images/icon/l-bomb.svg" alt="아이콘"></button> -->
                                        <c:if test="${menu_list[0].new_yn eq 'Y' }">
                                        	<button class="badge l-num l-new">new</button>
                                        </c:if>
                                        <c:if test="${menu_list[0].best_yn eq 'Y' }">
                                        	<button class="badge l-num l-best">best</button>
                                        </c:if>
                                        <c:if test="${menu_list[0].recommend_yn eq 'Y' }">
                                        	<button class="badge l-md"><span class="l-num">MD</span>추천</button>
                                        </c:if>
                                        <c:if test="${menu_list[0].spice_yn eq 'Y' }">
                                       	 <button class="badge l-num l-hot hot1">Hot<i></i></button>
                                       	</c:if>
                                    </div>
                                    <dl class="desc">
                                        <dt class="title">${menu_list[0].item_name }</dt>
                                        <!-- <dd class="l-num precent">10%</dd> -->
                                        <dd class="dis-price">
                                        	<span class="l-num"><fmt:formatNumber value="${menu_list[0].price1 }" pattern="#,###" /></span>
                                        	<c:if test="${menu_list[0].price1 ne '' and menu_list[0].price1 ne null }">원</c:if>
                                       	</dd>
                                        <!-- <dd class="or-price"><span class="l-num">22,400</span>원</dd> -->
                                        <!-- <dd class="icon">
                                            <button type="button"><img src="../assets/images/icon/l-menu-cart.svg"
                                                    alt="카트아이콘"></button>
                                        </dd> -->
                                    </dl>
                                </div>
                            </div>
                        </div>
                       
                        <div class="half list-menu-area" id="rMenu">
                        	<c:forEach  items="${menu_list }" var="menu" varStatus="status" begin="1" end="4">
	                            <div class="l-menu-item" onclick="menu_view('${menu.item_id}')">
	                                <div class="img">
	                                    <img src="<%=staticUrl %>${menu.img_name}" alt="인기메뉴">
	                                </div>
	                                <div class="l-badge-wrap">
	                                    <!-- <button class="l-bomb" type="button"><img src="/resources/assets/images/icon/l-bomb.svg" alt="아이콘"></button> -->
	                                     <c:if test="${menu.new_yn eq 'Y' }">
                                        	<button class="badge l-num l-new">new</button>
                                         </c:if>
                                         <c:if test="${menu.best_yn eq 'Y' }">
                                        	<button class="badge l-num l-best">best</button>
                                         </c:if>
                                         <c:if test="${menu.recommend_yn eq 'Y' }">
                                        	<button class="badge l-md"><span class="l-num">MD</span>추천</button>
                                         </c:if>
                                         <c:if test="${menu.spice_yn eq 'Y' }">
	                                     <button class="badge l-num l-hot hot1">Hot<i></i></button>
	                                     </c:if>
	                                </div>
	                                <dl class="desc">
	                                    <dt class="title">${menu.item_name }</dt>
	                                    <!-- <dd class="l-num precent">10%</dd> -->
	                                    <dd class="dis-price"><span class="l-num"> <fmt:formatNumber value="${menu.price1 }" pattern="#,###" /></span>원</dd>
	                                    <!-- <dd class="or-price"><span class="l-num">22,400</span>원</dd> -->
	                                    <!-- <dd class="icon">
	                                        <button type="button"><img src="/resources/assets/images/icon/l-menu-cart.svg"
	                                                alt="카트아이콘"></button>
	                                    </dd> -->
	                                </dl>
	                            </div>
                            </c:forEach>
                        </div>
                    </section>
                    </c:if>
                    <!-- //메뉴리스트 - 메인 영역 -->

                    <!-- 메뉴리스트 - 하단 영역  -->
                    <div class="l-menu-item-list" id="bMenu">
						<c:forEach  items="${menu_list }" var="menu" varStatus="status" begin="${startIdx }">
                        <div class="l-menu-item"  onclick="menu_view('${menu.item_id}')">
                            <div class="img">
                                <img src="<%=staticUrl %>${menu.img_name }" alt="인기메뉴">
                            </div>
                            <div class="l-badge-wrap">
                               <!--  <button class="l-bomb" type="button"><img src="/resources/assets/images/icon/l-bomb.svg" alt="아이콘"></button> -->
                               <c:if test="${menu.new_yn eq 'Y' }">
                               		<button class="badge l-num l-new">new</button>
                                </c:if>
                                <c:if test="${menu.best_yn eq 'Y' }">
                               		<button class="badge l-num l-best">best</button>
                                </c:if>
                                <c:if test="${menu.recommend_yn eq 'Y' }">
                               		<button class="badge l-md"><span class="l-num">MD</span>추천</button>
                                </c:if>
                                <c:if test="${menu.spice_yn eq 'Y' }">
                                	<button class="badge l-num l-hot hot1">Hot<i></i></button>
                                </c:if>
                            </div>
                            <dl class="desc">
                                <dt class="title">${menu.item_name }</dt>
                                <!-- <dd class="l-num precent l-hidden">10%</dd> -->
                                <dd class="dis-price"><span class="l-num"><fmt:formatNumber value="${menu.price1 }" pattern="#,###" /></span>원</dd>
                                <!-- <dd class="or-price l-hidden"><span class="l-num">22,400</span>원</dd> -->
                                <!-- <dd class="icon">
                                    <button type="button"><img src="/resources/assets/images/icon/l-menu-cart.svg"
                                            alt="카트아이콘"></button>
                                </dd> -->
                            </dl>
                        </div>
                        </c:forEach>
                    </div>
                    <!-- //메뉴리스트 - 하단 영역  -->

                    <!-- 페이징 영역  -->
                   <!--  <section class="l-paging-num mt30">
                        <button type="button">1</button>
                        <button type="button" class="is-active">2</button>
                        <button type="button">3</button>
                        <button type="button">4</button>
                        <button type="button">5</button>
                        <button type="button">6</button>
                    </section> -->
                    <!-- //페이징 영역  -->
                </div>
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
    
    <script>
        $(document).ready(function () {
            //new WOW().init();
        	//searchMenuList(${menuDto.class_id});    
        });
        function menu_list(class_id){
        	$('#class_id').val(class_id);
    	    document.menuListForm.action='/menu/menu_list' 
    		document.menuListForm.submit();
        }
        function menu_view(item_id){
        	$('#item_id').val(item_id);
    	    document.menuListForm.action='/menu/menu_view' 
    		document.menuListForm.submit();
        }
    </script>
</body>
</html>