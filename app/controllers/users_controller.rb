class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end
end
