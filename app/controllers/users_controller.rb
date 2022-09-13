class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    
  end

  def index
    @users = User.all
  end

  def edit
    # @user = current_user
  end
end
