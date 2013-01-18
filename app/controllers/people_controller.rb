class PeopleController < ApplicationController

  # GET /people
  # GET /people.js
  def index
    @matches = current_user.matches.limit(4)
    @matchees = @matches.collect { |match| match.matchee }

    respond_to do |format|
      format.html #index.html.erb
      format.js { render 'update_matches_carousel' }
    end
  end

end
