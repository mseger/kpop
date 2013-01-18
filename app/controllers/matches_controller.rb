class MatchesController < ApplicationController

  def update
    @match = Match.find(params[:id])
    if @match.update_attributes(params[:match])
      render 'refresh_match_card'
    else
      render 'error'
    end
  end
  
end
