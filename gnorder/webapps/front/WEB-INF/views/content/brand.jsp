<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kor" dir="ltr">
<head>
   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<meta charset="utf-8">
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
            <article class="l-layout brand">

                <!-- 브랜드소개 -->
                <section class="brand__intro">
                    <div class="l-inner">
                        <dl class="brand__intro-title wow fadeInUp" data-wow-delay="0.2s">
                            <dt class="l-num brand-tit"><i class="oven"></i>BRAND STORY<i class="chi"></i></dt>
                            <dd class="l-num">
                                <span class="l-color">Goobne No.1 Oven</span><br>
                                Recipe Brand<br>
                            </dd>
                        </dl>
                        <dl class="l-comm brand__intro-type1 wow fadeInUp">
                            <dt class="l-num">2005<span>년</span></dt>
                            <dd>
                                첫 출범한 굽네는 후라이드 굽네 치킨 위주의 시장에서 <span class="l-bold">오븐에 구워</span><br class="pc">
                                건강한 굽네 치킨으로 업계를 확장하며 새로운 바람을 불어 넣었습니다.
                            </dd>
                            <dd>
                                굽네는 <span class="l-bold">전국 1,096개의 가맹점</span>을 보유한 빅 브랜드로 성장하였고, <span
                                    class="l-bold">오븐요리<br class="pc">
                                    브랜드로서 단연 1위의 시장점유율</span>을 확보하게 되었습니다.
                            </dd>
                            <dd>
                                굽네는 굽네 치킨을 넘어, 이제 굽네 피자, 굽네 디저트까지 오븐으로 선보일 수 있는 최상의 레시피를 연구하며<br class="pc">
                                <span class="l-bold">최고의 오븐 외식 브랜드로 거듭나기 위한 도전</span>을 계속해 나가고 있습니다.
                            </dd>
                        </dl>
                        <dl class="l-comm brand__intro-type2 wow fadeInUp">
                            <dt>굽네 치킨</dt>
                            <dd>
                                굽네 치킨은 Haccp 인증을 받은 100% 국내산 계육을 고집합니다,<br class="pc">
                                본사 R&D센터의 까다로운 개발 과정을 거쳐 많은 히트메뉴를 선보였습니다.
                            </dd>
                        </dl>
                    </div>

                </section>
                <!-- // 브랜드소개 -->

                <!-- 시리즈 -->
                <section class="brand__series l-bg wow fadeInDown">
                    <div class="l-inner">
                        <div class="series-1">
                            <dl class="l-comm wow fadeInLeft">
                                <dt class="sub">굽네 오리지널</dt>
                                <dd>
                                    굽네의 첫 시그니처 메뉴. 기름기가 쏙 빠진 담백하고<br class="pc">
                                    깔끔한 맛으로 굽네 출범 이래 꾸준한 사랑을 받아 왔습니다.
                                </dd>
                            </dl>
                            <div class="img wow fadeInRight">
                                <img src="/resources/assets/images/contents/c-brand-series-01_02.png" alt="시리즈이미지1">
                            </div>
                        </div>

                        <div class="series-2">
                            <dl class="l-comm wow fadeInLeft">
                                <dt class="sub wow fadeInUp">굽네 바사삭 시리즈</dt>
                                <dd class="wow fadeInUp">
                                    1초에 한마리씩 팔리는 국민 굽네 치킨 고추 바사삭.<br>
                                    오븐에서 구현한 극강의 바삭함 오븐바사삭.<br>
                                    콰트로 치즈로 깊은 풍미의 치즈바사삭까지<br>
                                    바사삭 시리즈는 <span class="l-bold">오직 굽네에서만 맛볼 수 있는 메뉴입니다.</span>
                                </dd>
                            </dl>
                            <div class="img">
                                <img src="/resources/assets/images/contents/c-brand-series-02.png" alt="시리즈이미지1">
                            </div>
                            <div class="bg">
                                <img src="/resources/assets/images/contents/c-brand-series-02-bg.png" alt="시리즈이미지1">
                            </div>
                        </div>
                        <p class="brand__series-point wow fadeInDown">
                            GOOBNE<br>
                            STORY
                        </p>
                        <div class="series-3">
                            <dl class="l-comm wow fadeInLeft">
                                <dt class="sub wow fadeInUp">굽네 양념 시리즈</dt>
                                <dd class="wow fadeInUp">
                                    대한민국에 매운맛 열풍을 몰고 온 매운 굽네 치킨의 원조 볼케이노.<br>
                                    치밥 문화를 자리잡게 한 신개념 갈비 굽네 치킨 갈비천왕.<br>
                                    매운 맛의 새 역사를 쓰고 있는 불금굽네 치킨까지.<br>
                                    <span class="l-bold">굽네의 양념굽네 치킨은 굽네 치킨의 역사를 새로 쓰고 있습니다.</span>
                                </dd>
                            </dl>
                            <div class="img wow fadeInRight">
                                <img src="/resources/assets/images/contents/c-brand-series-03_02.png" alt="시리즈이미지1">
                            </div>
                        </div>
                    </div>
                </section>
                <!-- //시리즈 -->

                <!-- 띠 애니메이션 라인  영역 -->
                <section class="l-goobne-slider">
                    <div class="goobne-wrapper">
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
                </section>
                <!-- 띠 애니메이션 라인  영역 -->

                <!-- 굽네 피자 영역 -->
                <section class="brand__pizza">
                    <div class="l-inner">
                        <div class="brand__pizza-half">
                            <div class="half wow fadeInLeft">
                                <dl class="l-comm">
                                    <dt class="">굽네 피자</dt>
                                    <dd>
                                        굽네 오븐 기술의 새로운 혁신!<br>
                                        굽네 피자도 잘 굽는 굽네의 오븐 레시피로 탄생한 굽네 굽네 피자 시리즈는<br>
                                        굽네의 또 다른 메인 메뉴로 고객님들께 사랑받고 있습니다.
                                    </dd>
                                </dl>
                                <div class="img">
                                    <img src="/resources/assets/images/contents/c-brand-pizza-01_02.png" alt="굽네 피자이미지">
                                </div>
                            </div>
                            <div class="half wow fadeInRight">
                                <div class="img">
                                    <img src="/resources/assets/images/contents/c-brand-pizza-02_02.png" alt="굽네 피자이미지">
                                </div>
                                <dl class="l-comm">
                                    <dt class="sub">시카고 딥디쉬 굽네 피자</dt>
                                    <dd>
                                        바삭한 딥디쉬 도우 속 다섯가지 프리미엄 치즈와 아라비아따 소스를<br class="pc">
                                        듬뿍 채워 끝까지 맛있게 먹을 수 있는 굽네의 대표 굽네 피자 제품입니다.
                                    </dd>
                                </dl>

                            </div>
                        </div>
                    </div>
                </section>
                <!-- // 굽네 피자 영역 -->

                <!-- 굽네 디저트 영역 -->
                <section class="brand__dessert l-bg wow fadeInUp">
                    <div class="l-inner">
                        <dl class="l-comm wow fadeInDown">
                            <dt class="">
                                에그타르트,<br>
                                바게트볼
                            </dt>
                            <dd>
                                이제 굽네 디저트도 굽네입니다. 굽네 치킨 굽네 피자와 함께 즐길 수 잇는<br>
                                오븐 굽네 디저트 메뉴를 만나보세요.
                            </dd>
                            <dd>
                                달콤한 갈릭 소스를 바른 바게트 속<br>
                                크림 치즈를 듬뿍 채운 바게트볼.
                            </dd>
                            <dd>
                                바삭한 패스츄리에 달콤한 커스터드 크림이 가득한<br>
                                에그미니 타르트까지.<br>
                                메인 메뉴 만큼 사랑받는 굽네 디저트 메뉴입니다.
                            </dd>
                        </dl>

                        <div class="brand__dessert-img l-ani-move">
                            <img src="/resources/assets/images/contents/c-brand-dessert_03.png" alt="굽네 디저트">
                        </div>
                    </div>
                </section>
                <!-- //굽네 디저트 영역 -->

                <!-- 띠 애니메이션 라인  영역 -->
                <section class="l-goobne-slider">
                    <div class="goobne-wrapper">
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
                </section>
                <!-- 띠 애니메이션 라인  영역 -->


            </article>
        </div>
        <!-- end of :: contents -->
        <!-- start of :: footer -->
        <div id="footer" class="sub-footer" style="margin-top: 0;">
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
            new WOW().init();
        });
    </script>
</body>
</html>