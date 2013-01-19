$(".btn.find-roommates").live("click", function (e) {
  $.ajax({
    url: "/generate_matches",
    type: "POST",
    success: function() {
      $.ajax({
        url: "/people.js?carousel_name=matches",
        type: "GET"
      });
      $.ajax({
        url: "/people.js?carousel_name=fb-matches",
        type: "GET"
      });
    }
  });
});

// loudness radio buttons
$(".btn.quiet").live("click", function (e) {
	$("input#user_loudness").val("f");
});

$(".btn.loud").live("click", function (e){
	$("input#user_loudness").val("t");
});

// house-party radio buttons
$(".btn.okay").live("click", function (e) {
	$("input#user_house_parties").val("t");
});

$(".btn.not-okay").live("click", function (e){
	$("input#user_house_parties").val("f");
});