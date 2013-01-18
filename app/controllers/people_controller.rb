class PeopleController < ApplicationController

  # GET /people
  # GET /people.js
  def index
    @matchees = current_user.matchees.limit(4)
    @matches = @matchees.map do |matchee| 
      Match.find_by_user_id_and_matchee_id current_user.id, matchee.id
    end

    respond_to do |format|
      format.html #index.html.erb
      format.js { render 'update_matches_carousel' }
    end
  end

end
