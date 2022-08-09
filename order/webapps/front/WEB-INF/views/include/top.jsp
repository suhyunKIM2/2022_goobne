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
%><head>
<meta name="robots" content="index,nofollow">
</head>
  
<div class="loading-bar on"></div>
<div class="inner">
    <div class="logo">
        <a href="/index">
            <img src="/resources/assets/images/common/logo.svg" alt="logo">
        </a>
    </div>  
    <div class="menu">
        <ul>
            <li><a href="javascript:loginnet('')">주문하기</a></li>
            <li><a href="/menu/menu_main">메뉴소개</a></li>
            <li><a href="/store/search_store">매장찾기</a></li>
            <li><a href="/brd/const/franchise">창업안내</a></li>
            <li><a href="/brd/event/list">이벤트</a></li>
        </ul>
    </div> 
    <div class="btn-cnt-area">
        <% if( sessFtr.isLogin() ) { %>
	        <!-- 로그인시 보여지는 영역 -->
	       <a href="/brd/customer/list"><div class="login-btn"></div></a>
	        <!-- // 로그인시 보여지는 영역 -->
        <% } else { %>
           <a href="/account/login" class="link"><div class="login-btn"></div></a>
        <% } %>
        <%-- <button class="search-icon mobile"></button> --%>
        <div class="sub-menu-btn">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
        </div>
    </div>
</div> 