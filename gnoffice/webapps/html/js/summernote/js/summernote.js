    $(document).ready(function(){
	 
	 	//썸머노트에 값넣기
	   //$('#summernote').summernote('code', '<p>가나다</p><p>마바사</p><p>아자차카타파하</p>');
	    $('#summernote').summernote();
	    //위와 같이 값을 먼저 넣어준 후 초기화를 시킨다. 그럼 아래와 같이 입력이 된다.
	    //초기화
		$('#summernote').summernote({
			height : 400, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true,
			lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
		});
	 
		

    //저장버튼 클릭
    $(document).on('click', '#saveBtn', function () {
        saveContent();
      
    });
 });

    //데이터 저장
    function saveContent() {
    	
        //값 가져오기
        var summernoteContent = $('#summernote').summernote('code');        //썸머노트(설명)
        console.log("summernoteContent : " + summernoteContent);
		
    }
