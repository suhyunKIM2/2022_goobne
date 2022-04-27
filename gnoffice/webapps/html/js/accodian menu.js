$(document).ready(function(){
  $(".table_acc_menu").hide();
  // $("ul > li:first-child a").next().show();
  $("ul.accodian_menu li a").click(function(){
    $(this).next().slideToggle(300);
    // $(this).next().slideDown(300);
    $("ul.accodian_menu li a").not(this).next().slideUp(300);
    return false;
  });
  $("ul.accodian_menu li a").eq(0).trigger("click");
});