$(document).ready(function(){
var timer = null;
		var isRunning = false;
		$(function(){

				$(".code_btn").click(function(e){
				 $('.btn_chk_input').attr("placeholder", "").attr("disabled", false);
				var display = $('.code_time');
				var leftSec = 180;
				// 남은 시간
				// 이미 타이머가 작동중이면 중지
				if (isRunning){
					clearInterval(timer);
					display.html("");
					startTimer(leftSec, display);
				}else{
				startTimer(leftSec, display);

				}
			});
		})


		function startTimer(count, display) {

					var minutes, seconds;
					timer = setInterval(function () {
					minutes = parseInt(count / 60, 10);
					seconds = parseInt(count % 60, 10);

					minutes = minutes < 10 ? "0" + minutes : minutes;
					seconds = seconds < 10 ? "0" + seconds : seconds;

					display.html(minutes + ":" + seconds);

					// 타이머 끝
					if (--count < 0) {
					 clearInterval(timer);
					 //alert("시간초과");
					 display.html("시간초과");
					 $('.btn_chk_input').attr("disabled", true);
					 isRunning = false;
					}
				}, 1000);
					 isRunning = true;
		}
});
