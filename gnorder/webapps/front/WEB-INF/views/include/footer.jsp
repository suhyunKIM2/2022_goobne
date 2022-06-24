<%@ page contentType="text/html; charset=utf8" %>
<div class="inner">
    <div class="info-box">
        <div class="number">
            <p class="sub-text">주문상담</p>
            <p class="tel">1661-9494</p>
        </div>
        <div class="info-btn">
            <a href="#none" class="terms">이용약관</a>
            <a href="#none" class="privacy">개인정보처리방침</a>
            <a href="#none" class="e_mail">이메일무단수집거부</a>
            <a href="/directions">찾아오시는길</a>
        </div>
        <div class="sns-box">
            <a href="https://www.instagram.com/the___goobster/" target="_blank" class="instar"></a>
            <a href="https://www.facebook.com/goobne" target="_blank" class="facebook"></a>
            <a href="https://blog.naver.com/goobne94" target="_blank" class="blog"></a>
            <a href="https://www.youtube.com/watch?v=c99aYibEys4" target="_blank" class="youtube"></a>
        </div>
    </div>
    <div class="text-box">
        <div class="info-list">
            <p class="text-list">주식회사 지앤푸드 대표자 : 정태용</p>
            <p class="text-list">주소 서울특별시 강서구 강서로 318 (내발산동 677) 지앤빌딩</p>
            <p class="text-list">사업자등록번호 137-81-80324</p>
            <p class="text-list">통신판매업신고번호 제 2014-서울양천-0426호</p>
            <p class="text-list">TEL 02-2648-2005</p>
            <p class="text-list">FAX 02-2648-9458</p>
        </div>
        <p class="copyright">© 2009-2016 GOOBNE.CO.ALL RIGHT RESERVED</p>
    </div>
</div>
<jsp:include page="/WEB-INF/views/include/common_script.jsp"></jsp:include>


    
<script type="text/javascript">  
/*gps 전역변수 */
var lat;
var lon; 
$(document).ready(function() {   
	//메인화면 위치 표시
	//geoloc.init(); 
    //geolocation https 에서만 사용가능 보안문제, 강제 위치값 지정해줌
    lat = '37.554071';
    lon = '126.8370592';
    findLocation(lat, lon);
    
	$(".selectpicker").niceSelect();
	
	// 이용약관 내용보기 버튼 
    $('.terms').click(function () {
        $(".dimmed-bg").removeClass("l-hidden");
        $(".terms-moadl").removeClass("l-hidden");
    });

    // 개인정보 관련 내용보기 버튼 
    $('.privacy').click(function () {
        $(".dimmed-bg").removeClass("l-hidden");
        $(".privacy-moadl").removeClass("l-hidden");
    });
    
    // 이메일무단수집거부 내용보기 버튼 
    $('.e_mail').click(function () {
        $(".dimmed-bg").removeClass("l-hidden");
        $(".e_mail-moadl").removeClass("l-hidden");
    });

    // 팝업 닫기 버튼 구현
    function closePopupFunc() {
        $(".dimmed-bg").addClass("l-hidden");
        $(".terms-moadl").addClass("l-hidden");
        $(".privacy-moadl").addClass("l-hidden");
        $(".e_mail-moadl").addClass("l-hidden");
        $(".promo-moadl").addClass("l-hidden");
    }
 // 팝업 닫기 버튼 구현
    function closePopupFunc() {
        $(".dimmed-bg").addClass("l-hidden");
        $(".terms-moadl").addClass("l-hidden");
        $(".privacy-moadl").addClass("l-hidden");
        $(".e_mail-moadl").addClass("l-hidden");
        $(".promo-moadl").addClass("l-hidden");
    }
    const closeBtnElem = document.querySelectorAll(".closeBtn");
    closeBtnElem.forEach(e => e.addEventListener('click', closePopupFunc));
    
}); 

//현재 위치 받아오기 
var geoloc = {
	init : function() {
		if ('geolocation' in navigator) {
			/* 지오로케이션  */
			navigator.geolocation.getCurrentPosition(geoloc.success, geoloc.error); 
		} else {
			/* 지오로케이션 불가능 */
			alert('geolocationx');
			alert('현재  브라우저는 지오로케이션을 지원하지 않습니다.'); 
		}
	},
	success : function(position) {
		var latitude  = position.coords.latitude; //위도
	    var longitude = position.coords.longitude; //경도 
	    lat = latitude;
	    lon = longitude; 
	    findLocation(latitude, longitude);
	},
	error : function(err) {			
		var userAgent = navigator.userAgent.toString();
		if(/iPad|iPhone|iPod/.test(userAgent) && !window.MSStream){ // iOS
			alert('아이폰 > 설정 > 개인정보보호 > 위치서비스 > 굽네치킨의 위치접근허용을 체크해주세요.');
			return;
		} else {
			//alert('위치접근허용을 승인해주세요.'); 
			$('#myloc').attr('placeholder','주변 매장의 프로모션을 확인해보세요!');    //pc
			$('#m_myloc').attr('placeholder','주변 매장의 프로모션을 확인해보세요!');  //모바일 
			return; 
		}
	}
}  
function findLocation(lat,lon) { 	
	var url = "/getXyAddr";
	var obj = new Object();
	obj.longitude = lon;
	obj.latitude = lat; 
	var jsonData = JSON.stringify(obj);	
	ajaxCall(url, jsonData, locationCallBack, errorCallBack, '주소호출');	//alert 
} 
function locationCallBack(obj) { 
	if ( obj.result == common._trans_success_code ) { 
		$('#myloc').attr('placeholder',obj.body.addr);    //pc
		$('#m_myloc').attr('placeholder',obj.body.addr);  //모바일 
		$('#myLocMenu').text(obj.body.addr);
	}
}  

function promoStore(){
	var url = "/promo/Store";
	var obj = new Object();
	obj.yloc = lon;
	obj.xloc = lat; 
	var jsonData = JSON.stringify(obj);	
	ajaxCall(url, jsonData, promoCallBack, errorCallBack, '프로모션매장호출');	//alert  
}
function promoCallBack(obj) {  
	if ( obj.result == common._trans_success_code ) { 
		var promList = obj.body.promostore.promolist; 
		var promoHtml = "";
		if(promList.length>0){ 
			for (var i = 0; i < promList.length; i++) {	
				var promoObj = promList[i];	 
				promoHtml += "<div class='list'>\n";
				promoHtml += "<div class='icon bk'></div>\n"; 
				promoHtml += "<div class='desc'>\n";
				promoHtml += "<dl>\n";
				promoHtml += "<dt class='name'>"+promoObj.br_name+" <span class='l-num'>("+promoObj.distance+"km)</span></dt>\n";
				promoHtml += "<dd class='local'>"+promoObj.address+"</dd>\n";
				promoHtml += "<dd class='num'>"+promoObj.tel1+"</dd>\n";
				promoHtml += "</dl>\n";
				
				//promoHtml += "<p class='promo'><span class='l-num'>#</span>수요일 방문 포장 <span class='l-num'>50%</span> 할인</p>\n";
				promoHtml += "<div class='msg'>\n";
				promoHtml += "<div class='msg-line'>\n"; 
				promoHtml += "<span>1km 배달비 : "+numberFormatComma(promoObj.dlv_amt1)+"원</span>\n";
				promoHtml += "<span class='bar'></span>\n";
				promoHtml += "<span>포장주문 할인금액 : "+numberFormatComma(promoObj.pack_amt)+"원</span>\n";
				promoHtml += "</div>\n";  
				promoHtml += "<div class='msg-line'>\n";
				if( promoObj.dlv_time != null ) { 
				  promoHtml += "<span>배달주문 준비시간 : "+promoObj.dlv_time+" hour</span>\n";
				  promoHtml += "<span class='bar'></span>\n"; 
				}
				if( promoObj.pack_time != null ) {
				  promoHtml += "<span>포장주문 준비시간 : "+promoObj.pack_time+" hour</span>\n";
				}
				promoHtml += "</div>\n";
				promoHtml += "</div>\n";
				
				promoHtml += "<div class='icon-list'>\n";  //이쿠폰, 금액권, 온라인주문 가능 표시
				if( promoObj.ecoupon_yn == 'Y' ) promoHtml += "<button type='button' class='l-coupon' alt='e-coupon가능'></button>\n";
				if( promoObj.cashecoupon_yn == 'Y' ) promoHtml += "<button type='button' class='l-receipt' alt='금액권가능'></button>\n";
				if( promoObj.online_yn == 'Y' ) promoHtml += "<button type='button' class='l-cart' alt='온라인주문가능'></button>\n";
				promoHtml += "</div>\n";
				promoHtml += "</div>\n"; 
				if( promoObj.online_yn == 'Y' ) {   //온라인주문이 가능한 매장일때만 노출
					promoHtml += "<div class='btn'>\n";
					promoHtml += "<button type='button' class='like is-active' onclick=\"selStore(\'"+promoObj.br_id+"\')\">메뉴보기</button>\n";
					//promoHtml += "<button type='button' class='chk'>주문하기</button>\n";
					//promoHtml += "<button type='button' class='like is-active'><i class='star'></i>찜하기</button>\n";
					promoHtml += "</div>\n"; 
				}
				promoHtml += "</div>\n"; 
			} 
		} 
		$('#promo_bg').removeClass('l-hidden');
		$('#promo').removeClass('l-hidden'); 
		$('#promoList').empty();
		$('#promoList').html(promoHtml); 
	}
}  

function selStore(bid){ 
	var url = "/promo/selStore";
	var obj = new Object();
	obj.br_id = bid; 
	var jsonData = JSON.stringify(obj);	
	ajaxCall(url, jsonData, selStoreCallBack, errorCallBack, '매장선택');	//alert  
}

//메뉴페이지에서 결과처리
function selStoreCallBack(obj) {  
	if ( obj.result == common._trans_success_code ) { 
		var br_id = obj.body.br_id; 
		console.log("매장선택 session 생성완료,선택매장 =>"+br_id);
		
		$('#promo_bg').addClass('l-hidden');
		$('#promo').addClass('l-hidden'); 
	}
} 
</script> 