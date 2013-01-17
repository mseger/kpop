class PeopleController < ApplicationController
  def index
    @people = User.all_but(current_user).limit(4)
  end
end
