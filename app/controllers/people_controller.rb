class PeopleController < ApplicationController

  # GET /people
  # GET /people.js
  def index
    @matchees = current_user.matchees.limit(4)
    respond_to do |format|
      format.html #index.html.erb
      format.js { render 'update_matches_carousel' }
    end
  end

end
