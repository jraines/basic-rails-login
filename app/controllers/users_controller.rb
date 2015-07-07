class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create params[:user]
    flash[:notice] = "Thanks for Signing Up"
    redirect_to posts_path
  end
end
