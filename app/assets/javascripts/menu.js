document.addEventListener('turbolinks:load', function(){
  $(".menu_button").click(function(){
    $(".menu").slideToggle(200);
  });
});

document.addEventListener('turbolinks:load', function(){
  $(".category_button").click(function(){
    $(".category").slideToggle(200);
  });
});