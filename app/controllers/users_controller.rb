class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @user, owner_type: "User").page(params[:page]).per_page(20)
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
