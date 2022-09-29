class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @posts = @posts.order('created_at DESC')
    posts = []
    current_user.friends.each do |friend|
      if friend.posts.any?
        posts.concat(friend.posts)
      end
    end
    posts = posts.concat(current_user.posts).sort_by &:created_at
    @friends_posts = posts.reverse
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save && @post.post_content != ""
      redirect_to posts_path
    else
      flash[:notice] = "Your post was unable to be submitted."
      redirect_to posts_path
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    if params[:view] == "user#show"
      redirect_to user_path(@post.user), status: :see_other
    elsif params[:view] == "static_pages#user_posts"
      redirect_to user_posts_path(@post.user), status: :see_other
    elsif params[:view] == "likes#index"
      redirect_to user_likes_path(@post.user), status: :see_other
    else
      redirect_to posts_path, status: :see_other
    end
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def post_params
    params.require(:post).permit(:author, :post_content, :user_id)
  end
end
