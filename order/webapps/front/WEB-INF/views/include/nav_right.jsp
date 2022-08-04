<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant
             , com.gncns.goobne.common.session.SessionFactoryFront
             , com.gncns.goobne.common.session.GnMember" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %> 
<%
    SessionFactoryFront sessFtr = new SessionFactoryFront(request);
    GnMember user = sessFtr.getGnMember();     
	String class_id = "";
	if( request.getServletPath().contains("/WEB-INF/views/menu/menu_list.jsp") ) class_id = request.getParameter("class_id");
%><head>
<meta name="robots" content="index,nofollow">
</head>
  
<div class="aside__dimmed-bg l-hidden"></div>
<div class="aside__lnb">
    <div class="aside__lnb-inner">
        <button type="button" class="aside__lnb-close"></button>
      
        <% if( sessFtr.isLogin() ) { %>
	        <!-- 로그인시 보여지는 영역 -->
	        <div class="aside__lnb-login aside__lnb-logout"> 
	            <div class="name_float_left"><a href="#none" class="arrow-link"><span><%=user.getUser_name()%></span>님 환영합니다.</a></div> 
				<div class="name_float_right"><a href="<%=SystemConstant.LOGOUT%>" class="link logout_btn_re">Logout</a></div>
             </div>
	        <!-- // 로그인시 보여지는 영역 -->
        <% } else { %>
         <div class="aside__lnb-login">
           <!-- 오픈시 온라인 주문으로 넘김  <a href="<%=SystemConstant.LOGIN%>" class="link">Login</a>  -->
           <!-- 로그인 처리 --> <a href="/account/login" class="link">Login</a> 
            <span class="bar"></span>
<!--            <a href="<%=SystemConstant.JOIN%>" class="link">Join</a> -->
            <a href="javascript:alert('긴급 점검 중 입니다.');" class="link">Join</a>
          </div>
        <% } %>
        <div class="aside__scroll">
            <ul class="aside__lnb-list">
                <li><!--<a href="javascript:loginnet('')">--><a href="javascript:alert('긴급 점검 중 입니다.');">주문하기</a></li>
                <li class="list-arrow">
                    <a href="#none">메뉴소개</a>
					<ul class="dept <% if( request.getServletPath().contains("/WEB-INF/views/menu/menu_main.jsp") || request.getServletPath().contains("/WEB-INF/views/menu/menu_list.jsp") ) { %>is-show<% } %>">
                        <li><a href="/menu/menu_main"<% if( request.getServletPath().contains("/WEB-INF/views/menu/menu_main.jsp") && class_id.equals("") ) { %> class="active"<%}%>>전체</a></li>
                        <li><a href="/menu/menu_list?class_id=10"<% if( class_id.equals("10") ) { %> class="active"<%}%>>치킨</a></li>
                        <li><a href="/menu/menu_list?class_id=11"<% if( class_id.equals("11") ) { %> class="active"<%}%>>피자</a></li>
                        <li><a href="/menu/menu_list?class_id=12"<% if( class_id.equals("12") ) { %> class="active"<%}%>>디저트</a></li>
                        <li><a href="/menu/menu_list?class_id=13"<% if( class_id.equals("13") ) { %> class="active"<%}%>>치PD</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/store/search_store">매장찾기</a>
                   <!-- <ul class="dept">
                        <li><a href="#none">월별 신규매장</a></li>
                        <li><a href="#none">국내매장</a></li>
                        <li><a href="#none">해외매장/GLOBAL</a></li>
                    </ul>  --> 
                </li>
                <!-- <li>
                    <a href="#none">굽뉴스</a>
                </li> -->
                <li>
                    <a href="/brd/event/list">이벤트</a>
                    <!-- <ul class="dept">
                        <li><a href="#none">진행중인이벤트</a></li>
                    </ul> -->
                </li>
                <li>
                    <a href="/global">글로벌</a>
                </li>
                <li class="list-arrow">
                    <a href="#none">창업안내</a>
                    <ul class="dept <% if( request.getServletPath().contains("/WEB-INF/views/const/franchise.jsp") || request.getServletPath().contains("/WEB-INF/views/const/process.jsp") || request.getServletPath().contains("/WEB-INF/views/const/write.jsp") ) { %>is-show<% } %>">
                        <li><a href="/brd/const/franchise"<% if( request.getServletPath().contains("/WEB-INF/views/const/franchise.jsp") ) { %> class="active"<%}%>>프랜차이즈굽네</a></li>
                        <li><a href="/brd/const/process"<% if( request.getServletPath().contains("/WEB-INF/views/const/process.jsp") ) { %> class="active"<%}%>>창업프로세스 및 예상비용</a></li>
                        <li><a href="/brd/const/write"<% if( request.getServletPath().contains("/WEB-INF/views/const/write.jsp") ) { %> class="active"<%}%>>온라인 창업상담</a></li>
                    </ul>
                </li>
                <li class="list-arrow">
                    <a href="#none">브랜드</a>
                    <ul class="dept <% if( request.getServletPath().contains("/WEB-INF/views/content/brand.jsp") ) { %>is-show<% } %>">
                        <li><a href="/brand"<% if( request.getServletPath().contains("/WEB-INF/views/content/brand.jsp") ) { %> class="active"<%}%>>브랜드스토리</a></li> 
                        <li><a href="http://recruit.gn-food.co.kr/hmp/empmn/viewInfo.do?menuId=0901" target="_blank">인재채용</a></li> 
                    </ul>
                </li> 
                <li>
                    <% if( sessFtr.isLogin() ) { %>
                    <a href="/brd/customer/write">굽민의소리</a>
                    <% } else { %>
                    <a href="/account/login" class="link">굽민의소리</a>
                    <%} %>
                </li>
                <li>
                    <a href="/brd/notice/list" rel="nosublink">공지사항</a>
                </li>  
                 <% if( sessFtr.isLogin() ) { %>
                <li class="list-arrow">
                   <a href="#none">MY PAGE</a>
                   <ul class="dept">
                        <li><a href="/brd/customer/list">나의 문의내역</a></li> 
                        <li><a href="javascript:loginnet('/member/resign.aspx');">회원탈퇴</a></li> 
                    </ul>
                </li>                
                <%} %>
            </ul>
            <dl class="aside__num">
                <dt>주문전화</dt>
                <dd>1661-9494</dd>
            </dl>
            <%-- 1차때는 숨김 
            <% if( sessFtr.isLogin() ) { %>
            <!-- 로그인시 보여지는 영역 --> 
            <div class="l-info-area l-pc-show">
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
                    <span><%=user.getUser_name()%></span>님의 등급은 <span class="eng"><%=user.getUser_type_nm() %></span>입니다.
                </div>
            </div>
            <!-- 로그인시 보여지는 영역 -->
            <% } %>
            --%>
            
        </div>
    </div>
</div>

