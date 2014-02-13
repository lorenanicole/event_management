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
       $('#response').empty();
       $('#response').append("Congrats! You have successfully made that thing " +  response.name + " to now do with people!");
      $("#events").append(string);
    });
  });

  $('#pirate-submit').on('click', function(e){
      e.preventDefault();
      var sentence = $('#pirate-sentence').val();
      var url = 'http://isithackday.com/arrpi.php?text=' + sentence;
      console.log(url);
    $.post('/pirate', { url: url }, function(response) {
      console.log(response);
      $('#pirate-response').empty();
      $('#pirate-response').append("<h2> So what say yeeeee as a pirate?!?!</h2><p>" + response.translation + "</p>");
    });
  });
});
