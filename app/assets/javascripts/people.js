$(".btn.starred-match").live("click", function(e) {
  var id = $(e.target).data("id");
  if (id != null) {
    $.ajax({
      url: "/starred_matches/" + id,
      type: "DELETE"
    });
  }
});

$(".btn.unstarred-match").live("click", function(e) {
  var matcheeId = $(e.target).data("matchee-id");
  if (matcheeId != null) {
    var params = {
      "starred_match": {
        "matchee_id": matcheeId,
        "type": "UserStarredMatch"
      }
    };
    $.ajax({
      url: "/starred_matches", 
      type: "POST",
      data: $.param(params)
    });
  }
});