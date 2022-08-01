/*
$(function(){
	$('#decreaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $('#numberUpDown').text();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
		alert('더이상 줄일수 없습니다.');
		num =1;
	}
		$('#numberUpDown').text(num);
	});
	$('#increaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $('#numberUpDown').text();
		var num = parseInt(stat,10);
		num++;

		if(num>5){
		alert('더이상 늘릴수 없습니다.');
		num=5;
		}
	$('#numberUpDown').text(num);
	});
});
*/$(function(){
	$('#decreaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $('#numberUpDown').text();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
		alert('더이상 줄일수 없습니다.');
		num =1;
	}
		$('#numberUpDown').text(num);
		
	});
	$('#increaseQuantity').click(function(e){
		e.preventDefault();
		var stat = $('#numberUpDown').text();
		var num = parseInt(stat,10);
		num++;

		if(num>5){
		alert('더이상 늘릴수 없습니다.');
		num=5;
		}
	$('#numberUpDown').text(num);
	});
});