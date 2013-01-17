class MainController < ApplicationController
	
	# GET / (no user logged in)
	def home_not_li
	end

	# GET / (user logged in)
	def home_li
		@starred_matchees = current_user.matchees
	end
end
