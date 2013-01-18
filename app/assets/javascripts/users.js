$('.btn.find-roommates').live("click", function (e) {
  $.ajax({
    url: "/generate_matches",
    type: "POST"
  });
});