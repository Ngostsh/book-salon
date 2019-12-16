document.addEventListener('turbolinks:load', function(){
  $(".menu_button").click(function(){
    $(".menu").slideToggle(200);
  });
});