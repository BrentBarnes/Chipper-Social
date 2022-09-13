class UsersController < ApplicationController
  def show
    
  end

  def index
    @users = User.all
  end

  def edit
    # @user = current_user
  end
end
