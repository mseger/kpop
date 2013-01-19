class PeopleController < ApplicationController

  # GET /people
  # GET /people.js
  def index
    respond_to do |format|
      format.html do
        @matches = current_user.matches.page(params[:page]).per(4)
        @matchees = @matches.collect { |match| match.matchee }

        @fb_matches = current_user.fb_matches.starred(false).page(params[:page]).per(4)
        @fb_matchees = @fb_matches.collect { |fb_match| fb_match.matchee}
      end

      format.js do
        @carousel_name = params[:carousel_name]
        case @carousel_name
        when "matches"
          @matches = current_user.matches.page(params[:page]).per(4)
        when "fb-matches"
          @matches = current_user.fb_matches.starred(false).page(params[:page]).per(4)
        when "starred-matches"
          @matches = current_user.matches.starred.page(params[:page]).per(2)
        else
          raise ActionController::RoutingError.new('Invalid carousel name')
        end

        @matchees = @matches.collect { |match| match.matchee }
        render 'update_matches_carousel'
      end
    end
  end

end
