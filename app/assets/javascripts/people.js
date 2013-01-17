$(".btn.starred-match").live("click", function(e) {
  var id = $(e.target).data("id");
  if (id != null) {
    $.ajax({
      url: "/matches/" + id,
      type: "DELETE"
    });
  }
});

$(".btn.unstarred-match").live("click", function(e) {
  var matcheeId = $(e.target).data("matchee-id");
  if (matcheeId != null) {
    var params = {
      "match": {
        "matchee_id": matcheeId,
        "type": "UserMatch"
      }
    };
    $.ajax({
      url: "/matches", 
      type: "POST",
      data: $.param(params)
    });
  }
});