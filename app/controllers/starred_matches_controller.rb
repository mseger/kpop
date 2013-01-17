class StarredMatchesController < ApplicationController
  
  def create
    @starred_match = current_user.starred_matches.build(params[:starred_match])
    if @starred_match.save
      render 'refresh_match_card'
    else
      render 'error'
    end
  end

  def destroy
    @starred_match = StarredMatch.find(params[:id])
    @starred_match.destroy
    render 'refresh_match_card'
  end
  
end
