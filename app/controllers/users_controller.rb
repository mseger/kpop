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

  # PUT
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      render 'update'
    else
      render 'error'
    end
  end
end
