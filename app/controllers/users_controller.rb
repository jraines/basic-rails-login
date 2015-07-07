class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:password_confirmation]
      @user = User.create params[:user]
      flash[:notice] = "Thanks for Signing Up"
      redirect_to posts_path
    else
      flash[:alert] = "Your password did not match confirmation"
      redirect_to new_post_path
    end
  end
end
