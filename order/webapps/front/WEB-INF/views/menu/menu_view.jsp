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
   <style>
   .menu-detail__desc-area .select-btn button:first-child:nth-last-child(1){width:auto;padding:0 2rem;}
   </style>
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
            <article class="l-layout menu-detail">
                <div class="l-inner">
                    <div class="l-title">${menu_view.item_name}</div>
                    
                    <section class="menu-detail__wrap">
                        <div class="half menu-detail__img-area">
                            <div class="img">
                                <img src="<%=staticUrl %>${menu_view.img_name}" alt="메뉴상세이미지" id="itemImg">
                            </div>
                            <div class="desc-box">
							<!--- 2차오픈시 열릴 UI---->
                                <!--<div class="drop-box">
                                    <button type="button" class="arrow-btn">원산지 정보보기<i class="arrow"></i></button>
                                    <div class="drop">
                                        <button type="button" class="close"><img src="/resources/assets/images/icon/a-close.svg" alt="닫기"></button>
                                        <p class="drop__tit">원산지 정보보기</p>
                                        <p class="drop__tit-sub">원산지</p>
                                        <div class="drop__desc" id="origin">
                                          ${menu_view.origin}
                                        </div>
                                    </div>
                                </div>-->
                                <!--<div class="drop-box">
                                    <button type="button" class="arrow-btn">영양성분 정보보기<i class="arrow"></i></button>
                                    <div class="drop">
                                        <button type="button" class="close"><img src="/resources/assets/images/icon/a-close.svg" alt="닫기"></button>
                                        <p class="drop__tit">영양성분 정보보기</p>
                                        <p class="drop__tit-sub">영양성분 정보</p>
                                        <div class="drop__table">
                                            <table>
                                                <colgroup>
                                                    <col style="width: 50%;">
                                                    <col style="width: 50%;">
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th>1회제공량</th>
                                                        <th>${menu_view.food03}</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="food">
                                                	<c:if test="${menu_view.food05 ne '' and menu_view.food05 ne null}">
	                                                    <tr >
	                                                        <td>열량(Kcal)</td>
	                                                        <td>${menu_view.food05}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food06 ne '' and menu_view.food06 ne null}">
	                                                    <tr >
	                                                        <td>나트륨(mg)</td>
	                                                        <td>${menu_view.food06}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food07 ne '' and menu_view.food07 ne null}">
	                                                    <tr >
	                                                        <td>탄수화물(g)</td>
	                                                        <td>${menu_view.food07}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food08 ne '' and menu_view.food08 ne null}">
	                                                    <tr >
	                                                        <td>당류(g)</td>
	                                                        <td>${menu_view.food08}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food09 ne '' and menu_view.food09 ne null}">
	                                                    <tr >
	                                                        <td>지방(g)</td>
	                                                        <td>${menu_view.food09}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food10 ne '' and menu_view.food10 ne null}">
	                                                    <tr >
	                                                        <td>트랜스지방(g)</td>
	                                                        <td>${menu_view.food10}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food11 ne '' and menu_view.food11 ne null}">
	                                                    <tr >
	                                                        <td>포화지방(g)</td>
	                                                        <td>${menu_view.food11}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food12 ne '' and menu_view.food12 ne null}">
	                                                    <tr >
	                                                        <td>콜레스테롤(mg)</td>
	                                                        <td>${menu_view.food12}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food13 ne '' and menu_view.food13 ne null}">
	                                                    <tr >
	                                                        <td>단백질(g)</td>
	                                                        <td>${menu_view.food13}</td>
	                                                    </tr>
                                                    </c:if>
                                                   
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="drop-box">
                                    <button type="button" class="arrow-btn">알레르기 정보보기<i class="arrow"></i></button>
                                    <div class="drop">
                                        <button type="button" class="close"><img src="/resources/assets/images/icon/a-close.svg" alt="닫기"></button>
                                        <p class="drop__tit">알레르기 정보 보기</p>
                                        <p class="drop__tit-sub">알레르기 정보</p>
                                        <div class="drop__table">
                                            <table>
                                                <colgroup>
                                                    <col>
                                                    <col>
                                                    <col style="width: 45%;">
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th>구분</th>
                                                        <th>제품명</th>
                                                        <th>주요 알레르기 성분</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>신메뉴</td>
                                                        <td>굽네 오븐 바사삭</td>
                                                        <td>계란, 우유, 대구, 아황산류, 
                                                            쇠고기, 조개류</td>
                                                    </tr>
                                                    <tr>
                                                        <td>치킨 시리즈</td>
                                                        <td>굽네 치즈 바사삭</td>
                                                        <td>닭고기, 계란, 우유, 대두, 밀,
                                                            쇠고기
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>굽네 치즈 바사삭</td>
                                                        <td>닭고기, 계란, 우유, 대두, 밀,
                                                            쇠고기
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>굽네 치즈 바사삭</td>
                                                        <td>닭고기, 계란, 우유, 대두, 밀,
                                                            쇠고기
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>굽네 치즈 바사삭</td>
                                                        <td>닭고기, 계란, 우유, 대두, 밀,
                                                            쇠고기
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>-->
                            </div>
                        </div>
                        <div class="half menu-detail__desc-area">
                        		<div class="l-badge-wrap">
                                        <!-- <button class="l-bomb" type="button"><img src="../assets/images/icon/l-bomb.svg" alt="아이콘"></button> -->
                                        <c:if test="${menu_view.new_yn eq 'Y' }">
                                        	<button class="badge l-num l-new">new</button>
                                        </c:if>
                                        <c:if test="${menu_view.best_yn eq 'Y' }">
                                        	<button class="badge l-num l-best">best</button>
                                        </c:if>
                                        <c:if test="${menu_view.recommend_yn eq 'Y' }">
                                        	<button class="badge l-md"><span class="l-num">MD</span>추천</button>
                                        </c:if>
                                        <c:if test="${menu_view.spice_yn eq 'Y' }">
                                       	 <button class="badge l-num l-hot hot1">Hot<i></i></button>
                                       	</c:if>
                                 </div>    
                            <dl class="name">
                                <dt class="tit" id="itemNm">${menu_view.item_name }</dt>
                                <jsp:scriptlet> pageContext.setAttribute("newline", "\n"); </jsp:scriptlet>
                                <dd class="desc" id="description">
                                	<c:out value="${fn:replace(menu_view.description, newline, '<br>')}" escapeXml="false"/>
                                </dd>
                            </dl>
                            <p class="price"><span class="l-num" id="price"><fmt:formatNumber value="${menu_view.price1 }" pattern="#,###" /></span>원</p>
                            <div class="select-btn">
                            	<c:forEach items="${menu_detail }" var="sub">
                            		<button type="button" class="<c:if test="${sub.item_id eq menu_view.item_id }">is-active</c:if>" onclick="chgMenuView('${sub.item_id}')">${sub.item_sname}</button>
                            	</c:forEach>
                            </div>
							
                             <%-- <dl class="origin">
                                <dt>원산지</dt>
                                <dd id="origin2">${menu_view.origin }</dd>
                            </dl> --%>
							<!--- 2차오픈시 닫는 UI---->
							<div class="half menu-detail__img-area" style="width:100%;padding:0;">
                            <div class="desc-box" style="margin-top: 2rem;">
                            	 <div class="drop-box">
                            	 	<button type="button" class="arrow-btn">원산지<i class="arrow"></i></button>
                            	 	<div class="drop">
                            	 		<button type="button" class="close"><img src="/resources/assets/images/icon/a-close.svg" alt="닫기"></button>
                            	 		<p class="drop__tit">원산지 정보보기</p>
                                        <p class="drop__tit-sub">원산지 정보</p>
                                         <div class="drop__desc" id="origin">
                                          ${menu_view.origin}
                                        </div>
                            	 	</div>
                            	 </div>
                                <div class="drop-box">
                                    <button type="button" class="arrow-btn">영양성분 정보보기<i class="arrow"></i></button>
                                    <div class="drop">
                                        <button type="button" class="close"><img src="/resources/assets/images/icon/a-close.svg" alt="닫기"></button>
                                        <p class="drop__tit">영양성분 정보보기</p>
                                        <p class="drop__tit-sub">영양성분 정보</p>
                                        <div class="drop__table">
                                            <table>
                                                <colgroup>
                                                    <col style="width: 50%;">
                                                    <col style="width: 50%;">
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th>1회제공량</th>
                                                        <th id="food03">${menu_view.food03 }</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="food">
                                                    <c:if test="${menu_view.food05 ne '' and menu_view.food05 ne null}">
	                                                    <tr >
	                                                        <td>열량(Kcal)</td>
	                                                        <td>${menu_view.food05}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food06 ne '' and menu_view.food06 ne null}">
	                                                    <tr >
	                                                        <td>나트륨(mg)</td>
	                                                        <td>${menu_view.food06}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food07 ne '' and menu_view.food07 ne null}">
	                                                    <tr >
	                                                        <td>탄수화물(g)</td>
	                                                        <td>${menu_view.food07}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food08 ne '' and menu_view.food08 ne null}">
	                                                    <tr >
	                                                        <td>당류(g)</td>
	                                                        <td>${menu_view.food08}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food09 ne '' and menu_view.food09 ne null}">
	                                                    <tr >
	                                                        <td>지방(g)</td>
	                                                        <td>${menu_view.food09}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food10 ne '' and menu_view.food10 ne null}">
	                                                    <tr >
	                                                        <td>트랜스지방(g)</td>
	                                                        <td>${menu_view.food10}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food11 ne '' and menu_view.food11 ne null}">
	                                                    <tr >
	                                                        <td>포화지방(g)</td>
	                                                        <td>${menu_view.food11}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food12 ne '' and menu_view.food12 ne null}">
	                                                    <tr >
	                                                        <td>콜레스테롤(mg)</td>
	                                                        <td>${menu_view.food12}</td>
	                                                    </tr>
                                                    </c:if>
                                                	<c:if test="${menu_view.food13 ne '' and menu_view.food13 ne null}">
	                                                    <tr >
	                                                        <td>단백질(g)</td>
	                                                        <td>${menu_view.food13}</td>
	                                                    </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="drop-box">
                                    <button type="button" class="arrow-btn">알레르기 정보보기<i class="arrow"></i></button>
                                    <div class="drop">
                                        <button type="button" class="close"><img src="/resources/assets/images/icon/a-close.svg" alt="닫기"></button>
                                        <p class="drop__tit">알레르기 정보 보기</p>
                                        <p class="drop__tit-sub">알레르기 정보</p>
                                        <div class="drop__table">
                                            <table>
                                                <colgroup>
                                                    <col>
                                                    <col>
                                                </colgroup>

                                                <thead>
                                                    <tr>
                                                        <th colspan="2">제품명</th>
                                                        <th>주요 알레르기 성분</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>오리지널</td>
                                                        <td>굽네치킨 씨즈닝</td>
                                                        <td>대두</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>달콤소스</td>
                                                        <td> 대두, 밀, 땅콩
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>매콤소스</td>
                                                        <td> 대두, 밀, 토마토
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>볼케이노</td>
                                                        <td>볼케이노 소스</td>
                                                        <td>우유, 대두, 밀, 토마토, 쇠고기, 조개류(굴)</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>마그마 소스</td>
                                                        <td> 우유, 대두, 밀, 토마토, 쇠고기, 조개류(굴)
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>스윗 볼케이노</td>
                                                        <td>스윗볼케이노 소스</td>
                                                        <td>우유, 대두, 밀, 돼지고기, 토마토, 쇠고기</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>스윗마그마 소스</td>
                                                        <td> 우유, 대두, 밀, 돼지고기, 토마토, 쇠고기
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>갈비천왕</td>
                                                        <td>갈비양념 소스</td>
                                                        <td>우유, 대두, 밀, 토마토, 닭고기, 쇠고기, 조개류(굴)</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>왕중왕 소스</td>
                                                        <td> 우유, 대두, 밀, 토마토, 닭고기, 쇠고기, 조개류(굴)
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>고추바사삭</td>
                                                        <td>고추바사삭 파우더</td>
                                                        <td>대두, 밀, 땅콩, 우유</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>마블링 소스</td>
                                                        <td> 대두, 계란
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>고블링 소스</td>
                                                        <td> 참아람 : 계란, 대두, 쇠고기 / 원일 : 계란, 대두, 우유, 밀
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>오븐바사삭</td>
                                                        <td>현미가루</td>
                                                        <td>밀</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>오리지널바사삭 파우더</td>
                                                        <td> 대두
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>러블링 소스</td>
                                                        <td> 우유, 대두, 밀, 토마토, 쇠고기, 돼지고기
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>딥치즈</td>
                                                        <td>굽네 치즈홀릭 파우더</td>
                                                        <td>우유, 대두, 밀, 땅콩</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>굽네 치즈믹스 파우더</td>
                                                        <td> 우유, 대두, 밀
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>치즈 바사삭</td>
                                                        <td>굽네 콰트로 치즈믹스</td>
                                                        <td>우유, 대두</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>굽네 치즈 파우더</td>
                                                        <td> 우유, 대두, 밀
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>양념히어로</td>
                                                        <td>오리지널바사삭 파우더</td>
                                                        <td>대두</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>달콤양념 소스</td>
                                                        <td> 우유, 대두, 밀, 토마토, 쇠고기, 돼지고기
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>츄블링 소스</td>
                                                        <td> 계란, 대두, 쇠고기
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>현미가루</td>
                                                        <td> 밀
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>갈릭마왕</td>
                                                        <td>오리지널바사삭 파우더</td>
                                                        <td>대두</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>갈릭마왕 소스</td>
                                                        <td> 우유, 대두, 밀, 돼지고기, 쇠고기
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>츄블링 소스</td>
                                                        <td> 계란, 대두, 쇠고기
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>현미가루</td>
                                                        <td> 밀
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>허니멜로</td>
                                                        <td>허니멜로 양념소스</td>
                                                        <td>계란, 우유, 땅콩, 대두, 밀, 돼지고기</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>허니멜로 디핑소스</td>
                                                        <td> 계란, 우유, 땅콩, 대두, 밀, 돼지고기, 이산화황
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>불금치킨</td>
                                                        <td>불금치킨 소스</td>
                                                        <td>우유, 대두, 밀, 토마토, 쇠고기, 조개류(굴)</td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>오매불맛 소스</td>
                                                        <td> 우유, 대두, 밀, 토마토, 쇠고기, 조개류(굴)
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>버터갈릭 소스</td>
                                                        <td> 대두, 우유, 계란
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>갈비천왕 그릴드비프 피자</td>
                                                        <td>그릴드 비프 갈비천왕 피자</td>
                                                        <td>밀, 대두, 우유, 토마토, 쇠고기, 닭고기, 아황산류, 조개류(굴)</td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>이지마요 소스</td>
                                                        <td> 대두, 우유, 계란
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>볼케이노 바비큐 치킨 피자</td>
                                                        <td>바비큐 치킨 볼케이노 피자</td>
                                                        <td>밀, 대두, 우유, 토마토, 쇠고기, 닭고기, 아황산류, 조개류(굴)</td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>버터갈릭 소스</td>
                                                        <td> 대두, 우유, 계란
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>허니멜로 스윗 포테이토 피자</td>
                                                        <td>스윗 포테이토 허니멜로 피자</td>
                                                        <td>밀, 대두, 우유, 계란, 돼지고기</td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>버터갈릭 소스</td>
                                                        <td> 대두, 우유, 계란
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>고구마 필링 소스</td>
                                                        <td> 대두, 우유
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>페퍼로니 챱챱피자</td>
                                                        <td>페퍼로니 챱챱 피자</td>
                                                        <td>밀, 대두, 우유, 토마토, 쇠고기, 돼지고기</td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>버터갈릭 소스</td>
                                                        <td> 대두, 우유, 계란
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>눈꽃치즈(체다치즈)</td>
                                                        <td> 우유, 난류, 대두, 밀
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>시카고 딥디쉬 피자</td>
                                                        <td>시카고피자</td>
                                                        <td>우유, 대두, 밀, 닭고기, 토마토</td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>그뤼에르치즈</td>
                                                        <td> 대두, 우유
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>파마산치즈가루</td>
                                                        <td>우유
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>슈림프 시카고 딥디쉬 피자</td>
                                                        <td>슈림프 시카고 피자</td>
                                                        <td>새우, 토마토, 닭고기, 돼지고기, 쇠고기, 우유, 난류, 대두, 밀, 조개류(굴)</td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>날치알 크림소스</td>
                                                        <td> 우유, 난류, 대두, 밀, 닭고기, 소고기, 조개류(굴)
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>눈꽃치즈(체다치즈)</td>
                                                        <td>우유, 난류, 대두, 밀
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>파마산치즈가루</td>
                                                        <td>우유
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>바비큐 시카고 딥디쉬 피자</td>
                                                        <td>바비큐 시카고 딥디쉬 피자</td>
                                                        <td>밀, 대두, 돼지고기, 토마토, 쇠고기, 난류, 우유</td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>파마산치즈가루</td>
                                                        <td> 우유
                                                        </td>
                                                    </tr>
													<tr>
                                                        <td>갈릭디핑소스</td>
                                                        <td></td>
                                                        <td>대두, 우유, 계란</td>
                                                    </tr>
													<tr>
                                                        <td>굽네 불 닭발</td>
                                                        <td></td>
                                                        <td>우유, 대두, 밀, 닭고기, 쇠고기</td>
                                                    </tr>
													<tr>
                                                        <td>폭립(바비큐 스페어립)</td>
                                                        <td></td>
                                                        <td>우유, 대두, 밀, 쇠고기, 돼지고기, 아황산류</td>
                                                    </tr>
													<tr>
                                                        <td>굽네 파닭용 소스</td>
                                                        <td></td>
                                                        <td>우유, 대두, 밀, 쇠고기</td>
                                                    </tr>
													<tr>
                                                        <td>모짜렐라 치즈</td>
                                                        <td></td>
                                                        <td>우유</td>
                                                    </tr>
													<tr>
                                                        <td>찹쌀 치즈볼</td>
                                                        <td></td>
                                                        <td>우유, 대두</td>
                                                    </tr>
													<tr>
                                                        <td>새우링</td>
                                                        <td></td>
                                                        <td>새우, 밀, 난류</td>
                                                    </tr>
													<tr>
                                                        <td>근위 탕수육</td>
                                                        <td></td>
                                                        <td>닭고기, 대두, 밀</td>
                                                    </tr>
													<tr>
                                                        <td>에그미니타르트</td>
                                                        <td></td>
                                                        <td>밀, 계란, 우유</td>
                                                    </tr>
													<tr>
                                                        <td>바게트볼(갈릭크림)</td>
                                                        <td></td>
                                                        <td>밀, 대두, 우유, 계란, 쇠고기</td>
                                                    </tr>
													<tr>
                                                        <td>치트킹</td>
                                                        <td>콘스프 맛</td>
                                                        <td>대두, 우유, 닭고기</td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>매콤 치즈 맛</td>
                                                        <td>대두, 우유, 닭고기</td>
                                                    </tr>
													<tr>
                                                        <td>볼케이노 치즈 치밥</td>
                                                        <td>치밥</td>
                                                        <td>쇠고기, 닭고기, 대두, 밀, 우유, 조개류(굴), 토마토, 난류</td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>모짜렐라치즈</td>
                                                        <td>우유</td>
                                                    </tr>
													<tr>
                                                        <td>갈비천왕 치즈 치밥</td>
                                                        <td>치밥</td>
                                                        <td>쇠고기, 닭고기, 대두, 밀, 우유, 조개류(굴), 토마토, 난류</td>
                                                    </tr>
													<tr>
                                                        <td></td>
                                                        <td>모짜렐라치즈</td>
                                                        <td>우유</td>
                                                    </tr>
													<tr>
                                                        <td>닭가슴살 그릴 후랑크</td>
                                                        <td></td>
                                                        <td>우유, 대두, 밀, 닭고기, 쇠고기</td>
                                                    </tr>
													<tr>
                                                        <td>웨지감자</td>
                                                        <td></td>
                                                        <td>대두, 밀</td>
                                                    </tr>
													<tr>
                                                        <td>케이준 감자</td>
                                                        <td></td>
                                                        <td>대두, 밀</td>
                                                    </tr>
													<tr>
                                                        <td>굽네치킨 마크니 소스</td>
                                                        <td></td>
                                                        <td>달걀,우유,대두,밀,토마토,돼지고기,닭고기,쇠고기</td>
                                                    </tr>
													<tr>
                                                        <td>굽네 티마 마살라 소스</td>
                                                        <td></td>
                                                        <td>우유,대두,밀,토마토,돼지고기,닭고기,쇠고기</td>
                                                    </tr>
                                                </tbody>
                                            </table>
											<p class="msg">• 본 제품은 달걀, 새우, 아황산류, 닭고기, 오징어, 조개류(굴), 땅콩, 호두, 돼지고기, 쇠고기, 복숭아, 토마토를 사용한 제품과 같은 시설에서 제조하고 있습니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                           <!--  <div class="count">
                                <button type="button" class="minus"><img src="/resources/assets/images/icon/l-minus.svg" alt="마이너스아이콘" onclick="chgCnt('M')"></button>
                                <input type="number" value="1" readonly id="itemCnt">
                                <button type="button" class="plus"><img src="/resources/assets/images/icon/l-plus.svg" alt="마이너스아이콘" onclick="chgCnt('P')"></button>
                            </div> -->
                            <p class="msg">• 본 이미지는 실제와 다를 수 있으며 가맹점 상황에 따라 가격이 상이 할 수 있습니다.</p>
                           <%-- <dl class="total-price">
                                <dt class="tit">총 상품금액 :</dt>
                                <dd class="total"><span class="l-num" id="totPrice"><fmt:formatNumber value="${menu_view.price1 }" pattern="#,###" /></span>원</dd>
                            </dl> --%>
                           <!-- <div class="result-btn">
                                <button type="button" class="l-btn line">장바구니</button>
                                <button type="button" class="l-btn">주문하기</button>
                            </div> -->
							
							<div class="result-btn" style="display: block;margin: 4rem auto;text-align: center;">
                                <a href="javascript:loginnet('');"><button type="button" class="l-btn" style="border-color:#D4000B;background:#D4000B;">온라인주문</button></a>
                            </div>
							
                        </div>
                    </section>
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
             // 메뉴 btn
            $('.menu-detail__desc-area .select-btn button').click(function () {
                $(this).addClass('is-active').siblings().removeClass('is-active');
            });

             // 정보보기 btn
             $('.drop-box .arrow-btn').click(function () {
                $(this).toggleClass('is-active');
                $(this).next().toggleClass('is-open');
                $(this).parent().siblings().children('.arrow-btn').removeClass('is-active');
                $(this).parent().siblings().children('.drop').removeClass('is-open');
            });
        });
        function chgMenuView(item_id){
        	var obj = new Object();  
        	obj.item_id = item_id;
        	obj.srchGb = "view";
        	var url = "/menu/chgMenuView";
        	var data = JSON.stringify(obj); 
        	ajaxCall(url, data, menuViewCallBack, errorCallBack, '지금인기있는메뉴검색');
        	
        }
        function menuViewCallBack(obj){
        	var menuView = obj.body.menu_view;
        	var imgUrl = "<%=staticUrl %>"+menuView.img_name;
    		$("#itemImg").attr("src", imgUrl);
    		
    		$("#origin").html(menuView.origin);
    		$("#origin2").html(menuView.origin);
    		$("#food03").html(menuView.food03);
    		var foodTxt ="";
     		if(replaceNull(menuView.food05,'')!=''){
	     		foodTxt +='<tr >';
	     		foodTxt +='<td>열량(Kcal)</td>';
	     		foodTxt +='<td>'+ replaceNull(menuView.food05,'')+'</td>';
	     		foodTxt +='</tr>';
     		}
     		if(replaceNull(menuView.food06,'')!=''){
	     		foodTxt +='<tr >';
	     		foodTxt +='<td>나트륨(mg)</td>';
	     		foodTxt +='<td>'+ replaceNull(menuView.food06,'')+'</td>';
	     		foodTxt +='</tr>';
     		}
     		if(replaceNull(menuView.food07,'')!=''){
	     		foodTxt +='<tr >';
	     		foodTxt +='<td>탄수화물(g)</td>';
	     		foodTxt +='<td>'+ replaceNull(menuView.food07,'')+'</td>';
	     		foodTxt +='</tr>';
     		}
     		if(replaceNull(menuView.food08,'')!=''){
	     		foodTxt +='<tr >';
	     		foodTxt +='<td>당류(g)</td>';
	     		foodTxt +='<td>'+ replaceNull(menuView.food08,'')+'</td>';
	     		foodTxt +='</tr>';
     		}
     		if(replaceNull(menuView.food09,'')!=''){
	     		foodTxt +='<tr >';
	     		foodTxt +='<td>지방(g)</td>';
	     		foodTxt +='<td>'+ replaceNull(menuView.food09,'')+'</td>';
	     		foodTxt +='</tr>';
     		}
     		if(replaceNull(menuView.food10,'')!=''){
	     		foodTxt +='<tr >';
	     		foodTxt +='<td>트랜스지방(g)</td>';
	     		foodTxt +='<td>'+ replaceNull(menuView.food10,'')+'</td>';
	     		foodTxt +='</tr>';
     		}
     		if(replaceNull(menuView.food11,'')!=''){
	     		foodTxt +='<tr >';
	     		foodTxt +='<td>포화지방(g)</td>';
	     		foodTxt +='<td>'+ replaceNull(menuView.food11,'')+'</td>';
	     		foodTxt +='</tr>';
     		}
     		if(replaceNull(menuView.food12,'')!=''){
	     		foodTxt +='<tr >';
	     		foodTxt +='<td>콜레스테롤(mg)</td>';
	     		foodTxt +='<td>'+ replaceNull(menuView.food12,'')+'</td>';
	     		foodTxt +='</tr>';
     		}
     		if(replaceNull(menuView.food13,'')!=''){
	     		foodTxt +='<tr >';
	     		foodTxt +='<td>단백질(g)</td>';
	     		foodTxt +='<td>'+ replaceNull(menuView.food13,'')+'</td>';
	     		foodTxt +='</tr>';
     		}
     		
    		$("#food").html(foodTxt);
    		$("#itemNm").html(menuView.item_name);
    		var description = menuView.description.replace(/\r\n|\n|\r/g, '<br />');
    		$("#description").html(description);
    		$("#price").html(numberFormatComma(menuView.price1));
        }
        function chgCnt(gb){
        	var itemCnt = parseInt($("#itemCnt").val());
        	if(gb =='M'){
        		if(itemCnt ==1){
        			itemCnt = 1;
        		}else{
        			itemCnt = itemCnt -1;
        		}
        	}else{
        		itemCnt = itemCnt +1;       		
        	}
        	$("#itemCnt").val(itemCnt);
        	
        	$("#totPrice").html(numberFormatComma(${menu_view.price1}*itemCnt));
        }
    </script>
</body>
</html>