$(".btn.starred-match-toggle").live("click", function(e) {
  e.preventDefault();
  $(e.target).toggleClass("starred");
});