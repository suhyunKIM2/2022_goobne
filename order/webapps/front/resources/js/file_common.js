/**
 * AjaxForm 을 이용한 파일 업로드
 * @param objData
 * 	url 				: UpLoad URL
 * 	data 				: UpLoad param Data
 * 	beforSendFunc 	: UpLoad 이전 실행될 Function
 * 	completeFunc 	: UpLoad 완료 이후 실행될 Function
 * 	successFunc 		: UpLoad 성공 이후 실행될 Function
 * 	errorFunc 		: UpLoad 실패 시 실행될 Function
 */
ajaxFormFileUpLoad = function(objData){
	console.log("objData.jqObj : "+objData.jqObj);
	var obj={
			jqObj:"",
			url:"",
			data: {},
			timeout : 120000,//30000,
			beforSendFunc:function(){ },
			completeFunc:function(){ },
			successFunc:function(){ },
			errorFunc:function(){ },
			getDataFunc:function(objData,eventObj){ return objData; }
	};
	//ObjData Check
	 
	if(objData != "" && objData != null){
		if(objData.jqObj != "" && objData.jqObj != null){							 //Jquery Object
			obj.jqObj = objData.jqObj;
		}
		if(objData.url != "" && objData.url != null){								 //URL
			obj.url = objData.url;
		}
		if(objData.data != "" && objData.data != null){								 //Data
			obj.data = objData.data;
		}
		if(objData.beforSendFunc != "" && objData.beforSendFunc != null){			//Befor Function
			obj.beforSendFunc = objData.beforSendFunc;
		}
		if(objData.completeFunc != "" && objData.completeFunc != null){				//Complete Function
			obj.completeFunc = objData.completeFunc;
		}
		if(objData.successFunc != "" && objData.successFunc != null){					//Success Function
			obj.successFunc = objData.successFunc;
		}
		if(objData.errorFunc != "" && objData.errorFunc != null){							//Error Function
			obj.errorFunc = objData.errorFunc;
		}
		if(objData.getDataFunc != "" && objData.getDataFunc != null){
			obj.getDataFunc = objData.getDataFunc;
		}
		if(objData.timeout != "" && objData.timeout != null){
			obj.timeout = objData.timeout;
		}
		if(objData.container){
			obj.container = objData.container;
		}
	}

	function mouseOverEvent(e, eventObj){
        console.log(eventObj);
		var exts = eventObj.attr("exts");
		var accept = "";
		var tmp = exts.split(',');
		if( exts != undefined && exts != '' ) {
			$.each(tmp, function(v) {
				if( accept == ""){
					accept = "."+tmp[v];
				}else{
					accept += ",."+tmp[v];
				}
			});
		}
		var strHtml = "";
		strHtml += '<div id="ajaxFormDiv" style="position: absolute; top:0px; left:0px; overflow: hidden; width: 100px; height: 33px; display: block; z-index: 999;">';
		strHtml += '	<form id="ajaxForm" name="dataFileForm" method="post" enctype="multipart/form-data" action="' + obj.url + '" accept-charset="UTF-8">';
		if( accept != ""){
			strHtml += '		<input type="file" name="FILE" id="ajaxFormFileData" style="width:100px; height:33px; filter: alpha(opacity=0); opacity:0; z-index: 999;" accept="' + accept +'"/>';
		}else{
			strHtml += '		<input type="file" name="FILE" id="ajaxFormFileData" style="width:100px; height:33px; filter: alpha(opacity=0); opacity:0;z-index: 999;" />';
		}
		strHtml += '	</form>';
		strHtml += '</div>';
		$("#ajaxFormDiv").remove();
		var container = objData.container;
		if(!container){
			container="body";
		}
		$(container).append(strHtml);
		
		if (navigator.appVersion.indexOf("MSIE") > 0) {		//IE 하위버전을 위한 구문...
			//Change Event 추가....
			$("#ajaxFormFileData").unbind("change");
			$("#ajaxFormFileData").bind("change", function(){
				//alert("bind change");
				//console.log("bind Cahnge!!!!!!");
			});
			//ajaxFormDiv 위치 설정....
			if($('#ajaxFormDiv')){
				$('#ajaxFormDiv').css('top', e.pageY-e.offsetY-5);
				$('#ajaxFormDiv').css('left', e.pageX-e.offsetX-8);
				$('#ajaxFormDiv').show();
			}else{
				//console.log("Jquery Object 가 없습니다.[ajaxFormDiv]");
			}
			//mouseOut 이벤트 발생시 ajaxFormDiv 삭제

			$("#ajaxFormDiv").mouseout(function(){
				//console.log("ajaxFormFileData out");
				$('#ajaxFormDiv').hide();
				//$('#ajaxFormDiv').remove();
			});
		}

		$("#ajaxFormFileData").change(function(){
			//console.log($(this));
			//obj.data 속성값 추가.
			if(undefined != eventObj.attr("fileType") || '' != eventObj.attr("fileType")) {
				obj.data.fileType = eventObj.attr("fileType");
			}
			if(undefined != eventObj.attr("deviceType") || '' != eventObj.attr("deviceType")) {
				obj.data.deviceType = eventObj.attr("deviceType");
			}
			if(undefined != eventObj.attr("fileName") || '' != eventObj.attr("fileName")) {
				obj.data.fileName = eventObj.attr("fileName");
			}
			if(undefined != eventObj.attr("imgWidth") || '' != eventObj.attr("imgWidth")) {
				obj.data.imgWidth = eventObj.attr("imgWidth");
			}
			if(undefined != eventObj.attr("imgHeight") || '' != eventObj.attr("imgHeight")) {
				obj.data.imgHeight = eventObj.attr("imgHeight");
			}
			if(undefined != eventObj.attr("exts") || '' != eventObj.attr("exts")) {
				obj.data.exts = eventObj.attr("exts");
			}
			if(undefined != eventObj.attr("maxLength") || '' != eventObj.attr("maxLength")) {
				obj.data.maxLength = eventObj.attr("maxLength");
			}
			if(undefined != eventObj.attr("fileSq") || '' != eventObj.attr("fileSq")) {
				obj.data.fileSq = eventObj.attr("fileSq");
			}
			var uesChangeEvent = eventObj.attr("useChangeEvent");
			obj.data = obj.getDataFunc(obj.data,eventObj);
			if(uesChangeEvent == "N" || uesChangeEvent == "n"){
				obj.successFunc("", eventObj);
				return ;
			}
			ajaxForm(obj);
		});
	}

	function ajaxForm(eventObj){
		console.log("obj"+eventObj);
		$("#ajaxForm").ajaxForm({
			data:eventObj.data	,
			timeout: eventObj.timeout,
			type: 'POST',
			cache: false,
			beforeSend: function(xmlHttpRequest) {
				//cfShowBlock(true);
				//	로딩바 보이기
			//	oGNMO.showLoading();
				console.log("before");
				obj.beforSendFunc(eventObj);
			},
			complete: function(xhr, textStatus) {
				obj.completeFunc();
				$("#ajaxFormDiv").remove();
				//cfHideBlock();
				//	로딩바 숨기기
				//oGNMO.hideLoading();
			},
			success:function(data){
				console.log("data");
				obj.successFunc(data, eventObj);
	    	},
	    	error:function(error){
	    		console.log("error");
	    		//	로딩바 숨기기
				//oGNMO.hideLoading();
	    		obj.errorFunc(error);
	    	},
			dataType:"json"
		}).submit();
	};

	//Event 추가....
	obj.jqObj.bind({
		mouseover : function(e){
			var eventObj = $(this);
			mouseOverEvent(e, eventObj);
		},
		click : function(){ 
			$("#ajaxFormFileData").click();
		}
	});
}; 
 
function imgUpload(img, idx, url) {
	/* var obj = $("label[id='img']"); */
	var obj = $("label[id="+img+"]");
	ajaxFormFileUpLoad({
		jqObj: obj,
		url: url,
		//container: '.filebox',
		container: '#imgbox' + idx,
		beforSendFunc: function (eventObj) {
			console.log("before");
		},
		completeFunc: function () {
			/*setTimeout(function () {
				layerPosition($(popupCmBnnrlLayerId));
			}, 100);*/
		},
		successFunc: function (data, eventObj) {
			if (data) {
				//	업로드 성고시 완료 콜백부분 
				var fileObj = data.body.ImageFile;
				//	미리보기 처리와 파일변수 바인딩 처리
				$(this.container + " input[id='file_tp']").val(fileObj.file_tp);
				$(this.container + " input[id='db_file_path']").val(fileObj.db_file_path);
				$(this.container + " input[id='ext']").val(fileObj.ext);
				$(this.container + " input[id='file_mv_yn']").val(fileObj.file_mv_yn);
				$(this.container + " input[id='file_nm']").val(fileObj.file_nm);
				$(this.container + " input[id='file_size']").val(fileObj.file_size);
				$(this.container + " input[id='org_file_nm']").val(fileObj.org_file_nm);
				$(this.container + " input[id='real_file_pth']").val(fileObj.real_file_pth);
				$(this.container + " input[id='real_file_url']").val(fileObj.real_file_url);
				$(this.container + " input[id='tmp_file_pth']").val(fileObj.tmp_file_pth);
				$(this.container + " input[id='tmp_file_url']").val(fileObj.tmp_file_url);
				//	미리보기 태그
				//var imgTag = "<img src='" + CONTEXT_PATH + fileObj.tmp_file_pth + "' width='252'/>";
				var divTag = "<div class='upload-display'><div class='upload-thumb-wrap'><img src='"+ CONTEXT_PATH+fileObj.tmp_file_pth+ "' class='upload-thumb'></div></div>";
				$(this.container + " span[id='img_view'").html(divTag);
				$(this.container + " input[id='file_vnm']").val(fileObj.org_file_nm);
			}
		},
		errorFunc: function () {
			alertPopup("AjaxForm Error");
		},
		getDataFunc: function (objData, eventObj) {		//change 이벤트 발생시 추가 데이터 넣기…..
			objData.imgInputId = eventObj.attr("imgInputId");
			return objData;
		}
	});
}

function fileUpload(file, idx, url) {
	var obj = $("label[id="+file+"]");
	ajaxFormFileUpLoad({
		jqObj: obj,
		url: url,
		//container: '.filebox',
		container: '#filebox' + idx,
		beforSendFunc: function (eventObj) {
			console.log("before");
		},
		completeFunc: function () {
			/*setTimeout(function () {
				layerPosition($(popupCmBnnrlLayerId));
			}, 100);*/
		},
		successFunc: function (data, eventObj) {
			if (data) {
				//	업로드 성고시 완료 콜백부분 
				var fileObj = data.body.DataFile;
				//	미리보기 처리와 파일변수 바인딩 처리
				$(this.container + " input[id='file_tp']").val(fileObj.file_tp);
				$(this.container + " input[id='db_file_path']").val(fileObj.db_file_path);
				$(this.container + " input[id='ext']").val(fileObj.ext);
				$(this.container + " input[id='file_mv_yn']").val(fileObj.file_mv_yn);
				$(this.container + " input[id='file_nm']").val(fileObj.file_nm);
				$(this.container + " input[id='file_size']").val(fileObj.file_size);
				$(this.container + " input[id='org_file_nm']").val(fileObj.org_file_nm);
				$(this.container + " input[id='real_file_pth']").val(fileObj.real_file_pth);
				$(this.container + " input[id='real_file_url']").val(fileObj.real_file_url);
				$(this.container + " input[id='tmp_file_pth']").val(fileObj.tmp_file_pth);
				$(this.container + " input[id='tmp_file_url']").val(fileObj.tmp_file_url);
				//	미리보기 태그
				//var imgTag = "<img src='" + CONTEXT_PATH + fileObj.tmp_file_pth + "' width='252'/>";
				//var divTag = "<div class='upload-display'><div class='upload-thumb-wrap'><img src='"+ CONTEXT_PATH + "/static/_gntmp/img/20220510/27c574be83d7463e8fcef8055041cc64.png' class='upload-thumb'></div></div>";
				//$(this.container + " span[id='img_view'").html(divTag);
				$(this.container + " input[id='file_vnm']").val(fileObj.org_file_nm);
			}
		},
		errorFunc: function () {
			alertPopup("AjaxForm Error");
		},
		getDataFunc: function (objData, eventObj) {		//change 이벤트 발생시 추가 데이터 넣기…..
			objData.imgInputId = eventObj.attr("imgInputId");
			return objData;
		}
	});
}