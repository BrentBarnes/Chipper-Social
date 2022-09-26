class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(current_user.id) 
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :location, :education, :occupation, :birthday, :avatar)
  end
end
