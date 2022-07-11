<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="com.gncns.goobne.config.SystemConstant" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!-- S: 파일업로드 -->
<script src="<%=SystemConstant.SITE_PATH%>/resources/js/file_upload.js"></script> 
<!-- E: 파일업로드 -->

 <!-- Bootstrap core JavaScript-->
 <!-- <script src="<%=SystemConstant.SITE_PATH%>/resources/vendor/jquery/jquery.min.js"></script> -->
 <script src="<%=SystemConstant.SITE_PATH%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

 <!-- Core plugin JavaScript-->
 <script src="<%=SystemConstant.SITE_PATH%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

 <!-- Custom scripts for all pages-->
 <script src="<%=SystemConstant.SITE_PATH%>/resources/js/sb-admin-2.min.js"></script>

 <!-- Page level plugins -->
 <script src="<%=SystemConstant.SITE_PATH%>/resources/vendor/chart.js/Chart.min.js"></script>
 <!-- Page level custom scripts -->
  <script src="<%=SystemConstant.SITE_PATH%>/resources/js/demo/chart-area-demo.js"></script>
  <script src="<%=SystemConstant.SITE_PATH%>/resources/js/demo/chart-pie-demo.js"></script>
   <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="<%=SystemConstant.SITE_PATH%>/resources/js/calendar.js"></script> <!--- 캘린더----> 
  <script src="<%=SystemConstant.SITE_PATH%>/resources/js/jquery.nice-select.js"></script> <!--- 셀렉박스---->
  <script src="<%=SystemConstant.SITE_PATH%>/resources/js/all_checkbox.js"></script> <!--- 전체선택&해제 체크박스---->
<!--- S: modal_popup ---->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
   <script src="<%=SystemConstant.SITE_PATH%>/resources/js/modal_popup.js"></script>  
<!--- E: modal_popup---->

<jsp:include page="/WEB-INF/views/include/common_script.jsp"></jsp:include>

<!-- S: include summernote(에디터) css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="<%=SystemConstant.SITE_PATH%>/resources/js/summernote/js/summernote-lite.js"></script>
<script src="<%=SystemConstant.SITE_PATH%>/resources/js/summernote/js/summernote.js"></script>
<!-- E: include summernote(에디터) css/js -->
 
<!-- S: 버튼식체크박스 -->
    <script src="<%=SystemConstant.SITE_PATH%>/resources/js/btn_checkbox.js"></script> 
<!-- E: 버튼식체크박스 -->

<script>
    $(document).ready(function() {
      //$('select').niceSelect();  
      $(".selectpicker").niceSelect();
     // 팝업 닫기 추가 
     $('.close').on('click', function(){
       $('.modal').modal('hide');
       console.log("click close");
       });
     /*selected hidden 추가*/
     $('.selected_hidden .nice-select .list li').attr('id','selected');
     $('.selected_hidden .nice-select .list li:nth-child(1)').attr('id','selected_on');
       $(".selected_hidden .nice-select .list li#selected_on").click(function(){
           //$(".list_inline .hidden_option").hide();
       $(this).parent().parent().parent('.selected_hidden li').nextAll('.hidden_option').hide();   
      });
     $(".selected_hidden .nice-select .list li#selected").click(function(){
         //$(".list_inline .hidden_option").show();
         $(this).parent().parent().parent('.selected_hidden li').nextAll('.hidden_option').show();    
     });
   /*   if($(".selected_hidden .nice-select .list li:nth-child(1)").hasClass("selected") == true) {
       $('.hidden_option').css('display','none');
      } */
     
     $("#check1").change(function(){
         if($("#check1").is(":checked")){
            $(".TOP_10").css('display','block');
            $(".TOP_10_write").css('display','none');
         }else{
            $(".TOP_10").css('display','none');
            $(".TOP_10_write").css('display','block');
         }
     });
      $("#check2").change(function(){
         if($("#check2").is(":checked")){
            $(".TOP_10_write").css('display','block');
            $(".TOP_10").css('display','none');
         }else{
            $(".TOP_10_write").css('display','none');
            $(".TOP_10").css('display','block');
         }
     });
   });
</script>
<script type="text/javascript">

function maxLengthCheck(object){
  if (object.value.length > object.maxLength){
    //object.maxLength : 매게변수 오브젝트의 maxlength 속성 값입니다.
    object.value = object.value.slice(0, object.maxLength);
  }    
}
</script>