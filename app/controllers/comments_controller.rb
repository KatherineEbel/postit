# frozen_string_literal: true

# comments_controller
class CommentsController < ApplicationController
  before_action :require_user
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = @current_user
    if @comment.save
      flash[:notice] = 'You comment was added'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    @vote = @comment.votes.create(vote: params[:vote], voter: current_user)
    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = 'Vote counted'
        else
          flash[:error] = 'You already voted on this one'
        end
        redirect_back(fallback_location: root_path)
      end
      format.js
    end
  end
end