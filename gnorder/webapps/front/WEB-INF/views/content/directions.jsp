<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<% String sysMode = (String)request.getAttribute("sysMode"); %> 
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
            <article class="l-layout">
                <div class="l-c-pt sys-pro my_page map_page">
                <div class="l-title">찾아오시는길</div>
                    <div class="map_box">
                        <div class="franchise_map" id="franchise_map">
                        <!-- 다음 맵 API -->

<div id="map" style="width:100%;height:350px;"></div>
 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=SystemConstant.getKakaoAppKey(sysMode)%>&libraries=services"></script> 
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.5540631, 126.8370592), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 강서구 강서로 318', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        var imageSize = new kakao.maps.Size(24, 35);
        var markerImage = new kakao.maps.MarkerImage("/resources/assets/images/icon/l-map-on.svg", imageSize);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords,
            image : markerImage // 마커 이미지 
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">굽네치킨</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script> 
                        
                        </div>
                    </div>
                </div>
                <div class="l-inner">
                    <ul class="map_ul">
                        <li>
                            <span class="map_icon"><i class="icon_nu"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-forward-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511zm10.761.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708z"/>
</svg></i>전화번호 :</span> <span class="text_span"> 02-2648-2005</span>
                        </li>
                        <li>
                            <span class="map_icon"><i class="icon_nu"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
</svg></i>주소 :</span> <span class="text_span ">서울 특별시 강서구 강서로 318</span>
                        </li>
                        <li><span class="map_icon"><i class="icon_nu"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
</svg></i>대중교통 </span><br><span class="text_span left_rem">지하철: <span class="subway_05">5</span>호선 발산역 6번출구 , <span class="subway_05">5</span>호선 우장산역 1번 출구</span> </li>
                        <li><span class="map_icon" style="width:25px;height:25px;"></span> <span class="text_span"><span class="bus_back">마을</span>: 강서05, 강서06 <br><span class="bus_back_1">간선</span> : 652,661,N65(심야) <br><span class="bus_back_2">지선</span>: 6629,6630,6645, 6657</span></li>
                    </ul>
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