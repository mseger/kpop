function updateStarredAttrForMatch (matchId, starred) {
  var params = {
    "match": {
      "starred": starred
    }
  };
  $.ajax({
    url: "/matches/" + matchId,
    type: "PUT",
    data: $.param(params)
  });
}

$(".btn.unstarred-match").live("click", function(e) {
  var id = $(e.target).data("id");
  if (id != null) {
    updateStarredAttrForMatch (id, true);
  }
});

$(".btn.starred-match").live("click", function(e) {
  var id = $(e.target).data("id");
  if (id != null) {
    updateStarredAttrForMatch (id, false);
  }
});