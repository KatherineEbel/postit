# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: %i[edit show update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.new post_params
  end

  def show; end

  def update; end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :title, :url)
  end
end
