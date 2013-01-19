class PeopleController < ApplicationController

  # GET /people
  # GET /people.js
  def index
    @matches = current_user.matches.page(params[:page]).per(4)
    @matchees = @matches.collect { |match| match.matchee }

    @fb_matches = current_user.fb_matches.starred(false).page(params[:page]).per(4)
    @fb_matchees = @fb_matches.collect { |fb_match| fb_match.matchee}

    respond_to do |format|
      format.html #index.html.erb
      format.js { render 'update_matches_carousel' }
    end
  end

end
