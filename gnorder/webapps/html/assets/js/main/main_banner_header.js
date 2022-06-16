/*메인롤링배너 background height 리사이징*/
  $(document).ready(function() {
  
  
   var windowWidth = $('.main-vi-wrap .main-box_hight').height(),
                    windowHeight = $('.main-vi-wrap .main-box_hight').height(),
                    adjHeight = windowHeight;
                $('.main-box .goobne-img_office_bg').css({
                    'height': adjHeight + 'px'
                });
            });
            $(window).resize(function() {
                    windowHeight = $('.main-vi-wrap .main-box_hight').height(),
                    adjHeight = windowHeight;
                $('.main-box .goobne-img_office_bg').css({
                    'height': adjHeight + 'px'
                });
        });
        
                
  $(function() {
        let header = document.querySelector("#header");
        let headerHeight = header.offsetHeight;

        window.onscroll = function () {
          let windowTop = window.scrollY;
            // 스크롤 세로값이 헤더높이보다 크거나 같으면 
            // 헤더에 클래스 'drop'을 추가한다
          if (windowTop >= headerHeight) {
            header.classList.add("drop");
          } 
          // 아니면 클래스 'drop'을 제거
          else {
            header.classList.remove("drop");
          }
        };
    });