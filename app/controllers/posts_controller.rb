# frozen_string_literal: true

# posts_controller.rb
class PostsController < ApplicationController
  before_action :set_post, only: %i[edit show update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.creator = User.first # TODO: assign user dynamically
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @post.save
      flash[:notice] = 'Post successfully updated'
      redirect_to post_path @post.id
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :title, :url)
  end
end
