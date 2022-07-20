<%@ page contentType="text/html; charset=utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <article class="l-layout founded">
                <div class="l-inner">
                    <div class="l-title">창업안내</div>

                    <div class="founded__page-tab">
                        <a href="#none" class="is-active">프랜차이즈 굽네</a>
                        <a href="/fnd/process">창업 프로세스 및 예상비용</a>
                        <a href="/fnd/online">온라인 창업상담</a>
                    </div>

                    <div class="founded__page-tab-tit">굽네만의 특별함</div>

                    <section class="founded__franchise">

                        <!-- 차별화된 오븐구이 치킨 -->
                        <div class="l-c-pt diff">
                            <dl class="l-comm">
                                <dt class="tit">
                                    차별화된 오븐구이 치킨
                                </dt>
                                <dd class="l-hidden">없음</dd>
                            </dl>
                            <div class="diff__desc">
                                <dl class="box">
                                    <dt class="l-num">UP</dt>
                                    <dd>치킨 본연의 맛</dd>
                                    <dd>촉촉한 육즙</dd>
                                    <dd>깊은 감칠맛과 불맛</dd>
                                </dl>
                                <div class="center-box">
                                    <p class="img">
                                        <img src="/resources/assets/images/contents/c-founded-diff.png" alt="오븐구이치킨">
                                    </p>
                                    <div class="text">
                                        <span>차별화된</span>
                                        <p>오븐구이 치킨</p>
                                    </div>
                                </div>
                                <dl class="box">
                                    <dt class="l-num">DOWN</dt>
                                    <dd>칼로리</dd>
                                    <dd>트랜스 지방</dd>
                                    <dd>탄수화물 함량</dd>
                                </dl>
                            </div>
                        </div>
                        <!-- // 차별화된 오븐구이 치킨 -->

                        <!-- 간편 조리 시스템 -->
                        <div class="l-c-pt sys-cook">
                            <dl class="l-comm">
                                <dt class="tit">
                                    간편 조리 시스템
                                </dt>
                                <dd class="">굽네치킨은 오븐에 구워 치킨 본연의 맛을 즐길 수 있으며, 촉촉한 육즙이 살아 있어 깊은 감칠맛과 불맛을 느낄 수 있습니다.</dd>
                            </dl>
                            <ul class="sys-cook__list">
                                <li>
                                    <p class="l-num num">01</p>
                                    <p class="l-num tit">ONE-PACK SYSTEM</p>
                                    <p class="sub">원료육 중량 관리</p>
                                    <p class="sub">염지육 공급</p>
                                    <p class="sub">절단 계육 공급</p>
                                    <p class="sub">1회분 소스 포장</p>
                                </li>
                                <li>
                                    <p class="l-num num">02</p>
                                    <p class="l-num tit">NO OIL</p>
                                    <p class="sub">기름 냄새 없음</p>
                                    <p class="sub">기름 교체 없음</p>
                                    <p class="sub">화상 위험 적음</p>
                                    <p class="sub">조리 공정 단축</p>
                                </li>
                                <li>
                                    <p class="l-num num">03</p>
                                    <p class="tit">라치오날 오븐</p>
                                    <p class="sub">전국 365일 A/S시스템 구축</p>
                                    <p class="sub">최강의 고온 도달 능력</p>
                                    <p class="sub">최강의 온도 복원 능력</p>
                                    <p class="sub">자동 청소 기능 탑재</p>
                                    <p class="sub">최상의 내구성</p>
                                </li>
                                <li>
                                    <p class="l-num num">04</p>
                                    <p class="tit">상온/냉장 트롤리</p>
                                    <p class="sub">러시타임 조리시간 단축</p>
                                    <p class="sub">효율적인 공간관리</p>
                                    <p class="sub">주방 인건비 절감</p>
                                    <p class="sub">최강의 온도 복원 능력</p>
                                    <p class="sub">초벌/해동 제품 위생적 관리 용이</p>
                                </li>
                            </ul>
                        </div>
                        <!-- // 간편 조리 시스템 -->

                        <!-- 자체 생산 시스템  -->
                        <div class="l-c-pt sys-pro">
                            <dl class="l-comm">
                                <dt class="tit">
                                    자체 생산 시스템
                                </dt>
                                <dd class="">원료 관리부터 도계, 가공, 양념, 포장까지 굽네치킨의 생산에는 빈틈이 없습니다.</dd>
                            </dl>
                            <div class="sys-pro__half">
                                <div class="half">
                                    <img src="/resources/assets/images/contents/c-founded-pro-01.png" alt="공장이미지">
                                    <p class="text"><span class="l-num">HACCP</span>인증 굽네치킨 정읍 가공 공장</p>
                                </div>
                                <div class="half">
                                    <img src="/resources/assets/images/contents/c-founded-pro-02.png" alt="공장이미지">
                                    <p class="text">소스/분말 전문 참아람 공장</p>
                                </div>
                            </div>
                        </div>
                        <!-- // 자체 생산 시스템  -->


                        <!-- 신선 배송 시스템 -->
                        <div class="l-c-pt sys-del">
                            <dl class="l-comm">
                                <dt class="tit">
                                    신선 배송 시스템
                                </dt>
                                <dd class="">
                                    굽네치킨은 원료육을 주 5일 배송으로 가맹점에 공급하기 때문에 가맹점 사장님께서 신선한 계육을 받아보실 수 있으며,<br class="pc">
                                    안정적인 재고 관리를 할 수 있습니다. 또한 전국 7개의 물류센터 김포, 용인, 계룡, 정읍, 광주, 김해, 가산(구미)을 보유해<br class="pc">
                                    전국 유통망을 확보하고 있어 고객들에게 항상 신선한 제품을 공급할 수 있는 경쟁력을 확보하고 있습니다.
                                </dd>
                            </dl>
                            <div class="sys-del__box">
                                <div class="box">주5일 배송시스템</div>
                                <div class="box">콜드체인 시스템</div>
                                <div class="box">공정 자동화 시스템</div>
                                <div class="box">ONE-PACK 포장배송</div>
                            </div>
                            <div class="sys-del__img">
                                <img src="/resources/assets/images/contents/c-founded-del.png" alt="이미지">
                            </div>
                        </div>
                         <!-- // 신선 배송 시스템 -->

                        <!-- TIPS from 사장님!  -->
                        <div class="l-c-pt from">
                            <p class="tit">TIPS from 사장님! </p>
                            <ul class="from__list">
                                <li>
                                    <p class="icon">
                                        <img src="/resources/assets/images/contents/c-founded-from-01.png" alt="아이콘 이미지">
                                    </p>
                                    <div class="text">
                                        “냉장 트롤리 하나 있으면 든든합니다.<br>
                                        사전 손질해서 놓아두면 <i></i><span>주방 인건비 절감, 빠른 조리 가능!</span>”
                                    </div>
                                </li>
                                <li>
                                    <p class="icon">
                                        <img src="/resources/assets/images/contents/c-founded-from-02.png" alt="아이콘 이미지">
                                    </p>
                                    <div class="text">
                                        “10단 오븐 2대 있으면 <i></i><span>동시에 20마리 조리 가능!</span><br>
                                        러시타임도 문제없지요!”         
                                    </div>
                                </li>
                                <li>
                                    <p class="icon">
                                        <img src="/resources/assets/images/contents/c-founded-from-03.png" alt="아이콘 이미지">
                                    </p>
                                    <div class="text">
                                        “굽네는 기름도 안쓰죠. <i></i><span>버튼 한번</span> 누르면 오븐청소 끝나죠.<br>
                                        마감 청소가 너무 쉬워요!!”
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- // TIPS from 사장님!  -->




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
</body>
</html>