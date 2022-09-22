class CommentsController < ApplicationController
  before_action :set_post

  def create
    if @post.comments.create(user_id: current_user.id, comment_content: params[:comment_content])
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :comment_contnet)
  end
end
