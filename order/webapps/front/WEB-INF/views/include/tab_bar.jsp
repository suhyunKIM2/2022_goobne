<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %> 
<div class="inner">
    <!--<button type="button" class="qk-menu-btn" onClick="location.href='<%=SystemConstant.ORDER%>'">-->
	<button type="button" class="qk-menu-btn" onClick="javascript:alert('긴급 점검 중 입니다.');">
        <!--<img src="/resources/assets/images/common/l-quick.svg" alt="퀵메뉴아이콘"> 2차 오픈 아이콘-->
		<img src="/resources/assets/images/common/l-quick_02.svg" alt="온라인주문아이콘">
        <span>주문</span>
    </button></a>
    <!--<a href="<%=SystemConstant.ORDER%>" class="order">주문</a>-->
    <a href="/menu/menu_main" class="menu <% if(request.getServletPath().contains("/menu/")){%>on<%}%>">메뉴보기</a>
    <a href="/store/search_store" class="find <% if(request.getServletPath().contains("/store/")){%>on<%}%>">매장찾기</a>
    <a href="/brd/event/list" class="event <% if(request.getServletPath().contains("/views/event/")) {%>on<%}%>">이벤트</a>
	<a href="/brd/const/write" class="const <% if(request.getServletPath().contains("/views/const/")) {%>on<%}%>">창업안내</a>
<style>
#mobile-nav .menu{margin-right:0;}
#mobile-nav .const {
    background: url(/resources/assets/images/common/nav_icon_05.svg) top 2rem center no-repeat;    background-size: 23px;
}
#mobile-nav .const.on {
    background: url(/resources/assets/images/common/nav_icon_05_on.svg) top 2rem center no-repeat;background-size: 23px;
}
@media (max-width: 320px){
#mobile-nav .inner{width:95%;}
}
</style>
</div>