class MainController < ApplicationController
	
	# GET / (no user logged in)
	def home_not_li
	end

	# GET / (user logged in)
	def home_li
		@starred_matchees = current_user.matchees
	end

  # POST /generate_matches
  def generate_matches
    # Delete all matches except starred ones
    current_user.matches.each do |match|
      Match.destroy(match.id)
    end

    # Find new matches
    current_user.reload
    User.all_but(current_user).each do |matchee|
      return if current_user.matchees.include? matchee
      match = current_user.matches.build(matchee_id: matchee.id, type: "UserMatch", starred: false)
      match.save
    end

    redirect_to controller: 'people', action: 'index', format: 'js'
  end

end
