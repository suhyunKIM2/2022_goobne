//<![CDATA[
    function wrapWindowByMask(){
 
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask_popup").css({"width":maskWidth,"height":maskHeight});  
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
 
        $("#mask_popup").fadeIn(0);      
        $("#mask_popup").fadeTo("slow",0.6);    
 
        //윈도우 같은 거 띄운다.
        $("#window").show();
 
    }
 
    $(document).ready(function(){
        //검은 막 띄우기
        $(".openMask").click(function(e){
            e.preventDefault();
            wrapWindowByMask();
        });
 
        //닫기 버튼을 눌렀을 때
        $(".window .close").click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $("#mask, .window").hide();  
        });       
 
        //검은 막을 눌렀을 때
        $("#mask_popup").click(function () {  
            $(this).hide();  
             $("#window").addClass('fadeOut');
            $("#window").css('display','none');  
 
        });      
 
    });
 
//]]>

$( document ).ready(function() {
	cookiedata = document.cookie; 

	/*if ( cookiedata.indexOf("ncookie=done") < 0 ){ 
		document.getElementById('window').style.display = "block";    
        document.getElementById('mask_popup').style.display = "block";
	} else {
		document.getElementById('window').style.display = "none";    
        document.getElementById('mask_popup').style.display = "none";
	}*/
    if ( cookiedata.indexOf("ncookie=done") < 0 ){ 
		document.getElementById('window').className += 'fadeIn';   
        document.getElementById('mask_popup').className += 'fadeIn';
        document.getElementById('window').style.display = "block";    
        document.getElementById('mask_popup').style.display = "block";
	} else {
		document.getElementById('window').className = 'fadeOut';    
        document.getElementById('mask_popup').className = 'fadeOut';
        document.getElementById('window').style.display = "none";    
        document.getElementById('mask_popup').style.display = "none";
	}
});

function setCookie( name, value, expiredays ) { 
	/*var todayDate = new Date(); 
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
*/
var todayDate = new Date();   
    todayDate = new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);  
    if ( todayDate > new Date() )  
    {  
    expiredays = expiredays - 1;  
    }  
    todayDate.setDate( todayDate.getDate() + expiredays );   
     document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"   
  }  

function closeWin() { 
	/*document.getElementById('window').style.display = "none";   
    document.getElementById('mask_popup').style.display = "none"; */
    document.getElementById('window').className =  'fadeOut';    
    document.getElementById('mask_popup').className = 'fadeOut';
    document.getElementById('window').style.display = "none";    
    document.getElementById('mask_popup').style.display = "none";
}

function todaycloseWin() { 
	setCookie( "ncookie", "done" , 1 );     // 저장될 쿠키명 , 쿠키 value값 , 기간( ex. 1은 하루, 7은 일주일)
	/*document.getElementById('window').style.display = "none";    
    document.getElementById('mask_popup').style.display = "none"; */
    document.getElementById('window').className = 'fadeOut';   
    document.getElementById('mask_popup').className =  'fadeOut';
    document.getElementById('window').style.display = "none";    
    document.getElementById('mask_popup').style.display = "none";
}


