class LikesController < ApplicationController
  before_action :set_liked_object, except: [:show, :index]
  before_action :set_like, only: [:destroy]

  def index
    @user = User.find(params[:user_id])
    @user_likes = Like.where(user_id: @user, likeable_type: "Post")
    @liked_posts = []

    @user.likes.each { |like| @liked_posts << Post.find(like.likeable_id)}
  end

  def create
    @object.likes.create(user_id: current_user.id)
    if params[:post_id].present?
      redirect_to posts_path
    else
      redirect_to post_path(@object.post_id)
    end
  end

  def destroy
    @like.destroy
    if params[:post_id].present?
      redirect_to posts_path
    else
      redirect_to post_path(@object.post_id)
    end
  end

  private

  def set_liked_object
    if params[:post_id].present?
      @object = Post.find(params[:post_id])
    else
      @object = Comment.find(params[:comment_id])
    end
  end

  def set_like
    if params[:post_id].present?
      @like = @object.likes.find(params[:id])
    else
      @like = @object.likes.find(params[:id])
    end
  end
end
