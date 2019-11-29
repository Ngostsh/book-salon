$(function(){
  setTimeout("$('.notifications').fadeOut('slow')", 4000);
  $('.notifications').on('click', function() {
    $('.notifications').fadeOut(600);
  });
});