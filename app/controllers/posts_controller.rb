class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @friends_posts = []
    current_user.friends.each do |friend|
      if friend.posts.any?
        @friends_posts.concat(friend.posts)
      end
    end
    @friends_posts.concat(current_user.posts)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now[:notice] = "Your post was unable to be submitted."
      render :index
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def post_params
    params.require(:post).permit(:author, :post_content, :user_id)
  end
end
