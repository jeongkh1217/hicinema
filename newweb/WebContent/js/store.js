$(document).ready(function(){  
  $('ul.storetabs li').click(function(){
    var tab_id = $(this).attr('data-tab');
    $('ul.storetabs li').removeClass('current');
    $('.tab-content').removeClass('current');
    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  })
})
