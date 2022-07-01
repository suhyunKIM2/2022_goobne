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
                                                        <th>구분</th>
                                                        <th>100g</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="food">
                                                    <tr >
                                                        <td>열량(Kcal)</td>
                                                        <td>${menu_view.food05}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>당류(g)</td>
                                                        <td>${menu_view.food08 }</td>
                                                    </tr>
                                                    <tr>
                                                        <td>단백질(g)</td>
                                                        <td>${menu_view.food13 }</td>
                                                    </tr>
                                                    <tr>
                                                        <td>포화지방(g)</td>
                                                        <td>${menu_view.food11 }</td>
                                                    </tr>
                                                    <tr>
                                                        <td>나트륨(mg)</td>
                                                        <td>${menu_view.food06 }</td>
                                                    </tr>
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
                            <c:if test="${menu_view.new_yn eq 'Y' }">
                            <p class="badge">new</p>
                            </c:if>
                            <dl class="name">
                                <dt class="tit" id="itemNm">${menu_view.item_name }</dt>
                                <dd class="desc" id="description">${menu_view.description }</dd>
                            </dl>
                            <p class="price"><span class="l-num" id="price"><fmt:formatNumber value="${menu_view.price1 }" pattern="#,###" /></span>원</p>
                            <div class="select-btn">
                            	<c:forEach items="${menu_detail }" var="sub">
                            		<button type="button" class="<c:if test="${sub.item_id eq menu_view.item_id }">is-active</c:if>" onclick="chgMenuView('${sub.item_id}')">${sub.item_sname}</button>
                            	</c:forEach>
                            </div>
							
                             <dl class="origin">
                                <dt>원산지</dt>
                                <dd id="origin2">${menu_view.origin }</dd>
                            </dl>
							<!--- 2차오픈시 닫는 UI---->
							<div class="half menu-detail__img-area" style="width:100%;padding:0;">
                            <div class="desc-box" style="margin-top: 2rem;">
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
                                                        <th>구분</th>
                                                        <th>100g</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="food">
                                                    <tr >
                                                        <td>열량(Kcal)</td>
                                                        <td>${menu_view.food05}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>당류(g)</td>
                                                        <td>${menu_view.food08 }</td>
                                                    </tr>
                                                    <tr>
                                                        <td>단백질(g)</td>
                                                        <td>${menu_view.food13 }</td>
                                                    </tr>
                                                    <tr>
                                                        <td>포화지방(g)</td>
                                                        <td>${menu_view.food11 }</td>
                                                    </tr>
                                                    <tr>
                                                        <td>나트륨(mg)</td>
                                                        <td>${menu_view.food06 }</td>
                                                    </tr>
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
                                <button type="button" class="l-btn" style="border-color:#D4000B;background:#D4000B;" onClick="">온라인주문</button>
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
    		var foodTxt ="";
     		foodTxt +='<tr >';
     		foodTxt +='<td>열량(Kcal)</td>';
     		foodTxt +='<td>'+ replaceNull(menuView.food05,'')+'</td>';
     		foodTxt +='</tr>';
     		foodTxt +='<tr>';
     		foodTxt +='<td>당류(g)</td>';
     		foodTxt +='<td>'+ replaceNull(menuView.food08,'')+'</td>';
     		foodTxt +='</tr >';
     		foodTxt +='<tr >';
     		foodTxt +='<td>단백질(g)</td>';
     		foodTxt +='<td>'+ replaceNull(menuView.food13,'')+'</td>';
     		foodTxt +='</tr >';
     		foodTxt +='<tr>';
     		foodTxt +='<td>포화지방(g)</td>';
     		foodTxt +='<td>'+ replaceNull(menuView.food11,'')+'</td>';
     		foodTxt +=' </tr>';
     		foodTxt +='<tr>';
     		foodTxt +='<td>나트륨(mg)</td>';
     		foodTxt +='<td>'+ replaceNull(menuView.food06,'')+'</td>';
     		foodTxt +=' </tr>';
    		$("#food").html(foodTxt);
    		$("#itemNm").html(menuView.item_name);
    		$("#description").html(menuView.description);
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