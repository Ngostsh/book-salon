$(function(){
  var btn = $('cp_btn');
  btn.click(function(){
    btn.removeClass('active');
    $(this).addClass('active');
  });
});