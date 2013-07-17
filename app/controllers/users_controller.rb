class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def followers
  	@user = User.find(params[:id])
  	@users = @user.followers
  end

  def following
    @user = User.find(params[:id])
  	@users = @user.followed_users
  end
end
