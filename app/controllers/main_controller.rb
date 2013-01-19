class MainController < ApplicationController
	
	# GET / (no user logged in)
	def home_not_li
	end

	# GET / (user logged in)
	def home_li
    respond_to do |format|
      format.html do
        @starred_matches = current_user.matches.starred.page(params[:page]).per(2)
        @starred_matchees = @starred_matches.collect { |match| match.matchee }
        # render 'home_li'
      end
      format.js do
        redirect_to controller: 'people', action: 'index', params: {carousel_name: 'starred-matches', page: params[:page]}, remote: true
      end
    end
	end

  # POST /generate_matches
  def generate_matches
    # Delete all matches except starred ones
    current_user.matches.each do |match|
      Match.destroy(match.id) unless match.starred
    end

    # Find new matches
    current_user.reload
    num_starred_matches = current_user.matchees.length
    User.all_but(current_user).each do |matchee|
      next if current_user.matchees.include? matchee
      match = current_user.user_matches.build(matchee_id: matchee.id, matchee_name: matchee.name, starred: false)
      match.save
    end

    fb_matches = fb_graph.get_connections("me", "friends?limit=10&fields=id,name").select do |fb_match|
      FbMatch.find_by_matchee_id(fb_match["id"]).nil?
    end
    fb_matches = fb_matches.sort_by{rand}[0..5]
    fb_matches.each do |fb_match|
      match = current_user.fb_matches.build(matchee_id: fb_match["id"], matchee_name: fb_match["name"], starred: false)
      match.save
    end

    render nothing: true
  end

end
