<%@ page contentType="text/html; charset=utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kor" dir="ltr">
<head>
   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
   <script src="/resources/assets/js/common/gloabl.js"></script>
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
            <article class="l-layout notice sys-pro" style="padding-bottom: 5%;">
                <div class="l-inner">
                    <div class="journal_box">
                        <div class="l-title">Journal</div>
                        <div class="title_box_div">
                            <div class="text_size_m text_color_B weight_80 back_icon_G" style="margin:0.5rem;">[굽네 오븐썰]</div>
                            <div class="text_size_m text_color_B weight_80 float_left">최고의 오븐 레시피가 탄생하는 곳, 굽테크 랩</div>
                            <div class="text_size_m text_color_B weight_80 float_right">2022.07.07</div>
                        </div>
                        <div class="contants_journal">
                            <div class="text_size_m ">
                                <span class="text_size_m text_color_B weight_80 text_size_L"><img src="/resources/assets/images/icon/quote.svg" class="quote_icon_img">바사삭 시리즈, 볼케이노, 갈비천왕과 시카고 피자,<br> 에그타르트까지 장르 불문, 
                                오븐으로 만드는 모든 레시피를 연구하는 곳, 
                                굽네 R&D 센터- ‘굽테크 랩’입니다.<img src="/resources/assets/images/icon/quote.svg" class="quote_icon_img rotate"></span> 
                                굽테크란 “신선한 원료, 특별한 염지, 195도 조리’. 가장 맛있는 오븐구이를 요리를 만드는 굽네만의 비법 기술을 의미합니다.
                            </div>
                            <div class="contants_img">
                                <img src="/resources/assets/images/journal/img_04.jpg">
                            </div>
                            <div class="text_size_m text_left">
                                <span class="text_size_m text_color_B weight_80"><img src="/resources/assets/images/icon/quote.svg" class="quote_icon_img">오븐에 구웠을 때 퍽퍽하지 않고 촉촉하면서 바삭한 식감을 낼 수 있는 적당한 닭의 절단 크기. 굽네만의 특제 시즈닝을 혼합하여 만들어 치킨을 부드럽게 하면서 적당한 염도와 풍미를 더 해주는 굽네 염지.기름기는 쏙 빼주되 닭의 육질은 살아 있고, 양념이 잘 배는 가장 적당한 오븐. 굽테크는 단순해 보이지만 수많은 시행착오와 오랜 시간의 연구와 노력을 더 해 만든 굽네만의 비법입니다.<img src="/resources/assets/images/icon/quote.svg" class="quote_icon_img rotate"></span> 
                                
                                굽테크랩에서의 메뉴 개발 과정을 들여다보면 왜 굽네에서 신제품이 자주 나올 수 없는지 이해하게 됩니다.
                                마케팅에서 기획한 많은 상품 기획서 중, 오븐구이에 가장 적합한 레시피로 개발하는 데에만 수개월의 시간이 걸립니다.
                                최소 3~4개월의 레시피 개발 과정이 완료되면, 10회 이상의 내부 품평과 평가를 통해 고객에게 제공될 수 있는 수준의 레시피 고도화 작업이 진행됩니다.시즈닝 1g의 차이도 깐깐하게 비교 품평하고, 많은 블라인드 테스트를 거쳐 메뉴의 경쟁력이 완성되는 수준까지 수정의 수정을 거듭합니다.
                                
                                내부적으로 메뉴가 통과되어도 가장 어려운 관문이 남아 있습니다.
                                소비자 100인 이상이 참여하는 블라인드 테스트를 진행하여 5점 만점에 4.2점을 통과한 제품만이 최종 출시가 가능합니다.
                                6 반년 이상의 개발 과정을 거쳤어도 소비자 조사 기준 점수를 넘지 못해 출시되지 못한 비운의 메뉴들도 수십 종이 넘습니다. 
                                그야말로 ‘산 넘어 산’의 출시 과정이지만, 이 때문에 굽네의 오븐 메뉴들은 경쟁사 신제품에 비해 높은 소비자 만족도를 유지하고 있고,
                                맛있는 메뉴야말로 ‘굽네 마니아’로 불리는 찐팬들이 존재하는 이유이기도 합니다.
                                
                            </div>
                            <div class="contants_img">
                                <img src="/resources/assets/images/journal/img_05.jpg">
                            </div>
                            <div class="text_size_m text_left">
                                국내에 본격적으로 오븐구이 치킨을 선보인 “오리지널”, 매운 치킨의 새 장을 연 “볼케이노”, 온 가족이 즐기는 치밥 트렌드를 만든 “갈비천왕”, 매운맛에 중독되면 답도 없다는 국민 치킨 “고추 바사삭”, 숯불구이에서나 가능한 불맛을 구현한 한 차원 다른 매운치킨 “불금치킨”과 프라이드 치킨보다 바삭한 “오븐 바사삭”까지….모두 기존의 치킨 공식을 깬 굽테크랩에서 탄생한 레전드 메뉴들입니다.
                                
                            </div>
                            <div class="contants_img">
                                <div class="contants_img_left"><img src="/resources/assets/images/journal/img_01.jpg"></div>
                                <div class="contants_img_right"><img src="/resources/assets/images/journal/img_02.jpg"></div>
                            </div>
                            <div class="text_size_m text_left">
                                <span class="text_size_m text_color_B weight_80"><img src="/resources/assets/images/icon/quote.svg" class="quote_icon_img">굽테크랩은 지금 넥스트 레벨 (next level)을 위한 도전을 시작하고 있습니다.<img src="/resources/assets/images/icon/quote.svg" class="quote_icon_img rotate"></span> 
                                치킨 브랜드 중 최초로 시카고 피자를 선보이며 새로운 메뉴의 가능성을 본 이후, 에그타르트, 바게트볼 같은 디저트 베이커리부터 치밥과 찍먹 커리 같은 오븐 요리까지,다양한 오븐 구이 레시피를 개발하고 있습니다. 굽네와 굽테크랩이 열어갈 맛있는 오븐구이 유니버스를 기대해 주세요.  
                                
                            </div>
                            <div class="contants_img">
                                <img src="/resources/assets/images/journal/img_03.jpg">
                            </div>
                        </div>
                    </div>
                    
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