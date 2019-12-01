document.addEventListener('turbolinks:load', function(){
  $(".menu_button").click(function(){
    $("ul").slideToggle(200);
  });
});