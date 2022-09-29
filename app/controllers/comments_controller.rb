class CommentsController < ApplicationController
  before_action :set_post

  def create
    content = params[:comment][:comment_content]
    if @post.comments.create(comment_params) && content != ""
      redirect_to post_path(@post)
    else
      flash[:notice] = "Your comment could not be posted"
      redirect_to post_path(@post)
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
    redirect_to post_path(@post), status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :comment_content)
  end
end
