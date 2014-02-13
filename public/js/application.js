$(document).ready(function() {
  $('#create-event').submit(function(e){
    e.preventDefault();
    var name = $('#name').val();
    var location = $('#location').val();
    var starts = $('#starts').val();
    var ends = $('#ends').val();
    $.post('/create_event', {name: name, location: location, starts: starts, ends: ends}, function(response){
      console.log(response);
      var string = "<li>Thing: " + response.url + response.name + "</a> To be held on " + response.starts + "</li>";
      $("#events").append(string)
    })
  })
});
