class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now[:notice] = "Your post was unable to be submitted."
      render :index
    end
  end

  def delete

  end

  private

  def post_params
    params.require(:post).permit(:author, :post_content)
  end
end
