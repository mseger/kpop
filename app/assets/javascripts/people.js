$(".btn.facebook-profile").live("click", function(e) {
  var facebookBaseUrl= "http://www.facebook.com/";
	var matcheeUID= $(e.target).data("uid");
	if (matcheeUID){
		window.open(facebookBaseUrl + matcheeUID, '_blank');
	}
});