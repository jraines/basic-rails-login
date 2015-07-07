class PostsController < ApplicationController

  def index
    @posts = Post.order(id: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create params[:post]
    redirect_to posts_path
  end

end
