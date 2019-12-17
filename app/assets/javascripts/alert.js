document.addEventListener('turbolinks:load', function(){
  setTimeout("$('.notifications').fadeOut('slow')", 300);
  $('.notifications').on('click', function() {
    $('.notifications').fadeOut(600);
  });
});