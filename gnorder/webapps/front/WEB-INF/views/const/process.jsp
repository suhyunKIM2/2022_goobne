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
%>
<!DOCTYPE html>
<html lang="kor" dir="ltr">
<head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <script>
	    new WOW().init();
	</script>   
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>고객의 소리</title>
    
</head>

<body>
    <!-- start of :: wrap -->
    <div id="wrap">
        <!-- start of :: header -->
        <div id="header">
        	 <jsp:include page="/WEB-INF/views/include/top.jsp"></jsp:include>
            <!-- 참고: 스크립트로 load 됩니다. include 폴더 header.html  -->
        </div>
        <!-- end of :: header -->
        <aside class="aside">
        	<jsp:include page="/WEB-INF/views/include/nav_right.jsp"></jsp:include>
            <!-- 참고: 스크립트로 load 됩니다. include 폴더 aside.html  -->
        </aside>
        <!-- start of :: contents -->
        <div id="content">
            <article class="l-layout founded">
                <div class="l-inner">
                    <div class="l-title">창업안내</div>

                    <div class="founded__page-tab">
                        <a href="/brd/const/franchise">프랜차이즈 굽네</a>
                        <a href="/brd/const/process" class="is-active">프로세스 및 비용</a>
                        <a href="/brd/const/write">온라인 창업상담</a>
                    </div>


                    <!-- 창업프로세스 -->
                    <div class="founded__process-wrap">
                        <div class="founded__page-tab-tit">창업프로세스</div>
                        <section class="founded__process">
    
                            <div class="step">
                                <p class="img">
                                    <img src="/resources/assets/images/icon/c-process-01.png" alt="step1">
                                </p>
                                <p class="l-num">step 1</p>
                                <div class="desc">
                                    <p class="tit">창업연구소 1차 상담</p>
                                </div>
                            </div>
    
                            <div class="step">
                                <p class="img">
                                    <img src="/resources/assets/images/icon/c-process-02.png" alt="step2">
                                </p>
                                <p class="l-num">step 2</p>
                                <div class="desc">
                                    <p class="tit">창업승인팀 2차 상담</p>
                                </div>
                            </div>
    
                            <div class="step">
                                <p class="img">
                                    <img src="/resources/assets/images/icon/c-process-03.png" alt="step3">
                                </p>
                                <p class="l-num">step 3</p>
                                <div class="desc">
                                    <p class="tit">스타매장 교육<br>
                                        (적응교육 2일)</p>
                                </div>
                            </div>
    
                            <div class="step">
                                <p class="img">
                                    <img src="/resources/assets/images/icon/c-process-04.png" alt="step4">
                                </p>
                                <p class="l-num">step 4</p>
                                <div class="desc">
                                    <p class="tit">지역팀장 3차 상담</p>
                                </div>
                            </div>
    
    
                            <div class="step">
                                <p class="img">
                                    <img src="/resources/assets/images/icon/c-process-05.png" alt="step5">
                                </p>
                                <p class="l-num">step 5</p>
                                <div class="desc">
                                    <p class="tit">시장조사 및 점포개발</p>
                                    <p class="sub">상권/입지 분석</p>
                                    <p class="sub">영업구역 확인 및 점포 확정</p>
                                </div>
                            </div>
    
    
                            <div class="step">
                                <p class="img">
                                    <img src="/resources/assets/images/icon/c-process-06.png" alt="step6">
                                </p>
                                <p class="l-num">step 6</p>
                                <div class="desc">
                                    <p class="tit">가맹계약</p>
                                    <p class="sub">
                                        나이스 다큐 가입/전자서명<br>
                                        (15일간 3회 체크)
                                    </p>
                                    <p class="sub">가맹비/교육비 예치</p>
                                </div>
                            </div>
    
                            <div class="step">
                                <p class="img">
                                    <img src="/resources/assets/images/icon/c-process-07.png" alt="step7">
                                </p>
                                <p class="l-num">step 7</p>
                                <div class="desc">
                                    <p class="tit">실측 및 공사진행</p>
                                    <p class="sub">
                                        점포 실측(철거 완료 후)
                                    </p>
                                    <p class="sub">도면 작성 및 협의 확정</p>
                                    <p class="sub">인테리어 업체 입찰 후 업체 선정</p>
                                    <p class="sub">공사 진행(15~30일)</p>
                                    <p class="sub">각종 인허가 신청(공사중 완료)</p>
                                </div>
                            </div>
    
    
                            <div class="step">
                                <p class="img">
                                    <img src="/resources/assets/images/icon/c-process-08.png" alt="step8">
                                </p>
                                <p class="l-num">step 8</p>
                                <div class="desc">
                                    <p class="tit">가맹점 입문 교육</p>
                                    <p class="sub">
                                        입문교육<br>
                                        (서울아카데미 4박5일)
                                    </p>
                                    <p class="sub">
                                        오픈 행사 준비<br>
                                        (홍보물/판촉물)
                                    </p>
                                </div>
                            </div>
    
                            <div class="step">
                                <p class="img">
                                    <img src="/resources/assets/images/icon/c-process-09.png" alt="step9">
                                </p>
                                <p class="l-num">step 9</p>
                                <div class="desc">
                                    <p class="tit">장비 설치 및 집기류 입고</p>
                                    <p class="sub">
                                        오븐기 설치<br>
                                        (전기 or 가스 배관 설치)
                                    </p>
                                    <p class="sub">
                                        주방 장비 설치<br>
                                        (냉장/냉동고, 작업대 등)
                                    </p>
                                    <p class="sub">
                                        집기류 발주<br>
                                        (그리드, C팬, 믹싱볼 등)
                                    </p>
                                </div>
                            </div>
    
                            <div class="step">
                                <p class="img">
                                    <img src="/resources/assets/images/icon/c-process-10.png" alt="step10">
                                </p>
                                <p class="l-num">step 10</p>
                                <div class="desc">
                                    <p class="tit">매장오픈</p>
                                    <p class="sub">초도물품 발주</p>
                                    <p class="sub">AM 오픈 교육</p>
                                </div>
                            </div>
                        </section>
                    </div>
                    <!-- // 창업프로세스 -->


                    <!-- 가맹점 개설 비용 -->
                    <div class="founded__page-tab-tit">가맹점 개설 비용</div>
                    <section class="founded__cost">
                        <table class="cost-table">
                            <colgroup>
                                <col style="width: 25%;"> 
                                <col style="width: *;"> 
                                <col style="width: *;"> 
                                <col style="width: *;"> 
                                <col style="width: 15%;"> 
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>15평<span class="l-num">(Delivery)</span></th>
                                    <th>20평<span class="l-num">(Beer Pub)</span></th>
                                    <th>25평<span class="l-num">(Beer Pub)</span></th>
                                    <th>비고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>가맹비</td>
                                    <td>
                                        <span class="l-num">500</span>
                                    </td>
                                    <td>
                                        <span class="l-num">500</span>
                                    </td>
                                    <td>
                                        <span class="l-num">500</span>
                                    </td>
                                    <td>
                                        <span class="l-num">VAT</span> 별도
                                    </td>
                                </tr>
                                <tr>
                                    <td>교육비</td>
                                    <td>
                                        <span class="l-num">200</span>
                                    </td>
                                    <td>
                                        <span class="l-num">200</span>
                                    </td>
                                    <td>
                                        <span class="l-num">200</span>
                                    </td>
                                    <td>
                                        <span class="l-num">VAT</span> 별도
                                    </td>
                                </tr>
                                <tr>
                                    <td>보증금</td>
                                    <td>
                                        없음
                                    </td>
                                    <td>
                                        없음
                                    </td>
                                    <td>
                                        없음
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>로열티</td>
                                    <td>
                                        없음
                                    </td>
                                    <td>
                                        없음
                                    </td>
                                    <td>
                                        없음
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>인테리어 감리비</td>
                                    <td>
                                        없음
                                    </td>
                                    <td>
                                        없음
                                    </td>
                                    <td>
                                        없음
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr class="line">
                                    <td>인테리어</td>
                                    <td>
                                        <span class="l-num">3,300</span>
                                    </td>
                                    <td>
                                        <span class="l-num">4,800</span>
                                    </td>
                                    <td>
                                        <span class="l-num">6,000</span>
                                    </td>
                                    <td>
                                        <span class="l-num">3.3</span>㎡ 당 ≒ <br>
                                        <span class="l-num">220 ~ 240</span> 만원 기준
                                    </td>
                                </tr>
                                <tr>
                                    <td>간판 및 유리 시트</td>
                                    <td>
                                        별도
                                    </td>
                                    <td>
                                        별도
                                    </td>
                                    <td>
                                        별도
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>오븐<i class="br"></i>(10단/6단 기준)</td>
                                    <td>
                                        <span class="l-num">2,799</span>
                                    </td>
                                    <td>
                                        <span class="l-num">2,799</span>
                                    </td>
                                    <td>
                                        <span class="l-num">2,799</span>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>주방 장비, 집기</td>
                                    <td>
                                        <span class="l-num">1,150</span>
                                    </td>
                                    <td>
                                        <span class="l-num">1,210</span>
                                    </td>
                                    <td>
                                        <span class="l-num">1,210</span>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>배달용품</td>
                                    <td>
                                        <span class="l-num">180</span>
                                    </td>
                                    <td>
                                        <span class="l-num">180</span>
                                    </td>
                                    <td>
                                        <span class="l-num">180</span>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>POS 및 통신 장비</td>
                                    <td>
                                        <span class="l-num">100</span>
                                    </td>
                                    <td>
                                        <span class="l-num">250</span>
                                    </td>
                                    <td>
                                        <span class="l-num">250</span>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr class="last">
                                    <td>기타공사</td>
                                    <td colspan="3">
                                        전기. 가스 증설 및 설치공사, 철거공사, 의탁자, 냉/난방기기, 화장실 공사, 폴딩도어 시공, 전면교체,
                                        창호교체, 외부창고설치, 워크인 쿨러, 배수 별도공사, 그리스텝 설치공사, 온수기, DID 구입
                                    </td>
                                    <td>
                                        직접 비용<br>
                                        (점포에 따라 상이함)
                                    </td>
                                </tr>
                                <tr>
                                    <td>합계</td>
                                    <td>
                                        <span class="l-num">8,309</span>
                                    </td>
                                    <td>
                                        <span class="l-num">9,939</span>
                                    </td>
                                    <td>
                                        <span class="l-num">11,139</span>
                                    </td>
                                    <td>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </section>
                    <ul class="founded__cost-desc">
                        <li>• 별도 품목 : 가스, 철거, 전기승압, 냉   난방, 닥트 설비 등</li>
                        <li>• 상기 금액은 점포 특성에 따라 변동될 수 있습니다.</li>
                        <li>• 지역, 상권에 따라 일부 추가 비용이 발생할 수 있습니다.</li>
                    </ul>
                    <!-- // 가맹점 개설 비용 -->


                  


                </div>
            </article>


        </div>
        <!-- end of :: contents -->
        <!-- start of :: footer -->
        <div id="footer" class="sub-footer" style="margin-top: 20;">
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

    	/* $('.founded__page-tab a').click(function () {
            indexNo = $(this).index();
            $(this).addClass('is-active').siblings().removeClass('is-active');
    	} */
    });
    </script>
</body>

</html>