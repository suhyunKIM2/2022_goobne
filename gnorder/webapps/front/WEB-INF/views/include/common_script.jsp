<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title><%=SystemConstant.SITE_TITLE%></title>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyyMMddHHmmss" var="nowDTM"/>
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowD"/>
<script type="text/javascript">

/* 공통코드조회 selectbox*/
getCodeListSelBox = function(obj, param, firstOpt, defaultVal ){
	jQuery.ajax({
		type:"POST",
		url	:"/code/getAjaxCodeList",
		data: param,
		dataType: "json",
		success:function(data){
			fnCodeListSettingSelBox(data,obj,firstOpt,defaultVal);
		}
	});
};

//selectbox 코드값 셋팅 
fnCodeListSettingSelBox = function(data,obj,firstOpt,defaultVal){
	var cdCheck = false;
	var optionObj = "";
	//obj.empty();
	if(firstOpt!="" && firstOpt !=null){
		optionObj += '<option value="">' + firstOpt+'</option>';
	}
	$.each(data,function(){
		optionObj += '<option value="'+ this.type_id + '">' + this.type_name +'</option>';
	});
	obj.html(optionObj);
	if(defaultVal !="" && defaultVal!=null){
		obj.val(defaultVal).prop("selected", true);
	}
	obj.niceSelect("update");
};

//전체선택 (클릭chk id ,전체선택될 chk name)
fnAllChk = function (id,name){
    if($("#"+id).prop("checked")){
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
        $("input[name="+name+"]").prop("checked",true);
        //클릭이 안되있으면
    }else{
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
         $("input[name="+name+"]").prop("checked",false);
    }
};
 
//paging html 
createPagingHTML = function(intThisPage, intTotalCnt ,intListCnt, strFunctionName, intPagingCnt) {
		var thisPage = parseInt(intThisPage);
		var LastPage = Math.ceil(intTotalCnt/intListCnt);
		var strPaging = "";

		if (intPagingCnt == '' || intPagingCnt == "undefined" || intPagingCnt == undefined || intPagingCnt ==null) {
			intPagingCnt = 10;
		}
		var thisPagingCnt = parseInt(intPagingCnt);
		
		
		if (thisPage - 1 > 0) {
			strPaging = '<button type="button" onclick="'+strFunctionName + '(\'' + (thisPage - 1).toString()+ '\');"><img src="/resources/assets/images/icon/chevron-double-left.svg" style="width:20px;"></button>';
		} else {
			strPaging = '<button type="button"><img src="/resources/assets/images/icon/chevron-double-left.svg" style="width:20px;"></button>';
		}
		if (LastPage == 0) {
			strPaging = strPaging + '<button type="button" class="is-active">'+thisPage+'</button>';
			strPaging = strPaging + '<button type="button"><img src="/resources/assets/images/icon/chevron-double-right.svg" style="width:20px;"></button>';
		} else {
			var intX = parseInt((thisPage - 1) / thisPagingCnt);
			var intMOD = thisPage;
			if (intMOD == 0) {
				intX = intX - 1;
			}
			for (var j = 1 + (intX * thisPagingCnt); j < thisPagingCnt + (thisPagingCnt * intX) + 1; j++) {
				if (j <= LastPage) {
					if (j == thisPage) {
						strPaging = strPaging + '<button type="button" class="is-active">' + thisPage+ '</button>';
					} else {
						strPaging = strPaging + '<button type="button" onclick="'+strFunctionName+'(\'' + j.toString()+ '\');">' + j.toString() + '</button>';
					}
				}
			}
			if (thisPage + 1 <= LastPage) {
				strPaging = strPaging + '<button type="button" onclick="'+strFunctionName+'(\'' + (thisPage + 1).toString()+ '\');"><img src="/resources/assets/images/icon/chevron-double-right.svg" style="width:20px;"></button>' 	
						
			} else {
				strPaging = strPaging +'<button type="button"><img src="/resources/assets/images/icon/chevron-double-right.svg" style="width:20px;"></button>';
			}
		}
		return strPaging;
	}

toHtml=function(str){
    var returnText = str;
     returnText=returnText.replace(/&nbsp;/gi," ");
     returnText=returnText.replace(/&amp;/gi,"&");
     returnText=returnText.replace(/&quot;/gi,'"');
     
     returnText=returnText.replace(/&lt;/gi,'<');
     returnText=returnText.replace(/&gt;/gi,'>');
     returnText=returnText.replace(/\r\n|\n|\r/g, '<br />');
    return returnText;
 }
</script>

