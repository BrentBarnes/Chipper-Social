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
      if params[:view] == "posts#show"
        redirect_to post_path(@object), status: :see_other
      elsif params[:view] == "user#show"
        redirect_to user_path(@object.user), status: :see_other
      elsif params[:view] == "static_pages#user_posts"
        redirect_to user_posts_path(@object.user), status: :see_other
      else
        redirect_to posts_path, status: :see_other
      end
    elsif params[:comment_id].present?
      redirect_to post_path(@object.post), status: :see_other
    else
      redirect_to post_path(@object.id)
    end
  end

  def destroy
    @like.destroy
    if params[:post_id].present?
      if params[:view] == "posts#show"
        redirect_to post_path(@object), status: :see_other
      elsif params[:view] == "user#show"
        redirect_to user_path(@object.user), status: :see_other
      elsif params[:view] == "static_pages#user_posts"
        redirect_to user_posts_path(@object.user), status: :see_other
      elsif params[:view] == "likes#index"
        redirect_to user_likes_path(@object.user), status: :see_other
      else
        redirect_to posts_path, status: :see_other
      end
    elsif params[:comment_id].present?
      redirect_to post_path(@object.post), status: :see_other
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
