class StaticPagesController < ApplicationController
  def user_posts
    @user = User.find(params[:id])
    @user_posts = @user.posts.order('created_at DESC')
  end
end
