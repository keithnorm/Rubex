$(function() {
  $("#regex_input, #test_string").bind('keyup', function(e){
    $.post('/', $(e.target).parents("form").serialize(), function(response){
      var results = eval("(" + response + ")");
      var result;
      $("#match_capture").empty();
      $("#match").empty();
      if(results.matches){
        result = escapeHTMLEncode(results.matches[0])
        if(result == "undefined")
          result = "no matches"
        $("#match").html(result);
        results.matches.shift();
        for(var i = 0; i < results.matches.length; i++){
          $("#match_capture").append($("<li>" + results.matches[i] + "</li>"))
        }
      }
      else
        $("#match").html(results.error);
    });
  })
})

function escapeHTMLEncode(str) {
 var div = document.createElement('div');
 var text = document.createTextNode(str);
 div.appendChild(text);
 return div.innerHTML;
}