# frozen_string_literal: true

# posts_controller.rb
class PostsController < ApplicationController
  before_action :set_post, only: %i[edit show update vote]
  before_action :require_user, except: %i[index show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.creator = @current_user
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def show
    @comment = Comment.new
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post successfully updated'
      redirect_to post_path @post.id
    else
      render :edit
    end
  end

  def vote
    vote = @post.votes.create(vote: params[:vote], voter: current_user)
    respond_to do |format|
      format.html do
        redirect_back(fallback_location: root_path)
      end
      format.js
      if vote.invalid?
        flash[:error] = 'You already voted on this one' if vote.invalid?
      else
        flash[:notice] = 'Vote counted'
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    p = params.require(:post).permit(:description, :title, :url, category_ids: [])
    p[:category_ids].reject!(&:blank?)
    p
  end
end
