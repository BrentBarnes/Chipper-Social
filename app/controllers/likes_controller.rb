class LikesController < ApplicationController
  before_action :set_liked_object, except: [:show, :index]
  before_action :set_like, only: [:destroy]

  def index
    @user = User.find(params[:user_id])
    posts = []

    @user.likes.each { |like| posts << Post.find(like.likeable_id)}

    posts = posts.sort_by &:created_at
    @liked_posts = posts.reverse
  end

  def create
    @object.likes.create(user_id: current_user.id)
    if params[:post_id].present?
      redirect_back(fallback_location: post_path(@object.id))
    else
      redirect_to post_path(@object.id)
    end
  end

  def destroy
    @like.destroy
    if params[:post_id].present?
      redirect_back(fallback_location: post_path(@object.id))
    else
      redirect_to post_path(@object.id)
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
