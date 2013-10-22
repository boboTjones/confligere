/* 
   Using old code, for now. 
*/
$(document).ready(function() {  
    $('nav li').removeClass('active');
    var activeTab = $('#nav').attr('class');
    $('li.' + activeTab).addClass('active');


    
    $('#montharoo').change(function(){
      var month = $(this).val();
      light_up_calendar(month);
    });
});

function light_up_calendar(month) {
  if(undefined != month)
    $(".monthname").empty();
    $(".monthname").append(month);
  $("td").find("label").empty();
  $.getJSON('timeline/dow?month=' + month, function(data) {
    for ( x in data ) {
      var dow = x;
      var loc = data[x];
      $("td:eq(" + loc + ")").find("label").append(dow);
    }
  });
}