﻿<%@ page contentType="text/html; charset=utf-8" %><head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>굽네치킨</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

<!-- 네이버 봇 정보 -->
<meta name="description" content="오븐 요리 마스터 '굽네' 공식 홈페이지 - 치킨, 피자, 디저트 등 제품 소개, 매장 및 온라인 주문 안내" />
<link href="https://www.goobne.co.kr/" rel="canonical" />
<meta property="og:url" content="https://www.goobne.co.kr/" />
<meta property="og:site_name" content="굽네치킨" />
<meta property="og:title" content="굽네치킨" />
<meta property="og:description" content="오븐 요리 마스터 '굽네' 공식 홈페이지 - 치킨, 피자, 디저트 등 제품 소개, 매장 및 온라인 주문 안내" />
<meta property="og:type"  content="website" />
<meta property="og:image" content="https://www.goobne.co.kr/2021renew_img/red_bg_logo.png">
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate value="${today}" pattern="yyyyMMddhhmm" var="nowDate"/>
<link rel="stylesheet" type="text/css" href="/onepage_fullscreen/full-page-scroll.css?v=${nowDate }">
<!-- Meta Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '3005723823073377');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=3005723823073377&ev=PageView&noscript=1"
/></noscript>
<!-- End Meta Pixel Code -->

<!-- 네이버 봇 정보 -->
<style>
* {padding:0;margin:0;list-style: none;text-decoration: none;}<br>
@font-face {
    font-family: 'TmoneyRoundWindRegular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindRegular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.section1 {background:url(https://www.goobne.co.kr/resources/assets/images/main/bg_pc.jpg);position:relative; background-size: cover; background-repeat: no-repeat; cursor: pointer;position:relative;background-position: center;}
.mobile {display: none;}  
.container{position:absolute;left:0;top:0;width:100%;height:100%;overflow: hidden;text-align:center;margin:0 auto;}
.container_position{position:relative;width:100%;height:100%;}
.container_position li{position:absolute;bottom:0;width: 100%;height: 100%;}
.container_position .bi_goobne {width:5.5%;position: fixed;top:2%;right:2%;}
.container_position .bi_goobne img {width:100%;}
.container_position .pc_img {bottom:auto;height: auto;top:50%;transform: translateY(-50%);margin-top: -2%;}
.container_position .mobile_img {bottom:auto;height: auto;top:50%;transform: translateY(-50%);margin-top: -2%;}	
.container_position li:nth-child(1) img{width:65%;object-position: center;object-fit: cover;}
/*
.container_position li:nth-child(2) img{width:100%;height:auto;object-position:center;object-fit: cover;}
.container_position li:nth-child(3) img{width:auto;height:100%;object-position: center;object-fit: cover;}*/
.container_position li.img_04_li{top:18%}
.container_position li.img_04_li img{width:100%;}
.btn_container{width: auto;position: absolute;right: auto; bottom: 3.5%;left: 50%;transform: translateX(-50%); width:80%;text-align: center;}
.btn_container li{display:inline-block;}
.btn_container li img{width:100%;}
.mobile_img{display:none;}
body, html,.scroll-container section{min-height:100vh;overflow-y:hidden;overflow-x: hidden;}
.mobile_img_01{display: none;}

/*S: T-Day 말풍선 추가*/
.wrap {text-align: center; }
.chatbox {animation: motion 0.3s linear 0s infinite alternate; margin-top: 0;}
.btn_container li .chatbox img{width:190px;}
  .balloon {  
 position:absolute; 
 width:auto; 
 height:auto;
 padding:1rem;
  background:#fff; 
  border-radius: 20px;
  top:-97px;
      left: 50%;
    transform: translate(-50%, 0%);
	    border: 2px solid #000;
}
.balloon:after { 
border-top: 10px solid #ec2025;
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    border-bottom: 0px solid transparent;


    content: "";
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translate(-50%, 0%);
}      
@keyframes motion {
	0% {margin-top: 0px;}
	100% {margin-top: 10px;}
}
-webkit-@keyframes motion {
	0% {margin-top: 0px;}
	100% {margin-top: 10px;}
}
/*E: T-Day 말풍선 추가*/
.mobile_link{display: none;}
.svg_img{width:190px;}


@media only screen and (max-width: 1645px){
.container_position li:nth-child(1) img{width:75%;}
.btn_container{margin-left:0;}
}
@media only screen and (max-width: 1490px){
.container_position li.img_04_li {width: 65%;right: 0;bottom: 19%;height: auto;}
.btn_container li{width:25%;}
.btn_container{right:0;}
.container_position .pc_img {top:48%;}
.container_position li:nth-child(1) img{width:83%;}
}
@media only screen and (max-width: 1100px){
.container_position .bi_goobne {width:11%;}
.pc_img{display: none;}
.mobile_img{display:block;top:2%}
.mobile_img img{width: 93%!important;}
}
@media only screen and (max-width: 970px){
.mobile_img{top:5%;}
.mobile_img img{width: 57%!important;}
.btn_container{bottom:5%;width:100%;}
}
/* 태블릿, 아이패드 */
@media only screen and (min-device-width : 1024px) and (max-device-width : 1366px){
.pc_img {top:44%!important;}
.mobile_img {top:14%;}
.mobile_img img {width:93%;}
.btn_container {bottom:19%;width:110%;}
}
@media only screen and (min-device-width: 1280px) and (max-device-height: 800px){
.pc_img {top:7%!important;}
.pc_img img {width:77%!important;}
.btn_container {bottom: 3%!important;}
}
@media only screen and (min-device-width : 1024px) and (max-device-height : 768px) {
.pc_img {display: block!important; top:13%;}
.mobile_img {display: none!important;top:5%!important;}
.mobile_img img{width: 80%!important;}
.btn_container{bottom:10%;width:110%;}
}
@media only screen and (max-width:830px){
.mobile_img{top:8%;}
.mobile_img img{width: 63%!important;}
.btn_container{bottom:8%;}
}
@media only screen and (min-device-width: 768px) and (max-device-height: 1024px){
.pc_img {top:47%!important;}	
.mobile_img{top:10%;}
.mobile_img img{width: 70%!important;}
.btn_container{bottom:10%;width:120%;}
}
@media only screen and (max-width:749px){
.mobile_img{top:10%;}
.mobile_img img{width: 65%!important;}
.btn_container{bottom:10%;}
}
@media only screen and (min-device-width: 512px) and (max-device-height: 717px){
.container .container_position .mobile_img{top:41%!important;}
.container .container_position .mobile_img img{width: 75%!important;}
.container .btn_container{bottom:21%;width:120%;}
}
@media only screen and (min-device-width: 717px) and (max-device-height: 717px){
.container .container_position .mobile_img{top:30%!important;}
.container .container_position .mobile_img img{width: 42%!important;}
.container .btn_container{bottom:39%!important;}
}	
@media only screen and (min-device-width: 1024px) and (max-device-height: 600px){
.pc_img {top:35%!important;}
.pc_img img {width:55%!important;}
.container .container_position .mobile_img{top:2%!important;}
.container_position .mobile_img img{width: 47.5%!important;}
.container .btn_container{bottom:29%!important;width:95%;}
}
@media only screen and (max-width:700px){
.section1 {background:url(https://www.goobne.co.kr/resources/assets/images/main/bg_mo.jpg);position:relative; background-size: cover; background-repeat: no-repeat; cursor: pointer;position:relative;background-position: right;}
.mobile_img{top:11%;}
.mobile_img img{width: 70%!important;}
.btn_container{bottom:11%;}
}
@media only screen and (max-width:620px){
.container_position .bi_goobne {width:17%;}
.mobile_img{top:15%;}
.btn_container{bottom:15%;width:115%;}
.balloon{width:20%;top:-69px;border-radius: 10px;}
.btn_container li .chatbox img,.svg_img{width:100%;}
}
@media only screen and (min-device-width: 540px) and (max-device-height: 720px){
.mobile_img{top:40%!important;}
.container .container_position .mobile_img img{width: 75%;}
.btn_container{bottom:21%!important;width:115%;}
}
@media only screen and (min-device-width: 720px) and (max-device-height: 720px){
.container .container_position .mobile_img{top:33%!important;}
.container .container_position .mobile_img img{width: 75%;}
.container .btn_container{bottom:0%!important;}
.pc_img img {
    width: 72%!important;
}
}
@media only screen and (max-width:500px){
.container_position .bi_goobne {width:19%;}
.mobile_img{top:21.5%;}
.mobile_img img{width: 93%!important;}
.btn_container{bottom:13%;width:120%;}
.mobile_link{display:inline-block;}
.pc_link{display: none;}
}
@media only screen and (max-width:414px){
.mobile_img{top:43%!important;}
.mobile_img img{width: 93%!important;}
}

@media only screen and (max-width: 280px){
.container_position .mobile_img{top:37%!important;}
}
}
</style>
</head>
<script>
function lnk(){
	var link = '/index'; 
    window.open(link);  
}
function lnk1(){
	alert('긴급 점검 중 입니다.');
   // var link = 'https://order.goobne.co.kr:8481/login/login.aspx'; 
   // window.open(link);  
}



</script>

<script src="/resources/js/lib/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(e) {

if (new Date() >= new Date('02/09/2022 09:00:00')            
            && new Date() < new Date('03/04/2022 23:59:59')) {        
            //alert('test');
            //$('container').addClass('a')
           $(document).ready(function () {
                $('#balloon').css('display','block');
            }); 
        } else if (new Date() >= new Date('03/05/2022 00:00:00')      
            && new Date() < new Date('02/14/2922 23:59:59')) {    
            $(document).ready(function () {
                /* $('.windowfadeIn').css('display','none'); */
                 $('#balloon').css('display','none');
            }); 
        } 
    });
    
 <!-- 
//CountDownTimer('01/01/2017', 'countdown'); 
CountDownTimer('03/05/2022 00:00 AM', 'newcountdown'); //AM,PM 12시간으로


function CountDownTimer(dt, id)
{
var end = new Date(dt);

var _second = 1000;
var _minute = _second * 60;
var _hour = _minute * 60;
var _day = _hour * 24;
var timer;

function showRemaining() {
var now = new Date();
var distance = end - now;
if (distance < 0) {
$('#balloon').css('display','none');
clearInterval(timer);
document.getElementById(id).innerHTML = '';
 if (end == Date(dt)) {
// document.getElementById(id).innerHTML = '<div class="mask_out_text">타임세일이 종료 되었습니다.</div>'
 $('#balloon').css('display','none').css('pointer-events','none');
}
return ;
}
var days = Math.floor(distance / _day);
var hours = Math.floor(distance/ _hour);
var minutes = Math.floor((distance % _hour) / _minute);
var seconds = Math.floor((distance % _minute) / _second);

document.getElementById(id).innerHTML ='<b>'+days+'일'+'</b>';
document.getElementById(id).innerHTML +='<b>'+ hours + '시간 '+'</b>';
document.getElementById(id).innerHTML += '<b>'+minutes + '분'+'</b>';
document.getElementById(id).innerHTML += seconds + '초';
}

timer = setInterval(showRemaining, 100);

}
// Source: stackoverflow
//-->    
</script>

<body id="page-top" class="index darkBg">
<!---S: 메인팝업--->
	
<!-- <div style="display: none;"> -->
  <div style="display:none ;"> <!--티데이 주문 폭주 팝업--->
	<div id="mask_popup" style="background:transpatent;"></div>
	
	<div class="window" id="window">
		<img src="2021renew_img/popup/popup_20220228_2.svg">
		<div class="btn_wrap btn_blk">
			<ul class="popup_btn_ul">
				<li id="todayPopChk" class="web_order" onClick="javascript:todaycloseWin();">오늘하루 보지 않기</li>
				<li class="main_pop_close close" onClick="javascript:closeWin();">닫기</li>
			</ul>
		</div>
	</div>
</div>
   
<!---E: 메인팝업--->
 <div id="main" class="scroll-container">
	 <a href="/index">
	 <section class="section1" id="section1" style="cursor: pointer;">
		<div class="container">
			<ul class="container_position">
				<li class="pc_img"><img src="/resources/assets/images/main/220527_micro_ovbss/img_pc.png"></li>
				<li class="mobile_img"><img src="/resources/assets/images/main/220527_micro_ovbss/img_mo_2.png"></li>
				<li class="bi_goobne"><img src="/resources/assets/images/main/220527_micro_ovbss/bi_goobne.png"></li>
			</ul>
			<ul class="btn_container">
				<li><a href="http://www.xn--9i1b89owjy5lfa431as3k.com/" target="_blank"><img src="/resources/assets/images/main/220527_micro_ovbss/btn_menu.jpg"></a></li>
				<li class="wrap" style="width:0;">
				<div class="balloon chatbox" style="display:none;">
						<a href="https://kt.com/52cn" target="_blank" class="pc_link">
							<!--<img src="https://www.goobne.co.kr/resources/assets/images/icon/kt.svg" class="">-->
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 449.98 184.49" class="svg_img"><defs><style>.cls-1{fill:#000;}.cls-2{fill:url(#linear-gradient);}.cls-2,.cls-3{mix-blend-mode:multiply;}.cls-4{fill:#fff;}.cls-5{isolation:isolate;}.cls-6{fill:url(#radial-gradient-2);opacity:.7;}.cls-6,.cls-7{mix-blend-mode:screen;}.cls-8{fill:#f5bd1e;}.cls-9{fill:#ec2025;}.cls-3{fill:url(#linear-gradient-2);}.cls-10{fill:#ec2025;}.cls-7{fill:url(#radial-gradient);opacity:.25;}</style><linearGradient id="linear-gradient" x1="131.85" y1="90.2" x2="131.85" y2="86.12" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="#bcbec0"/></linearGradient><radialGradient id="radial-gradient" cx="435.49" cy="455.56" fx="435.49" fy="455.56" r="9.7" gradientTransform="translate(-327.2 -340.05) scale(.95)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="#000101"/></radialGradient><linearGradient id="linear-gradient-2" x1="86.38" y1="91.3" x2="86.38" y2="81.32" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#fff"/><stop offset=".53" stop-color="#bcbec0"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient id="linear-gradient-3" x1="165.44" y1="65.43" x2="67.79" y2="90.99" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#cf1f27"/><stop offset=".48" stop-color="#a11d20"/><stop offset=".59" stop-color="#a41d20"/><stop offset=".68" stop-color="#ae1d22"/><stop offset=".77" stop-color="#c01e24"/><stop offset=".83" stop-color="#cf1f27"/><stop offset=".93" stop-color="#991b1e"/><stop offset=".95" stop-color="#961a1d"/><stop offset=".96" stop-color="#8c191c"/><stop offset=".97" stop-color="#7c181a"/><stop offset=".98" stop-color="#661517"/><stop offset=".99" stop-color="#4a1213"/><stop offset="1" stop-color="#321010"/></linearGradient><linearGradient id="__그라디언트_견본_4" x1="94.76" y1="56.26" x2="146.37" y2="99.57" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#b81f24"/><stop offset=".02" stop-color="#d71f26"/><stop offset=".03" stop-color="#dd3130"/><stop offset=".07" stop-color="#e95544"/><stop offset=".09" stop-color="#f06a50"/><stop offset=".11" stop-color="#f37355"/><stop offset=".28" stop-color="#f05041"/><stop offset=".48" stop-color="#ed2126"/><stop offset=".71" stop-color="#ed2126"/><stop offset="1" stop-color="#d71f26"/></linearGradient><radialGradient id="radial-gradient-2" cx="419.08" cy="446.76" fx="419.08" fy="446.76" r="98.34" gradientTransform="translate(-327.2 -340.05) scale(.95)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#000101"/><stop offset=".24" stop-color="#fff"/><stop offset=".76" stop-color="#fff"/><stop offset=".78" stop-color="#fafafa"/><stop offset=".81" stop-color="#ebebeb"/><stop offset=".85" stop-color="#d4d4d4"/><stop offset=".88" stop-color="#b3b3b3"/><stop offset=".91" stop-color="#888989"/><stop offset=".95" stop-color="#555"/><stop offset=".99" stop-color="#181919"/><stop offset="1" stop-color="#000101"/></radialGradient></defs><g class="cls-5"><g id="_이어_2"><g id="Layer_1"><g><rect class="cls-4" width="449.98" height="184.49" rx="12" ry="12"/><rect class="cls-4" x="5.67" y="4" width="439.44" height="176.44"/><g><path class="cls-1" d="M102.76,124.44l-19.15-23.59,27.84-34.28h-15.21c-6.81,0-11.48,2.07-15.62,6.94l-14.67,18.04V41.96h-14.73c-3.45,0-6.26,2.82-6.26,6.28v92.5h14.73c3.45,0,6.26-2.82,6.26-6.28v-24.61l11.93,14.63,10.14,12.48c2.05,2.56,4.73,3.76,7.5,3.76h20.54l-13.29-16.3Z"/><path class="cls-1" d="M140.53,140.75c-11.36,0-19.18-7.82-19.18-19.17V48.23c0-3.45,2.82-6.27,6.28-6.27h14.73V117.64c0,3.11,2.52,5.65,5.63,5.65h14.99v11.17c0,3.46-2.82,6.28-6.28,6.28h-16.16Z"/><path class="cls-2" d="M121.27,90.24h21.16v-11.11h-21.16v11.11Z"/><path class="cls-7" d="M81.06,100.91s23.24-28.6,25.82-31.75h-.34c-.66,.81-25.72,31.66-25.72,31.66l.24,.09Z"/><path class="cls-3" d="M97.32,68.81c-4.65,0-9.82,2.35-16.45,4.45l-17.47,21.49,19.8,6.59c24.07-29.62,23.83-29.32,26.16-32.18-3.13,0-12.04-.35-12.04-.35Z"/><g><path class="cls-10" d="M149.39,69.02c-11.88,0-54.96,.02-54.96,.02-7.45,0-12.36,2.64-15.83,6.86l-10.64,13.11s0-.03-.02-.01c3.85-2.94,9.16-4.69,14.59-4.69h66.85c8.48,0,16.62-2.59,16.62-9.27s-.76-10.34-.76-10.34c0,0-3.98,4.32-15.86,4.32Z"/><path class="cls-9" d="M68.1,88.84l12.3-15.15c3.04-3.72,7.01-7.16,15.46-7.16h53.53c11.32,0,15.27-4.02,15.31-4.06l1.3-1.37v13.95s.17,2.01-1.67,4.03c-2.58,2.84-7.61,4.27-14.94,4.27H82.45c-8.54,0-14.35,5.5-14.35,5.5Z"/><path class="cls-6" d="M165.91,75.75c-.07,1.34-1.84,7.26-16.52,7.26H83.48c-6.09,0-10.82,1.72-15.31,5.7l-.12,.13c3.53-2.84,7.9-5.54,15.43-5.54h65.91c16.55,0,16.52-7.54,16.52-7.54h0Z"/></g></g><g><path class="cls-8" d="M210.81,77.97c3.44,0,7.17-.59,9.38-1.61v6.49c-2.21,1.1-6.11,1.7-9.59,1.7h-14.34V50.65h7.34v27.33h7.21Zm22.49-7.77h-4.24v16.04h-7.17V50.01h7.17v13.24h4.24v6.96Z"/><path class="cls-8" d="M252.05,84.55h-16.21v-6.71h16.51c3.35,0,7.13-.42,9.38-1.44v6.62c-2.25,1.02-6.07,1.53-9.68,1.53Zm7.89-22.53c0,7.09-4.84,11.75-11.54,11.75s-11.58-4.67-11.58-11.75,4.84-11.75,11.58-11.75,11.54,4.67,11.54,11.75Zm-16.21,0c0,3.1,1.78,5.35,4.67,5.35s4.67-2.25,4.67-5.35-1.82-5.35-4.67-5.35-4.67,2.29-4.67,5.35Zm27.24,24.23h-7.17V50.01h7.17v36.24Z"/><path class="cls-8" d="M325.2,78.36v6.62h-36.66v-6.62h14.72v-6.24h7.21v6.24h14.73Zm-35.56-4.5v-6.58c5.98,0,11.54-2.89,13.32-7.47h-12.56v-6.58h12.73v-3.69h7.38v3.69h12.82v6.58h-12.52c-.13,.72-.34,1.44-.55,2.08l14.51,6.24-2.97,5.9-14.89-6.71c-3.95,4.16-10.31,6.54-17.27,6.54Z"/><path class="cls-8" d="M353.2,67.71c0,11.92-4.54,17.27-11.37,17.27s-11.41-5.35-11.41-17.27,4.58-17.27,11.41-17.27,11.37,5.35,11.37,17.27Zm-15.7,0c0,8.15,1.91,10.69,4.33,10.69s4.29-2.55,4.29-10.69-1.91-10.69-4.29-10.69-4.33,2.59-4.33,10.69Zm26.9,18.54h-7.17V50.01h7.17v36.24Z"/><path class="cls-8" d="M370.17,78.27h36.66v6.71h-36.66v-6.71Zm.72-5.13v-6.79c7.21-.04,13.92-6.75,15.23-16.46l7.3,1.15c-.34,2.55-1.02,4.92-2,7.17l15.45,9.29-3.78,5.81-14.85-9.51c-4.2,5.69-10.44,9.29-17.36,9.34Z"/><path class="cls-1" d="M231.68,129.87h-14.68v8.15h-7.3v-8.15h-14.68v-6.62h36.66v6.62Zm-18.71-15.19c-4.07,3.69-10.14,5.9-16.59,5.94v-6.53c5.56-.08,10.99-2.42,13.15-6.24h-12.52v-6.49h32.67v6.49h-12.22c-.13,.51-.34,1.02-.55,1.49l14.26,5.39-2.72,5.94-15.49-5.98Z"/><path class="cls-1" d="M272.5,118.41v5.9h-14.73v4.92h-7.21v-4.92h-14.72v-5.9h36.66Zm-27.24,12.82h25.55v5.94h-32.84v-10.74h7.3v4.8Zm25.04-14.94h-32.25v-15.36h32.25v15.36Zm-7.13-9.72h-17.99v4.07h17.99v-4.07Z"/><path class="cls-1" d="M311.7,118.62c0,11.92-4.41,17.27-11.12,17.27s-11.16-5.35-11.16-17.27,4.46-17.27,11.16-17.27,11.12,5.35,11.12,17.27Zm-7.04,0c0-8.1-1.74-10.69-4.07-10.69s-4.12,2.59-4.12,10.69,1.74,10.69,4.12,10.69,4.07-2.55,4.07-10.69Zm19.1-17.7v36.24h-7.04v-8.74h-4.12l.47-6.71h3.65v-6.41h-3.65l-.47-6.71h4.12v-7.68h7.04Z"/><path class="cls-1" d="M351.63,111.58c0,14.72-8.19,23.89-20.88,23.89v-6.79c8.78-.08,13.54-6.62,13.54-17.1v-3.27h-13.54v-6.54h20.88v9.8Zm12.77,25.59h-7.17v-36.24h7.17v36.24Z"/><path class="cls-1" d="M406.83,129.36v6.54h-36.66v-6.54h14.68v-4.07h-12.65v-14.77h25.55v-2.46h-25.63v-6.28h32.72v14.72h-25.54v2.5h25.97v6.28h-13.11v4.07h14.68Z"/><path class="cls-1" d="M418.24,125.11h-5.26l-1.95-23.13h9.17l-1.95,23.13Zm1.87,7.6c0,2.59-1.91,4.46-4.5,4.46s-4.5-1.87-4.5-4.46,1.91-4.5,4.5-4.5,4.5,1.91,4.5,4.5Z"/></g></g></g></g></g></svg>
						</a>
						<a href="https://kt.com/q6xd" target="_blank" class="mobile_link">
							<!--<img src="https://www.goobne.co.kr/resources/assets/images/icon/kt.svg" class="">-->
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 449.98 184.49" class="svg_img"><defs><style>.cls-1{fill:#000;}.cls-2{fill:url(#linear-gradient);}.cls-2,.cls-3{mix-blend-mode:multiply;}.cls-4{fill:#fff;}.cls-5{isolation:isolate;}.cls-6{fill:url(#radial-gradient-2);opacity:.7;}.cls-6,.cls-7{mix-blend-mode:screen;}.cls-8{fill:#f5bd1e;}.cls-9{fill:#ec2025;}.cls-3{fill:url(#linear-gradient-2);}.cls-10{fill:#ec2025;}.cls-7{fill:url(#radial-gradient);opacity:.25;}</style><linearGradient id="linear-gradient" x1="131.85" y1="90.2" x2="131.85" y2="86.12" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="#bcbec0"/></linearGradient><radialGradient id="radial-gradient" cx="435.49" cy="455.56" fx="435.49" fy="455.56" r="9.7" gradientTransform="translate(-327.2 -340.05) scale(.95)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#fff"/><stop offset="1" stop-color="#000101"/></radialGradient><linearGradient id="linear-gradient-2" x1="86.38" y1="91.3" x2="86.38" y2="81.32" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#fff"/><stop offset=".53" stop-color="#bcbec0"/><stop offset="1" stop-color="#fff"/></linearGradient><linearGradient id="linear-gradient-3" x1="165.44" y1="65.43" x2="67.79" y2="90.99" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#cf1f27"/><stop offset=".48" stop-color="#a11d20"/><stop offset=".59" stop-color="#a41d20"/><stop offset=".68" stop-color="#ae1d22"/><stop offset=".77" stop-color="#c01e24"/><stop offset=".83" stop-color="#cf1f27"/><stop offset=".93" stop-color="#991b1e"/><stop offset=".95" stop-color="#961a1d"/><stop offset=".96" stop-color="#8c191c"/><stop offset=".97" stop-color="#7c181a"/><stop offset=".98" stop-color="#661517"/><stop offset=".99" stop-color="#4a1213"/><stop offset="1" stop-color="#321010"/></linearGradient><linearGradient id="__그라디언트_견본_4" x1="94.76" y1="56.26" x2="146.37" y2="99.57" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#b81f24"/><stop offset=".02" stop-color="#d71f26"/><stop offset=".03" stop-color="#dd3130"/><stop offset=".07" stop-color="#e95544"/><stop offset=".09" stop-color="#f06a50"/><stop offset=".11" stop-color="#f37355"/><stop offset=".28" stop-color="#f05041"/><stop offset=".48" stop-color="#ed2126"/><stop offset=".71" stop-color="#ed2126"/><stop offset="1" stop-color="#d71f26"/></linearGradient><radialGradient id="radial-gradient-2" cx="419.08" cy="446.76" fx="419.08" fy="446.76" r="98.34" gradientTransform="translate(-327.2 -340.05) scale(.95)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#000101"/><stop offset=".24" stop-color="#fff"/><stop offset=".76" stop-color="#fff"/><stop offset=".78" stop-color="#fafafa"/><stop offset=".81" stop-color="#ebebeb"/><stop offset=".85" stop-color="#d4d4d4"/><stop offset=".88" stop-color="#b3b3b3"/><stop offset=".91" stop-color="#888989"/><stop offset=".95" stop-color="#555"/><stop offset=".99" stop-color="#181919"/><stop offset="1" stop-color="#000101"/></radialGradient></defs><g class="cls-5"><g id="_이어_2"><g id="Layer_1"><g><rect class="cls-4" width="449.98" height="184.49" rx="12" ry="12"/><rect class="cls-4" x="5.67" y="4" width="439.44" height="176.44"/><g><path class="cls-1" d="M102.76,124.44l-19.15-23.59,27.84-34.28h-15.21c-6.81,0-11.48,2.07-15.62,6.94l-14.67,18.04V41.96h-14.73c-3.45,0-6.26,2.82-6.26,6.28v92.5h14.73c3.45,0,6.26-2.82,6.26-6.28v-24.61l11.93,14.63,10.14,12.48c2.05,2.56,4.73,3.76,7.5,3.76h20.54l-13.29-16.3Z"/><path class="cls-1" d="M140.53,140.75c-11.36,0-19.18-7.82-19.18-19.17V48.23c0-3.45,2.82-6.27,6.28-6.27h14.73V117.64c0,3.11,2.52,5.65,5.63,5.65h14.99v11.17c0,3.46-2.82,6.28-6.28,6.28h-16.16Z"/><path class="cls-2" d="M121.27,90.24h21.16v-11.11h-21.16v11.11Z"/><path class="cls-7" d="M81.06,100.91s23.24-28.6,25.82-31.75h-.34c-.66,.81-25.72,31.66-25.72,31.66l.24,.09Z"/><path class="cls-3" d="M97.32,68.81c-4.65,0-9.82,2.35-16.45,4.45l-17.47,21.49,19.8,6.59c24.07-29.62,23.83-29.32,26.16-32.18-3.13,0-12.04-.35-12.04-.35Z"/><g><path class="cls-10" d="M149.39,69.02c-11.88,0-54.96,.02-54.96,.02-7.45,0-12.36,2.64-15.83,6.86l-10.64,13.11s0-.03-.02-.01c3.85-2.94,9.16-4.69,14.59-4.69h66.85c8.48,0,16.62-2.59,16.62-9.27s-.76-10.34-.76-10.34c0,0-3.98,4.32-15.86,4.32Z"/><path class="cls-9" d="M68.1,88.84l12.3-15.15c3.04-3.72,7.01-7.16,15.46-7.16h53.53c11.32,0,15.27-4.02,15.31-4.06l1.3-1.37v13.95s.17,2.01-1.67,4.03c-2.58,2.84-7.61,4.27-14.94,4.27H82.45c-8.54,0-14.35,5.5-14.35,5.5Z"/><path class="cls-6" d="M165.91,75.75c-.07,1.34-1.84,7.26-16.52,7.26H83.48c-6.09,0-10.82,1.72-15.31,5.7l-.12,.13c3.53-2.84,7.9-5.54,15.43-5.54h65.91c16.55,0,16.52-7.54,16.52-7.54h0Z"/></g></g><g><path class="cls-8" d="M210.81,77.97c3.44,0,7.17-.59,9.38-1.61v6.49c-2.21,1.1-6.11,1.7-9.59,1.7h-14.34V50.65h7.34v27.33h7.21Zm22.49-7.77h-4.24v16.04h-7.17V50.01h7.17v13.24h4.24v6.96Z"/><path class="cls-8" d="M252.05,84.55h-16.21v-6.71h16.51c3.35,0,7.13-.42,9.38-1.44v6.62c-2.25,1.02-6.07,1.53-9.68,1.53Zm7.89-22.53c0,7.09-4.84,11.75-11.54,11.75s-11.58-4.67-11.58-11.75,4.84-11.75,11.58-11.75,11.54,4.67,11.54,11.75Zm-16.21,0c0,3.1,1.78,5.35,4.67,5.35s4.67-2.25,4.67-5.35-1.82-5.35-4.67-5.35-4.67,2.29-4.67,5.35Zm27.24,24.23h-7.17V50.01h7.17v36.24Z"/><path class="cls-8" d="M325.2,78.36v6.62h-36.66v-6.62h14.72v-6.24h7.21v6.24h14.73Zm-35.56-4.5v-6.58c5.98,0,11.54-2.89,13.32-7.47h-12.56v-6.58h12.73v-3.69h7.38v3.69h12.82v6.58h-12.52c-.13,.72-.34,1.44-.55,2.08l14.51,6.24-2.97,5.9-14.89-6.71c-3.95,4.16-10.31,6.54-17.27,6.54Z"/><path class="cls-8" d="M353.2,67.71c0,11.92-4.54,17.27-11.37,17.27s-11.41-5.35-11.41-17.27,4.58-17.27,11.41-17.27,11.37,5.35,11.37,17.27Zm-15.7,0c0,8.15,1.91,10.69,4.33,10.69s4.29-2.55,4.29-10.69-1.91-10.69-4.29-10.69-4.33,2.59-4.33,10.69Zm26.9,18.54h-7.17V50.01h7.17v36.24Z"/><path class="cls-8" d="M370.17,78.27h36.66v6.71h-36.66v-6.71Zm.72-5.13v-6.79c7.21-.04,13.92-6.75,15.23-16.46l7.3,1.15c-.34,2.55-1.02,4.92-2,7.17l15.45,9.29-3.78,5.81-14.85-9.51c-4.2,5.69-10.44,9.29-17.36,9.34Z"/><path class="cls-1" d="M231.68,129.87h-14.68v8.15h-7.3v-8.15h-14.68v-6.62h36.66v6.62Zm-18.71-15.19c-4.07,3.69-10.14,5.9-16.59,5.94v-6.53c5.56-.08,10.99-2.42,13.15-6.24h-12.52v-6.49h32.67v6.49h-12.22c-.13,.51-.34,1.02-.55,1.49l14.26,5.39-2.72,5.94-15.49-5.98Z"/><path class="cls-1" d="M272.5,118.41v5.9h-14.73v4.92h-7.21v-4.92h-14.72v-5.9h36.66Zm-27.24,12.82h25.55v5.94h-32.84v-10.74h7.3v4.8Zm25.04-14.94h-32.25v-15.36h32.25v15.36Zm-7.13-9.72h-17.99v4.07h17.99v-4.07Z"/><path class="cls-1" d="M311.7,118.62c0,11.92-4.41,17.27-11.12,17.27s-11.16-5.35-11.16-17.27,4.46-17.27,11.16-17.27,11.12,5.35,11.12,17.27Zm-7.04,0c0-8.1-1.74-10.69-4.07-10.69s-4.12,2.59-4.12,10.69,1.74,10.69,4.12,10.69,4.07-2.55,4.07-10.69Zm19.1-17.7v36.24h-7.04v-8.74h-4.12l.47-6.71h3.65v-6.41h-3.65l-.47-6.71h4.12v-7.68h7.04Z"/><path class="cls-1" d="M351.63,111.58c0,14.72-8.19,23.89-20.88,23.89v-6.79c8.78-.08,13.54-6.62,13.54-17.1v-3.27h-13.54v-6.54h20.88v9.8Zm12.77,25.59h-7.17v-36.24h7.17v36.24Z"/><path class="cls-1" d="M406.83,129.36v6.54h-36.66v-6.54h14.68v-4.07h-12.65v-14.77h25.55v-2.46h-25.63v-6.28h32.72v14.72h-25.54v2.5h25.97v6.28h-13.11v4.07h14.68Z"/><path class="cls-1" d="M418.24,125.11h-5.26l-1.95-23.13h9.17l-1.95,23.13Zm1.87,7.6c0,2.59-1.91,4.46-4.5,4.46s-4.5-1.87-4.5-4.46,1.91-4.5,4.5-4.5,4.5,1.91,4.5,4.5Z"/></g></g></g></g></g></svg>
						</a>
					</div>
				<!--a href="https://order.goobne.co.kr:8481/login/login.aspx" target="_blank"-->
				<!--<a href="/index">
				<img src="/resources/assets/images/main/220429_micro/btn_order.jpg">
				</a>-->

				</li>
				<li style="position:relative;">
				<span id="newcountdown"></span>
				<a href="/index"><img src="/resources/assets/images/main/220429_micro/btn_homepage_02.png"></a>
				</li>
			</ul>
		</div>
	</section>
	</a>
</div>


<link href='/resources/assets/css/main/popup_main.css?v=${nowDate }' rel='stylesheet' type='text/css'>
<script src="/resources/assets/css/main/popup_main.js"></script>
<style>
#window{    max-width: 400px;
left: 50%;
/*transform: translate(0,0);*/
top: 47%;
bottom: 144px;
box-shadow: 2px 2px 10px #4b3e3e;
border-radius: 20px;
/*z-index: 99;*/
}
#window img{image-rendering: pixelated;}
.popup_btn_ul li{background:#cc3b42;width:48%;}
.btn_blk {margin-top:-1px;    background: #cc3b42;}
#newcountdown{display: none;}
@media only screen and (max-width: 749px){
#window{ left:50%;transform: translate(-50%,-50%);bottom:auto;top:50%;}
}
</style>

<script src="/onepage_fullscreen/full-page-scroll.js"></script>
<script type="text/javascript">
	new fullScroll({
		displayDots: false,
		dotsPosition: 'left',
		animateTime: 0.7,
		animateFunction: 'ease'
	});
</script>
</body>