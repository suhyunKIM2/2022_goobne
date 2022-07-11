<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String sysMode = (String)request.getAttribute("sysMode"); %>
<!DOCTYPE html>
<html lang="kor" dir="ltr">
<head>
   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
    <!-- KAKAO MAP API DEV KEY - http://localhost:8080-->
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e7828c6cb316f52b765dd216c667253&libraries=services"></script> -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=SystemConstant.getKakaoAppKey(sysMode)%>"></script>
    <!-- KAKAO MAP API DEV KEY - http://localhost:8080-->
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
            <article class="l-layout pt store">
                <div class="store__inner">


                    <!-- 지도영역 -->
                    <section class="store__map" style="/* background-image: url(/resources/assets/images/contents/ex-map.png); */">
                        <!-- 지도 이미지 참고 : 
                            임시로 백그라운드 이미지를 통해 지도 지정 min-height:84.5rem 으로 지정해두었습니다.
                        -->
                        <div class="store__map" id="map"></div>
                        <!-- map item -->
                        <div class="map-icon-item item-01">
                           

                        </div>

                        <!-- map item2 -->
                        <div class="map-icon-item item-02">
                            <div class="desc l-hidden">
                                <dl class="info">
                                    <dt class="name">행당점</dt>
                                    <dd class="local">서울특별시 성동구 행당로 79 해당텍스트 2
                                        줄 까지 노출됩니다.
                                    </dd>
                                    <dd class="num">02-2294-9294</dd>
                                </dl>
                                <div class="delivery">
                                    <p>포장 <span>2,000</span>원 할인</p>
                                    <p>퀵포장</p>
                                </div>
                            </div>
                            <div class="map-icon">
                                <div class="icon bk"></div>
                            </div>
                        </div>

                        <!-- map item3 -->
                        <div class="map-icon-item item-03">
                            <div class="desc l-hidden">
                                <dl class="info">
                                    <dt class="name">행당점</dt>
                                    <dd class="local">서울특별시 성동구 행당로 79 해당텍스트 2
                                        줄 까지 노출됩니다.
                                    </dd>
                                    <dd class="num">02-2294-9294</dd>
                                </dl>
                                <div class="delivery">
                                    <p>포장 <span>2,000</span>원 할인</p>
                                    <p>퀵포장</p>
                                </div>
                            </div>
                            <div class="map-icon">
                                <div class="icon red"></div>
                            </div>
                        </div>

                    </section>
                    <!-- // 지도영역 -->

					<!-- 검색 영역  -->
                    <section class="store__search-tab">
                        <div class="tab-btn">
                            <button type="button" class="local-btn" id="loc_btn">지역검색</button>
                            <button type="button" class="name-btn disabled" id="name_btn">매장명</button>
                        </div>
                        <div class="tab-desc-cnt">
                            <!-- 지역명 검색  -->
                            <div class="tab-desc">
                                <div class="search-select-area">
                                <select id="sido" class="selectpicker" onchange="chgSido(this.value);">
                                </select>
                                 <select class="selectpicker" id="gugun">
                                 	<option value="">선택</option>
                                 </select>
                                    <button type="button" class="search-btn" onclick="goSearch('S')"><img src="/resources/assets/images/icon/c-store-search.png" alt="검색이미지"></button>
                                </div>
                                <div class="search-list-area">
                                    <div class="result-num">
                                        검색결과 <span id="loc_cnt"></span>개
                                    </div>
                                    <div class="result-list l-scroll-style" id="srchLocList">

                                    </div>
                                </div>
                            </div>
                            <!--  매장명 검색  -->
                            <div class="tab-desc l-hidden">
                                <div class="input-btn-area">
                                    <input type="text" placeholder="매장명을 입력해주세요." id="br_name" onkeyup="searchEnter(this)">
                                    <button type="button" class="search-btn" onclick="goSearch('N')"><img  src="/resources/assets/images/icon/c-store-search.png" alt="검색이미지"></button>
                                </div>
                                <!-- 참고 : class l-hidden 제거시 활성화   -->
                                <div class="search-list-area l-hidden" id="srchNameDiv">
                                    <div class="result-num">
                                        검색결과 <span id="nm_cnt"></span>개
                                    </div>
                                    <div class="result-list l-scroll-style" id="srchNameList">
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                        </div>
                    </section>
                    <!-- // 검색영역  -->
                    <!-- 매장안내 영역  -->
                    <section class="store__notice">
                        <div class="l-inner">
                            <div class="l-title">매장 안내</div>
                            <div class="notice-table">
                                <table id="storeInfo">
                                    <colgroup>
                                        <col>
                                        <%-- <col> --%>
                                        <col>
                                        <col>
                                       <%--  <col> --%>
                                        <col>
                                        <col>
                                        <col>
                                        <%-- <col> --%>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>매장명</th>
                                        <!--     <th>열림</th> -->
                                            <th>연락처</th>
                                            <th>포장할인</th>
                                            <!-- <th>소요시간<br/>(배달/포장)</th> -->
                                            <th>e-쿠폰</th>
                                            <th>금액권</th>
                                            <th>선결제<br/>(배달/포장)</th>
                                            <!-- <th>퀵포장</th> -->
                                        </tr>
                                        <tr>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                    <!-- //매장안내 영역  -->

                    <!-- 페이징 영역  -->
                    <section class="l-paging-num">
                    </section>
                    <!-- //페이징 영역  -->
                </div>

            </article>
        </div>
        <!-- end of :: contents -->
        <!-- start of :: footer -->
        <div id="footer" class="sub-footer" >
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        </div>
        <!-- end of :: footer -->
        <div id="mobile-nav">
            <jsp:include page="/WEB-INF/views/include/tab_bar.jsp"></jsp:include>
        </div>
    </div>
    <!-- end of :: wrap -->
     
    <script>
    	var searchGb = "L";
    	var sido ="";
    	var gugun= "";
    	var branch_nm ="";
    	// 지도
	 	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.5666805, 126.9784147), // 지도의 중심좌표
	        level: 6 // 지도의 확대 레벨
	    };
	    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	    var map = new kakao.maps.Map(mapContainer, mapOption);
	    var markers = [];
	    var positions=[];
        $(document).ready(function () {

            // select box
            $('.l-select .type').click(function () {
                $(this).siblings('.type-list').toggleClass('is-show');
            })
            $('.l-select .type-list li').click(function () {
                $(this).parent().removeClass('is-show');
            })

            //tab 버튼 구현 
            $('.store__search-tab .tab-btn button').click(function () {
                indexNo = $(this).index();
                $(this).removeClass('disabled').siblings().addClass('disabled');

                $('.store__search-tab .tab-desc-cnt .tab-desc').addClass('l-hidden');
                $('.store__search-tab .tab-desc-cnt .tab-desc').eq(indexNo).removeClass('l-hidden');
            })
	        var param = new Object();
		    param.define_id = 'SIDO'; // 지역(검색select)
		    param.use_yn ='Y';
		    getCodeListSelBox($("#sido"), param, "선택", ""); 
	      
	     
        });
        
        $(window).load(function(){
        	searchStore('L');
        	searchStorePaging(1);
        });
        
        function goSearch(gubun){
        	searchStore(gubun);
        	searchStorePaging(1);
        }
        // select박스 외부영역 클릭시 닫기
        $(document).mouseup(function (e){
            var select_box = $(".type-list");
            if(select_box.has(e.target).length === 0){
                select_box.removeClass("is-show");
            }
        });
        function chgSido(sido){
      		 var param = new Object();
               param.define_id = 'AREA'; // 지역(검색select)
               param.use_yn ='Y';
               param.value2= sido;
               param.value3 = 'Y';
               param.ord = 'value1';
               getCodeListSelBox($("#gugun"), param, "선택",''); 
               $("#gugun").niceSelect("update");
      	}
        
        /*상단조회*/
        function searchStore(gb){
        	searchGb=gb;
        	var url = "/store/srch_storeInfo";
        	var obj = new Object();
        	if(searchGb =='L'){ //위치
	        	var longitude=lon;
	        	var latitude=lat;
	        	if(replaceNull(longitude,"") =="" || replaceNull(latitude,"") =="" ){
	        		longitude=37.5666805;
	        		latitude=126.9784147;
	        	}
	        	obj.yloc = longitude;
	        	obj.xloc = latitude;
        	}else if(searchGb =='S'){ //시도 시군구
        		sido =$("#sido").val();
            	gugun= $("#gugun").val();
            	obj.paging_yn ='N';
        		obj.sido = sido;
        		obj.gugun = gugun;
        	}else{ //가맹점명
        		branch_nm =$("#br_name").val();
        		obj.paging_yn ='N';
        		obj.br_name = branch_nm;
        	}
        	var jsonData = JSON.stringify(obj);	
        	ajaxCall(url, jsonData, searchStoreTopCallBack, errorCallBack, '프로모션매장호출');	//alert */
        }
        function searchStoreTopCallBack(obj){
        	if ( obj.result == common._trans_success_code ) { 
        		var promList = obj.body.store_list.store_list;
        		var listTxt = "";
        		positions =[];
        		if(promList.length>0){
        			for (var i = 0; i < promList.length; i++) {	
        				var promoObj = promList[i];	 
        				listTxt+='<div class="list">';
        				var offclass= 'red';
        				if(promoObj.off_day =="Y"){
        					offclass= 'bk';
        				}
        				listTxt+='<div class="icon '+offclass+'"></div>';
        				listTxt+='<div class="desc">';
        				listTxt+='<dl>';
        				listTxt+='<dt class="name">'+promoObj.br_name+'</dt>';
        				listTxt+='<dd class="local">'+promoObj.address+'</dd>';
        				listTxt+='<dd class="num">'+promoObj.tel1+'</dd>';
        				listTxt+='</dl>';
        				listTxt+='</div>';
        				listTxt+='<div class="img">';
        				//listTxt+='<img src="/resources/assets/images/contents/ex-store-02.png" alt="이미지영역">';
        				listTxt+='</div>';
        				listTxt+='</div>';
        				if(i==0){
	        				 // 이동할 위도 경도 위치를 생성합니다 
	                	    var moveLatLon = new kakao.maps.LatLng(promoObj.xloc, promoObj.yloc);
	                	    // 지도 중심을 부드럽게 이동시킵니다
	                	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	                	    map.panTo(moveLatLon);
       					}
        				var iwPosition ='<div class="map-icon-item" style="z-index:99;">';
        				iwPosition +='<div class="desc">';
        				iwPosition +='<dl class="info">';
        				iwPosition +='<dt class="name">'+promoObj.br_name+'</dt>';
        				iwPosition +='<dd class="local">'+promoObj.address+'</dd>';
        				iwPosition +='<dd class="num">'+promoObj.tel1+'</dd>';
        				iwPosition +='</dl>';
        				iwPosition +='<div class="delivery">';
        				iwPosition +='<p>포장 <span>'+promoObj.pack_amt+'</span>원 할인</p>';
        				if(replaceNull(promoObj.quick_paytype,'10') != '10'){
        					iwPosition +='<p>퀵포장</p>';
        				}
        				iwPosition +='</div>';
        				iwPosition +='</div>';
        				iwPosition +='</div>';
       				 	positions.push({
        				   title: promoObj.br_name
        				,  latlng: new kakao.maps.LatLng(promoObj.xloc, promoObj.yloc )
       				 	,  off_day : promoObj.off_day
       				 	,  content : iwPosition
       				 	,  click_open : 'close'
        				});
        			} 
        		} 
        		if($("#loc_btn").hasClass("disabled") === true) {
        			$("#nm_cnt").html(promList.length);
	        		$("#srchNameDiv").removeClass('l-hidden');
	        		$('#srchNameList').empty();
            		$('#srchNameList').html(listTxt);
           		}else{
           			$("#loc_cnt").html(promList.length);
           			$('#srchLocList').empty();
            		$('#srchLocList').html(listTxt);
           		}
        		setMarkers(null);
        		// 마커 이미지의 이미지 주소입니다
        		for (var i = 0; i < positions.length; i ++) {
        		    
        		    // 마커 이미지의 이미지 크기 입니다
        		    var imageSize = new kakao.maps.Size(24, 35);
        		    var imageSrc = "/resources/assets/images/icon/l-map-on.svg";
        		    //2차오픈
        		    /* if(positions[i].off_day =='Y'){
        		    	imageSrc = "/resources/assets/images/icon/l-map-off.svg";
        		    } */
        		    // 마커 이미지를 생성합니다    
        		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
        		    
        		    
        		    // 마커를 생성합니다
        		    var marker = new kakao.maps.Marker({
        		        position: positions[i].latlng, // 마커를 표시할 위치
        		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        		        image : markerImage, // 마커 이미지 
        		    });
        		    
        		 	// 마커에 표시할 인포윈도우를 생성합니다 
        		    var infowindow = new kakao.maps.InfoWindow({
        		        content: positions[i].content // 인포윈도우에 표시할 내용
        		    });
        		    if(getDevice()==4){
	        		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	        		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        		    }else{
        		    	kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow,i));
        			}
        		    marker.setMap(map);
        		    markers.push(marker);
        		}
        	}
        	
        }
        
        function setMarkers(map) {
            for (var i = 0; i < markers.length; i++) {
            	markers[i].setMap(map);
            }            
        }
     // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
        function makeOverListener(map, marker, infowindow) {
            return function() {
                infowindow.open(map, marker);
            };
        }

        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
        function makeOutListener(infowindow) {
            return function() {
                infowindow.close();
            };
        }
        function makeClickListener(map, marker, infowindow, idx) {
            return function() {
            	if(positions[idx].click_open =='close'){
                	infowindow.open(map, marker);
                	positions[idx].click_open = 'open';
            	}else{
            		infowindow.close();
            		positions[idx].click_open = 'close';
            	}
            };
        }
        
        
        function searchStorePaging(pageNum){

        	var obj = new Object();  
        	if (pageNum == '' || pageNum == "undefined") {
        		obj.pageNum = "1";
        	} else {
        		obj.pageNum = pageNum;
        	}   
        	obj.listCnt = 5;
        	obj.paging_yn ='Y';
        	
        	if(searchGb =='L'){
        		var longitude=lon;
	        	var latitude=lat;
	        	if(replaceNull(longitude,"") =="" || replaceNull(latitude,"") =="" ){
	        		longitude=37.5666805;
	        		latitude=126.9784147;
	        	}
	        	obj.yloc = longitude;
	        	obj.xloc = latitude;
        		
        	}else if(searchGb =='S'){ //시도 시군구
        		obj.sido = sido;
        		obj.gugun = gugun;
        	}else{ //가맹점명
        		obj.br_name = branch_nm;
        	}
        	var url = "/store/srch_storeInfo";
        	var data = JSON.stringify(obj); 
        	
        	ajaxCall(url, data, storeInfoCallBack, errorCallBack, '매장안내');
        }
        function storeInfoCallBack(obj){

        	var storeList = obj.body.store_list.store_list;
        	var listTxt ="";
    		var total_cnt = 0;
    		if(storeList.length>0){
    			total_cnt = storeList[0].total_cnt;
    			for (var i in storeList) {
    				listTxt+='<tr>';
                    listTxt+='<td>'+storeList[i].br_name+'</td>';
                  /*   offClass ='l-map-icon red';
                    if(storeList[i].off_day =='Y'){
                    	offClass ='l-map-icon bk';
                    }
                    listTxt+='<td><button class="'+offClass+'"></button></td>'; */
                    listTxt+='<td class="l-num">'+storeList[i].tel1+'</td>';
                    
                    listTxt+='<td class="l-num">'+numberFormatComma(storeList[i].pack_amt)+'</td>';
                   /*  var dlvTime = '-';
                    if(replaceNull(storeList[i].dlv_time,'')!=""){
                    	dlvTime=storeList[i].dlv_time+'min';
                    }
                    var packTime = '-';
                    if(replaceNull(storeList[i].pack_time,'')!=""){
                    	packTime=storeList[i].pack_time+'min';
                    }
                    listTxt+='<td class="l-num">'+dlvTime+'/'+packTime+'</td>'; */
                    
                    var ecouponClass="disabled";
                    if(storeList[i].ecoupon_yn =='Y'){
                    	ecouponClass=""
                    }
                    listTxt+='<td><button class="l-coupon '+ecouponClass+'"></button></td>';
                    
                    var ecashClass="disabled";
                    if(storeList[i].cashecoupon_yn =='Y'){
                    	ecashClass=""
                    }
                    listTxt+='<td><button class="l-receipt '+ecashClass+'"></button></td>';
                    
                    var dlvPaytype = 'X';
                    var dlv_paytype=replaceNull(storeList[i].dlv_paytype,'10');
                    
                    if(dlv_paytype!="10" && dlv_paytype!="30"){
                    	dlvPaytype='O';
                    }
                    var packPaytype = 'X';
                    var pack_paytype=replaceNull(storeList[i].pack_paytype,'10');
                    if(pack_paytype!="10" && pack_paytype!="30"){
                    	packPaytype='O';
                    }
                    listTxt+='<td class="l-num">'+dlvPaytype+'/'+packPaytype+'</td>';
                   /*  var quick_paytype =replaceNull(storeList[i].quick_paytype,'10');
                    var quickPaytype = "";
                    if(quick_paytype =='10' ||quick_paytype =='30' ){
                    	quickPaytype = "disabled";
                    }
                    
                    listTxt+='<td><button class="l-cart '+quickPaytype+'"></button></td>'; */
                	listTxt+='</tr>';
    			}
    		}else{
    			listTxt += '<tr><td colspan="9">조회된 메뉴가 존재하지 않습니다.</td></tr>'
    		}
    		$('#storeInfo > tbody').empty();
    		$('#storeInfo > tbody').html(listTxt);
    		var pagingHTML = createPagingHTML(obj.body.store_list.pageNum, total_cnt ,obj.body.store_list.listCnt, 'searchStorePaging');
    		$(".l-paging-num").html(pagingHTML);
        }
        function searchEnter(obj){
     		 if(event.keyCode == '13') {
     			goSearch('N');
     		 } 
        }
    </script>
</body>
</html>