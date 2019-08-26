# frozen_string_literal: true

# comments_controller
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = User.first
    if @comment.save
      flash[:notice] = 'You comment was added'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
end