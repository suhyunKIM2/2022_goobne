<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant
             , com.gncns.goobne.common.session.SessionFactory
             , com.gncns.goobne.common.session.AdminUser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	SessionFactory sessFtr = new SessionFactory(request);
    AdminUser user = sessFtr.getAdminUser();
    
    String staticUrl = SystemConstant.getStaticUrl();
%> 
<!DOCTYPE html>
<html lang="ko">
 <head>
    <!-- Start bootstrap header script  -->
    <jsp:include page="/WEB-INF/views/include/header_script.jsp"></jsp:include>
    <!-- End bootstrap header script  -->
 </head>
<body id="page-top"  style="min-width:1690px; ">
    <!-- Page Wrapper -->
    <div id="wrapper">
                
        <!-- Start Sidebar left menu --> 
        <jsp:include page="/WEB-INF/views/include/nav_left.jsp"></jsp:include> 
        <!-- End Sidebar left menu --> 
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Start Topbar 공통 top-->
                <div class="ham"></div><jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
                <!-- End Topbar 공통 top-->
                
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4 container_auto">
                        <h1 class="h3 mb-0 text-gray-900">메뉴상세페이지</h1>
                    </div>
                    <div class="col-xl-4 col-lg-5 menu_container">
                    
                    <div class="tab-content">
                      <div class="tab-pane fade show active">
                        <form name="searchForm" id="searchForm" method="post">
                     		<input type="hidden" id="item_id" name="item_id" / >
                     	</form>
                       <div class="left_line line_50">
                            <b style="float:left;margin-right:1%;margin-top:6px;">메뉴상태 :</b> 
                            <ul class="list_inline">
                                <li>
                                <span class="button-checkbox">
                                    <button type="button" class="btn button_checkbox_de" data-color="info">베스트 </button>
                                    <input type="checkbox" class="hidden" id="best_yn" name="best_yn"<c:if test="${menu_view.best_yn eq 'Y' }">checked</c:if>/>
                                </span>
                                </li>
                                <li>
                                <span class="button-checkbox">
                                    <button type="button" class="btn button_checkbox_de" data-color="info">신메뉴 </button>
                                    <input type="checkbox" class="hidden"  id="new_yn" name="new_yn" <c:if test="${menu_view.new_yn eq 'Y' }">checked</c:if>/>
                                </span>
                                </li>
                                <li>
                                    <span class="button-checkbox">
                                    <button type="button" class="btn button_checkbox_de" data-color="info">MD추천 </button>
                                    <input type="checkbox" class="hidden"  id="recommend_yn" name="recommend_yn" <c:if test="${menu_view.recommend_yn eq 'Y' }">checked</c:if>/>
                                </span>
                                </li>
                                 <li>
                                    <span class="button-checkbox">
                                    <button type="button" class="btn button_checkbox_de" data-color="info">HOT </button>
                                    <input type="checkbox" class="hidden"  id="spice_yn" name="spice_yn" <c:if test="${menu_view.spice_yn eq 'Y' }">checked</c:if>/>
                                </span>
                                </li>
                            </ul>
                        </div>
                        <div class="preview_img_div">
                            <div class="filebox bs3-primary preview-image" id="imgbox0">
                              <span class="img" id="img_view">
                              	<div class='upload-display'>
                              		<div class='upload-thumb-wrap'>
                              			<img src='' class='upload-thumb'>
                              		</div>
                              	</div>
                              </span>
                              <p>메뉴 썸네일<span class="small-font block_line">600X600 비율 이미지</span></p>          
                              <input class="upload-name"  id="file_vnm" value="" placeholder="파일선택" disabled="disabled" style="width: 72%;">

                              <label id="img0"  exts="png,gif,jpg,jpeg">업로드</label> 
                              <input type="file" id="input_file" class="upload-hidden"> 
	                          <input type="hidden" id="file_tp"/>
							  <input type="hidden" id="db_file_path"/>
							  <input type="hidden" id="ext"/>
							  <input type="hidden" id="file_mv_yn"/>
							  <input type="hidden" id="file_nm"/>
							  <input type="hidden" id="file_size"/>
							  <input type="hidden" id="mv_sccss"/>
							  <input type="hidden" id="org_file_nm"/>
							  <input type="hidden" id="tmp_file_url"/>
							  <input type="hidden" id="tmp_file_pth"/>
							  <input type="hidden" id="real_file_url"/>
							  <input type="hidden" id="real_file_pth"/> 
                            </div>                        
                        </div>
                         <table class="table table-bordered table_S_box table_right_box" id="dataTable" width="100%" cellspacing="0">
                                 <tr>
                                     <th class="bg-gray-200">홈페이지 노출 순위</th>
                                    <td>
                                       <input type="text" style="width:52px;text-align: center;" id="ord1" name="ord1" value="${menu_view.ord1 }">
                                     </td>
                                    <th class="bg-gray-200">주문하기 노출 순위</th>
                                    <td>
                                       <input type="text" style="width:52px;text-align: center;" id="ord2" name="ord2" value="${menu_view.ord2 }">
                                     </td>
                                     <th class="bg-gray-200">코드번호</th>
                                      <td>
                                      		<input type="text" id="save_item_id"  value="${menu_view.item_id }" >
                                      </td>
                                      
                                </tr>
                                <tr>
                                    <th class="bg-gray-200">카테고리</th>
                                      <td>
                                       <select class="" id="class_id" name="class_id">
                                        </select>
                                      </td>
                                    <th class="bg-gray-200">제품명</th>
                                    <td>
                                       <input type="text" id="item_name" name="item_name" value="${menu_view.item_name }">
                                     </td>
                                    <th class="bg-gray-200">제품단축명</th>
                                    <td colspan="3">
                                       <input type="text" id="item_sname" name="item_sname" value="${menu_view.item_sname }">
                                     </td>
                                </tr>
                                <tr>
                                	<th class="bg-gray-200">그룹대표메뉴</th>
                                	 <td>
                                	 	 <div style="position:relative;">
                                	 	<input type="hidden" id="item_group" value="${menu_view.item_group }">
				                        <input type="text" id="keyword" style="width:95%;" placeholder="그룹대표메뉴검색" onkeyup="srchMenu(this);" value="${menu_view.item_group_nm }">
				                          <div class="autoFrame"  style="display:none; z-index:999"  id="menuList">
		                                      <ul class="autoFrame_ul">
		                                          <li onClick="#" > </li>
		                                          <li onClick="#" > </li>
		                                      </ul>
		                                  </div>
		                                  </div>
                                     </td>
                                	 <th class="bg-gray-200">주문시 포인트 점수</th>
                                	 <td >
                                       <div>
                                            <select class="selectpicker" id="point" name="point" >
                                                <option value="0">포인트 점수 추후 마케팅팀</option>
                                                <option value="10" <c:if test="${menu_view.point eq '10' }">chkecked</c:if>>10점</option>
                                            </select>
                                        </div>
                                     </td>
                                     <th class="bg-gray-200">금액권 적용</th>
                                    <td>
                                       <div>
                                            <label class="switch-button"> <input type="checkbox" id="money_cpn" name="money_cpn" <c:if test="${menu_view.money_cpn eq 'Y' }">checked</c:if>/> <span class="onoff-switch"></span> </label>
                                        </div>
                                     </td>
                                      
                                </tr>
                                <tr>
                                	<th class="bg-gray-200">가격</th>
                                    <td>
                                       <ul class="list_inline list_ul_bottom" >
                                            <li class="position_p"><input type="number" style="text-align: right;" id="price1" name="price1" value="${menu_view.price1 }"><span class="position_c">원</span></li> 
                                        </ul>
                                     </td>  
                                      
                                    <th class="bg-gray-200">판매여부</th>
                                        <td>
                                           <div>
                                                <label class="switch-button"> <input type="checkbox" id="online_yn" name="online_yn" <c:if test="${menu_view.online_yn eq 'Y' }">checked</c:if>/> <span class="onoff-switch"></span> </label>
                                            </div>
                                         </td>
                                    
                                   <th class="bg-gray-200">노출여부</th>
                                    <td>
                                       <div>
                                            <label class="switch-button"> <input type="checkbox" id="view_yn" name="view_yn" <c:if test="${menu_view.view_yn eq 'Y' }">checked</c:if>/> <span class="onoff-switch"></span> </label>
                                        </div>
                                     </td>
                                   
                                </tr>
                                <tr>
                                    <th class="bg-gray-200">메뉴설명</th>
                                    <td colspan="5">
                                        <textarea id="description" name="description" style="width:100%;min-height:83px;padding:0.5rem;border: 1px solid #e9e9e9;">${menu_view.description }</textarea>
                                    </td>
                                </tr>
                            </table>
                            
                        </div>
                         <table class="table table-bordered table_S_box" id="dataTable" width="100%" cellspacing="0" style="margin-top:1%;">
                                <tr>
                                    <th class="bg-gray-200">영양정보</th>
                                    <td>
                                        <ul class="block_ul">
                                            <li><p class="list_name">사이즈</p><input type="text"  id="food01" name="food01" value="${menu_view.food01 }"></li>
                                            <li><p class="list_name">총제공량</p><input type="text" id="food02" name="food02" value="${menu_view.food02 }"></li>
                                            <li><p class="list_name">1회제공량</p><input type="text" id="food03" name="food03" value="${menu_view.food03 }"></li>
                                            <li><p class="list_name">총중량</p><input type="text" id="food04" name="food04" value="${menu_view.food04 }"></li>
                                            <li><p class="list_name">열량</p><input type="text" id="food05" name="food05" value="${menu_view.food05 }"></li>
                                            <li><p class="list_name">나트륨</p><input type="text" id="food06" name="food06" value="${menu_view.food06 }"></li>
                                            <li><p class="list_name">탄수화물</p><input type="text" id="food07" name="food07" value="${menu_view.food07 }"></li>
                                            <li><p class="list_name">당류</p><input type="text" id="food08" name="food08" value="${menu_view.food08 }"></li>
                                            <li><p class="list_name">지방</p><input type="text" id="food09" name="food09" value="${menu_view.food09 }"></li>
                                            <li><p class="list_name">트랜스지방</p><input type="text" id="food10" name="food10" value="${menu_view.food10 }"></li>
                                            <li><p class="list_name">포화지방</p><input type="text" id="food11" name="food11" value="${menu_view.food11 }"></li>
                                            <li><p class="list_name">콜레스테롤</p><input type="text" id="food12" name="food12" value="${menu_view.food12 }"></li>
                                            <li><p class="list_name">단백질</p><input type="text" id="food13" name="food13" value="${menu_view.food13 }"></li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="bg-gray-200">원산지</th>
                                    <td><input type="text" style="width:95%;" id="origin" name="origin" value="${menu_view.origin }"></td>
                                </tr>
                            </table>
                     </div>
                 </div>
                  
                  <div class="col-xl-4 col-lg-5" style="text-align: center;margin: 2% auto 5%;    clear: both;">
                            <ul class="list_inline">
                                <li>
                                    <a href="<%=SystemConstant.SITE_PATH%>/menu/menu_list" class="btn btn-secondary btn-icon-split btn-S">
                                        <span class="text">취소</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:menu_save();" class="btn btn-primary btn-icon-split btn-S">
                                       <span class="text">저장</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    
                        
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Start Footer -->
            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
            <!-- End Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
  <!-- Start bootstrap footer script  -->
    <jsp:include page="/WEB-INF/views/include/footer_script.jsp"></jsp:include>
    <!-- End bootstrap footer script  -->
    
	<script type="text/javascript">
	$(document).ready(function(){

		var param = new Object();
		param.use_yn ='Y'
    	jQuery.ajax({
    		type:"POST",
    		url	:"<%=SystemConstant.SITE_PATH%>/code/getAjaxMenuClassList",
    		data: param,
    		dataType: "json",
    		success:function(data){
    			var optionObj = "<option value=''>선택</option>";
    			$.each(data,function(){
    				optionObj +='<option value="'+this.type_id+'">'+this.type_name+'</option>'
    			});
    			
    			$("#class_id").html(optionObj);
    			$("#class_id").val("${menu_view.class_id}")
    			$("#class_id").niceSelect();
    		}
    	});
		
		if("${menu_view.item_id}" !=""){
			$("#save_item_id").attr("disabled", true);
		}
		$("#point").val("${menu_view.point}");
		
		if("${menu_view.img_name}"!="" && "${menu_view.img_name}"!=null && "${menu_view.img_name}"!="null"){
			$(".upload-thumb").attr("src", "<%=staticUrl%>${menu_view.img_name}");
		}

		var url = "<%=SystemConstant.IMG_UPLOAD%>"; 
		imgUpload('img0', '0', url);	  //이미지 업로드 call
		
		
	});
	function menu_save(){
		
		if($("#class_id").val()==""){
			alert("카테고리를 선택해 주세요.");
			$("#class_id").focus();
			return;
		}
		
		if($("#save_item_id").val()==""){
			alert("코드번호를 입력해 주세요.");
			$("#save_item_id").focus();
			return;
		}
       	var obj = new Object();
  	   	obj.item_id = $("#save_item_id").val();
  	   	
  	   	var best_yn="N";
		if($('#best_yn').is(':checked')){
			best_yn ="Y";
		}
  	   	obj.best_yn =best_yn;
  	   	
  	  	var new_yn="N";
		if($('#new_yn').is(':checked')){
			new_yn ="Y";
		}
	   	obj.new_yn =new_yn;
	   	
	   	var recommend_yn="N";
		if($('#recommend_yn').is(':checked')){
			recommend_yn ="Y";
		}
		obj.recommend_yn =recommend_yn;
		
		var spice_yn="N";
		if($('#spice_yn').is(':checked')){
			spice_yn ="Y";
		}
		obj.spice_yn =spice_yn;
		
		obj.ord1 = $("#ord1").val();
		obj.ord2 = $("#ord2").val();
		obj.class_id= $("#class_id").val();
		obj.item_name = $("#item_name").val();
		obj.item_sname = $("#item_sname").val();
		obj.price1 = $("#price1").val();
		
		var online_yn="N";
		if($('#online_yn').is(':checked')){
			online_yn ="Y";
		}
  	   	obj.online_yn =online_yn;
		
  	   	var view_yn="N";
		if($('#view_yn').is(':checked')){
			view_yn ="Y";
		}
  	   	obj.view_yn =view_yn;
  	   	
  	  	var money_cpn = 'N';
  	  	if($('#money_cpn').is(':checked')){
  	  	money_cpn ="Y";
		}
	   	obj.money_cpn =money_cpn;
  	  	
	   	var point =$("#point").val();
	   	if(replaceNull(point,'')==""){
	   		point =0;
	   	}
  	   	obj.point = point;
  	   	
  	   	obj.description = $("#description").val();
  	   	obj.food01 = $("#food01").val();
  	  	obj.food02 = $("#food02").val();
  		obj.food03 = $("#food03").val();
  		obj.food04 = $("#food04").val();
  		obj.food05 = $("#food05").val();
  		obj.food06 = $("#food06").val();
  		obj.food07 = $("#food07").val();
  		obj.food08 = $("#food08").val();
  		obj.food09 = $("#food09").val();
  		obj.food10 = $("#food10").val();
  		obj.food11 = $("#food11").val();
  		obj.food12 = $("#food12").val();
  		obj.food13 = $("#food13").val();
  		obj.origin = $("#origin").val();
  		
  		var item_group = $("#item_group").val();
  		if(replaceNull(item_group,'') ==''){
  			item_group= $("#save_item_id").val();
  		}
  		obj.item_group = item_group;
  		
  		var file_nm = $("#file_nm").val().trim();
  		var tmp_file_pth = $("#tmp_file_pth").val().trim();
  		obj.img_name = file_nm;
		obj.img_tmp_pth = tmp_file_pth;
  		
  		
  		//menuData.menuImg = imgList; 
  	   	var data = JSON.stringify(obj);
  	   	var url = "<%=SystemConstant.SITE_PATH%>/menu/save_menu";
  	   	if( confirm("메뉴정보를 수정 하시겠습니까?") ) {
  			 ajaxCall(url, data, menuSaveCallBack, errorCallBack, "[메뉴정보 수정]");
       	} 
	}
	function menuSaveCallBack(obj){
    	alert("메뉴정보 수정 완료하였습니다.");
    	$('#item_id').val(obj.body.menu_save.item_id);
    	document.searchForm.action='<%=SystemConstant.SITE_PATH%>/menu/menu_view'; 
	    document.searchForm.submit();
    }
	
	function srchMenu(obj){
 		 //alert(obj.value);
 		  if(obj.value ==''){
 				 $("#item_group").val('');
 				 $("#menuList").css("display","none");
 				 return;
 		  }
 			var param = new Object();
 			param.type_name = obj.value;
 	    	jQuery.ajax({
 	    		type:"POST",
 	    		url	:"<%=SystemConstant.SITE_PATH%>/code/getAjaxMenuList",
 	    		data: param,
 	    		dataType: "json",
 	    		success:function(data){
 	    			var optionObj = "";
 	    			optionObj +='<ul class="autoFrame_ul">';
 	    			$.each(data,function(){
 	    				optionObj += '<li onClick="setGroupId(\''+this.type_id +'\',\''+this.type_name+'\')" >'+this.type_name+'</li>'
 	    			});
 	    			optionObj +=' </ul>';
 	    			$("#menuList").css("display","");
 	    			$("#menuList").html(optionObj);
 	    		}
 	    	});
 		
 			 
 		
 	 }
	 function setGroupId(item_group,group_nm){
  		$("#item_group").val(item_group);
  		$("#keyword").val(group_nm);
  		$("#menuList").css("display","none"); 
  	 }
</script>
</body> 
</html> 

