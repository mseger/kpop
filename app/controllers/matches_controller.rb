class MatchesController < ApplicationController
  
  def create
    @match = current_user.matches.build(params[:match])
    if @match.save
      render 'refresh_match_card'
    else
      render 'error'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    render 'refresh_match_card'
  end
  
end
