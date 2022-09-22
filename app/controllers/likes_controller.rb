class LikesController < ApplicationController
  before_action :set_post
  before_action :set_like, only: [:destroy]

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to posts_path
  end

  def destroy
    @like.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_like
    @like = @post.likes.find(params[:id])
  end
end
